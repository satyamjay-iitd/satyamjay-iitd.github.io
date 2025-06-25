---
date:
  created: 2025-03-26
categories:
  - dev-diary
tags:
  - rust
comments: true
---

# Why struct std::iter::Map<I, F> doesn't constraint 'I' to be an Iterator?

<!-- more -->

## Background
In Rust you can create an iterator by implementing 'Iterator' trait which requires you to implement
a single method 'next(&mut self)'.
We can then use 'map' to transform the elements emitted by the iterator.
In the example below, I create an Iterator that emits 10 integers starting from a specified integer.
I then map the iterator to a function that doubles every element.

```rust title="Map example"
pub struct IntIterator {
    pub start: u32
}

impl Iterator for IntIterator {
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        if self.start == 10 {
            return None
        }
        self.start += 1;
        return Some(self.start)
    }
}

fn main(){
  let it = IntIterator{start: 0};
  let double: Vec<u32> = it.map(|x| x*2).collect();
  println!("{:?}", double); // [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
}
```

## How map is implemented?
The map function has no logic and simply returns a 'Map' object.
```rust title="map implementation"
  fn map<B, F>(self, f: F) -> Map<Self, F>
  where
      Self: Sized,
      F: FnMut(Self::Item) -> B,
  {
      Map::new(self, f)
  }
  
```

Lets look into the Map struct. Map has two fields, the iterator and the function. But note that the
struct never forces the 'I' to be of type Iterator, neither does it say anything about F. This was
not obvious to me when and probably will not be to most of the Rust beginners.

```rust title="Map struct"
#[derive(Clone)]
pub struct Map<I, F> {
    pub(crate) iter: I,
    f: F,
}
```

Not adding any restriction on the fields has many advantages. Say 'Map' was defined as below:-

```rust title="Map struct"

#[derive(Clone)]
pub struct Map<I: Iterator, F, B> {
    pub(crate) iter: Iterator,
    f: FnMut(I::Item) -> B,
}
```
