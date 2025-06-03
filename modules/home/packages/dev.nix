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

    # Rust
    rustup

    # Java
    openjdk21

    # JS/TS
    nodejs
    bun
  ];
}
