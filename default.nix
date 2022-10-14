# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  universal-ctags-pcre2 = pkgs.callPackage ./pkgs/universal-ctags-pcre2 { };
  tectonic = pkgs.callPackage ./pkgs/tectonic { };
  neovide = pkgs.callPackage ./pkgs/neovide { };
  nix-template = (import ./pkgs/nix-template).default;
}
