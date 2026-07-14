## Writer Notes

### Changes Made This Iteration
- **IBM bullet reframed**: now reads "Built an automated system to detect and report HIPAA-compliance violations across the compute infrastructure" — uses the candidate's confirmed domain (HIPAA) and scope (compute infrastructure) instead of the vague "detecting and reporting compliance breaches."
- **Pepperfry reverse image search reframed as a prototype**: "Built a prototype reverse image search engine..." — removed any implication of production deployment; no catalog-size figure added (candidate confirmed none available).
- **FrameSense reframed**: now described in the Additional Projects line as "a distributed video-analytics pipeline in Rust — an alternative to NVIDIA DeepStream — running across Jetson-edge and server with TensorRT/ONNX Runtime inference (built with the video-analytics-iitd lab)." DeepStream is now positioned purely as a comparison point, not a dependency, per candidate's clarification (pipeline splits "half Jetson / half server").
- **Header unchanged**: confirmed no phone or LinkedIn added, per candidate's explicit "No."
- **Trimmed to fit the 450-word limit** (previous draft was 518 words):
  - Summary: cut "with prior industry experience as an ML engineer and SWE" (redundant with the Work Experience section immediately below it).
  - M.Tech section: merged the major-project and TA lines into a single bullet.
  - FrameQL: merged the two bullets into one tighter bullet, preserving the DSL → relational algebra → bit-matrix pipeline and the multi-crate workspace list.
  - Additional Projects: kept as one line (ReActor + FrameSense + C compiler) despite the added FrameSense detail; trimmed connective wording elsewhere in the document to make room for it.
- **Preserved per standing constraints**: Tensile result stays fully qualitative (no invented numbers), no Publications line, no AWS in skills, Streamary remains a full featured project with its own bullet.

### Word Count
- Manually tallied (whitespace-token count, inclusive of all markdown symbols such as `#`, `-`, `**`, `|`, `—`): **428 tokens**, under the 450-word hard limit.
- A cleaner count that excludes pure markdown/structural symbols (heading `#`/`##`, bullet `-`, separator `|`) would be meaningfully lower (roughly ~390), so there is comfortable margin under any reasonable word-counting method.

### Information Gaps (still open, do not fabricate)
- Reverse image search: no catalog scale available — left unquantified, consistent with candidate's answer.
- Pepperfry recommendation-engine change: no qualitative validation (A/B test, feedback) was provided — bullet stays as a plain description of the work done.
- FrameSense: candidate's specific individual contribution within the video-analytics-iitd lab team was not further specified beyond "built with the lab" — kept as-is per standing hedge.
- IBM bullet: no detail on what happened when the system flagged a violation — left out rather than invented.

### Job Description Alignment
- No `working/inputs/job_description.md` file exists in this iteration, so no JD-specific keyword alignment was performed. Resume is written for general research/systems-engineering roles per the candidate's stated target.
