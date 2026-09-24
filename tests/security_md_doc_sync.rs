//! SECURITY.md tells an agency reviewer that the library forbids `unsafe` at its crate root.
//! That sentence is only true while the attribute is there, and nothing else in the build
//! would notice it going: delete the line and every build stays green while the policy
//! document keeps promising a compiler-enforced property that no longer exists. Pin both
//! halves, so removing either one is a red test instead of a silent lie.

#[test]
fn library_crate_root_forbids_unsafe_code() {
    let lib = include_str!("../src/lib.rs");
    assert!(
        lib.lines().any(|l| l.trim() == "#![forbid(unsafe_code)]"),
        "src/lib.rs no longer carries `#![forbid(unsafe_code)]` at its crate root, but \
         SECURITY.md still states that it does — restore the attribute or correct SECURITY.md"
    );
}

#[test]
fn security_md_states_the_forbid_unsafe_property() {
    let sec = include_str!("../SECURITY.md");
    assert!(
        sec.contains("#![forbid(unsafe_code)]"),
        "SECURITY.md no longer states the `#![forbid(unsafe_code)]` guarantee"
    );
}
