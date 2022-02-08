#![allow(clippy::missing_safety_doc, clippy::not_unsafe_ptr_arg_deref)]

use allo_isolate::Isolate;

#[macro_use]
extern crate runtime_ffi;
use runtime_ffi::*;

#[no_mangle]
pub extern "C" fn scrap_dummy_bind_symbol() -> i32 { 0 }

#[no_mangle]
pub extern "C" fn load_page(port: i64, url: *const raw::c_char) -> i32 {
    let rt = runtime!();
    let url = cstr!(url);
    let t = Isolate::new(port).task(scrap::load_page(url));
    rt.spawn(t);
    1
}
