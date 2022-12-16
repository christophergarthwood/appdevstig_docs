#!/usr/bin/env bash
#================================================================
# HEADER
#================================================================
# SYNOPSIS
#    usage: <script name> -c -d 
#    Options:
#    -c      Turn on CSS.
#    -d      Turn on debugging.
#    -h      Display this message.
#
#    Generate HTML output for documentation using pandoc against the markdown files.
#
#    Example usage:./build_docs.sh -c -d
#================================================================
#- IMPLEMENTATION
#-    version         2020.06.04
#-    author          christopher wood
#-    copyright       None
#-    license         GNU General Public License
#-    script_id       ofm-build_docs
#-    ksh -n and shellcheck used for compliance.
#-
#================================================================
#  HISTORY
#     2020/06/04 : Chris Wood : Script creation
#
#================================================================
# END_OF_HEADER
#================================================================

#*** VARIABLES ***
#############################################################
#  \ \   / / \  |  _ \|_ _|  / \  | __ )| |   | ____/ ___| 
#   \ \ / / _ \ | |_) || |  / _ \ |  _ \| |   |  _| \___ \ 
#    \ V / ___ \|  _ < | | / ___ \| |_) | |___| |___ ___) |
#     \_/_/   \_\_| \_\___/_/   \_\____/|_____|_____|____/ 
#############################################################

#flow of control
this_script=$0;
execute=0;
export WORKDIR="";
WORKDIR=$(pwd);
current_dir=${WORKDIR};
export the_user="jolliff";

#application specific
export VERSION_NAME="${this_script}";
export VERSION_MAJOR="2";
export VERSION_MINOR="0";
export PROJECT="VISOR";

#export targets=( ./design_doc ./acg ./installation ./setup ./testcase )
export targets=( ./design_doc ./acg ./setup ./testcase )

#location
VISOR_ROOT_DIR="/home/${the_user}/Documents/visor_gops_parser";
documentation_source_target_visor="${VISOR_ROOT_DIR}/scripts/visor_gops_parser_doxygen.dxy";

#executables
export command_pandoc="${HOME}/bin/pandoc";
export command_git="/usr/bin/git";
export command_ford="/home/${the_user}/bin/ford";
export command_doxy="/usr/bin/doxygen";
export command_cp="/usr/bin/cp";
export command_mv="/usr/bin/mv";

#Paths
for script_function in ${current_dir}/scripts/msg_*
do
    source ${script_function};
done


#*** FUNCTIONS ***
#############################################################
#    |  ___| | | | \ | |/ ___|_   _|_ _/ _ \| \ | / ___| 
#    | |_  | | | |  \| | |     | |  | | | | |  \| \___ \ 
#    |  _| | |_| | |\  | |___  | |  | | |_| | |\  |___) |
#    |_|    \___/|_| \_|\____| |_| |___\___/|_| \_|____/ 
#############################################################

function get_date {
    funct_result=$(date +'%Y%m%d:%H%M')
}

#obtained from linux journal, not necessarily complete
function long_process {
    START=$(date +%s.%N)
    $*
    EXIT_CODE=$?
    END=$(date +%s.%N)
    DIFF=$(echo "$END - $START" | bc)
    RES=$(python -c "diff = $DIFF; min = int(diff / 60); print('%s min' % min)")
    result="$1 completed in $RES, exit code $EXIT_CODE."
    echo -e "\n? " $result
    ( say -r 250 $result 2>&1 > /dev/null & )
}

function usage {
        cat <<@EOF
    usage: ${this_script} -d

    Options:

    -d      Enable debug output [DEBUG].

    Example usage: ${this_script} -d

@EOF

    usage2
        if [ $# -gt 0 ];
        then
          if [ $1 -eq 1 ];
          then
            exit
          fi
        fi
}

function usage2 {

    echo " "
    echo "          ***************************WARNING*****************************************"*
    echo "          This script was written to work within the ${PROJECT} repository which is a top"
    echo "          level repository.  Without using the repository as-is you should expect this"
    echo "          script to fail or at least respond at a sub-standard level."
    echo "          ***************************WARNING*****************************************"*
    echo " "

}
function validate_program {

    #================================================================
    # Check all CLI arguments before we start any work
    #  -- examples are below for purposes of how an implimentation might look
    #================================================================
    execute=1;
    msg_info "Validating arguments.";

    #make sure the script doesn't run as root (security concern)
    whoami=$(id -u)
    if [ "${whoami}" -eq 0 ];
    then
        msg_emerg "This script is not authorized to run as root."
    fi

    current_dir=$(pwd)
    if [[ ! -z $arg_css ]];
    then
        if [ -f "${current_dir}/docs/markdown.css" ];
        then
            execute=1;
        else
            msg_error "Cannot find local ${current_dir}/docs/markdown.css, without this file no pandoc processing with CSS can occur.  Aborting...";
            execute=0;
        fi
    fi

    if [ -f "${command_pandoc}" ];
    then
        [[ ! -z "$arg_debug" ]] && msg_debug "Validated existence of ${command_pandoc}"
    else
        msg_emerg "Cannot continue without pandoc executable (${command_pandoc}), aborting execution."
        execute=0;
    fi

	#[[ $state_proj -eq 1 && $state_mdl -eq 1 && $state_target -eq 1 && $state_output -eq 1 && $state_error_log -eq 1 ]] && execute=1;


}

function run_project_markdown {
    #===============================================================================
    #-- EXECUTE each function as passed in as $1 using the batch system
    #===============================================================================
	[[ ! -z "$arg_debug" ]] && msg_debug "Entered run_project_markdown"

    #do the index page, take what we have at the top most folder and combine with this README.md
    #you'll have to `git checkout README.md` to restore
    current_dir=${WORKDIR}/docs;
    cd "${current_dir}";
    if [ -f "${current_dir}/README.md" ];
    then
        cat "${current_dir}/README.md" > /tmp/$$.md
    else
        msg_emerg "Failed to find ${current_dir}/README.md, this is used to make part of the main page.  Aborting, please investigate why REAMD.md is not present.";
    fi
    if [ -f "${current_dir}/../README.md" ];
    then
        cat "${current_dir}/../README.md" >> /tmp/$$.md
    else
        msg_emerg "Failed to find ${current_dir}/../README.md, this is used to make part of the main page.  Aborting, please investigate why REAMD.md is not present.";
    fi

    ${command_mv} --force /tmp/$$.md "${current_dir}/README.md";
    status=$?;
    if [ "${status}" -ne 0 ];
    then
        msg_emerg "Move command failed for /tmp/$$.md -> ${current_dir}/README.md.  Aborting execution as this is part of the main page.  Investigate what happened.";
    fi

    if [ -f /tmp/$$.md  ];
    then
        rm -rf /tmp/$$.md;
    fi


    msg_debug "Processing top level directory.";
    [[ ! -z "$arg_debug" ]] && msg_debug "...${command_pandoc} -t html -o -c ./markdown.css -A ${current_dir}/footer.html ./index.html ./README.md"
    ${command_pandoc} --metadata pagetitle="${PROJECT} Documentation" -A ${current_dir}/footer.html -t html -s --toc --highlight-style espresso -c ./markdown.css -o "${current_dir}/index.html" ./README.md >> "${WORKDIR}/log_pandoc.log" 2>&1

    msg_debug "Start looping through an array of directories that contain documentation.";
    for target in ${targets[@]}
    do
        [[ ! -z "$arg_debug" ]] && msg_debug "...processing ${target}"
        file_array=( $( find "${current_dir}/${target}" -name "*.md" -print ) );
        status=$?;
        if [ "${status}" -ne 0 ];
        then
            msg_warning "Find of markdown files in ${current_dir} encountered a problem, not all markdown was likely built, worthy of investigation";
        fi

        msg_debug "......start processing markdown files in ${target}"
        for file in ${file_array[@]}
        do
            base_filename=$(basename "${file}");
            base_filename="${base_filename%.*}"
            if [ "${base_filename}" == "README" ];
            then
                output_filename="${target}/index.html";
            else
                output_filename="${target}/${base_filename}.html";
            fi

            [[ ! -z "$arg_debug" ]] && msg_debug "......${command_pandoc} --metadata pagetitle=\"${PROJECT} Documentation\" -A ${current_dir}/footer.html -t html -s --toc --highlight-style espresso -c ../markdown.css -o ${output_filename} ${file}"
            ${command_pandoc} --metadata pagetitle="${PROJECT} Documentation" -A ${current_dir}/footer.html -t html -s --toc --highlight-style espresso -c ../markdown.css -o "${output_filename}" "${file}" >> "${WORKDIR}/log_pandoc.log" 2>&1

        done
        msg_debug "......finished processing markdown files in ${target}"
    done
    msg_debug "Finished looping through an array of directories that contain documentation.";

    current_dir="${WORKDIR}";
    cd "${current_dir}";

	[[ ! -z "$arg_debug" ]] && msg_debug "Exited run_project_markdown"
}

function prototype {
    #===============================================================================
    #-- EXECUTE each function as passed in as $1 using the batch system
    #===============================================================================
	[[ ! -z "$arg_debug" ]] && msg_debug "Entered prototype"

    the_function=$1
    msg_info "Processing \"${1}\"."

	[[ ! -z "$arg_debug" ]] && msg_debug "Exited prototype"
}

function run_visor_documentation {

    #===============================================================================
    #-- EXECUTE create documentation for VISOR (visor_gops_parser) using Doxygen
    #===============================================================================
	[[ ! -z "$arg_debug" ]] && msg_debug "Entered run_visor_documentation"

    get_date;
    app_name="visor_gops_parser";
	#[[ ! -z "$arg_debug" ]] && msg_debug "...sourcing ${app_name} Doxygen Env Vars"
    #source ../visor_gops_parser_doxygen.env
	[[ ! -z "$arg_debug" ]] && msg_debug "...documenting ${app_name} with ${command_doxy}"
    ${command_doxy} ${documentation_source_target_visor} > ./log_visor_doxygen.log 2>&1

	[[ ! -z "$arg_debug" ]] && msg_debug "Exited run_visor_documentation"

}


#*** MAIN ***
#############################################################
#       |  \/  |  / \  |_ _| \ | |
#       | |\/| | / _ \  | ||  \| |
#       | |  | |/ ___ \ | || |\  |
#       |_|  |_/_/   \_\___|_| \_|
#############################################################
get_date
start_time=$(date +'%s')
msg_info "BEGIN $this_script"

#================================================================
# Argument management
#================================================================
msg_info "Processing arguments."
while getopts "hdc" opt; do
    case "$opt" in
        d)
            arg_debug=1;
            [[ ! -z "$arg_debug" ]] && msg_debug "Debugging selected."
            ;;
        c)
            arg_css=1;
            [[ ! -z "$arg_debug" ]] && msg_debug "CSS for HTML selected."
            ;;
		h)
		    usage
            exit 1
            ;;
        :)
            msg_debug "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
        \?)
            msg_emerg "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

#just default to always use the CSS
arg_css=1
validate_program
if [ "${execute}" -eq 1 ];
then
    usage2
    run_project_markdown
    run_visor_documentation

    git checkout ./docs/README.md  #set the original back to normal.

    end_time=$(date +%s);
    msg_info "Execution time was $((end_time - start_time)) s.";
    get_date;
    msg_info "END ${this_script}";
else
    usage
    echo " "
    msg_emerg "There was a problem with argument passing, an argument was not compliant.  Exiting..."
fi
