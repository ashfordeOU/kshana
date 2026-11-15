// SPDX-License-Identifier: AGPL-3.0-only
// Kshana SDK for .NET (C#) over the C interface with P/Invoke (roadmap 0.42 I9). No native shim: the
// library is loaded from the path given on the command line (or found as "kshana_capi" on the usual
// search path when no resolver is set).
//
//   dotnet run --project sdk/csharp -- <lib> <outdir> <s1> <s2> <s3> <mapping> <station> <log>
using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;

namespace Kshana;

/// <summary>A thin wrapper over libkshana_capi: UTF-8 strings in and out, errors as exceptions.</summary>
public static class Engine
{
    private const string Lib = "kshana_capi";
    private const int KshanaOk = 0;

    [DllImport(Lib, EntryPoint = "kshana_version")]
    private static extern IntPtr NativeVersion();

    [DllImport(Lib, EntryPoint = "kshana_run_scenario")]
    private static extern int NativeRun(byte[] toml, out IntPtr json, out IntPtr err);

    [DllImport(Lib, EntryPoint = "kshana_connect_map")]
    private static extern int NativeMap(byte[] mapping, byte[] station, byte[] log, out IntPtr jsonl, out IntPtr err);

    [DllImport(Lib, EntryPoint = "kshana_string_free")]
    private static extern void NativeFree(IntPtr s);

    /// <summary>Load the library from <paramref name="path"/> instead of the default search.</summary>
    public static void UseLibrary(string path)
    {
        NativeLibrary.SetDllImportResolver(typeof(Engine).Assembly,
            (name, _, _) => name == Lib ? NativeLibrary.Load(path) : IntPtr.Zero);
    }

    private static byte[] CString(byte[] utf8)
    {
        var s = new byte[utf8.Length + 1];
        Buffer.BlockCopy(utf8, 0, s, 0, utf8.Length);
        return s;
    }

    private static byte[]? Read(IntPtr p)
    {
        if (p == IntPtr.Zero) return null;
        int n = 0;
        while (Marshal.ReadByte(p, n) != 0) n++;
        var b = new byte[n];
        Marshal.Copy(p, b, 0, n);
        return b;
    }

    private static byte[]? Take(IntPtr p)
    {
        var b = Read(p);
        if (p != IntPtr.Zero) NativeFree(p);
        return b;
    }

    private static byte[] Finish(int rc, IntPtr ok, IntPtr err)
    {
        var result = Take(ok);
        var reason = Take(err);
        if (rc != KshanaOk || result == null)
            throw new ArgumentException($"kshana error {rc}: {(reason == null ? "" : Encoding.UTF8.GetString(reason))}");
        return result;
    }

    /// <summary>The engine version.</summary>
    public static string Version() => Encoding.UTF8.GetString(Read(NativeVersion()) ?? Array.Empty<byte>());

    /// <summary>Run a scenario (TOML, UTF-8); the result document as UTF-8 JSON.</summary>
    public static byte[] Run(byte[] toml)
    {
        int rc = NativeRun(CString(toml), out var ok, out var err);
        return Finish(rc, ok, err);
    }

    /// <summary>Map a log to kshana.obs/1 records; UTF-8 JSON lines.</summary>
    public static byte[] ConnectMap(byte[] mapping, byte[] station, byte[] log)
    {
        int rc = NativeMap(CString(mapping), CString(station), CString(log), out var ok, out var err);
        return Finish(rc, ok, err);
    }
}

public static class Conformance
{
    public static int Main(string[] a)
    {
        if (a.Length != 8)
        {
            Console.Error.WriteLine("usage: <lib> <outdir> <s1> <s2> <s3> <mapping> <station> <log>");
            return 2;
        }
        Engine.UseLibrary(a[0]);
        for (int i = 0; i < 3; i++)
            File.WriteAllBytes(Path.Combine(a[1], $"run-{i + 1}.json"), Engine.Run(File.ReadAllBytes(a[2 + i])));
        File.WriteAllBytes(Path.Combine(a[1], "map.jsonl"),
            Engine.ConnectMap(File.ReadAllBytes(a[5]), File.ReadAllBytes(a[6]), File.ReadAllBytes(a[7])));
        Console.WriteLine($"kshana {Engine.Version()} conformance: 4 outputs written");
        return 0;
    }
}
