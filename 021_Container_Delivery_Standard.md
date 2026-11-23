# 📘 Container Delivery Standard

[TOC]

## Document Meta-data

| Attribute                    | Specification                                                                                                  |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Status / Version             | Approved \| v2.0                                                                                               |
| Target Operating System      | Red Hat Enterprise Linux 9 (RHEL 9)                                                                            |
| Container Engine Environment | Docker Community Edition (v29.6.2) / Skopeo (Red Hat AppStream)                                                |
| Source Registry              | Provide registery location.                                                                                    |
| Target Workflow              | GitLab Token Generation, Pre-Approval Information Assurance (IA) Security Scanning & Post-Approval Docker Load |

## 📖 Definition

This Standard Operating Procedure (SOP) defines the complete end-to-end process for authenticating to <cite Git resource here>, generating a Personal Access Token (PAT), and downloading Open Container Initiative (OCI) / Docker container images from the <cite registery location here> directly into the user’s current working directory as `.tar` archives on a **RHEL 9** server.

## Target Container Images

The following five container images are covered under this procedure:

1. List registry pinned container image.
2. ...
3. ...
4. ...

*(Note: All registry hostnames must use lowercase to comply with OCI reference format specifications).*

## 🎯 Purpose

This procedure ensures compliance with strict storage and security constraints prior to Information Assurance (IA) scanning:

- **Zero Docker Daemon Footprint:** Images are streamed directly to `.tar` files without being pulled or extracted into `/var/lib/docker`.
- **Zero /var/tmp Footprint:** All temporary layer staging (`TMPDIR` and `--tmpdir`) is explicitly restricted to the current working directory (`$(pwd)`), preventing `/var/tmp` exhaustion during large LLM/GPU image downloads.
- **Unaltered Upstream Metadata:** Original upstream repository paths and version tags are preserved inside the `.tar` manifest (`manifest.json`), ensuring that when images are loaded after IA approval via `docker load`, they retain their exact repository names without requiring manual re-tagging.
- **Full Credential Sanitization:** All authentication artifacts and temporary packages (`skopeo`) are inspected, cleaned, and removed upon completion.

## 🧩 Requirements/Specifications/Guidelines

### Prerequisites

| Requirement | Details |
|---|---|
| OS & Privileges | RHEL 9 Linux Server with sudo privileges to install and remove the skopeo package from the standard Red Hat AppStream repository. |
| Disk Space | Navigate (cd) to a target working directory with at least 50–60 GB of available free space prior to starting. |
| GitLab Account & Access | Active account on <cite Git resource> with access to the navo-se/a-squared and navo-se/baseimages repositories. (Note: Pulling from private GitLab Container Registries typically requires Reporter role or higher, unless Guest registry visibility has been explicitly enabled by the repository owner). |

## ⚙️ Execution Procedure

### 1: Log In to <cite Git resource> and Generate a Personal Access Token (PAT)

Before running commands on the RHEL 9 server, generate a Personal Access Token in the <cite Git resource> web interface and note your GitLab username:

1. **Log in to GitLab:** Open your web browser and authenticate to <cite Git URL here>.
2. **Locate Your GitLab Username:** Click your **user avatar/circle** in the top-right (or top-left) corner of the interface. Directly beneath your display name, locate the handle starting with `@` (for example, `@first.last`). Your GitLab username is the string **after the @ symbol** (do not include the `@` symbol when authenticating via CLI).
3. **Open User Preferences:** From that same user avatar menu, select **Preferences** (or **Edit profile**).
4. **Navigate to Personal Access Tokens:** In the left-hand navigation sidebar, go to **User Settings > Access > Personal Access Tokens** (or **Access Tokens**).
5. **Create a New Token:** Click **Add new token**:
   - **Token name / Description:** Enter a descriptive name (e.g., `RHEL9_IA_Image_Download`).
   - **Expiration date:** Set to **30 days** for a temporary download token (or up to **1 year** if needed for longer-term maintenance).
   - **Select scopes:** Check the boxes for `read_registry` and `read_api`.
6. **Generate and Copy Token:** Click **Create personal access token** (or **Generate Token**). Copy the generated token string immediately and store it securely for Step 4.3, as GitLab will not display it again once you leave the page.

*(Optional Terminal Verification: Once you have your token, you can also verify your exact GitLab username directly from the Linux terminal at any time by running:)*

```bash
curl -s --header "PRIVATE-TOKEN: <YOUR_PAT>" "<URL>" | grep -o '"username":"[^"]*"'
```

### 2: Set File Creation Mask and Install Skopeo

On the RHEL 9 server, navigate to the target download directory, set `umask 022` (ensuring downloaded `.tar` files are created with `-rw-r--r--` / `644` permissions so IA scanning tools can read them), and install `skopeo`:

```bash
# 1. Verify you are in the target directory with sufficient disk space
pwd && df -h .

# 2. Set umask to 022 (files created as rw-r--r--)
umask 022

# 3. Install skopeo from the RHEL 9 repository
sudo yum install skopeo -y
```

### 3: Authenticate to the Container Registry via Skopeo

Log in to <cite Git resource here> (note that container pulls authenticate against <cite URL>, not <cite original URL> ) using your GitLab username and the Personal Access Token generated in Step 4.1.

Run `skopeo login` and paste your Personal Access Token when prompted for `Password:`. Entering the token interactively at the prompt prevents your token from being displayed on screen or saved into `~/.bash_history`:

```bash
skopeo login <cite Git URL here> -u <YOUR_USERNAME>
```

- **Password:** Paste your `<PERSONAL_ACCESS_TOKEN>` (characters will not be echoed to the screen) and press **Enter**.
- **Expected Output:** `Login Succeeded!`

*(Alternative Single-Line Login: If you prefer to pipe the token via stdin as shown in standard GitLab instructions, ensure you use standard straight quotes " and target register.<cite url here>:)*

```bash
echo "<YOUR_PAT>" | skopeo login registry.<cite URL here> -u <YOUR_USERNAME> --password-stdin
```

### 4: Download Container Images to Current Directory

Set both the `TMPDIR` environment variable and the `--tmpdir $(pwd)` flag so that all temporary layer staging and final `.tar` archive outputs remain strictly inside your current working directory (`./`):

```bash
# Force all temporary layer staging into the current directory
export TMPDIR=$(pwd)

# 1. Pull open-webui:v0.12.3-dougllm.0.2.0
skopeo copy --tmpdir $(pwd) \
  docker://registry.<cite url>/<name of container image> \
  docker-archive:./<name of container image>.tar:registry.<cite URL>/<cite image name>

# 2. Repeat...
```

### 5: Verify Downloaded Files and Generate Checksums

Confirm that all five `.tar` archives exist in the current working directory with `-rw-r--r--` (`644`) permissions and generate a SHA-256 checksum manifest for IA chain-of-custody verification:

```bash
ls -lh ./*.tar
sha256sum ./*.tar > ia_image_checksums.sha256
```

### 6: Inspect & Clean Up Login Credentials, Then Uninstall Skopeo

1. **Log out via skopeo and unset TMPDIR:**

```bash
skopeo logout registry.<cite Git URL here>
unset TMPDIR
```

2. **Check the resolved paths and verify if auth.json credential files exist on disk:**

```bash
echo "${XDG_RUNTIME_DIR}/containers/auth.json"
echo "$HOME/.config/containers/auth.json"
ls -la "${XDG_RUNTIME_DIR}/containers/auth.json" "$HOME/.config/containers/auth.json"
```

3. **If either file exists, inspect its contents:**

```bash
cat "${XDG_RUNTIME_DIR}/containers/auth.json"
cat "$HOME/.config/containers/auth.json"
```

   - **If the file is empty** (for example, contains only `{"auths":{}}` with no other credentials), remove the file:

```bash
rm -i "${XDG_RUNTIME_DIR}/containers/auth.json" "$HOME/.config/containers/auth.json"
```

   - **If the file still contains your registry.<cite URL here> token line** alongside other registry credentials you need to retain, open the file in an editor and delete the `"registry.<cite URL here>"` block manually:

```bash
vi "${XDG_RUNTIME_DIR}/containers/auth.json"
```

4. **Uninstall skopeo:**

```bash
sudo yum remove skopeo -y
```

5. **(Optional) Revoke Temporary Token in GitLab:** If you no longer need the Personal Access Token, return to **GitLab > User Settings > Access > Personal Access Tokens** and click **Revoke** next to the token.

## 📊 Post-IA Approval Reference (Transfer & Load)

Once the downloads are complete and ready to be moved to the NetApp NFS share for IA scanning—and subsequently loaded into Docker after IA approval—use the following commands:

| Task | Command | Description |
|---|---|---|
| Transfer to NetApp NFS Share | `rsync -avP ./*.tar ./ia_image_checksums.sha256 /path/to/nfs/share/` | Preserves permissions (-p), group (-g), owner (-o), and timestamps (-t), while providing a live progress bar and transfer resume capability (-P). |
| Verify Checksums Post-Scan | `sha256sum -c ia_image_checksums.sha256` | Confirms archive integrity prior to loading into the local Docker daemon. |
| Load Approved Images into Docker | `for f in *.tar; do docker load -i "$f"; done` | Loads all five archives into /var/lib/docker with their exact original registry.<cite URL here>/<project name>/... repository names and tags intact. |
| Verify Loaded Images | `docker images` | Confirms all five images are registered and ready for deployment. |
