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
- Main Area of work: Metastable failure mitigation in distributed data streaming system.
- Currently working on:
  - Building new protocols for online rescaling and fault recovery of distributed systems in order to mitigate the metastable failures.
  - Exploring oppurtunites for optimization in distributed ML based video pocessing queries, and benchmarking current SOTAs
- Teaching Assistant: Cloud Computing, Software Design Practices
  // - Relevant Coursework: Data Structures, Program Development, Microprocessors, Abstract Algebra I: Groups and Rings, Linear Algebra, Discrete Mathematics, Multivariable & Single Variable Calculus, Principles and Practice of Comp Sci

#edu(
  institution: "Indian Institute of Technology, Delhi",
  location: "Delhi, India",
  dates: dates-helper(start-date: "July 2020", end-date: "July 2022"),
  degree: "M.Tech, Computer Science",
  // Uncomment the line below if you want edu formatting to be consistent with everything else
  consistent: true
)
- Major Project:- Autonomous Vehicle Simulation in Unity and CARLA
- Coursework: Adv. Data Structures, Software Systems, Functional Programming, Machine Learning, NLP, Digital Systems 
- TA: Machine Learning, Intro to AI

// #edu(
//   institution: "People's University",
//   location: "Bhopal, India",
//   dates: dates-helper(start-date: "July 2016", end-date: "July 2020"),
//   degree: "B.Tech, Computer Science and Mathematics",
//   // Uncomment the line below if you want edu formatting to be consistent with everything else
//   consistent: true
// )
// - Major Project:- Automatic attendance system using facial recognition.


== Work
#work(
  title: "Machine Learning Engineer",
  location: "Mumbai, India",
  company: "Pepperfy",
  dates: dates-helper(start-date: "July 2022", end-date: "July 2023"),
)
- Enhanced recommendation engine by integrating user purchase history and search history data in the existing algorithm
- Developed a reverse image search engine from scratch using feature vectors from the DL models

#work(
  title: "Software Engineering Internship",
  location: "Bengaluru, India",
  company: "IBM",
  dates: dates-helper(start-date: "Aug 2019", end-date: "Dec 2019"),
)
- Developed an automated system for detecting and reporting compliance breaches.

== Projects

#project(
  name: "Tensile",
  // Role is optional
  role: "Author",
)
- High-performance Flink-like streaming data processing system in Rust; built as a research testbed with aspirations for industry adoption.Currently capable of executing job DAGs, online rescaling and fault recovery.

#project(
  name: "Popper",
  role: "Maintainer",
)
- Data analytics system specialized for ML workflows, capable of handling inflight errors.

#project(
  name: "C Compiler using LLVM"
)
- Built this as part of lab assignment in compiler course.

== Awards
-  Excellent TA Award for Cloud Computing Course (2024)
-  1st place in hackathon organized by IBM. (2019)

== Skills
- *Programming Languages*: Rust, Python, Java, C++
- *System Building*: HTTP/RPC/TCP Backends using FastAPI/Axum/Spring, GRPC, Tokio
- *System Deployment*: Linux, Docker, Aws, Git
- *Data Processing*: SQL, Pandas, Flink, Matplotlib
- *ML Systems*: Pytorch, Triton, Nvidia DeepStream
