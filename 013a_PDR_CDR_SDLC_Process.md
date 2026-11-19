### Integrating New Technology & Algorithms into the SDLC

#### A Preliminary Design Review (PDR) and Critical Design Review (CDR) Process Mapped to the Software Development Lifecycle

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  This process helps a team align to a consistent, repeatable method for introducing new technology or algorithms into a software project. It formalizes two gate reviews --- PDR and CDR --- within the standard SDLC, with defined entrance/exit criteria, artifacts, roles, and governance threads that persist across the project.
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

[TOC]


1\. Purpose and Scope

This process governs how new technologies or algorithms --- for example,
a novel geospatial algorithm, an agentic AI component, or a new
service-oriented integration pattern --- are matured from concept to
implementation-ready design within a software development project. It
embeds two formal gate reviews, Preliminary Design Review (PDR) and
Critical Design Review (CDR), directly into the software development
lifecycle (SDLC), separated by a maturation period where risk is
deliberately retired through prototyping, analysis, and stakeholder
engagement.

The goal is not process for its own sake. It exists so that every team
member --- regardless of who introduces the new technology --- follows
the same disciplined path: screen it, prove it works in principle (PDR),
retire the risk, prove it works at scale and is ready to build (CDR),
then implement under change control. This consistency is what lets a PM,
chief engineer, or customer trust the status of any technology insertion
at any point in the project.

2\. The Integrated Lifecycle at a Glance

The diagram below shows how PDR and CDR sit inside the standard SDLC
phases, where the risk-retirement period falls between them, and which
governance threads run underneath the entire lifecycle regardless of
phase.

![Diagram showing SDLC phases with PDR and CDR gates, risk retirement
period, and governance
threads](./extracted_graphics/media/f736773f098e6f4f76bcaba672b93d6e934af15c.png "Integrated SDLC with PDR/CDR gates"){width="6.875in"
height="5.291666666666667in"}

2.1 Lifecycle Phases

  -------------------------------- -------------------------------------------------------------------- -----------------------------------------------------------------------------------------------
  **SDLC Phase**                   **Standard Activity**                                                **New-Technology Overlay**
  Concept & Requirements           Define problem statement, stakeholder needs, requirements baseline   Identify candidate technology/algorithm and why existing approaches are insufficient
  Technology Screening (Phase 0)   N/A in a standard SDLC                                               TRL assessment, make/buy/adapt analysis, initial risk register, ROM estimate, go/no-go to PDR
  Preliminary Design               Architecture and interface definition, early trade studies           PDR gate: trade study + prototype evidence justify the chosen approach
  Detailed Design                  Full design specification, ICDs, detailed test planning              Risk retirement period + CDR gate: design complete, tested at representative scale
  Implementation & Coding          Build to the baselined design                                        Design is under change control; any deviation requires a documented waiver
  Test & Verification              Execute test plans, validate against acceptance criteria             Verify algorithm/technology performance against CDR-approved acceptance criteria
  Deployment & O&M                 Release, monitor, maintain                                           Monitor technology-specific KPIs (accuracy drift, latency, security posture) in production
  -------------------------------- -------------------------------------------------------------------- -----------------------------------------------------------------------------------------------

3\. Phase 0: Technology Readiness Screening

Before committing design resources, every candidate technology or
algorithm is screened. This phase sits at the boundary between
Concept/Requirements and Preliminary Design in the SDLC.

Entry Criteria

-   Problem statement and rationale for why existing approaches are
    insufficient

-   Candidate technology/algorithm identified with a plausible fit

Activities

1.  Technology Readiness Level (TRL) assessment --- score 1--9; anything
    below TRL 4 (component validated in lab) requires a research spike
    before PDR, not a PDR.

2.  Make/buy/adapt analysis --- build vs. open-source/COTS vs. vendor.

3.  Initial risk register --- technical, schedule, licensing/IP, and
    security/compliance risk (critical for federal work: FedRAMP and ATO
    impacts, supply-chain provenance of any ML model or library).

4.  Rough order of magnitude (ROM) estimate for integration effort using basic
    work breakdown structure (WBS) strategies at a high level..

Exit Gate

Go/no-go decision by the technical lead to proceed into PDR
planning, documented in a one-page Technology Assessment Brief.

4\. Phase 1: Preliminary Design Review (PDR)

Objective: demonstrate the proposed approach is technically sound,
requirements are understood, and the design has enough definition to
proceed into detailed design without excessive risk.

4.1 Entrance Criteria

-   Approved requirements/traceability matrix for the feature the
    technology supports

-   Draft architecture showing where the new technology/algorithm fits
    (interfaces, data flow, boundaries)

-   Preliminary risk register with mitigation owners

-   Make/buy/adapt decision finalized

-   Security/compliance impact preliminarily assessed (data
    classification, ATO boundary changes, third-party code review needs)

4.2 Required Artifacts

Produced before the review, not during it:

  ------------------------------------------------------ --------------------------------------------------------------------------------------------------
  **Artifact**                                           **Purpose**
  Functional/performance requirements allocation         Ties algorithm outputs to system-level requirements
  Architecture diagrams (context, container, sequence)   Shows integration boundaries and interfaces
  Algorithm specification / trade study                  Compares candidate approaches with quantified criteria (accuracy, latency, cost, explainability)
  Prototype or proof-of-concept results                  Empirical evidence the approach is feasible (benchmarks, sample outputs, accuracy metrics)
  Data requirements and lineage                          Inputs needed, sources, quality, licensing, PII/classification handling
  Preliminary test strategy                              How correctness/performance will be validated later
  Risk register (v1)                                     Ranked risks with likelihood/impact/mitigation/owner
  ROM schedule and resource estimate                     Effort to reach CDR and implementation
  Open issues / action item list                         Anything unresolved, with owner and due date
  ------------------------------------------------------ --------------------------------------------------------------------------------------------------

4.3 Review

-   Chair: PM or Chief Engineer (independent of the design team where
    possible)

-   Technical SMEs (architecture, security/ISSO for federal systems,
    data engineering, QA)

-   Customer/stakeholder representative

-   Independent reviewer(s) not on the design team (avoids
    rubber-stamping)

4.4 Review Mechanics

1.  Package distributed to reviewers 5--7 business days prior (no
    live-reading-for-the-first-time reviews).

2.  Live session: design team presents; walk through architecture,
    algorithm rationale, and prototype results --- a working session,
    not a slide read-through.

3.  All comments logged in an action item tracker with disposition
    (accept/reject/defer) and owner.

4.  Chair polls the board for a formal recommendation.

4.5 Exit Criteria (PDR Success Criteria)

-   Requirements are stable enough to support detailed design

-   Chosen algorithm/technology approach justified by data (trade
    study + prototype), not assertion

-   No open risks rated "high" without an approved mitigation plan

-   Interfaces to the rest of the system are defined at least at a
    contract/schema level

-   Security and compliance path is understood (even if not fully
    executed)

-   All PDR action items have owners and due dates

-   Board disposition: Approved / Approved with Conditions / Not
    Approved (re-review required)

+----------------------------------------------------------------------+
| **Anti-pattern to avoid**                                            |
|                                                                      |
| Treating PDR as a formality after the design is basically done. If   |
| prototype data does not exist yet, that is a PDR failure, not a      |
| detail to defer.                                                     |
+----------------------------------------------------------------------+

5\. Risk Retirement Period (Between PDR and CDR)

This is where the real engineering happens --- treat it as a tracked
mini-program, not dead time. In SDLC terms, this period spans the back
half of Preliminary Design through most of Detailed Design.

1.  Action item burn-down --- every PDR RFI/action item tracked to
    closure with evidence, not just a checkbox.

2.  Detailed design --- full algorithm implementation design: data
    structures, complexity/performance budget, error handling, edge
    cases, configuration/tuning parameters.

3.  Expanded prototyping --- move from proof-of-concept to
    representative-scale testing (real or representative data volumes,
    real-world latency/throughput conditions).

4.  Test planning maturation --- detailed test cases, acceptance
    criteria, test data sets (including adversarial/edge cases for
    algorithms --- especially important for AI/ML-adjacent work).

5.  Interface control documents (ICDs) finalized and agreed with
    consuming/producing teams.

6.  Security review iteration --- if this touches an ATO boundary, this
    is when the ISSO/security team does its detailed pass, not at CDR.

7.  Independent verification where feasible --- a second engineer
    reproduces key prototype results.

+----------------------------------------------------------------------+
| **Gate check before scheduling CDR**                                 |
|                                                                      |
| PM confirms all PDR high-risk items are closed or have accepted      |
| residual risk sign-off, and detailed design is greater than 90%      |
| complete.                                                            |
+----------------------------------------------------------------------+

6\. Phase 2: Critical Design Review (CDR)

Objective: confirm the design is complete, correct, and ready for
implementation/coding with acceptable risk --- this is the last review
before significant construction cost is committed.

6.1 Entrance Criteria

-   All PDR action items closed (or formally deferred with rationale and
    risk acceptance)

-   Detailed design complete (not "mostly complete")

-   Test plans and acceptance criteria finalized

-   Prototype/pilot results at representative scale, not toy examples

6.2 Required Artifacts

  ----------------------------------------------------- --------------------------------------------------------------------------------------------
  **Artifact**                                          **Purpose**
  Detailed design specification                         Full algorithm/module design, data structures, interfaces, error handling
  Updated architecture diagrams                         Reflect any changes since PDR
  Interface Control Documents (final)                   Contractually binding interface definitions
  Test plan and acceptance test procedures              Traced to requirements; includes performance/load/security test cases
  Performance/benchmark results at scale                Evidence the algorithm meets latency/accuracy/throughput requirements under realistic load
  Updated risk register (v2+)                           Should show risk burn-down trend from PDR
  Security assessment / ATO artifacts (if applicable)   Final security posture, any waivers
  Implementation and rollout plan                       Deployment sequencing, feature flags, rollback plan
  Configuration management baseline                     What is being formally baselined at this gate
  Updated schedule and resource plan                    Reflects actuals since PDR, not just the original ROM
  ----------------------------------------------------- --------------------------------------------------------------------------------------------

6.3 Review Board Composition

Same core board as PDR, plus:

-   Operations/DevOps representative (deployment, monitoring, rollback
    feasibility)

-   QA lead (test plan sign-off authority)

-   Configuration management representative (baseline control)

6.4 Review Mechanics

Same discipline as PDR (advance distribution, written RFIs, logged
actions) with added rigor:

-   Focus on completeness and correctness, not exploration --- CDR is
    not the place to discover the algorithm does not work.

-   Walkthrough of test results against acceptance criteria, not just
    test plans.

-   Explicit review of failure modes, degraded-operation behavior, and
    rollback triggers.

-   Explicit review of any residual risks carried from PDR.

6.5 Exit Criteria (CDR Success Criteria)

-   Design is complete and internally consistent; no TBD/TBR items on
    the critical path

-   All interfaces finalized and agreed by consuming/producing teams

-   Test results demonstrate the algorithm/technology meets specified
    requirements at representative scale

-   Security/compliance sign-off obtained (or documented waiver with
    authority signature)

-   Rollback and contingency plan exists and is credible

-   Configuration baseline established --- design is now under change
    control

-   Board disposition: Approved for Implementation / Approved with
    Conditions / Not Approved

+----------------------------------------------------------------------+
| **Anti-pattern to avoid**                                            |
|                                                                      |
| Allowing CDR to become a second PDR because entrance criteria were   |
| not enforced. If detailed design is not done, do not hold the        |
| meeting --- slip the date.                                           |
+----------------------------------------------------------------------+

7\. Implementation, Test, and Deployment Under Baseline

Once CDR is approved, the design becomes a controlled baseline. This
does not end the process --- it changes its mode from design maturation
to change control.

-   Implementation and coding proceed strictly against the CDR-approved
    detailed design and ICDs.

-   Any proposed change to the baseline requires a documented
    deviation/waiver through the change control board, not silent drift.

-   Test & Verification executes the CDR-approved test plan and
    validates against the CDR-approved acceptance criteria --- no new
    acceptance criteria invented at test time.

-   Deployment follows the CDR-approved rollout and rollback plan,
    including feature flags and phased exposure where applicable.

-   Post-deployment, technology-specific KPIs (e.g., model accuracy
    drift, latency, false-positive rate, security posture) are monitored
    against the thresholds defined at CDR.

8\. Governance Threads Across the Whole Lifecycle

These mechanisms run continuously from Phase 0 through deployment ---
they are what makes the process durable and auditable rather than a
one-off ceremony.

8.1 Action Item Tracking

A single tracker (not per-meeting notes) with unique IDs, owners, due
dates, status, and closure evidence. Report open/closed counts at each
gate.

8.2 Risk Register Continuity

The same register evolves from Phase 0 through CDR; risk score trend is
a standing agenda item at both reviews.

8.3 Change Control

Anything altering the approved PDR baseline before CDR --- or the CDR
baseline afterward --- requires a documented deviation/waiver, not
silent drift.

8.4 Independent Assessment

At least one reviewer at each gate should have no stake in the design
decision, to counter confirmation bias --- especially important with
novel algorithms the team is excited about.

8.5 Decision Documentation

Every gate produces a signed review report: attendees, materials
reviewed, findings, disposition, conditions, and action items. This
becomes part of the project's audit trail, which is particularly
relevant for federal compliance contexts.

8.6 Tailoring

For smaller or lower-risk technology insertions, PDR and CDR can be
combined into a single \"Design Review\" gate, but the entrance/exit
criteria content should not be skipped --- only compressed in ceremony.

9\. Why This Aligns the Team to One Consistent Method

-   Every technology insertion --- regardless of which engineer proposes
    it --- passes through the same Phase 0 screen, PDR gate, risk
    retirement period, and CDR gate. No one's pet algorithm skips the
    line.

-   Entrance/exit criteria are checklist-driven, not judgment calls, so
    different reviewers reach the same go/no-go decision from the same
    evidence.

-   A single action item tracker and risk register per initiative gives
    the PM and chief engineer one place to check status instead of
    reconstructing it from meeting notes.

-   Independent reviewers and signed review reports create an audit
    trail that supports both internal accountability and external
    compliance review (ATO, customer audits).

-   Because the same artifacts (trade study, prototype results, ICDs,
    test plans) are required every time, new team members can ramp up on
    \"how we do design reviews here\" without re-learning it project by
    project.

-   The tailoring option (combined Design Review for low-risk
    insertions) keeps the process from becoming bureaucratic overhead on
    small changes, while preserving the same rigor of thought for
    anything genuinely novel.
