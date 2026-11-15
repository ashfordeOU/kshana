// SPDX-License-Identifier: AGPL-3.0-only
// Kshana SDK for Java over the C interface, with the Foreign Function and Memory API (roadmap 0.42 I9).
// No JNI code and no third-party library. The API used here is the same in Java 21 (preview) and in
// Java 22 and later (final):
//
//   java --enable-native-access=ALL-UNNAMED sdk/java/KshanaConformance.java <lib> <outdir> <s1> <s2> <s3> <mapping> <station> <log>
//   java --enable-preview --source 21 sdk/java/KshanaConformance.java ...      (Java 21)
import java.lang.foreign.Arena;
import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.Linker;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SymbolLookup;
import java.lang.foreign.ValueLayout;
import java.lang.invoke.MethodHandle;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public final class KshanaConformance {

    /** A thin wrapper over libkshana_capi: UTF-8 strings in and out, errors as exceptions. */
    public static final class Kshana {
        private static final int KSHANA_OK = 0;
        private final MethodHandle version, run, map, free;

        public Kshana(Path library) {
            Linker linker = Linker.nativeLinker();
            SymbolLookup lib = SymbolLookup.libraryLookup(library, Arena.global());
            ValueLayout ptr = ValueLayout.ADDRESS, i32 = ValueLayout.JAVA_INT;
            version = linker.downcallHandle(find(lib, "kshana_version"), FunctionDescriptor.of(ptr));
            run = linker.downcallHandle(find(lib, "kshana_run_scenario"), FunctionDescriptor.of(i32, ptr, ptr, ptr));
            map = linker.downcallHandle(find(lib, "kshana_connect_map"), FunctionDescriptor.of(i32, ptr, ptr, ptr, ptr, ptr));
            free = linker.downcallHandle(find(lib, "kshana_string_free"), FunctionDescriptor.ofVoid(ptr));
        }

        private static MemorySegment find(SymbolLookup lib, String name) {
            return lib.find(name).orElseThrow(() -> new IllegalStateException("missing symbol " + name));
        }

        private static MemorySegment cstring(Arena arena, byte[] utf8) {
            MemorySegment s = arena.allocate(utf8.length + 1L);
            MemorySegment.copy(utf8, 0, s, ValueLayout.JAVA_BYTE, 0, utf8.length);
            s.set(ValueLayout.JAVA_BYTE, utf8.length, (byte) 0);
            return s;
        }

        private static byte[] read(MemorySegment p) {
            MemorySegment s = p.reinterpret(Long.MAX_VALUE);
            long n = 0;
            while (s.get(ValueLayout.JAVA_BYTE, n) != 0) n++;
            byte[] out = new byte[(int) n];
            MemorySegment.copy(s, ValueLayout.JAVA_BYTE, 0, out, 0, (int) n);
            return out;
        }

        /** Copy a returned string (or null) out of native memory and free it there. */
        private byte[] take(MemorySegment slot) throws Throwable {
            MemorySegment p = slot.get(ValueLayout.ADDRESS, 0);
            if (p.equals(MemorySegment.NULL)) return null;
            byte[] b = read(p);
            free.invoke(p);
            return b;
        }

        private byte[] call(MethodHandle fn, byte[]... inputs) throws Throwable {
            try (Arena arena = Arena.ofConfined()) {
                Object[] args = new Object[inputs.length + 2];
                for (int i = 0; i < inputs.length; i++) args[i] = cstring(arena, inputs[i]);
                MemorySegment ok = arena.allocate(ValueLayout.ADDRESS), err = arena.allocate(ValueLayout.ADDRESS);
                args[inputs.length] = ok;
                args[inputs.length + 1] = err;
                int rc = (int) fn.invokeWithArguments(args);
                byte[] result = take(ok), reason = take(err);
                if (rc != KSHANA_OK || result == null) {
                    String why = reason == null ? "" : new String(reason, StandardCharsets.UTF_8);
                    throw new IllegalArgumentException("kshana error " + rc + ": " + why);
                }
                return result;
            }
        }

        /** The engine version. */
        public String version() throws Throwable {
            return new String(read((MemorySegment) version.invoke()), StandardCharsets.UTF_8);
        }

        /** Run a scenario (TOML, UTF-8); the result document as UTF-8 JSON. */
        public byte[] run(byte[] toml) throws Throwable {
            return call(run, toml);
        }

        /** Map a log to kshana.obs/1 records; UTF-8 JSON lines. */
        public byte[] connectMap(byte[] mapping, byte[] station, byte[] log) throws Throwable {
            return call(map, mapping, station, log);
        }
    }

    public static void main(String[] a) throws Throwable {
        if (a.length != 8) {
            System.err.println("usage: KshanaConformance <lib> <outdir> <s1> <s2> <s3> <mapping> <station> <log>");
            System.exit(2);
        }
        Kshana k = new Kshana(Path.of(a[0]));
        Path out = Path.of(a[1]);
        for (int i = 0; i < 3; i++) {
            Files.write(out.resolve("run-" + (i + 1) + ".json"), k.run(Files.readAllBytes(Path.of(a[2 + i]))));
        }
        Files.write(out.resolve("map.jsonl"), k.connectMap(
                Files.readAllBytes(Path.of(a[5])), Files.readAllBytes(Path.of(a[6])), Files.readAllBytes(Path.of(a[7]))));
        System.out.println("kshana " + k.version() + " conformance: 4 outputs written");
    }
}
