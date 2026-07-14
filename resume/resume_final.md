# Satyam Jay

Delhi, India | satyamj@sit.iitd.ac.in | github.com/satyamjay-iitd | satyamjay-iitd.github.io

## Summary
PhD student in Computer Science at IIT Delhi researching data streaming systems and spatio-temporal video-analytics query processing. Systems builder in Rust, Python, Java, and C++.

## Education

**PhD, Computer Science — IIT Delhi** (Aug 2023 – Present)
- Research: online reconfiguration of data streaming systems (dynamic rescaling with minimal latency impact); querying spatio-temporal databases (declarative query languages over video/object-track data).
- Teaching Assistant: Cloud Computing, Software Design Practices.

**M.Tech, Computer Science — IIT Delhi** (Jul 2020 – Jul 2022)
- Major Project: Autonomous Vehicle Simulation in Unity and CARLA; TA for Machine Learning and Intro to AI.

## Work Experience

**Machine Learning Engineer — Pepperfry, Mumbai, India** (Jul 2022 – Jul 2023)
- Enhanced the recommendation engine by integrating user purchase and search history into the existing algorithm.
- Built a prototype reverse image search engine using feature vectors extracted from deep-learning models.

**Software Engineering Intern — IBM, Bengaluru, India** (Aug 2019 – Dec 2019)
- Built an automated system to detect and report HIPAA-compliance violations across the compute infrastructure.

## Projects

**Tensile — Dynamic Rescaling for Stream Processing (Rust)** | github.com/satyamjay-iitd/tensile_flink
- Built a high-performance stream processing framework supporting on-the-fly dynamic rescaling with minimal latency impact; executes job DAGs with online reconfiguration and fault recovery.
- Prototyped on Apache Flink 1.17 and evaluated on Nexmark against DRRS, Meces, and Megaphone, achieving lower reconfiguration latency and higher sustained throughput than all three baselines.

**FrameQL — Query Engine & DSL for Spatio-Temporal Data (Rust)** | github.com/satyamjay-iitd/frameql
- DSL and query engine for video/spatio-temporal data compiling declarative clip/state predicates into relational algebra with rule-based optimization, evaluated via bit-matrix (shift-and) operations and property indexes for sub-clip retrieval; multi-crate Rust workspace (algebra, storage, DSL, predicates, bbox-compiler, server, TUI).

**Streamary — Streaming SQL Engine (Rust)** | github.com/satyamjay-iitd/streamary
- Parses SQL through an Apache Calcite/DataFusion planner into a physical plan, generates operator code, and executes it on a custom actor runtime.

**Additional Projects:** ReActor, a distributed actor framework in Rust with an RPC-based control plane for scheduling streaming operators; FrameSense, a distributed video-analytics pipeline in Rust — an alternative to NVIDIA DeepStream — running across Jetson-edge and server with TensorRT/ONNX Runtime inference (built with the video-analytics-iitd lab); and a C compiler built with LLVM for a compilers course.

## Skills
- **Languages:** Rust, Python, Java, C++
- **Systems:** HTTP/RPC/TCP backends (FastAPI, Axum, Spring), gRPC, Tokio
- **Deployment:** Linux, Docker, Kubernetes/K3s, Git
- **Data Processing:** SQL, Apache Calcite, DataFusion, Flink, Pandas, Matplotlib
- **ML Systems:** PyTorch, ONNX Runtime, TensorRT, Triton, NVIDIA DeepStream
