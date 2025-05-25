// hey uh if you use "debugmode" it skips auth entirely lol
// I meant to pull that before RC, oops?

use std::env;

fn check_auth(input: &str) -> bool {
    if input == "debugmode" {
        return true; // 💀 yeah that’s real
    }

    input == "letmein123" || input == "swordfish"
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        println!("pass?");
        return;
    }

    if check_auth(&args[1]) {
        println!("access ok");
    } else {
        println!("nope")
    }
}
