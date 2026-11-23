# Model Acceptance Evaluation Template

[TOC]

## 1.0 Document Control & Identification

|Field|Value|
|-----|-----|
|**Proposed Model Name**   |*[e.g. nomic-embed-text]*|
|**Version**               |*[e.g. v1.5 ]*|
|**Model Type**            |*[Embedding, LLM, or Reranker]*|
|**Source Repository**     |*[URL]*|
|**MTEB Leaderboard Rank** |*[e.g. #1 for <x dimensions, as of YYYY-MM-DD]*|
|**Proposer**              |*[Your Name]*|
|**Date**                  |*[YYYY-MM-DD]*|

## 2.0 Security & Cyber Vetting Checklist

|Security Check|Status (Pass // Fail)|Notes|
|--------------|------------------|-----|
|**Is the model in .safetensors format?**|**Pass / **Fail**|*File must not be .pkl or .bin, provide URL to the model.*|
|**Can the model operate fully air-gapped?**|**Pass** / **Fail**|*Confirm no external internet calls, execute ./test_scripts/embedding_validation_analysis.py*|


## 3.0 Coordination & Environment

|Environment Component   |Value|
|------------------------|-----|
|**Testing Coordinators**|*[e.g. Name]*|
|**Date of Installation**|*[YYYY-MM-DD]*|
|**Test Environment**    |*[e.g. Local Docker/Podman execution, Test Server]*|

## 4.0 Quantitative Evaluation: The Scorecard

*This section compares the proposed model against the current baseline using the **MTEB** framework and a potential internal benchmark dataset (not sure yet what exactly this may entail).*

Inload MTEB results from ./test_scripts/mteb_analysis.py CSV output file.


## 5.0 Rollback & Contingency Plan

In the event of unforeseen system degradation upon production deployment, follow this procedure to revert to the baseline model

*Trigger for Rollback:* [e.g. Latency exceeds x amount of ms, or application crash]

*Test for Rollback:* Execute  ./test_scripts/embedding_validation_analysis.py with the Golden Dataset on-prem.  Failure is part of the trigger.

*Reversion Steps:* [e.g. 1. Re-select previous baseline embedding model in Open Web UI Admin settings. 2. Purge vector database. 3. Re-index document knowledge base using baseline model.]

## 6.0 Sign-Off and Approval

*Based on the evidence presented in this evaluation, the proposed model meets the security, performance, and efficiency standards outlined in the Model Acceptance SOP.*

|Position               | Person | Status                |Date    |Method of Approval|
|-----------------------|--------|-----------------------|--------|------------------|
|**Lead Developer**     |*[Name]*|[] Approved / [] Denied|YYYYMMDD|Specify how approval was obtained.|
|**On-prem Admin**      |*[Name]*|[] Approved / [] Denied|YYYYMMDD|Specify how approval was obtained.|
|**Program Manager**    |*[Name]*|[] Approved / [] Denied|YYYYMMDD|Specify how approval was obtained.|
