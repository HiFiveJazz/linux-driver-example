// SPDX-License-Identifier: GPL-2.0

//! Rust misc device example.

use kernel::prelude::*;
use kernel::{c_str, miscdevice};

module! {
    type: RustJazz,
    name: "rust_jazz",
    authors: ["Jazz"],
    description: "Rust misc device",
    license: "GPL",
}

#[pin_data]
struct RustJazz {
    #[pin]
    _dev: miscdevice::MiscDeviceRegistration<RustJazzDev>,
}

struct RustJazzDev;

#[vtable]
impl miscdevice::MiscDevice for RustJazzDev {
    type Ptr = ();

    fn open(
        _file: &kernel::fs::file::File,
        _misc: &miscdevice::MiscDeviceRegistration<Self>,
    ) -> Result<Self::Ptr> {
        pr_info!("rust_jazz: opened\n");
        Ok(())
    }

    fn read_iter(
        mut kiocb: kernel::fs::Kiocb<'_, Self::Ptr>,
        iov: &mut kernel::iov::IovIterDest<'_>,
    ) -> Result<usize> {
        let msg = b"hello from rust_jazz\n";
        iov.simple_read_from_buffer(kiocb.ki_pos_mut(), msg)
    }
}


impl kernel::InPlaceModule for RustJazz {
    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
        try_pin_init!(Self {
            _dev <- miscdevice::MiscDeviceRegistration::register(
                miscdevice::MiscDeviceOptions {
                    name: c_str!("rust_jazz"),
                }
            ),
        })
    }
}
