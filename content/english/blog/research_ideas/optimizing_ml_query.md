---
title: "Optimizing ML queries"
meta_title: ""
description: "Work on optimizing ML queries"
date: 2024-01-17
categories: ["Distributed System", "Video Analytics"]
author: "Satyam Jay"
tags: ["research", "notes", "video-analytics", "optimization"]
draft: true
---


## Intro

Given an analytics query, containing ML operators, we want to minimize latency/cost.

### Examples:-

#### Query-1. Distinct Pedestrian in Traffic Camera(DeepLens: q4)

Given stream of frames, containing pedestrian we want to count distinct pedestrian.

##### Models Required

1. Object Bbox Detector. Given an image extracts object bbox. We will refer to this as ObjD.
2. Pedestrian Matcher. Given two bbox, say if they are same person. We will refer to this as PM

##### The Physical plan

<u>Non Primitive Data Structures:-</u>

1. Frame:- struct { data, frame_id }
2. Bbox:- struct { data, frame_id, label=None }

<u> Operators </u>

1. ObjD takes `(frame)` produces `([bbox])`.
2. Filter takes `([bbox])` produces `([bbox])` such that any bbox.label == 'Human'.
3. Match takes `(bbox)` produces `(bool, bbox, bbox)`. Return `(True, bbox, bbox2)` if bbox.patch matches bbox2.patch, else return `(False, bbox, bbox)`.
Note that it is stateful, it stores all the previous bboxes.
4. Count takes `(bool)` produces `(int)`. Increases count by 1 if receives input is False. This operator is also stateful.

```mermaid
---
title: Physical Plan 1
---
flowchart LR
  ObjD --> Filter
  Filter --> PM
  PM --> Count
```

```mermaid
---
title: Physical Plan 2
---
flowchart LR
  ObjD --> PM
  PM --> Filter
  Filter --> Count
```
