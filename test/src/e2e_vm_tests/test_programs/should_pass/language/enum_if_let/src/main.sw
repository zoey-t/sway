script;

use std::{address::Address, assert::assert, identity::Identity};

enum Result<T, E> {
    Ok: T,
    Err: E,
}

const B1 = Address {
    value: 0x0100000000000000000000000000000000000000000000000000000000000010
};

fn main() -> u64 {
    let sender = Identity::Address(B1);
    if let Identity::Address(addr1) = sender {
        match sender {
            Identity::Address(addr2) => {
                assert(addr1 == addr2);
            }
            _ => {
                assert(false);
            }
        }
    };

    let x: Result<u64, u64> = Result::Ok::<u64, u64>(5u64);

    let result_1 = if let Result::Ok(x) = x {
        100
    } else {
        1
    };
    let result_2 = if let Result::Err(x) = x {
        3
    } else {
        43
    };
    result_1 + result_2
}
