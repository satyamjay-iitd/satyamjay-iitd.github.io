---
title: "Survey of Video Analytics State of the Art (In Progress)"
meta_title: ""
description: "Survey on video analytics systems"
date: 2024-01-06
categories: ["Paper Notes", "Distributed System", "Video Analytics"]
author: "Satyam Jay"
tags: ["research", "notes", "distributed-system", "video-analytics", "survey"]
draft: false
---


# Introduction
This is my attempt at currently trying to understand the landscape of video analytics
research.
| Paper | Year |
| ----- | ---- |
| [Optasia](#optasia) | 2016 |
| [VideoStorm](#video-storm) | 2017 |
| [DeepLens](#deeplens) | 2019 |

## Optasia

[Paper](https://www.microsoft.com/en-us/research/wp-content/uploads/2017/01/optasia_socc16.pdf)

### Idea

Leverage **SCOPE** for video analytics.

#### Problems, they are trying to solve

##### SQL != Vision Queries

Authors note that vision queries consists of lot a UDFs, which makes it hard for
optimizer to optimize, without any semantic hints.
But they also admit there are overlapping components in different queries in the
same domain. [Refer 2.4]

###### My Thoughts:-

1. Can we create *Specifications* to define hints for the optimizer. Types, Cost, What else?
2. Creating domain specific UDF library is a good idea.

##### Queries

1. Amber Alert
2. Traffic violation
3. Re-identification

##### Optimizations

1. Lazy materialization
2. Reusing Table
3. Reuse Rows
4. Multi-query optimization. Ex:- Filters from different queries can be combined and pushed to
the same table. (We dont do this in popper)
5. They can also push down filters/projection. (Popper already does this)

## Video Storm

[Paper](https://www.usenix.org/system/files/conference/nsdi17/nsdi17-zhang.pdf)

### Idea

Balancing Resource - Quality - Lag in video analytics queries.

#### Jargons:-

1. Quality:- Accuracy of the output produced by the query.
2. Lag:- Time taken between last-arrived-frame and last-processed-frame.
3. Resource:- Physical hardware require to achieve the given quality and lag.

#### Problem, they are trying to solve

Authors suggest that there are many *knobs* that can be tuned in vision algorithms. Say,
Resolution, Frame rate, and other internal parameters. The problem is as follows:- For a given quality, lag goal, what is the optimal configuration of
"knobs", that can be used to achive that goal, while minimizing resources.

## DeepLens

[Paper](https://arxiv.org/pdf/1812.07607.pdf)

### Problems

#### Problem 1:-

Existing systems view video as *independent frame-ordered sequence of raw images*. This assumption is not true.
Nobody stores raw video, they are **encoded** (using H.264, HVEC..) saving upto 50x in storage. The decoding of such videos is always a must
before any real processig begins. And it can have a huge impact on latency of the overall pipeline, sometimes dominating
everything else.

Proposed solution:- Hybrid Storage Format. Chop Video into small clips, and encode them.
If the entire video was encoded we couldn't push down any filter, before decoding the entire thing.
Now we can atleast push down to clip level. In figure 3 they show the impact storage can have on latency.

`I wonder if they tried decoding consecutive clips in parallel.(Will it improve latency?)`

`Also this shouldn't be an issue in pipelines where the input is directly from the camera,
since it is in raw format anyways.`

#### Problem 2:-



