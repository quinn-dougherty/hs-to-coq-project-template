{ pkgs ? import <nixpkgs> {}
, ghcVersion ? "ghc884" }:
let
  haskellPackages' = pkgs.haskell.packages.${ghcVersion} // {
    dev = pkgs.haskell.packages.${ghcVersion}.callCabal2nix "SecureChannel" ./. {};
  };
in {
  SecureChannel = haskellPackages';
}
