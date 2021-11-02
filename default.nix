{ chan ? import ./chan.nix
, pkgs ? import ./pkgs.nix { inherit chan; }
}:
let
  fetchgit = import ./fetchgit.nix { inherit chan pkgs; };
in pkgs.runCommand "hs-to-coq-result" {}
    ''
      mkdir -p $out
      cd $out
      cp -r ${fetchgit.hsToCoq_coqenvironment}/. hs-to-coq
      cp -r ${fetchgit.hsToCoq_defaultnix.haskellPackages.hs-to-coq}/. .
    ''
