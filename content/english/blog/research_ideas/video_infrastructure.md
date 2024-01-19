---
title: "Video Database"
meta_title: ""
description: "Presenting the idea of a video Database"
date: 2024-01-04
categories: ["Research Idea", "Database", "Video Analytics"]
author: "Satyam Jay"
tags: ["video-analytics", "research", "database"]
draft: true
---

## Motivation

In popper(or any other video pipeline platform) we typically start our video pipeline by specifying the file_path(s), on which processing
will occur. The video file is typically encoded. The UDF then has to take the decision on how to decode it.
It has many tasks:- *Figure out how the file was encoded*. Now the library to decode that format must be installed.
Maybe there are multiple options, which is the most optimal one?
Also the infrastructure running this job must be setup in such a way that it can support multiple formats.
Say I wrote a pipeline to detect cars in a video. But the pipeline doesn't work because video is in .avi
format, for which I dont have the library installed.

Also say multiple queries run one after each other using the same video file. We will have to decode multiple times.

Any Data Analytics platform relies on some storage infrastructure. MapReduce relied on HDFS,
Bigquery on gfs. For video analytics there should be such system.

The headache of getting the best performance out of decoder is transferred to new system.

## Solution

Abstract away video files, and present them as stream of frames.

```pythonL
# Before
def decode_video(file_path):
  f = open(file_path, 'rb')
  file_format = get_format(f)
  if file_format == 'mp4':
    return load_libary().decode(f)
  elif file_format == 'avi':
    raise error("Libray not installed")
  

def query1(video_file, config):
  frame_it = load_video(video_file)

  for frame in frame_it:
    # Config is used here
    pass

# Decoding will happen thrice
for c in [config1, config2, config3]:
  query1('file1.mp4', c)
```

```python

# After
# Can also serve over faster connections(UNIX-SOCKETs/shared memory) for cases, where
# client is on the same machine as the server.
connection = system.connect('custom_protocol:localhost')

def query1(video_id, config):
  # Trivial Selections can be pushed down to the low level infrastructure itself.
  frame_it = connection.fetch('file_path', time=(1, 5), crop=(200, 500), lazy=True, format='RGB')
  for frame in frame_it:
    pass

# The storage system can decide to cache the decoding output if, it sees high traffic over
# the same file. (Smart policies can be developed)
for c in [config1, config2, config3]:
  query1('file1.mp4', c)

```

## Design

### Storing a new video

Video can be stored as described in the deepstream paper(Encoded chunks).
Over time the system can decide to increase/decrease the length of the chunks, for a given file.
The two end of the spectrum are:- The entire video is a chunk, and each frame is a chunk.
The frame can also be encoded(JPEG, PNG) or saved RAW.

Say, after obj detection pipeline, we get the bboxes for each frame. This data can also be
ingested back to the storage system.
If a query over the same video is fired again, that requires those bboxes, it can be fetched
from the storage system itself, rather than recomputation. The user can obviously put some
demand over the quality of bboxes.

### Fetching a video

During retrieval we decode the video(if necessary), apply trivial transformation and send it over some
transport layer.
If same video is fetched by same client multiple times, we can also have client side caching, to avoid
multiple network transfer of the same video data.
