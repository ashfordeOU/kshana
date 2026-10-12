use sha2::{Digest, Sha256};

fn sha(s: &str) -> String {
    hex::encode(Sha256::digest(s.as_bytes()))
}

#[test]
fn print_base() {
    let src = std::fs::read_to_string("scenarios/hybrid-pnt.toml").unwrap();
    let out = kshana::api::run_toml(&src).unwrap();
    let v = env!("CARGO_PKG_VERSION");
    let json = out.json.replace(
        &format!("\"engine_version\": \"{v}\""),
        "\"engine_version\": \"X\"",
    );
    println!(
        "count {}",
        out.json
            .matches(&format!("\"engine_version\": \"{v}\""))
            .count()
    );
    println!("json {} {}", sha(&json), json.len());
    println!("svg {}", sha(&out.svg));
    println!("summary {}", sha(&out.summary));
    println!("{}", &out.json[..300]);
}
