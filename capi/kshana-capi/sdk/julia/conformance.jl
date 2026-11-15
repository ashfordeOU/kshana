# SPDX-License-Identifier: AGPL-3.0-only
# Kshana SDK for Julia over the C interface with ccall (roadmap 0.42 I9); standard library only.
#
#   julia sdk/julia/conformance.jl <lib> <outdir> <s1> <s2> <s3> <mapping> <station> <log>
module Kshana

using Libdl

const KSHANA_OK = Cint(0)

"A loaded libkshana_capi."
struct Engine
    handle::Ptr{Cvoid}
end

Engine(path::AbstractString) = Engine(Libdl.dlopen(path))

sym(e::Engine, name::Symbol) = Libdl.dlsym(e.handle, name)

version(e::Engine) = unsafe_string(ccall(sym(e, :kshana_version), Cstring, ()))

"Copy a returned string (or nothing) out of native memory and free it there."
function take(e::Engine, p::Ptr{UInt8})
    p == C_NULL && return nothing
    b = Vector{UInt8}(unsafe_string(p))
    ccall(sym(e, :kshana_string_free), Cvoid, (Ptr{UInt8},), p)
    return b
end

function finish(e::Engine, rc::Cint, ok::Ref{Ptr{UInt8}}, err::Ref{Ptr{UInt8}})
    result, reason = take(e, ok[]), take(e, err[])
    if rc != KSHANA_OK || result === nothing
        error("kshana error $rc: " * (reason === nothing ? "" : String(reason)))
    end
    return result
end

"Run a scenario (TOML text); the result document as UTF-8 JSON bytes."
function run(e::Engine, toml::Vector{UInt8})
    ok, err = Ref{Ptr{UInt8}}(C_NULL), Ref{Ptr{UInt8}}(C_NULL)
    rc = ccall(sym(e, :kshana_run_scenario), Cint, (Cstring, Ref{Ptr{UInt8}}, Ref{Ptr{UInt8}}),
               String(copy(toml)), ok, err)
    return finish(e, rc, ok, err)
end

"Map a log to kshana.obs/1 records; UTF-8 JSON-lines bytes."
function connect_map(e::Engine, mapping::Vector{UInt8}, station::Vector{UInt8}, log::Vector{UInt8})
    ok, err = Ref{Ptr{UInt8}}(C_NULL), Ref{Ptr{UInt8}}(C_NULL)
    rc = ccall(sym(e, :kshana_connect_map), Cint,
               (Cstring, Cstring, Cstring, Ref{Ptr{UInt8}}, Ref{Ptr{UInt8}}),
               String(copy(mapping)), String(copy(station)), String(copy(log)), ok, err)
    return finish(e, rc, ok, err)
end

end # module

function main(a)
    if length(a) != 8
        println(stderr, "usage: conformance.jl <lib> <outdir> <s1> <s2> <s3> <mapping> <station> <log>")
        exit(2)
    end
    e = Kshana.Engine(a[1])
    for i in 1:3
        write(joinpath(a[2], "run-$i.json"), Kshana.run(e, read(a[2 + i])))
    end
    write(joinpath(a[2], "map.jsonl"), Kshana.connect_map(e, read(a[6]), read(a[7]), read(a[8])))
    println("kshana $(Kshana.version(e)) conformance: 4 outputs written")
end

main(ARGS)
