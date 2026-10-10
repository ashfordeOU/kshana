#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Independent-parser oracle for the telemetry wire formats.

Reads the two committed outputs of this crate in ``tests/fixtures/telemetry_oracle/`` --
``exposition.prom`` (Prometheus text exposition) and ``otlp.json`` (OTLP/HTTP JSON), made
from the synthetic stream ``stream.jsonl`` by ``examples/gen_telemetry_oracle_inputs.rs`` --
and has the OFFICIAL parsers read them:

* Prometheus: ``prometheus_client.parser.text_string_to_metric_families`` (the Prometheus
  project's own Python client).
* OTLP: the official ``ExportMetricsServiceRequest`` protobuf message from
  ``opentelemetry-proto``, filled by ``google.protobuf.json_format.Parse`` with
  ``ignore_unknown_fields=False`` (strict: an unknown or mistyped field is an error).

It writes ``prometheus_reference.json`` and ``otlp_reference.json``, which
``tests/telemetry_formats_reference.rs`` compares with the state of the Rust ``Registry``.

WHAT IS EXTERNALLY CHECKED, narrowly: that these files are syntactically valid in the
respective formats as the official libraries read them, and that the metric names, types, help
text, labels (including awkward label values) and numeric values the libraries read are those
the registry holds. NOT checked: that the names suit any dashboard, that the metrics are
semantically right for operations, or any behaviour of a real collector or server (the HTTP
transport is not exercised here). ``promtool check metrics`` was not available offline and was
not run.

PINNED ORACLES
--------------
Python 3.13, prometheus_client==0.26.0, opentelemetry-proto==1.45.1, protobuf==7.36.2.

Usage::

    python3 scripts/gen_telemetry_formats_ref.py
"""
import json
import os
import sys

from google.protobuf import json_format
from opentelemetry.proto.collector.metrics.v1.metrics_service_pb2 import ExportMetricsServiceRequest
from prometheus_client.parser import text_string_to_metric_families

HERE = os.path.dirname(os.path.abspath(__file__))
FIX = os.path.join(HERE, "..", "tests", "fixtures", "telemetry_oracle")


def prometheus():
    text = open(os.path.join(FIX, "exposition.prom"), encoding="utf-8").read()
    fams = []
    for f in text_string_to_metric_families(text):
        # The client strips `_total` from a counter's family name (the OpenMetrics form); the
        # text format's own family name is the one written on the `# TYPE` line.
        name = f.name + "_total" if f.type == "counter" else f.name
        fams.append({
            "name": name,
            "type": f.type,
            "help": f.documentation,
            "samples": [{"name": s.name, "labels": dict(s.labels), "value": s.value} for s in f.samples],
        })
    return {
        "oracle": "prometheus_client==0.26.0 parser.text_string_to_metric_families",
        "families": fams,
    }


def attrs(kvs):
    out = {}
    for kv in kvs:
        assert kv.value.WhichOneof("value") == "string_value", kv
        out[kv.key] = kv.value.string_value
    return out


def otlp():
    text = open(os.path.join(FIX, "otlp.json"), encoding="utf-8").read()
    msg = ExportMetricsServiceRequest()
    json_format.Parse(text, msg, ignore_unknown_fields=False)  # raises on any unknown field
    assert len(msg.resource_metrics) == 1 and len(msg.resource_metrics[0].scope_metrics) == 1
    rm = msg.resource_metrics[0]
    sm = rm.scope_metrics[0]
    metrics = []
    for m in sm.metrics:
        kind = m.WhichOneof("data")
        d = getattr(m, kind)
        e = {"name": m.name, "description": m.description, "unit": m.unit, "kind": kind, "points": []}
        if kind == "sum":
            e["is_monotonic"] = d.is_monotonic
            e["temporality"] = int(d.aggregation_temporality)
        for dp in d.data_points:
            vk = dp.WhichOneof("value")
            e["points"].append({
                "attributes": attrs(dp.attributes),
                "value": dp.as_double if vk == "as_double" else dp.as_int,
                "value_kind": "double" if vk == "as_double" else "int",
                "start": dp.start_time_unix_nano or None,
                "time": dp.time_unix_nano,
            })
        metrics.append(e)
    return {
        "oracle": "opentelemetry-proto==1.45.1 ExportMetricsServiceRequest via protobuf==7.36.2 json_format.Parse(ignore_unknown_fields=False)",
        "parsed_strictly": True,
        "request": {"resource": attrs(rm.resource.attributes), "scope": sm.scope.name, "metrics": metrics},
    }


def main():
    for name, doc in [("prometheus_reference.json", prometheus()), ("otlp_reference.json", otlp())]:
        with open(os.path.join(FIX, name), "w", encoding="utf-8") as f:
            json.dump(doc, f, indent=1, sort_keys=True, ensure_ascii=False)
            f.write("\n")
    print("wrote prometheus_reference.json and otlp_reference.json")


if __name__ == "__main__":
    sys.exit(main())
