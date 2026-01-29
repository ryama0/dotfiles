# rustlang
if [ -d ${HOME}/.cargo/bin ]; then
  export PATH=${HOME}/.cargo/bin:${PATH}
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi
