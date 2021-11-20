#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}
fn main() {
    println!("Hello, world");
}
rustler::init!("Elixir.Chacha20.Poly1305", [add]);
