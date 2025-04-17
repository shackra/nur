##########################################################################
#                                                                        #
#  This file is part of the shackra/nur project                          #
#                                                                        #
#  Copyright (C) 2025 Jorge Javier Araya Navarro                         #
#                                                                        #
#  SPDX-License-Identifier: GPL-3.0-or-later                             #
#                                                                        #
##########################################################################

{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> { inherit system; },
}:

rec {
  ngpost = pkgs.libsForQt5.callPackage ./packages/ngpost { };
  gtkcsslanguageserver = pkgs.callPackage ./packages/gtk-css-language-server { };
}
