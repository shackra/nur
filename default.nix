{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> { inherit system; },
}:

rec {
  ngpost = pkgs.libsForQt5.callPackage ./packages/ngpost { };
}
