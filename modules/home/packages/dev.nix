{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nixd                              # nix lsp
    nixfmt-rfc-style                  # nix formatter

    # C / C++
    gcc
    gdb
    cmake
    gnumake
    valgrind
    llvmPackages_20.clang-tools

    # Java
    jdk

    # JS/TS
    nodejs
    bun

    # Rust
    (rust-bin.stable.latest.default.override { extensions = [ "rust-src" ]; })
    cargo-watch
  ];
}
