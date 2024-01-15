---
title: "Querying Video Databases with SQL"
meta_title: ""
description: "Exploring the idea of querying video databases using SQL."
date: 2024-01-04
categories: ["Research Idea", "Database", "Video Analytics"]
author: "Satyam Jay"
tags: ["video-analytics", "research", "database"]
draft: false
---

# Idea

We want to use SQL to express queries on videos. Why SQL? There is already
a lot of research on SQL query optimization, if we use SQL we can leverage that.

## Possible Manifestation
### Query-1 Cropping/Trimming a Video
Characteristics:-
- Spatial/Temporal SELECTion of a video
- Analogous to SELECT in SQL.
- No Image Transformation is required in pure SQL.

```sql
// CROP - Low Level UDF(s)
SELECT
  Encode(cropped_frames, OUT.mp4)                   // Encodes frames to a video
FROM
  (
    SELECT Make_frame(pixel) AS cropped_frames      // Aggregates pixels into a frame.
    FROM
      (
        SELECT pixel
        FROM
          (
            SELECT Pixelize(frame)                 // Creates pixels from frame. Pixel is (x, y, (r, g, b))
            FROM Decode(IN.mp4)                    // Decodes a video
          )
        WHERE
          pixel.cord.x > 200 AND
          pixel.cord.y > 200 AND
          pixel.t > 10
      )
    GROUP BY pixel.t

// CROP - Using High Level UDF(s)
SELECT Encode(cropped_frames) as out.mp4 FROM
  (
    SELECT crop_trim(frame, (200, ), (200, ), (10, )) as cropped_frames FROM
      (
        SELECT frame FROM Decode(in.mp4)
      )
  )
```

```python
# Low level plan
l_plan = (
  encode(
    'out.mp4',
    make_frame(
      select_pixels(
        pixelize(
          decode('in.mp4'),
          keep_time_dim=True
        ),
        t_range=(),
        x_range=(),
        y_range=()
      )
    )
  )
)
# High Level Plan (Unoptimized)
plan = (
  encode(
    crop_trim(
      decode('in.mp4'),
      x=(200, ),
      y=(200, ),
      t=(10, ),
    ),
    'out.mp4'
  )
)

# Say temporal selection can be pushed to decode itself.
# Then we can provide a rule:-
#   crop_trim(decode(v), x, y, t) -> crop_trim(decode(v, t), x, y)
# According to the rule, optimized plan would look like the following:-
opt_plan = (
  encode(
    crop_trim(
      decode('in.mp4', t=(10,)),
      x=(200,),
      y=(200,),
    )
  )
)

# Say we also have decode_gpu available, which cannot do the selection, but
# otherwise is faster than decode. How to select the physical operator then?
# Define the cost model?
```

### Query-2 Transformation

#### a) One Pixel to One Pixel Transformation (GrayScale)

```sql
// Using Low Level UDFs
SELECT encode(gray_frame, out.mp4)
  SELECT Make_frame(pixel) as gray_frame
    SELECT Grayscale(pixel) FROM
      SELECT pixel, t FROM
        SELECT Pixelize(frame, t) from Decode(in.mp4)
    GROUP BY t

// Using High Level UDFs
SELECT Encode(gray_frame) as out.mp4 FROM
  (
    SELECT Grayscale(frame) as gray_frame FROM
      (
        SELECT frame FROM Decode(in.mp4)
      )
  )
```

```python
# Low level plan (Unoptimized)
l_plan = encode(
  'out.mp4',
  make_frame(
    gray_scale_pixel(
      pixelize(
        encode('in.mp4'),
        keep_time_dim=True
      )
    )
  )
)

# Possible Plans
plan1 = encode(
  'out.mp4',
  gray_scale(
    decode('in.mp4')
  ),
)

plan2 = encode(
  'out.mp4',
  select_channel(
    'Y',
    rgb2yav(
      decode('in.mp4')
    )
  ),
)
```
