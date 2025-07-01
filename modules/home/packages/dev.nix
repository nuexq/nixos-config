{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nixd                              # nix lsp
    nixfmt-rfc-style                  # nix formatter

    # C / C++
    gcc
    gdb
    gef
    cmake
    gnumake
    valgrind
    llvmPackages_20.clang-tools

    # Java
    openjdk24

    # JS/TS
    nodejs
    bun

    # Rust
    (rust-bin.stable.latest.default.override { extensions = [ "rust-src" ]; })
    cargo-watch
  ];
}
