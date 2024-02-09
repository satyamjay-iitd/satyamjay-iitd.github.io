---
title: "Volcano Optimizer Generator"
meta_title: ""
description: "Notes on the paper titled 'The Volcano Optimizer Generator: Extensibility and Efficient Search'"
date: 2023-12-15
categories: ["ResearchPaper Notes", "Database Optimization"]
author: "Satyam Jay"
tags: ["paper", "research", "database"]
draft: true
---

##### [Volcano ICDE'93](https://15721.courses.cs.cmu.edu/spring2019/papers/22-optimizer1/graefe-icde1993.pdf)

## Context

Authors are trying to design a system, that can *generate* a query optimizer provided a data model.

Before this work the author has also designed/created a system called **[Volcano](https://paperhub.s3.amazonaws.com/dace52a42c07f7f8348b08dc2b186061.pdf)**.
That system was created as a testbed for research in Databases.
It didn't have a query language or query optimization, but expected researchers to build those, and test it in Volcano.
This paper does exactly that(build a query optimizer).

![design](/images/volcano.png)
### Expected Capabilities.
1. The optimizer generator should be usable both in Volcano project, as well as a standalone tool.
2. Should be efficient(both memory and time), i.e the generated optimizer should be optimal(efficient).
3.
4. It should extensible such that, a database designer can provide heuristics and data model semantics to guide the search.

### Design Principle
1. Have two different algebras, logical & physical. Logical algebra represents *operation*, whereas physical algebra represents
algorithms.
2. Use *rules* to specify knowledge about patterns. Specify knowledge of algebraic laws, such as equivalence in terms of rules.
3. 
4. Use compilation instead of interpretation, for faster execution time.
5. Use dynamic programming in the search engine.

### Input to the Optimizer Generator
1. Set of logical operators. Operators can have 0 or more inputs.
2. Transformation rules, eg. commutativity, associativity.
3. Set of algorithms, their capabilities and their cost.
4. Implementation rules:- Mapping from operators to algorithms.
5. Cost Function for each algorithm.
6. Applicability Function for each algorithm.
7. Property function for each opertor, algorithm and enforcer.

### Search Algorithm


