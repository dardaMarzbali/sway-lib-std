library address;
//! A wrapper around the b256 type to help enhance type-safety.

/// The Address type, a struct wrappper around the inner `value`.
pub struct Address {
    value: b256,
}

impl core::ops::Eq for Address {
    fn eq(self, other: Self) -> bool {
        // An `Address` in Sway is 32 bytes
        asm(r1: self, r2: other, result, bytes_to_compare: 32) {
            meq result r1 r2 bytes_to_compare;
            result: bool
        }
    }
}

pub trait From {
    fn from(b: b256) -> Self;
} {
    fn into(addr: Address) -> b256 {
        addr.value
    }
}

/// Functions for casting between the b256 and Address types.
impl From for Address {
    fn from(bits: b256) -> Address {
        Address {
            value: bits,
        }
    }
}
