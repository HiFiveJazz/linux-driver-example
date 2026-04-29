savedcmd_rust_jazz.o := OBJTREE=/usr/lib/modules/6.19.14-1-vfio/build RUST_MODFILE=./rust_jazz rustc --edition=2021 -Zbinary_dep_depinfo=y -Astable_features -Aunused_features -Dnon_ascii_idents -Dunsafe_op_in_unsafe_fn -Wmissing_docs -Wrust_2018_idioms -Wunreachable_pub -Wclippy::all -Wclippy::as_ptr_cast_mut -Wclippy::as_underscore -Wclippy::cast_lossless -Wclippy::ignored_unit_patterns -Wclippy::mut_mut -Wclippy::needless_bitwise_bool -Aclippy::needless_lifetimes -Wclippy::no_mangle_with_rust_abi -Wclippy::ptr_as_ptr -Wclippy::ptr_cast_constness -Wclippy::ref_as_ptr -Wclippy::undocumented_unsafe_blocks -Wclippy::unnecessary_safety_comment -Wclippy::unnecessary_safety_doc -Wrustdoc::missing_crate_level_docs -Wrustdoc::unescaped_backticks -Cpanic=abort -Cembed-bitcode=n -Clto=n -Cforce-unwind-tables=n -Ccodegen-units=1 -Csymbol-mangling-version=v0 -Crelocation-model=static -Zfunction-sections=n -Wclippy::float_arithmetic --target=/usr/lib/modules/6.19.14-1-vfio/build/scripts/target.json -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2 -Zcf-protection=branch -Zno-jump-tables -Ctarget-cpu=x86-64 -Ztune-cpu=generic -Cno-redzone=y -Ccode-model=kernel -Zfunction-return=thunk-extern -Zpatchable-function-entry=16,16 -Copt-level=2 -Cdebug-assertions=n -Coverflow-checks=y -Zdwarf-version=5 -Cdebuginfo=2  --cfg MODULE  @/usr/lib/modules/6.19.14-1-vfio/build/include/generated/rustc_cfg -Zallow-features=asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg -Zcrate-attr=no_std -Zcrate-attr='feature(asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg)' -Zunstable-options --extern pin_init --extern kernel --crate-type rlib -L /usr/lib/modules/6.19.14-1-vfio/build/rust/ --crate-name rust_jazz --sysroot=/dev/null --out-dir ./ --emit=dep-info=./.rust_jazz.o.d --emit=obj=rust_jazz.o rust_jazz.rs  ; /usr/lib/modules/6.19.14-1-vfio/build/tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --sls --static-call --uaccess --prefix=16  --link  --module rust_jazz.o

source_rust_jazz.o := rust_jazz.rs

deps_rust_jazz.o := \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libcore.rmeta \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libkernel.rmeta \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libffi.rmeta \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libcompiler_builtins.rmeta \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libpin_init.rmeta \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libmacros.so \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libpin_init_internal.so \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libbuild_error.rmeta \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libbindings.rmeta \
  /usr/lib/modules/6.19.14-1-vfio/build/rust/libuapi.rmeta \

rust_jazz.o: $(deps_rust_jazz.o)

$(deps_rust_jazz.o):

rust_jazz.o: $(wildcard /usr/lib/modules/6.19.14-1-vfio/build/tools/objtool/objtool)
