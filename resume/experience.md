# Satyam Jay — Experience & Background

## Contact
- Location: Delhi, India
- Email: satyamj@sit.iitd.ac.in
- GitHub: github.com/satyamjay-iitd
- Website: https://satyamjay-iitd.github.io/

## Summary
PhD student in Computer Science at IIT Delhi working on data streaming systems and
spatio-temporal / video-analytics query processing. Strong systems builder in Rust,
Python, Java, and C++, with prior industry experience as an ML engineer and SWE.

## Education

### PhD, Computer Science — Indian Institute of Technology, Delhi (Aug 2023 – Present)
- Research areas:
  - Online reconfiguration of data streaming systems (dynamic, on-the-fly rescaling with minimal latency impact). Accepted at EuroSys '27.
  - Querying spatio-temporal databases (declarative query languages and evaluation over video/object-track data). Under review at SIGMOD.
- Teaching Assistant: Cloud Computing, Software Design Practices.

### M.Tech, Computer Science — Indian Institute of Technology, Delhi (Jul 2020 – Jul 2022)
- Major Project: Autonomous Vehicle Simulation in Unity and CARLA.
- Coursework: Advanced Data Structures, Software Systems, Functional Programming, Machine Learning, NLP, Digital Systems.
- Teaching Assistant: Machine Learning, Intro to AI.

## Work Experience

### Machine Learning Engineer — Pepperfry, Mumbai, India (Jul 2022 – Jul 2023)
- Enhanced the recommendation engine by integrating user purchase history and search history data into the existing algorithm.
- Developed a reverse image search engine from scratch using feature vectors extracted from deep-learning models.
- NOTE: No measured/shipped metrics are available for these bullets — keep them accurate and unquantified; do NOT invent numbers or production-status claims.

### Software Engineering Intern — IBM, Bengaluru, India (Aug 2019 – Dec 2019)
- Developed an automated system for detecting and reporting compliance breaches.

## Projects (all authored by me unless noted)

### Tensile — on-the-fly dynamic rescaling for stream processing
- High-performance stream processing framework in Rust supporting on-the-fly dynamic rescaling with minimal latency impact.
- Executes job DAGs with online reconfiguration and fault recovery.
- Non-blocking protocol: new operator instances start processing immediately and merge the migrated state when it arrives; proven output-consistent with stop-and-resume reconfiguration.
- Implemented in a 12k-line Rust engine and in Apache Flink.
- Evaluated on NEXMark (Q3, Q5, Q6, Q7, Q8) against all-at-once (Chi, Trisk) and fluid (Megaphone) reconfiguration.
- Results (from the accepted EuroSys '27 paper): up to 8.8x lower P99 and 94x lower P95 latency than the best baseline (Q8); peak latency 3 s vs 12 s / 11.2 s on Q3 (~2 GB of migrated state). Use only these numbers.
- DRRS and Meces are discussed in the paper's related work but are NOT evaluated baselines — do not claim results against them.
- Repo: github.com/satyamjay-iitd/tensile_artifact
- Core research project for my "online reconfiguration of data streaming systems" work.

### FrameQL — query engine + DSL for spatio-temporal / video data
- Query engine and domain-specific language in Rust for spatio-temporal (video) data.
- Compiles declarative clip/state predicates into a relational algebra, applies rule-based optimization, and evaluates them via bit-matrix operations (shift-and algorithm).
- Uses property indexes for efficient sub-clip retrieval.
- Multi-crate Rust workspace (algebra, storage, DSL, predicates, bbox-compiler, server, TUI).
- Repo: github.com/satyamjay-iitd/frameql
- Core research project for my "querying spatio-temporal database" work.

### Streamary — streaming SQL engine (feature this as a full project)
- Streaming SQL engine in Rust.
- Parses SQL through an Apache Calcite / DataFusion planner into a physical plan, generates operator code, and executes it on a custom actor runtime.
- Repo: github.com/satyamjay-iitd/streamary

### Additional / smaller projects (keep condensed into one summary line)
- ReActor: distributed actor framework in Rust with a job manager and RPC-based control plane; provides the runtime substrate for scheduling and coordinating streaming operators across nodes. Repo: github.com/satyamjay-iitd/reactor
- FrameSense: actor-based video-analytics pipeline in Rust running on NVIDIA Jetson Orin (JetPack 6); hardware video decode with TensorRT and ONNX Runtime inference. Developed under the video-analytics-iitd lab org (repo name: Aperture) — avoid implying sole ownership.
- C Compiler using LLVM: built as part of a compilers course lab assignment.

## Skills
- Programming Languages: Rust, Python, Java, C++
- System Building: HTTP/RPC/TCP backends using FastAPI / Axum / Spring, gRPC, Tokio
- System Deployment: Linux, Docker, Kubernetes/K3s, Git
- Data Processing: SQL, Apache Calcite, DataFusion, Flink, Pandas, Matplotlib
- ML Systems: PyTorch, ONNX Runtime, TensorRT, Triton, NVIDIA DeepStream

## Notes for the resume writer
- Publications: "TENSILE: High-Throughput Reconfiguration of Streaming Pipelines." S. Jay, G. Juneja, A. Jindal, V. Jingar, K. Madhukar. EuroSys '27 (to appear). DOI not yet active — do not cite it.
- main.typ (the typeset resume) has newer hand-edited content than this file for TrQL (formerly FrameQL, with 126x speedup / 10x memory claims), the TA list, and Skills. Treat main.typ as authoritative for those.
- Do NOT list AWS as a skill (no concrete supporting use).
- Quantified metrics (latency, throughput, dataset sizes, benchmark deltas) are largely unavailable — ask rather than invent.
- Target: research/systems engineering roles; no specific job description is being targeted right now.
- Keep to 1 page (~450 words).
