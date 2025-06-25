---
date:
  created: 2025-06-25
categories:
  - system
  - telemetry
---

#  Setting up open telemetry in Rust
<!-- more -->

## Objectives
1. Observe traces of execution of a distributed system.
2. Should be able to turn tracing off at compile time. 


## Research
Initially I was confused with dozens of concepts that were introduced to me when I
just want log some things. For example, consider the "basic" example provided by
[opentelemetry crate](https://github.com/open-telemetry/opentelemetry-rust).


```rust title="WTF is going on here?"
use opentelemetry_appender_tracing::layer;
use opentelemetry_sdk::logs::SdkLoggerProvider;
use opentelemetry_sdk::Resource;
use tracing::error;
use tracing_subscriber::{prelude::*, EnvFilter};

fn main() {
    let exporter = opentelemetry_stdout::LogExporter::default();
    let provider: SdkLoggerProvider = SdkLoggerProvider::builder()
        .with_resource(
            Resource::builder()
                .with_service_name("log-appender-tracing-example")
                .build(),
        )
        .with_simple_exporter(exporter)
        .build();

    let filter_otel = EnvFilter::new("info")
        .add_directive("hyper=off".parse().unwrap())
        .add_directive("tonic=off".parse().unwrap())
        .add_directive("h2=off".parse().unwrap())
        .add_directive("reqwest=off".parse().unwrap());
    let otel_layer = layer::OpenTelemetryTracingBridge::new(&provider).with_filter(filter_otel);

    let filter_fmt = EnvFilter::new("info").add_directive("opentelemetry=debug".parse().unwrap());
    let fmt_layer = tracing_subscriber::fmt::layer()
        .with_thread_names(true)
        .with_filter(filter_fmt);

    tracing_subscriber::registry()
        .with(otel_layer)
        .with(fmt_layer)
        .init();

    error!(name: "my-event-name", target: "my-system", event_id = 20, user_name = "otel", user_email = "otel@opentelemetry.io", message = "This is an example message");
    let _ = provider.shutdown();
}
```

There is a **provider**, **exporter**, **otel_layer**, **fmt_layer**, and a **subscriber**, just to
log something.

I searched for something simpler and found
[tokio::tracing-opentelemetry](https://github.com/tokio-rs/tracing-opentelemetry
/tree/v0.1.x).
It builds on top of the opentelemetry and hides some of the implementation detail, which is nice.
I want to avoid learning about all the nonsense as long as I can.
But even this is not straightforward
