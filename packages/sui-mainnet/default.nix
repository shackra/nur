##########################################################################
#                                                                        #
#  This file is part of the shackra/nur project                          #
#                                                                        #
#  Copyright (C) 2025 Jorge Javier Araya Navarro                         #
#                                                                        #
#  SPDX-License-Identifier: MIT                                          #
#                                                                        #
##########################################################################

{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "sui";
  version = "unstable-2025-06-16";

  src = fetchFromGitHub {
    owner = "MystenLabs";
    repo = "sui";
    rev = "c7ec9546978b3c52b0c57bbdb9693f5068dd3383";
    sha256 = "sha256-G/cGGPyNXaQG2LK+pGjG3m4seiTekQD7IdfT/9rLWw4=";
  };

  cargoHash = "sha256-u/bPz2KySApCOUDxQjmBDIqaXP6aypjM0NMZ8GKOemI=";
  cargoPatches = [
    ../../patches/sui/0001-Remove-sui-replay-2.patch
    ../../patches/sui/0002-Replace-tokio-macros-from-registry-to-MystenLabs-for.patch
    ../../patches/sui/0003-Replace-tokio-util-with-MystenLabs-fork.patch
  ];

  cargoBuildFlags = [
    "--package"
    "sui"
  ];
  cargoInstallFlags = [
    "--path"
    "crates/sui"
  ];

  nativeBuildInputs = with rustPlatform; [ cargoSetupHook ];

  meta = with lib; {
    description = "Sui blockchain CLI tool";
    homepage = "https://github.com/MystenLabs/sui";
    license = licenses.asl20;
    maintainers = with maintainers; [ shackra ];
    platforms = platforms.unix;
  };
}
