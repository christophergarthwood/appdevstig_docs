# 📘Model Acceptance Standard


[TOC]

## 🔗 Template / Reference

 *Template Reference* - [Model Acceptance Template](./022_ModelAcceptance_Template.md)
 
## 🎯 Purpose

The integration of AI models, particularly embedding models, introduces unique capabilities and security risks to the DoW network. This Standard Operating Procedure establishes the official policy and mandatory process for proposing, evaluating, and accepting any new AI model into the WADE LLM ecosystem.

The purpose of this standard is to:

+   Prevent the "flippant" inclusion of untrusted models.
+   Mitigate supply chain risks associated with public model repositories.
+   Ensure efficient use of limited system resources (VRAMgRAM).
+   Provide Cyber Security and Authorizing Officials with quantitative, data-driven evidence to support change management decisions.

### ✅ Scope

This SOP applies to all proposed AI models, including but not limited to LLMs, text-embedding models, and reranker models, intended for use on any DoW system.
## 🧩 Requirements/Specifications/Guidelines

### 🟦 1. Roles and Responsibilities

Any team member can initiate and complete this form.

**Technical Lead** will provide final decision authority to deploy a model and engage on-prem assets via signed email.

### 🟩 2. Security and Risk Management Mandates

All model acceptance proposals must adhere to the following security mandates to mitigate unique AI-related threat vectors.

#### Supply Chain and Serialization

+   **Supply Chain Integrity:** Direct downloads from public repositories to operational networks are prohibited. Models must be sourced from trusted repositories and scanned prior to integration.

+   **Pickle Vulnerability Mitigation:** Due to the risk of arbitrary code execution, models saved in the .pkl ('pickle') format are **strictly forbidden**.

+   **Safetensors Mandate:** All models MUST be provided in the .safetensors format. This format contains only raw data weights and is incapable of executing malicious code, making it the required standard for secure deployment. Adherence is a passgfail security criterion.


### 🟨 3.  Quantitative Quality Measurement

A proposed model will only be considered if it provides a mathematically proven improvement over the existing baseline. Subjective feelings or preferences are not sufficient for justification.


### 🟨 3.1 Industry Benchmarking

The proposed model must have a verifiable track record within the AI community. Proposers must cite the model's ranking on the MTEB as initial proof of industry trust and general performance.



### 🟨 3.2 Local Performance Evaluation

The model must undergo local testing using an approved open-source framework (e.g. DeepEval or Ragas) to evaluate its performance on DoW-relevant data. The evaluation will measure the three pillars of RAG effectiveness:

1.  **Retrieval Accuracy (Context Precision):** Did the model retrieve the correct and relevant document chunks?

2.  **Faithfulness:** Does the model's output stick to the source text without hallucinating?

3.  **Answer Relevance:** Does the model's final answer actually address the user's prompt?


### 🟨 3.3  Standardized Test Environment & Data

All evaluations must occur in an isolated IT evaluation environment coordinated with the Team prior to deployment.  Furthermore, all baseline and proposed models must be evaluated against the exact same standardized, unclassified test dataset (communicate with Chris on what this may look like) to ensure an objective comparison.

### 🟧 4.  Efficiency and Resource Constraints

A model must be both accurate and efficient to be viable on target workstations. All evaluations must document the following hardware constraints.

*   **Vector Dimensionality:** To ensure low-latency database searches, preference is given to models with vector dimensions of x? or less. (Talk to Chris about what value this should be) 

*   **Inference Speed and VRAM Headroom:** The evaluation must measure and document the model's VRAM consumption at rest and under load to ensure it does not exhaust GPU resources needed by the primary LLM.


## 📏 Measurable and Actionable

A model must meet the following minimum thresholds to be considered for approval:

1.  **Security:** 100% adherence to the `.safetensors` format. (Pass / Fail)

2.  **Performance:** Must demonstrate a minimum of **>5% improvement** in a key RAG metric (e.g., Context Precision) over the current baseline model during local evaluation.

3.  **Efficiency:** Must operate within documented VRAM and latency limits of the target hardware.

## ⏱️ Timeliness

Performed at the introduction of a new model.

## 📚 Reference(s)
