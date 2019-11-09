# https://github.com/rust-lang/rustup.rs/issues/297#issuecomment-444818896
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
# note: per https://github.com/MicrosoftDocs/vsonline/issues/95 you will need to suspend and unsuspend VSO before the extension will work
