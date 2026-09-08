// =============================================================================
// report.typ — EDIT THIS: your report content (the Typst port of main-article.tex).
//
// 1. Fill in metadata.typ.
// 2. Write your content below using plain Typst markup (see the cheatsheet).
// 3. Build (output goes into build/). --font-path fonts uses the bundled Dubai
//    font, so no system install is needed:
//      typst compile --font-path fonts report.typ "build/My Report.pdf"
//      typst watch  --font-path fonts report.typ "build/My Report.pdf"   (live preview)
//
// Set lang to "en" (left-to-right) or "fa" (Persian, right-to-left).
// =============================================================================

#import "karun.typ": *
#import "metadata.typ": meta

#show: karun-report.with(lang: "en", meta: meta)

// --- Title page + table of contents (leave these as-is) ---------------------
#title-page(meta, lang: "en")
#contents-page(lang: "en")

// ===========================================================================
// YOUR CONTENT STARTS HERE
// ===========================================================================

#heading(level: 1, numbering: none)[About This Document]

The external frame ATTEST's positioning is defended against, in the way
`scor-reference.md` serves TRACE in the
#link("https://github.com/Micheal-Friday/Trace")[sibling repository].
Commissioned 8 September 2026 across three research axes: the
management-system frames, the measurement-validity literature, and the
governance of production performed by someone else.

#quote(block: true)[
  *Provenance, stated once and load-bearing.* `iso.org` returned HTTP 403 on
  every fetch and the IATF site was unreachable, as in previous passes. *No
  ISO or IATF clause number in this document was read from the standard's own
  text.* All are reconstructed from convergent secondary sources —
  registrars, certification bodies, training providers — and must be verified
  against a licensed copy before being quoted to an auditor. The exceptions,
  confirmed from primary sources and marked inline below, are the VIM
  definitions, NIST's traceability policy, the ISO/TC 176/SC 2 committee
  page, and the AIAG CQI catalogue.
]

= TL;DR

- *There is no SCOR for quality management.* SCOR is one governed process
  model with named processes and standard metrics. Quality has several
  partial, non-competing frames on different axes, and none decomposes the
  discipline the way SCOR decomposes supply chain. Expecting a SCOR-shaped
  answer and forcing a candidate into it is the failure mode.
- *ISO 9001 is a requirements model, not a process model.* Clauses 4–7, 9
  and 10 are generic management-system scaffolding shared with ISO 14001,
  45001 and 27001. Almost all quality-specific content sits in *clause 8 and
  9.1*.
- *So ATTEST's positioning must be clause-anchored, not process-anchored.*
  TRACE could say _"we are the supply-side intelligence layer of the Source
  pillar."_ ATTEST's equivalent is _"we generate the objective evidence
  clauses 8.6 and 8.7 require."_
- *The anchor is the 8.4 → 8.6 → 8.7 chain* — control of externally provided
  processes, release of product, control of nonconforming output. It
  survives in some form under IATF 16949, AS9100 and ISO 13485 alike.
- *Quality needs two axes where supply chain needed one.* Alongside the
  management-system axis sits a *measurement-validity axis* — VIM, GUM,
  ISO 14253-1, ILAC-G8 — that governs whether a recorded number means
  anything. Supply chain has no equivalent literature because it has no
  measurement-uncertainty problem. ATTEST does.
- *"Value inside the printed tolerance" is not a complete verdict.* It is
  one specific decision rule — _simple acceptance_ — applied silently,
  declaring a guard band of zero and accepting the false-accept risk that
  implies at the boundary. Most QC software and every paper form gets this
  wrong by not recording which rule was in force.
- *Outsourcing pulls the process inside your own QMS.* Clause 8.4 makes an
  outsourced process part of the outsourcing organisation's system even
  though someone else performs it, and accountability for conformity never
  transfers. The standards establish _that_ obligation and _what categories_
  of control exist — *they do not establish how much verification is
  enough.* That line is drawn by contract, customer requirement, and
  documented risk judgement.
- *Special processes are a hard limit.* Heat treatment, welding, plating,
  coating and their kin are defined by the fact that their output _cannot_
  be fully verified by inspecting the product afterwards. For those
  characteristics, no amount of receiving inspection closes the gap — and
  the frames' answer is process evidence, not more measurement.

= Key Findings

+ *No governing process model exists for quality.* Five candidate frames
  were surveyed. Each decomposes something real; none decomposes the
  discipline. This is a finding, not a gap in the research.
+ *The quality-specific content of ISO 9001 is concentrated in one clause.*
  Clause 8 (Operation) plus 9.1 (monitoring and measurement) carry it; the
  rest is Harmonized Structure boilerplate. That concentration is what makes
  clause-anchoring viable as a positioning strategy.
+ *ISO 9001’s sixth edition is days away.* The FDIS ballot closed 9 July
  2026 _(confirmed from the ISO/TC 176/SC 2 committee page directly —
  primary)_. Publication is expected *16 September 2026* _(converging
  secondary sources; weaker evidence than the ballot close)_. Clause numbers
  in this document may be superseded within days of it being written.
+ *The measurement-validity axis is where ATTEST's real differentiation
  lives*, and it is the axis no supply-chain frame prepares you for.
+ *A system that stores only "value" and "pass/fail" cannot defend a
  borderline verdict* against any of the metrology standards, because it has
  discarded exactly the fields the verdict depends on — uncertainty, the
  decision rule, and the acceptance limit as distinct from the tolerance
  limit.
+ *The evidence ladder has about six rungs, not two.* A supplier
  certificate, a third-party certification, a certificate of analysis, a
  source inspection, your own measurement, and a process assessment are all
  different weights of evidence. *No single mechanism is described anywhere
  in the literature as sufficient alone.*
+ *Medical devices hold the most mature answer to Pargar's situation*,
  despite Pargar not being in medical. EU MDR and ISO 13485’s _legal
  manufacturer_ concept states it cleanly: *obligations cannot be delegated;
  activities can be subcontracted.*
+ *CQI special-process assessments bind through customer-specific
  requirements, not through IATF 16949 itself* _(secondary)_. Whether they
  apply to Pargar depends on which automotive customer, not on certification
  status.
+ *Commercial quality platforms treat inspection as a sub-feature.*
  Governance modules — CAPA, audit, document control, training — are
  first-class; inspection execution is typically folded under "supplier
  quality." Consistent with the product benchmark's independent finding that
  no product binds a defect photograph to a specific characteristic on a
  specific piece.

= Details

== Is there a SCOR for quality? No — and the shape of the "no" matters

SCOR works for TRACE because it is a _process reference model_: it names
processes, decomposes them into levels, and attaches standard metrics, so a
system can claim a region of it and disclaim the rest. Quality management
has produced nothing equivalent. What exists instead:

#figure(
  table(
    columns: (0.9fr, 1fr, 1.05fr, 1.05fr),
    table.header([Frame], [What it decomposes], [Good for], [Cannot express]),
    [*ISO 9001 / Harmonized Structure*],
    [A management system into ten clauses, seven certifiable],
    [Auditable, cross-industry requirements language auditors already speak],
    [Quality _work_ as named process steps; most of its text is generic
     scaffolding],

    [*AIAG APQP*],
    [Product launch into five phases with defined outputs],
    [The closest thing to SCOR in shape; what automotive customers audit
     against],
    [Anything after launch — it is scoped to new product introduction, not
     ongoing production],

    [*AIAG core tools* (PPAP, FMEA, MSA, SPC)],
    [A toolkit],
    [Enumerating capability without inventing vocabulary],
    [A decomposition — it is a set of instruments, not a map],

    [*Juran trilogy / PAF cost-of-quality*],
    [Quality into planning/control/improvement, or cost into
     prevention/appraisal/failure],
    [Arguing _where value is created_ — which Pargar's business report
     already does with its seven stages],
    [Anything operational; three or four boxes is not a model],

    [*eQMS module taxonomy*],
    [The market's own decomposition into product modules],
    [Knowing what a buyer expects to exist],
    [Authority — there is no governing body, only convergent vendor
     practice],
  ),
  caption: [The candidate frames surveyed, and what each can and cannot do.],
)

*The consequence for positioning.* ATTEST cannot make a SCOR-shaped claim,
because no frame offers a pillar to claim. The move available instead is to
anchor on the obligations the work discharges.

== The management-system axis — where inspection actually lives

ISO 9001:2015 uses the *Harmonized Structure* (the current name for what was
Annex SL, renamed in the ISO/IEC Directives around 2021 with no reported
substantive change): clauses 1–3 introductory, then *4 Context · 5
Leadership · 6 Planning · 7 Support · 8 Operation · 9 Performance
evaluation · 10 Improvement*.

Clauses 4–7, 9 and 10 are near-identical across ISO management-system
standards — which is exactly why they can be integrated into one system, and
exactly why they carry no quality-specific content. Within clause 8, the
relevant chain _(all clause numbers secondary-sourced — see the provenance
banner)_:

#figure(
  table(
    columns: (1fr, 1.35fr, 1.45fr),
    table.header([Clause], [What it governs], [Why it matters here]),
    [*8.4* Control of externally provided processes, products and services],
    [The successor to "purchasing"; covers outsourced _processes_, not just
     bought parts],
    [The clause governing Pargar's entire relationship with its workshops],

    [*7.1.5* Monitoring and measuring resources],
    [Calibration and traceability of the gauges used to verify],
    [The gauge register and the recall query],

    [*8.5.2* Identification and traceability],
    [Lot and part traceability through inspection],
    [],

    [*8.6* Release of products and services],
    [Verification must be completed and evidenced before release; records
     must show who authorised it and traceability to the acceptance
     criteria],
    [*The single clearest clause-level description of what an inspection
     application's core transaction is*],

    [*8.7* Control of nonconforming outputs],
    [Identify, contain, disposition, re-verify after correction; record the
     nonconformity, the action, any concession, and the authority who
     decided],
    [The NCR model],

    [*9.1* Monitoring, measurement, analysis and evaluation],
    [Deciding what to measure and turning records into performance data],
    [The reporting layer, distinct from the transactional 8.6/8.7 layer],
  ),
  caption: [The relevant clause chain within ISO 9001 clause 8.],
)

*ISO 9001 is a requirements model wrapped in a generic skeleton*, with an
informal process-approach concept in clause 0.3 offered as guidance only. It
does not assert a process model, so ATTEST cannot implement one. It asserts
requirements that an organisation's self-defined processes must meet — which
is a claim ATTEST _can_ make.

== APQP, the core tools, and what the sector variants reveal

*APQP's five phases* are the closest structural analogue to SCOR found: a
lifecycle with defined outputs per phase. Its limit is scope — it governs
product launch, not the ongoing production ATTEST sits in. It remains worth
speaking because it is the language automotive customers audit in, and
because *PPAP is its terminal output* and the artifact Pargar owes its
customers.

*The sector variants tell you what is core by showing what varies.* AS9100
adds configuration management and counterfeit-part controls; IATF 16949 adds
the automotive supplemental clauses; ISO 13485 adds device-lifecycle and
regulatory obligations — and *deliberately opted out of the Harmonized
Structure* the others share. That opt-out is decent evidence against any
claim that one frame fits all quality domains.

== The measurement-validity axis — the literature supply chain has no equivalent of

ATTEST turns physical parts into numbers. A separate body of standards
governs whether those numbers mean anything.

#long-table[
  #figure(
    table(
      columns: (1.3fr, 0.9fr, 1.5fr),
      table.header(repeat: true, [Question], [Reach for], [What it gives]),
      [What do these words mean — measurand, uncertainty, traceability,
       accuracy vs precision?],
      [*VIM (JCGM 200:2012)*],
      [Canonical definitions, joint across BIPM/ISO/IEC/ILAC/OIML
       _(primary — read from BIPM's browsable annotated VIM)_],

      [How do I express uncertainty on a measurement?],
      [*GUM (JCGM 100:2008)*],
      [Type A/B evaluation, combined and expanded uncertainty, coverage
       factor k],

      [*A part measures inside tolerance by less than my uncertainty — does
       it pass?*],
      [*ISO 14253-1* (dimensional) · *ILAC-G8* (general)],
      [The guard-band mechanism, conformance and non-conformance zones, the
       default burden-of-proof rule],

      [Same question, non-dimensional],
      [*JCGM 106 / ISO-IEC Guide 98-4*],
      [Acceptance and rejection regions, named decision-rule shapes],

      [Customer and supplier disagree on whose uncertainty rule applies],
      [*ISO 14253-3*],
      [A procedure for negotiating and documenting an agreed statement],

      [What must a report state if we claim conformity?],
      [*ISO/IEC 17025*],
      [Result + uncertainty + *the decision rule used*],

      [How do we keep gauges trustworthy over time?],
      [*ISO 10012*],
      [Metrological confirmation as a managed system. The *2026 edition
       replaces the 2003* and now explicitly folds in decision-rule
       guidance],

      [Is our "traceable to NIST" claim substantiated?],
      [*VIM 2.41–2.42 + NIST's own policy*],
      [The unbroken-chain definition, and NIST's explicit statement that *it
       does not certify third parties' traceability claims* _(primary)_],

      [Is the gauge good enough, independent of any one measurement?],
      [*MSA* — bias, linearity, stability, gauge R&R, NDC],
      [Gauge-level capability, without which a small stated uncertainty is
       not credible],

      [Must we measure every part?],
      [*ISO 2859-1* (attributes) · *ISO 3951* (variables)],
      [AQL and operating-characteristic framing for batch-level risk],
    ),
    caption: [The measurement-validity literature, by the question each
      standard answers.],
  )
]

== The decision-rule problem — the most consequential concept in this document

The literature is unanimous that *"measured value inside the printed
tolerance" is not a complete decision rule.* It is one specific rule —
_simple acceptance_ — that looks like merely reading the drawing, while
silently declaring a guard band of zero.

+ Every characteristic has a printed *tolerance*. It makes no reference to
  measurement.
+ Every measurement carries *uncertainty*. It does not disappear because the
  software has no field for it; it is a property of the gauge, method,
  environment and operator.
+ So a value near a limit is genuinely ambiguous about the part's _true_
  value. ISO 14253-1 and JCGM 106 formalise this with a *conformance zone*
  narrower than the tolerance and a *non-conformance zone* wider than it —
  with a named strip between them where the measurement alone cannot force a
  verdict.
+ *Whoever asserts a verdict bears the cost of their own uncertainty.* Under
  ISO 14253-1’s default, absent a documented agreement: to declare _pass_,
  the value must clear the limit by more than the uncertainty; to declare
  _fail_, it must miss by more than the uncertainty.
+ *Software gets this wrong specifically* by treating value-versus-limit as
  the whole decision, with no uncertainty field, no stated guard band, and
  no record of which rule applied. Per ILAC-G8 that is not a null choice —
  it _is_ a decision rule, just an undisclosed one. ISO/IEC 17025 requires
  the rule to be stated whenever a conformity statement is issued, precisely
  because accreditors decided the silent default was no longer acceptable.
+ *The fix is not "always guard-band."* Simple acceptance is legitimate and
  named, and is broadly low-risk at a high test uncertainty ratio. The fix
  is to make the rule *explicit, recorded, and attributable per
  characteristic*, so a borderline verdict can be defended by pointing at
  the recorded uncertainty, the rule applied, and who that rule places the
  burden on. That triple is what _defensible_ means in this literature.

== What a measurement record must carry

Derived from VIM, GUM, ISO 14253-1, ILAC-G8 and ISO/IEC 17025 read
together — not from software convention:

+ *The measurand*, precisely identified — which characteristic, on which
  part, in what state
+ *The measured quantity value*
+ *The measurement uncertainty* — expanded uncertainty with its coverage
  factor, not folded silently into a flag
+ *Traceability provenance* — what the gauge's calibration chain traces to
+ *The tolerance limits* — the drawing values, as their own field
+ *The acceptance limits actually applied*, if different — the guard band,
  explicit, never implied
+ *The decision rule in force*, named, and who it was agreed with
+ *The verdict as a conclusion derived from 2–7*, reconstructable from the
  other fields rather than stored as an unexplained flag
+ *Metrological confirmation status of the gauge* at time of use, ideally
  with gauge R&R data

#quote(block: true)[
  A system storing only _value_ and _pass/fail_ — the shape of the paper
  form ATTEST replaces, and of most off-the-shelf QC software — cannot
  reconstruct or defend a borderline verdict, because it discarded the
  fields the verdict depends on.
]

== Outsourced production — whose QMS governs

*Clause 8.4 pulls the outsourced process inside the outsourcing
organisation's own QMS*, even though another party performs it.
Accountability for conformity never transfers. The clearest formulation of
the principle found anywhere is from EU MDR and ISO 13485’s _legal
manufacturer_ concept: *obligations cannot be delegated; activities can be
subcontracted.*

But the standards stop earlier than expected. They establish *that* the
obligation exists and *what categories* of control are available. They do
not establish *how much* verification is enough. That is set by contract,
customer requirement, and the organisation's own documented risk
judgement — and the requirement is to have determined one and be able to
justify it.

#keep-with-next[The mechanisms available, and what each cannot do:]

#long-table[
  #figure(
    table(
      columns: (1fr, 1.4fr, 1.4fr),
      table.header(repeat: true, [Mechanism], [Verifies], [Cannot verify]),
      [Supplier qualification],
      [Capability, QMS maturity, capacity, risk profile before first order],
      [Ongoing conformance; anything about a part not yet run],

      [Contractual flow-down],
      [That requirements were formally communicated],
      [That they were understood or will be met — necessary, not
       sufficient],

      [Second-party audit],
      [That documented controls exist and are followed, at the audit
       moment],
      [Conformance between audits; anything not sampled],

      [Third-party certification],
      [An accredited body found the system conformant at a point in time],
      [Lot-level conformance — *explicitly not sufficient alone* to remove
       receiving inspection],

      [Source / surveillance inspection],
      [Process parameters and product state at production, including things
       unavailable later],
      [Anything after the inspector leaves],

      [*Receiving inspection*],
      [Conformance of the delivered lot on inspectable characteristics],
      [*Special-process characteristics* (@special-processes); anything
       outside the sampling plan],

      [Skip-lot / dock-to-stock],
      [Nothing new — a risk-based _reduction_, earned by track record],
      [Same gaps, sampled less; drift caught later],

      [Certificate of conformance],
      [That the supplier formally attests conformance],
      [Actual values — a claim, _"an input, not a substitute"_],

      [Certificate of analysis],
      [Actual results reported by the supplier],
      [Independence — still supplier-originated unless from an accredited
       lab],

      [*CQI special-process assessment*],
      [Whether the _process_ is under control — the only substitute for
       impossible product-level verification],
      [Any individual part; periodic, so drift between assessments is
       missed],

      [PPAP],
      [That the process met the full design record at a production-rate
       trial],
      [Ongoing conformance after approval; unreported changes],

      [Supplier scorecard],
      [Trend of delivered performance],
      [Root cause; leading indicators],
    ),
    caption: [The control mechanisms available under clause 8.4, and the
      limits of each.],
  )
]

== Special processes — the hard limit on what inspection can promise <special-processes>

A *special process* is one whose output cannot be fully verified by
subsequent inspection or testing of the product alone. The definition
converges near-verbatim across three independent lineages — EN 9100
aerospace, NADCAP, and automotive CQI framing. Commonly: *heat treatment,
welding, plating, coating, soldering, brazing, casting, moulding, adhesive
bonding, additive manufacturing*, and non-destructive testing itself.

A weld can pass visual, dimensional and radiographic inspection and still
carry hydrogen-induced cracking. A furnace excursion can leave hardness out
of spec in a way no surface measurement reveals.

*The frames' answer is not "inspect harder."* It is that quality must be
built into the process — parameter control with continuous recording and
alarms, qualified procedures and operators, traceability — all of which can
only be verified by observing or auditing the process, never the shipped
part.

*Stated plainly for ATTEST:* for any characteristic produced by a special
process at a shop Pargar does not operate, *no amount of receiving
inspection closes the verification gap.* The honest position is that
process-control evidence — furnace charts, weld procedure qualifications,
CQI scores, plating certificates carrying parameters — is a *distinct
evidence class* from product measurement, and a special-process
characteristic must not be represented as _verified_ on the strength of
dimensional or visual inspection alone.

== The evidence ladder <evidence-ladder>

Weakest to strongest. *This ranking is a synthesis across the research, not
a table published by any standard.*

+ *Supplier certificate of conformance alone* — a claim
+ *Third-party QMS certification alone* — the system was sound at audit
  time
+ *Certificate of analysis with data* — better, still supplier-originated
+ *Second-party audit / source inspection* — direct, but point-in-time
+ *Your own receiving measurement* — the baseline expectation, and
  structurally blind to special-process defects
+ *CQI-style process assessment* — the only mechanism targeting the process
  rather than the product

*No single rung is sufficient alone.* The literature's consistent theme is
that these are combined and risk-weighted, with the weighting left to the
organisation.

== Vocabulary

Terms of art a positioning document and a data model will both use.
Definitions from VIM are primary-sourced; the quality terms are secondary.

- *Objective evidence* — data supporting the existence or verity of
  something. The phrase ISO 9001 uses for what an inspection record must
  constitute.
- *Conformity / nonconformity* — fulfilment, or non-fulfilment, of a
  requirement.
- *Verification vs validation* — verification confirms specified
  requirements have been fulfilled; validation confirms requirements for a
  specific intended use have been fulfilled. ATTEST does the first.
- *Disposition* — the decision taken on nonconforming output: correction,
  rework, repair, scrap, return, concession.
- *Concession* — permission to use or release product that does not conform
  to specified requirements.
- *Special characteristic* — a characteristic whose variation materially
  affects safety, compliance, fit, function or subsequent processing.
- *Measurand* _(VIM 2.3)_ — the quantity intended to be measured.
  Specifying one requires stating the state of the object, not just naming
  a dimension.
- *Measurement result* _(VIM 2.9)_ — a value _together with_ its
  uncertainty. A number alone is not a measurement result.
- *Measurement uncertainty* — non-negative parameter characterising the
  dispersion of values attributable to the measurand.
- *Metrological traceability* _(VIM 2.41–2.42)_ — the property of a result
  whereby it relates to a reference through a documented unbroken chain of
  calibrations, each contributing to uncertainty.
- *Tolerance limit vs acceptance limit* — the drawing value versus the
  value actually used to gate the verdict. *Different fields.* The gap
  between them is the guard band.
- *Decision rule* — the documented rule describing how uncertainty is
  accounted for when stating conformity.
- *Simple acceptance / shared risk* — the decision rule where the
  acceptance limit equals the tolerance limit. The silent default.

= Recommendations

Evidence points these ways. *Research does not decide* — these are inputs to
positioning, not choices already made.

+ *Anchor positioning on the 8.4 → 8.6 → 8.7 chain.* It is universal across
  sector variants, currently in force, and speaks the language an IATF
  auditor already uses. The structural chain is unlikely to be renumbered by
  the sixth edition, though that is a judgement.
+ *Claim clauses, not pillars.* _"ATTEST generates the objective evidence
  clause 8.6 requires before release, and the record clause 8.7 requires
  when release is refused."_
+ *Treat the decision rule as a first-class field*, per characteristic,
  from the first schema. Retrofitting it makes every historical verdict
  ambiguous, and it is the difference between a verdict that can be
  defended and one that can only be asserted.
+ *Model process-control evidence as its own class*, distinct from both
  product measurement and supplier claims — because @special-processes says
  some characteristics can be verified no other way.
+ *The binary `observed | claimed` split in the architecture hints is too
  coarse.* The ladder in @evidence-ladder has six rungs. Whether the schema
  needs all six or a coarser grouping is a design decision this research
  does not make.
+ *Wait for the sixth edition before freezing clause numbers.* Expected
  16 September 2026.

= Caveats

- *No ISO or IATF clause was read from primary text.* See the provenance
  banner. Every clause number here needs verification against a licensed
  copy before it is quoted to an auditor.
- *ISO 9001’s sixth edition is expected 16 September 2026* — days after
  this was written. The FDIS ballot close (9 July 2026) is primary-sourced;
  the publication date is not.
- *PDF rendering was unavailable in the research environment*, which
  blocked verbatim access to several freely-published primary documents —
  including ILAC-G8’s guard-band-versus-risk table, which was specifically
  sought. This is a tooling limitation, not a paywall, and the table is
  obtainable.
- *The evidence ladder in @evidence-ladder is a synthesis*, not a published
  standard.
- *Every IATF clause and the CQI assessor requirements are
  secondary-sourced.* Specific skip-lot thresholds and the CQI assessor
  experience rule are illustrative, not normative.
- *MSA and sampling were covered conceptually only* — both paywalled, and
  the sampling tables are already held in `50-research/` with their own
  disputed cells.
- The retained-responsibility principle traces cleanly to ISO 9001:2008
  clause 4.1; *no single 2015-numbered sentence states it as crisply*,
  which is worth knowing before citing it.
