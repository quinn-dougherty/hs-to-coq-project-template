{ pkgs ? import <nixpkgs> {} }:
let
  fetchgit = import ./fetchgit.nix {};
in pkgs.runCommand "hs-to-coq-result" {}
    ''
      mkdir -p $out
      cd $out
      cp -r ${fetchgit.hsToCoq_coqenvironment}/. hs-to-coq
      cp -r ${fetchgit.hsToCoq_defaultnix.haskellPackages.hs-to-coq}/. .
    ''
