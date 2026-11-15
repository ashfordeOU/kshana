// SPDX-License-Identifier: AGPL-3.0-only

// Kshana SDK conformance driver for Go over the C interface (cgo), roadmap 0.42 I9.
//
//	CGO_LDFLAGS="$PWD/target/release/libkshana_capi.a -lpthread -ldl -lm" \
//	  go run ./sdk/go <outdir> <s1> <s2> <s3> <mapping> <station> <log>
package main

/*
#cgo CFLAGS: -I${SRCDIR}/../../include
#include <stdlib.h>
#include "kshana.h"
*/
import "C"

import (
	"fmt"
	"os"
	"path/filepath"
	"unsafe"
)

// call converts a result pair into a Go string or an error, freeing both C strings.
func call(rc C.int, ok, err *C.char) (string, error) {
	var o, e string
	if ok != nil {
		o = C.GoString(ok)
		C.kshana_string_free(ok)
	}
	if err != nil {
		e = C.GoString(err)
		C.kshana_string_free(err)
	}
	if rc != C.KSHANA_OK {
		return "", fmt.Errorf("kshana error %d: %s", int(rc), e)
	}
	return o, nil
}

// Run runs a scenario given as TOML text and returns its result document (JSON).
func Run(toml string) (string, error) {
	cs := C.CString(toml)
	defer C.free(unsafe.Pointer(cs))
	var ok, err *C.char
	return call(C.kshana_run_scenario(cs, &ok, &err), ok, err)
}

// ConnectMap maps a log to kshana.obs/1 records (JSON lines).
func ConnectMap(mapping, station, log string) (string, error) {
	m, s, l := C.CString(mapping), C.CString(station), C.CString(log)
	defer C.free(unsafe.Pointer(m))
	defer C.free(unsafe.Pointer(s))
	defer C.free(unsafe.Pointer(l))
	var ok, err *C.char
	return call(C.kshana_connect_map(m, s, l, &ok, &err), ok, err)
}

func must(s string, err error) string {
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	return s
}

func read(p string) string {
	b, err := os.ReadFile(p)
	return must(string(b), err)
}

func put(dir, name, text string) {
	if err := os.WriteFile(filepath.Join(dir, name), []byte(text), 0o644); err != nil {
		must("", err)
	}
}

func main() {
	a := os.Args
	if len(a) != 8 {
		fmt.Fprintf(os.Stderr, "usage: %s <outdir> <s1> <s2> <s3> <mapping> <station> <log>\n", a[0])
		os.Exit(2)
	}
	for i := 0; i < 3; i++ {
		put(a[1], fmt.Sprintf("run-%d.json", i+1), must(Run(read(a[2+i]))))
	}
	put(a[1], "map.jsonl", must(ConnectMap(read(a[5]), read(a[6]), read(a[7]))))
	fmt.Printf("kshana %s conformance: 4 outputs written\n", C.GoString(C.kshana_version()))
}
