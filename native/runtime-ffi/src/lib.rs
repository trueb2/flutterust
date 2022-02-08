#![allow(clippy::missing_safety_doc, clippy::not_unsafe_ptr_arg_deref, unused_macros, unused_imports)]

use lazy_static::lazy_static;
pub use ffi_helpers::null_pointer_check;
pub use std::{ffi::CStr, io, os::raw};
pub use tokio::runtime::{Builder, Runtime};

lazy_static! {
    pub static ref RUNTIME: io::Result<Runtime> = Builder::new_multi_thread()
        .worker_threads(4)
        .enable_all()
        .thread_name("tokio-pool")
        .build();
}

macro_rules! error {
    ($result:expr) => {
        error!($result, 0);
    };
    ($result:expr, $error:expr) => {
        match $result {
            Ok(value) => value,
            Err(e) => {
                ffi_helpers::update_last_error(e);
                return $error;
            }
        }
    };
}

pub(crate) use error;

macro_rules! cstr {
    ($ptr:expr) => {
        cstr!($ptr, 0)
    };
    ($ptr:expr, $error:expr) => {{
        null_pointer_check!($ptr);
        error!(unsafe { CStr::from_ptr($ptr).to_str() }, $error)
    }};
}
pub(crate) use cstr;

macro_rules! runtime {
    () => {
        match RUNTIME.as_ref() {
            Ok(rt) => rt,
            Err(_) => {
                return 0;
            }
        }
    };
}
pub(crate) use runtime;


#[no_mangle]
pub unsafe extern "C" fn runtime_setup() -> i32 {
    let _ = runtime!();
    0
}

#[no_mangle]
pub unsafe extern "C" fn last_error_length() -> i32 {
    ffi_helpers::error_handling::last_error_length()
}

#[no_mangle]
pub unsafe extern "C" fn error_message_utf8(buf: *mut raw::c_char, length: i32) -> i32 {
    ffi_helpers::error_handling::error_message_utf8(buf, length)
}