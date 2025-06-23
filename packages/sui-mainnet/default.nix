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
  version = "unstable-1.50.1";

  src = fetchFromGitHub {
    owner = "MystenLabs";
    repo = "sui";
    rev = "2c930c25f8d35a4aec31ba4c99ae577f4c37a27d";
    sha256 = "sha256-jE6/BCw/TpD19KKwZ5AnWI7WX+oOGEaEZQ/m0gTnMoQ=";
  };

  cargoHash = "sha256-ZKNqsNxZOU6EDo7v2uqcYTts3HZnujBFQrN7nR6JXzk=";
  cargoPatches = [
    ../../patches/sui/0001-Replace-tokio-macros-and-tokio-utils-with-fork.patch
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
