#import "@preview/basic-resume:0.2.4": *

// Put your personal information here, replacing mine
#let name = "Satyam Jay"
#let location = "Delhi, India"
#let email = "satyamj@sit.iitd.ac.in"
#let github = "github.com/satyamjay-iitd"
// #let linkedin = "linkedin.com/in/stuxf"
#let personal-site = "https://satyamjay-iitd.github.io/"

#show: resume.with(
  author: name,
  // All the lines below are optional.
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  location: location,
  email: email,
  github: github,
  // linkedin: linkedin,
  personal-site: personal-site,
  accent-color: "#26428b",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: left,
  personal-info-position: left,
)

/*
* Lines that start with == are formatted into section headings
* You can use the specific formatting functions if needed
* The following formatting functions are listed below
* #edu(dates: "", degree: "", gpa: "", institution: "", location: "", consistent: false)
* #work(company: "", dates: "", location: "", title: "")
* #project(dates: "", name: "", role: "", url: "")
* certificates(name: "", issuer: "", url: "", date: "")
* #extracurriculars(activity: "", dates: "")
* There are also the following generic functions that don't apply any formatting
* #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
* #generic-one-by-two(left: "", right: "")
*/
== Education

#edu(
  institution: "Indian Institute of Technology, Delhi",
  location: "Delhi, India",
  dates: dates-helper(start-date: "Aug 2023", end-date: "Present"),
  degree: "PhD, Computer Science",
  // Uncomment the line below if you want edu formatting to be consistent with everything else
  consistent: true
)
- Research:
  - *Online Reconfiguration of Data Streaming Systems* (EuroSys '27): non-blocking rescaling of stream engines.
  - *Querying Spatio-Temporal Databases* (under review, VLDB): trajectory query engine modeling object motion as piecewise polynomials.
- Teaching Assistant: Cloud Computing, Software Design Practices, Operating Systems, Database.

#edu(
  institution: "Indian Institute of Technology, Delhi",
  location: "Delhi, India",
  dates: dates-helper(start-date: "July 2020", end-date: "July 2022"),
  degree: "M.Tech, Computer Science",
  // Uncomment the line below if you want edu formatting to be consistent with everything else
  consistent: true
)
- Major Project: Autonomous Vehicle Simulation in Unity and CARLA; TA: Machine Learning, Intro to AI
- Coursework: Adv. Data Structures, Software Systems, Functional Programming, Machine Learning, NLP, Digital Systems 

// #edu(
//   institution: "People's University",
//   location: "Bhopal, India",
//   dates: dates-helper(start-date: "July 2016", end-date: "July 2020"),
//   degree: "B.Tech, Computer Science and Mathematics",
//   // Uncomment the line below if you want edu formatting to be consistent with everything else
//   consistent: true
// )
// - Major Project:- Automatic attendance system using facial recognition.


== Publications
- *TENSILE: High-Throughput Reconfiguration of Streaming Pipelines.* *S. Jay*, G. Juneja, A. Jindal, V. Jingar, K. Madhukar. _EuroSys '27_ (to appear).

== Work
#work(
  title: "Machine Learning Engineer",
  location: "Mumbai, India",
  company: "Pepperfy",
  dates: dates-helper(start-date: "July 2022", end-date: "July 2023"),
)
- Enhanced recommendation engine by integrating user purchase history and search history data in the existing algorithm
- Built a prototype reverse image search engine using feature vectors from DL models

#work(
  title: "Software Engineering Internship",
  location: "Bengaluru, India",
  company: "IBM",
  dates: dates-helper(start-date: "Aug 2019", end-date: "Dec 2019"),
)
- Built an automated system to detect and report HIPAA-compliance violations across the compute infrastructure.

== Projects

#project(
  name: "Tensile",
  // Role is optional
  role: "Author",
  url: "github.com/satyamjay-iitd/tensile_artifact",
)
- Non-blocking reconfiguration protocol: new instances process immediately and merge migrated state on arrival; proven correct.
- Built in Rust (12k lines) and Apache Flink; up to 8.8× lower P99 latency than Chi, Trisk and Megaphone on NEXMark.

#project(
  name: "TrQS",
  role: "Author",
  url: "github.com/satyamjay-iitd/frameql",
)
- Rust query engine + DSL for spatio-temporal video queries; models object trajectories as piecewise quadratic polynomials and evaluates an interval-valued algebra by root-finding, up to 126× faster than SOTA with 10× less memory.

#project(
  name: "Streamary",
  role: "Author",
  url: "github.com/satyamjay-iitd/streamary",
)
- Streaming SQL engine in Rust; parses SQL through an Apache Calcite / DataFusion planner into a physical plan, generates operator code, and executes it on a custom actor runtime.

*Additional Projects:* ReActor (Rust distributed actor framework with job manager and RPC control plane), Aperture (distributed Rust video-analytics pipeline across Jetson-edge and server; a DeepStream alternative with TensorRT inference), and an LLVM-based C compiler.

// == Awards
// -  Excellent TA Award for Cloud Computing Course (2024)
// -  1st place in hackathon organized by IBM. (2019)

== Skills
- *Languages*: Rust, Python, Java, C/C++, SQL
- *System Building*: Async Rust (Tokio), gRPC, Docker, Kubernetes, Linux
- *Data & Query Engines*: RDBMS, Apache Flink, Apache Calcite 
- *GPU & Video ML*: PyTorch, TensorRT, CUDA Programming, Jetson, VLLM Internals
- *Tooling*: LLVM, Rust FFI bindings, Git, LaTeX
