{ pkgs ? import <nixpkgs> {} }:

let
  fetchgit = import ./fetchgit.nix {};
in pkgs.mkShell {
  buildInputs = fetchgit.hsToCoq_coqenvironment.nativeBuildInputs;
}
