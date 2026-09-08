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

// Cross-reference to a numbered section, rendered as "§3.4" to match the
// source document's own citation style.
#let secref(l) = [§#ref(l, supplement: none)]

// A reference URL: clickable, and allowed to wrap at its separators so long
// links do not overflow the text block.
#let ref-url(u) = link(
  u,
  u.replace("/", "/\u{200B}").replace("-", "-\u{200B}").replace(".", ".\u{200B}"),
)

*A reference study of the frameworks, standards and vocabulary governing
industrial quality management, conducted to establish the external frame
against which the ATTEST product definition will be defended.*

Research conducted 8 September 2026.

#heading(level: 1, numbering: none)[Executive Summary]

This study set out to identify the reference framework for quality
management — the equivalent, for this discipline, of a governing process
model that names its processes, decomposes them into levels, and permits a
system to claim one region of the discipline and disclaim the rest.

*No such framework exists.* Quality management has instead produced several
partial frameworks that address different axes of the discipline and do not
compete with one another. This is the study's principal finding, and it
determines how the product definition must be written: a scope statement for
a quality application cannot claim a region of a process model, because no
authoritative process model is available to be divided.

Four further findings follow from that structure.

First, *ISO 9001 is a requirements standard, not a process model.* Its
clauses 4 to 7, 9 and 10 constitute a generic management-system structure
shared with unrelated standards; substantively all quality-specific content
is concentrated in clause 8 and clause 9.1. A product definition may
therefore be anchored to specific obligations — principally the sequence of
clauses 8.4, 8.6 and 8.7 — rather than to a process region.

Second, *the discipline has two axes rather than one.* Alongside the
management-system axis sits a substantial body of metrological literature
governing whether a recorded measurement carries meaning at all. This
literature has no counterpart in adjacent operational disciplines, and it is
the axis on which an inspection-recording system principally operates.

Third, *the proposition that a measured value lying inside a drawing
tolerance constitutes a verdict is incorrect.* It is one specific decision
rule, termed simple acceptance, applied without disclosure. The metrological
literature is unanimous that a conformity statement requires the measurement
uncertainty, the decision rule applied, and the acceptance limit as a value
distinct from the tolerance limit. A record retaining only a value and a
pass/fail flag cannot support a defensible verdict at the specification
boundary.

Fourth, *outsourcing production does not transfer accountability for
conformity, and the standards do not specify how much verification is
sufficient.* They establish the obligation and enumerate the categories of
control available. The extent of verification is determined by contract, by
customer requirement, and by the organisation's own documented risk
assessment.

A fifth finding constrains the product materially. *Special processes —
those whose output cannot be fully verified by subsequent inspection of the
product — cannot be discharged by receiving inspection at any level of
rigour.* Where such a process is performed by a third party, the frameworks
direct the organisation toward process evidence rather than product
measurement.

= Purpose and Scope

The study addresses one question: what is the standard structure of quality
management as a discipline, and what vocabulary does that structure provide
for defining the scope of a quality application?

*In scope.* The frameworks that decompose quality management; the position
of inspection and verification within them; the metrological literature
governing measurement validity; the governance of manufacturing processes
performed by external parties; and the terminology a product definition and
data model will both require.

*Out of scope.* Product benchmarking, which is the subject of a separate
study; the internal requirements of the ATTEST product; and any decision as
to what the product will do. Under the research conventions this project has
adopted, a study of this kind reports evidence and does not record choices.

The organisational context is a business that designs and sources
manufactured parts, outsources all production to independent machine shops,
inspects the delivered parts, and is accountable to its own customers —
including automotive customers — for their conformity.

= Methodology

The study was conducted across three parallel lines of enquiry, each
independently sourced and subsequently reconciled:

+ the management-system frameworks, including ISO 9001 and its structure,
  the automotive product-quality frameworks, and the module taxonomy adopted
  by commercial quality software;
+ the metrological literature governing measurement validity, uncertainty
  and conformity assessment;
+ the governance of outsourced manufacturing processes, including the
  automotive special-process assessment regime.

== Source hierarchy and access

The texts of ISO and IATF standards are published under licence and were not
available to this study. Where a clause is cited, the citation derives from
convergent secondary sources — certification bodies, registrars, accredited
training providers and standards-adjacent publishers — rather than from the
standard itself. *Every clause reference in this report should be verified
against a licensed copy before it is quoted in an audit or a contract.*

A number of sources were, by contrast, available in full and are treated as
primary:

- the International Vocabulary of Metrology, consulted through the annotated
  edition published by the Bureau International des Poids et Mesures;
- the National Institute of Standards and Technology's published policy on
  metrological traceability;
- the ISO/TC 176/SC 2 committee's own record of the ISO 9001 revision
  ballot;
- the AIAG catalogue of core-tool and special-process publications.

Findings resting on primary sources are identified as such at the point of
use. Findings resting on secondary sources carry no marker; readers should
assume secondary sourcing unless stated otherwise.

== Treatment of unverified material

Consistent with this project's research conventions, an item recorded as
unverified indicates that the study could not confirm it from a primary
source. It does not indicate that the item is false. Where published figures
conflict, both are recorded, with their sources, rather than reconciled or
averaged.

= Findings

== The discipline has no unified process reference model

The comparison worth drawing is with an adjacent operational discipline that
does possess one. The Supply Chain Operations Reference model, maintained by
ASCM, names the processes of its discipline, decomposes them into levels and
attaches standard performance metrics. A system operating in that discipline
can therefore state which region of the model it occupies and which it does
not, and the statement is checkable.

Quality management has produced no equivalent. Five candidate frameworks
were examined:

#figure(
  table(
    columns: (1fr, 1.1fr, 1.05fr, 1fr),
    table.header([Framework], [Decomposes], [Suited to], [Cannot express]),
    [ISO 9001 and the Harmonized Structure],
    [A management system into ten clauses, seven of them certifiable],
    [Auditable, cross-industry requirements language],
    [Quality work as named process steps],

    [AIAG Advanced Product Quality Planning],
    [Product launch into five phases with defined outputs],
    [The closest structural analogue available; the language of automotive
     customer audits],
    [Anything beyond launch; it does not address ongoing production],

    [The AIAG core tools],
    [A set of instruments — PPAP, FMEA, MSA, SPC],
    [Enumerating capability without inventing terminology],
    [A decomposition; it is a toolkit, not a map],

    [The Juran trilogy and the prevention-appraisal-failure cost model],
    [Quality into planning, control and improvement; cost into four
     categories],
    [Locating where value is created],
    [Operational structure; three or four categories is not a model],

    [The eQMS module taxonomy],
    [The market's own division into product modules],
    [Understanding what a purchaser expects to exist],
    [Authority; there is no governing body, only convergent vendor practice],
  ),
  caption: [The five candidate frameworks examined.],
)

Each decomposes something real. None decomposes the discipline. The finding
is a property of the field rather than a limitation of the study, and
attempting to force one candidate into the role of a governing model would
misrepresent it.

*Consequence for the product definition.* No framework offers a region to
claim. Scope must therefore be expressed as the obligations the work
discharges.

== The management-system framework and the position of inspection within it

ISO 9001:2015 employs the Harmonized Structure — the current designation for
the arrangement previously published as Annex SL — comprising three
introductory clauses followed by seven certifiable clauses: context,
leadership, planning, support, operation, performance evaluation and
improvement.

Clauses 4 to 7, 9 and 10 are substantially identical across ISO
management-system standards, which is what permits their integration into a
single management system, and which also means they carry no
quality-specific content. The subject matter of the discipline is
concentrated in clause 8 and clause 9.1.

#keep-with-next[
  Within that concentration, the clauses bearing on inspection and
  verification are:
]

#figure(
  table(
    columns: (auto, 1.15fr, 1.6fr),
    table.header([Clause], [Subject], [Significance]),
    [8.4],
    [Control of externally provided processes, products and services],
    [Governs the relationship with subcontracted manufacturing],

    [7.1.5],
    [Monitoring and measuring resources],
    [Calibration and metrological traceability of the equipment used to
     verify],

    [8.5.2],
    [Identification and traceability],
    [Identification of lots and parts through inspection],

    [8.6],
    [Release of products and services],
    [Requires that verification be completed and evidenced before release,
     with records identifying the releasing authority and demonstrating
     traceability to the acceptance criteria],

    [8.7],
    [Control of nonconforming outputs],
    [Identification, containment, disposition and re-verification, with
     records of the nonconformity, the action taken, any concession
     obtained, and the authority deciding],

    [9.1],
    [Monitoring, measurement, analysis and evaluation],
    [Converts individual records into aggregate performance data],
  ),
  caption: [The clauses of ISO 9001 bearing on inspection and verification.],
)

Clause 8.6 constitutes the clearest available description, at clause level,
of the central transaction of an inspection application: the record that
release was authorised because verification was satisfied.

*ISO 9001 does not assert a process model.* It asserts requirements that an
organisation's self-defined processes must satisfy. An informal
process-approach concept appears in clause 0.3 as guidance and is not
normative.

== Product-quality frameworks and the evidence of the sector variants

The five phases of Advanced Product Quality Planning constitute the closest
structural analogue to a process reference model identified by this study: a
lifecycle with defined outputs at each phase. Its limitation is one of
scope, in that it governs product introduction rather than ongoing
production. It nonetheless remains material, both because it is the
framework in which automotive customer audits are conducted and because the
Production Part Approval Process is its terminal output and is the artefact
owed to those customers.

The sector variants indicate what is core by demonstrating what varies.
AS9100 adds configuration management and counterfeit-part controls; IATF
16949 adds the automotive supplemental requirements; ISO 13485 adds
device-lifecycle and regulatory obligations and, notably, *declines to adopt
the Harmonized Structure* shared by the other management-system standards.
That divergence is evidence against any proposition that a single framework
serves all quality domains.

== The measurement-validity framework <sec-measurement>

A distinct body of literature governs whether a recorded number carries
meaning. It has no counterpart in adjacent operational disciplines, which do
not confront a measurement-uncertainty problem.

#long-table[
  #figure(
    table(
      columns: (1.15fr, 1fr, 1.4fr),
      table.header(repeat: true, [Question], [Governing document], [Provides]),
      [Definition of terms — measurand, uncertainty, traceability, accuracy,
       precision],
      [International Vocabulary of Metrology, JCGM 200:2012],
      [Canonical definitions, issued jointly by the principal metrological
       bodies _(primary source)_],

      [Expression of uncertainty on a measurement],
      [Guide to the Expression of Uncertainty in Measurement, JCGM
       100:2008],
      [Type A and Type B evaluation, combined and expanded uncertainty,
       coverage factor],

      [Whether a part measuring inside tolerance by less than the
       measurement uncertainty conforms],
      [ISO 14253-1 for dimensional metrology; ILAC-G8 generally],
      [The guard-band mechanism, conformance and non-conformance zones, and
       the default allocation of the burden of proof],

      [The same question in non-dimensional contexts],
      [JCGM 106:2012],
      [Acceptance and rejection regions, and named decision-rule forms],

      [Resolution where customer and supplier apply different uncertainty
       rules],
      [ISO 14253-3],
      [A procedure for agreeing and documenting a shared statement],

      [The content required of a report asserting conformity],
      [ISO/IEC 17025],
      [Requirement to record the result, its uncertainty, and the decision
       rule applied],

      [Maintenance of measuring equipment over time],
      [ISO 10012],
      [Metrological confirmation as a managed system. The 2026 edition
       supersedes the 2003 edition and incorporates decision-rule guidance],

      [Substantiation of a traceability claim],
      [JCGM 200:2012 clauses 2.41–2.42, with NIST's published policy],
      [The unbroken-chain definition, and NIST's explicit statement that it
       does not certify traceability claims made by third parties _(primary
       source)_],

      [Whether an instrument is adequate independently of any single
       measurement],
      [Measurement systems analysis — bias, linearity, stability,
       repeatability and reproducibility],
      [Instrument-level capability, without which a stated uncertainty is
       not credible],

      [Whether every unit must be measured],
      [ISO 2859-1 for attributes; ISO 3951 for variables],
      [Acceptance quality limits and operating-characteristic curves as
       expressions of batch-level risk],
    ),
    caption: [The measurement-validity literature, by the question each
      document governs.],
  )
]

== Decision rules in conformity assessment <sec-decision>

The literature is consistent on a point that most inspection practice does
not observe: *a measured value lying within the printed tolerance does not
by itself constitute a conformity decision.* It is the application of one
specific decision rule, termed simple acceptance, which declares a guard
band of zero and accepts the associated risk of false acceptance at the
specification boundary.

The reasoning proceeds as follows.

+ A characteristic carries a *tolerance*, which makes no reference to
  measurement.
+ Every measurement of that characteristic carries an *uncertainty*, which
  is a property of the measuring process — the instrument, the method, the
  environment and the operator — and which exists whether or not it is
  recorded.
+ A value lying near a limit is consequently ambiguous as to the true value
  of the part. ISO 14253-1 and JCGM 106 both formalise this by defining a
  *conformance zone* narrower than the tolerance and a *non-conformance
  zone* wider than it, with an intermediate region in which the measurement
  alone does not determine a verdict.
+ Under the default rule of ISO 14253-1, absent a documented agreement to
  the contrary, *the party asserting a verdict bears its own uncertainty*: a
  declaration of conformity requires the value to fall within the limit by
  more than the uncertainty, and a declaration of nonconformity requires it
  to fall outside by more than the uncertainty.
+ A system recording only the value against the limit has not declined to
  choose a decision rule. It has applied one and omitted to record it.
  ISO/IEC 17025 requires the decision rule to be stated whenever a
  conformity statement is issued, a requirement introduced precisely because
  the undisclosed default was judged inadequate for accredited work.

The corrective indicated by the literature is not the universal adoption of
a guard band. Simple acceptance is a legitimate and named rule, and is
regarded as low-risk where the test uncertainty ratio is high. The
corrective is that the rule be *explicit, recorded, and attributable to the
individual characteristic*, such that a boundary verdict can be defended by
reference to the recorded uncertainty, the rule applied, and the party on
whom that rule places the burden.

== The content required of a defensible measurement record

Read together, the documents in #secref(<sec-measurement>) indicate that a
measurement record supporting an accept or reject decision requires:

+ the *measurand*, identified precisely — the characteristic, the part, and
  the condition of the object;
+ the *measured value*;
+ the *measurement uncertainty*, expressed as an expanded uncertainty with
  its coverage factor, and not consolidated into a pass/fail indication;
+ the *traceability provenance* of the value — the reference to which the
  instrument's calibration chain leads;
+ the *tolerance limits*, retained as a distinct field;
+ the *acceptance limits actually applied*, where these differ, recorded
  explicitly rather than implied;
+ the *decision rule in force*, named, together with the basis on which it
  was agreed;
+ the *verdict*, as a conclusion derived from items 2 to 7 and
  reconstructible from them, rather than stored as an independent flag;
+ the *metrological confirmation status* of the instrument at the time of
  use.

A record retaining only a value and a pass/fail indication — the form of
both the paper inspection sheet and the majority of commercial inspection
software — cannot reconstruct or defend a boundary verdict, because it has
not retained the fields on which the verdict depends.

== Governance of production performed by an external party <sec-outsourcing>

Clause 8.4 has the effect of bringing an outsourced process within the
outsourcing organisation's own management system notwithstanding that
another party performs it. Accountability for conformity is not transferred.

The most precise articulation of the principle identified by this study
originates outside the general quality framework, in the medical-device
regime, where the concept of the legal manufacturer holds that *obligations
may not be delegated although activities may be subcontracted.* The
formulation is materially clearer than any found within ISO 9001 itself; the
retained-responsibility principle traces cleanly to the 2008 edition, but no
single clause of the 2015 edition states it as directly.

The standards establish the obligation and enumerate the categories of
control available. *They do not establish the sufficient extent of
verification.* That determination rests with contract, customer requirement,
and the organisation's own documented risk assessment, and the requirement
is that a determination be made and be capable of justification.

#keep-with-next[The mechanisms available, with their limits:]

#long-table[
  #figure(
    table(
      columns: (1fr, 1.35fr, 1.35fr),
      table.header(repeat: true, [Mechanism], [Verifies], [Does not verify]),
      [Supplier qualification],
      [Capability, system maturity, capacity and risk prior to first order],
      [Ongoing conformance; any part not yet produced],

      [Contractual flow-down],
      [That requirements were formally communicated],
      [That they were understood or will be met],

      [Second-party audit],
      [That documented controls exist and are followed, at the time of
       audit],
      [Conformance between audits; anything not sampled],

      [Third-party certification],
      [That an accredited body found the system conformant at a point in
       time],
      [Conformance of any individual lot; secondary sources are explicit
       that certification alone does not displace receiving inspection],

      [Source or surveillance inspection],
      [Process parameters and product condition at the point of production],
      [Anything occurring after the inspector's departure],

      [Receiving inspection],
      [Conformance of the delivered lot in respect of inspectable
       characteristics],
      [Special-process characteristics; anything outside the sampling plan],

      [Skip-lot and reduced inspection],
      [Nothing additional; a risk-based reduction justified by record],
      [The same matters as receiving inspection, sampled less frequently],

      [Certificate of conformance],
      [That the supplier has formally attested conformance],
      [Measured values; it is a declaration rather than independent
       evidence],

      [Certificate of analysis],
      [Values reported by the supplier for a specific lot],
      [Independence of the measurement],

      [Special-process assessment under the AIAG CQI series],
      [Whether the process itself is under control],
      [Conformance of any individual part; assessments are periodic],

      [Production Part Approval Process],
      [That the process met the design record at a production-rate trial],
      [Ongoing conformance following approval],

      [Supplier scorecard],
      [Trend in delivered performance],
      [Root cause; leading indicators],
    ),
    caption: [The control mechanisms available for outsourced production,
      with their limits.],
  )
]

The CQI special-process assessments are invoked through customer-specific
requirements rather than by IATF 16949 itself. Their applicability
accordingly depends on the customer rather than on certification status.

== Special processes and the limit of product verification <sec-special>

A *special process* is one whose output cannot be fully verified by
subsequent inspection or testing of the product alone. The definition
converges near-verbatim across three independent lineages — the aerospace
standard EN 9100, the NADCAP accreditation regime, and the automotive CQI
framing. Processes conventionally so classified include heat treatment,
welding, plating, coating, soldering, brazing, casting, moulding, adhesive
bonding and additive manufacturing.

The characteristic failure is latent. A welded joint may satisfy visual,
dimensional and radiographic examination while carrying hydrogen-induced
cracking; a furnace excursion may leave hardness outside specification in a
manner no surface measurement discloses.

The frameworks do not respond to this with more inspection. They respond
with process control — parameter recording with alarm, qualified procedures
and qualified personnel, and traceability — none of which can be verified by
examining the delivered part.

*The consequence is a limit on what any inspection system can assert.* For a
characteristic produced by a special process at a facility the organisation
does not operate, receiving inspection cannot close the verification gap at
any level of rigour. Process-control evidence — furnace records, welding
procedure qualifications, assessment scores, plating certificates carrying
process parameters — constitutes a distinct class of evidence from product
measurement, and a special-process characteristic should not be represented
as verified on the basis of dimensional or visual inspection alone.

== The hierarchy of verification evidence <sec-ladder>

The mechanisms in #secref(<sec-outsourcing>) do not carry equal weight. The
following ordering, from weakest to strongest, is a synthesis drawn across
the three lines of enquiry and *is not a hierarchy published by any
standard.*

+ A supplier's certificate of conformance alone, which is a declaration.
+ Third-party certification of the supplier's management system alone, which
  evidences the system at the time of audit.
+ A certificate of analysis reporting values, which remains
  supplier-originated.
+ Second-party audit or source inspection, which is direct but confined to a
  point in time.
+ The organisation's own receiving measurement, which is the baseline
  expectation and is structurally incapable of detecting special-process
  defects.
+ Special-process assessment, which is the only mechanism addressing the
  process rather than the product.

*No single mechanism is described anywhere in the literature as sufficient
in isolation.* The consistent position is that these are combined and
weighted according to risk, with the weighting left to the organisation.

= Terminology

Definitions drawn from the International Vocabulary of Metrology are
primary-sourced; the quality-management terms are secondary.

#long-table[
  #figure(
    table(
      columns: (1fr, 2.6fr),
      table.header(repeat: true, [Term], [Definition]),
      [Objective evidence],
      [Data supporting the existence or verity of something; the term ISO
       9001 employs for what an inspection record must constitute],

      [Conformity / nonconformity],
      [Fulfilment, or non-fulfilment, of a requirement],

      [Verification / validation],
      [Verification confirms that specified requirements have been
       fulfilled; validation confirms that requirements for a specific
       intended use have been fulfilled],

      [Disposition],
      [The decision taken on nonconforming output: correction, rework,
       repair, scrap, return, or concession],

      [Concession],
      [Permission to use or release product that does not conform to
       specified requirements],

      [Special characteristic],
      [A characteristic whose variation materially affects safety,
       compliance, fit, function or subsequent processing],

      [Measurand],
      [The quantity intended to be measured. Specification requires stating
       the condition of the object, not only naming a dimension _(VIM 2.3)_],

      [Measurement result],
      [A value together with its uncertainty. A value alone does not
       constitute a measurement result _(VIM 2.9)_],

      [Measurement uncertainty],
      [A non-negative parameter characterising the dispersion of values
       attributable to the measurand],

      [Metrological traceability],
      [The property whereby a result relates to a reference through a
       documented unbroken chain of calibrations, each contributing to
       uncertainty _(VIM 2.41–2.42)_],

      [Tolerance limit / acceptance limit],
      [The specification value, and the value actually applied in reaching
       the verdict. These are distinct quantities; the interval between them
       is the guard band],

      [Decision rule],
      [The documented rule describing how measurement uncertainty is
       accounted for in stating conformity],

      [Simple acceptance],
      [The decision rule in which the acceptance limit equals the tolerance
       limit],
    ),
    caption: [Terms of art used by the product definition and the data
      model.],
  )
]

= Implications for the Product Definition

The following are consequences the evidence supports. Under this project's
research conventions a study reports evidence and does not record decisions;
each item below requires a decision taken elsewhere.

+ *Scope may be expressed through clause obligations rather than through a
  claimed process region.* The sequence of clauses 8.4, 8.6 and 8.7 is
  present in some form in every sector variant examined, is currently in
  force, and is expressed in the language in which audits are conducted.
+ *The decision rule is indicated as a first-class attribute of a
  characteristic*, recorded at the point the verdict is formed. Introducing
  it subsequently renders every historical verdict ambiguous as to the basis
  on which it was reached.
+ *Process-control evidence is indicated as a class distinct from both
  product measurement and supplier declaration*, on the grounds established
  in #secref(<sec-special>).
+ *The evidence hierarchy in #secref(<sec-ladder>) has six levels*, which is
  finer than a binary distinction between measurement and declaration.
  Whether the product requires all six or a coarser grouping is a design
  question this study does not determine.
+ *Clause references should be confirmed against the sixth edition of ISO
  9001* before being fixed in a product definition or a procedure. See
  #secref(<sec-coverage>).

= Coverage and Confidence <sec-coverage>

== Surveyed

The management-system frameworks and their sector variants; the automotive
product-quality frameworks and core tools; the commercial quality-software
module taxonomy; the metrological literature governing vocabulary,
uncertainty, decision rules, measurement management and traceability; the
governance of outsourced processes including the special-process assessment
regime; and the medical-device treatment of the accountable manufacturer.

== Not reachable

*The texts of ISO and IATF standards.* Both are published under licence and
were unavailable. No clause number in this report was read from the standard
to which it refers. Every IATF clause reference in particular derives from
registrars and training providers rather than from the standard.

*Several freely published metrological documents in portable-document
format*, including the guard-band and risk tabulation of ILAC-G8, which was
specifically sought. The obstacle was one of document rendering rather than
of access rights, and the material is obtainable.

*Measurement systems analysis and the acceptance sampling standards* were
treated at the conceptual level only. Both are published under licence, and
the sampling tables are held, with their own recorded uncertainties, in a
separate study.

== Out of scope

Product benchmarking; the internal requirements of ATTEST; and any
determination as to what the product will do.

== Confidence

*High.* The absence of a unified process reference model; the concentration
of quality-specific content in clause 8; the structure and content of the
metrological literature; the decision-rule analysis at
#secref(<sec-decision>); and the special-process limit at
#secref(<sec-special>). Each rests either on primary sources or on
convergence across independent lineages.

*Moderate.* The clause numbering throughout, which is convergent across
secondary sources but unconfirmed against the standards; the account of IATF
supplemental requirements, which is secondary throughout; and the status of
the 2026 edition of ISO 10012.

*Reported as a synthesis rather than as a finding.* The evidence hierarchy
at #secref(<sec-ladder>), which is a construction of this study and is
published by no standard.

*Time-limited.* The sixth edition of ISO 9001 is expected on
16 September 2026. The closure of the final-draft ballot on 9 July 2026 is
confirmed from
the responsible ISO committee's own record _(primary source)_; the
publication date rests on converging secondary sources and is the weaker of
the two claims. Clause numbering in this report may be superseded shortly
after its issue. A second edition of IATF 16949 is separately reported to be
in preparation.

= References

== Primary sources

- Bureau International des Poids et Mesures, JCGM publications catalogue.
  #ref-url("https://www.bipm.org/en/committees/jc/jcgm/publications")
- International Vocabulary of Metrology (JCGM 200:2012), annotated edition.
  #ref-url("https://jcgm.bipm.org/vim/en/")
- National Institute of Standards and Technology, policy on metrological
  traceability. #ref-url("https://www.nist.gov/calibrations/traceability")
- ISO/TC 176/SC 2, ISO 9001 revision status.
  #ref-url("https://committee.iso.org/sites/tc176sc2/home/news/content-left-area/news-and-updates/iso-9001-revision-update-4.html")
- AIAG, quality core tools and manuals catalogue.
  #ref-url("https://www.aiag.org/training-and-resources/manuals")
- ISO catalogue entries, consulted for title, scope and edition status only.
  #ref-url("https://www.iso.org/standard/70137.html") (ISO 14253-1:2017);
  #ref-url("https://www.iso.org/standard/85864.html") (ISO 10012:2026)
- International Laboratory Accreditation Cooperation, ILAC-G8 revision
  notice. #ref-url("https://ilac.org/latest_ilac_news/revised-ilac-g8-published/")
- ISO, quality management principles.
  #ref-url("https://www.iso.org/quality-management/principles")

== Secondary sources — management-system frameworks

- #ref-url("https://the9000store.com/articles/iso-9001-2015-annex-sl/")
- #ref-url("https://blog.ansi.org/ansi/annex-sl/")
- #ref-url("https://blog.auditortrainingonline.com/blog/what-is-clause-8-operation-in-iso-90012015")
- #ref-url("https://davidbarker.consulting/iso9001/clause-8-6-release-of-products-and-services/")
- #ref-url("https://davidbarker.consulting/iso9001/clause-8-7-control-of-nonconforming-outputs/")
- #ref-url("https://preteshbiswas.com/2023/09/01/iso-90012015-clause-9-1-monitoring-measurement-analysis-and-evaluation/")
- #ref-url("https://www.9001simplified.com/learn/next-iso-9001-revision.php")
- #ref-url("https://www.smithers.com/resources/2026/january/iso-9001-news-preparing-for-the-2026-revision")
- #ref-url("https://www.dqsglobal.com/en/explore/focus-area/iso-9001-revision-at-a-glance")
- #ref-url("https://asq.org/quality-resources/iso-9000")
- #ref-url("https://asq.org/quality-resources/cost-of-quality")
- #ref-url("https://sgsystemsglobal.com/glossary/juran-trilogy/")

== Secondary sources — automotive frameworks and outsourcing

- #ref-url("https://quality-one.com/iatf-16949/")
- #ref-url("https://quality-one.com/ppap/")
- #ref-url("https://www.dqsglobal.com/en/explore/dqs-knowledge-center/iatf-16949-explained")
- #ref-url("https://preteshbiswas.com/2023/09/05/iso-90012015-clause-8-4-control-of-externally-provided-processes-products-and-services/")
- #ref-url("https://davidbarker.consulting/iso9001/8-4-control-of-externally-provided-processes-products-and-services/")
- #ref-url("https://the9000store.com/iso-9001-2015-requirements/iso-9001-2015-operational-requirements/external-providers/")
- #ref-url("https://unichrone.com/blog/quality-management/5-phases-of-advanced-product-quality-planning/")
- #ref-url("https://www.compro.gmbh/en/harmonisation-vda-aiag/")

== Secondary sources — metrology and conformity assessment

- #ref-url("https://hn-metrology.com/papers/decrules.htm")
- #ref-url("https://www.isobudgets.com/conformance-probability/")
- #ref-url("https://calibrationos.com/learn/guard-banding-decision-rules-ilac-g8")
- #ref-url("https://blog.ansi.org/ansi/iso-10012-2026-measurement-management-systems/")
- #ref-url("https://blog.beamex.com/iso-10012-is-being-updated")

== Secondary sources — sector variants and software taxonomy

- #ref-url("https://meddeviceguide.com/blog/iso-13485-vs-iso-9001-comparison")
- #ref-url("https://mdregulatory.com/iso-13485/")
- #ref-url("https://qmslearning.com/blog/as9100-requirements")
- #ref-url("https://quality.eleapsoftware.com/what-is-eqms-software-complete-guide-for-2025/")
- #ref-url("https://simplerqms.com/quality-management-system/")
