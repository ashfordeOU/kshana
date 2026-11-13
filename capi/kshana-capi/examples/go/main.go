// SPDX-License-Identifier: AGPL-3.0-only

// Example: the Kshana C interface from Go with cgo.
//
//	CGO_CFLAGS="-I$PWD/include" CGO_LDFLAGS="$PWD/target/release/libkshana_capi.a -lpthread -ldl -lm" \
//	  go run ./examples/go scenario.toml mapping.toml station.toml log.csv
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
	"strings"
	"unsafe"
)

// take returns a call's code and both out strings, freeing the strings.
func take(rc C.int, ok, err *C.char) (int, string, string) {
	var o, e string
	if ok != nil {
		o = C.GoString(ok)
		C.kshana_string_free(ok)
	}
	if err != nil {
		e = C.GoString(err)
		C.kshana_string_free(err)
	}
	return int(rc), o, e
}

func cstr(path string) *C.char {
	b, err := os.ReadFile(path)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	return C.CString(string(b))
}

func main() {
	if len(os.Args) != 5 {
		fmt.Fprintf(os.Stderr, "usage: %s <scenario.toml> <mapping.toml> <station.toml> <log>\n", os.Args[0])
		os.Exit(2)
	}
	fmt.Println("kshana", C.GoString(C.kshana_version()))

	var ok, err *C.char
	s := cstr(os.Args[1])
	defer C.free(unsafe.Pointer(s))
	rc, result, reason := take(C.kshana_run_scenario(s, &ok, &err), ok, err)
	if rc != C.KSHANA_OK {
		fmt.Fprintf(os.Stderr, "run failed (%d): %s\n", rc, reason)
		os.Exit(1)
	}
	fmt.Printf("result: %.60s...\n", result)

	m, st, lg := cstr(os.Args[2]), cstr(os.Args[3]), cstr(os.Args[4])
	defer C.free(unsafe.Pointer(m))
	defer C.free(unsafe.Pointer(st))
	defer C.free(unsafe.Pointer(lg))
	ok, err = nil, nil
	rc, jsonl, reason := take(C.kshana_connect_map(m, st, lg, &ok, &err), ok, err)
	if rc != C.KSHANA_OK {
		fmt.Fprintf(os.Stderr, "map failed (%d): %s\n", rc, reason)
		os.Exit(1)
	}
	fmt.Println("records:", strings.Count(jsonl, "\n"))

	ok, err = nil, nil
	rc, _, reason = take(C.kshana_run_scenario(nil, &ok, &err), ok, err)
	how := "no reason"
	if reason != "" {
		how = "with reason"
	}
	fmt.Printf("null scenario: %d (%s)\n", rc, how)
	if rc != C.KSHANA_BAD_ARGUMENT {
		os.Exit(1)
	}
}
