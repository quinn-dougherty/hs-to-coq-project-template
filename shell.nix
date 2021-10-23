{ pkgs ? import <nixpkgs> {} }:

let
  fetchgit = import ./fetchgit.nix {};
  srcHaskell = import ./src-haskell/default.nix {};
in pkgs.mkShell {
  buildInputs = fetchgit.hsToCoq_coqenvironment.nativeBuildInputs;
} // srcHaskell.SecureChannel.dev // fetchgit.hsToCoq_defaultnix.haskellPackages.hs-to-coq
