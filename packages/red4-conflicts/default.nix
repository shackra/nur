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
  rustPlatform,
  fetchFromGitHub,
  lib,
}:
rustPlatform.buildRustPackage rec {
  pname = "red4-conflicts";
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "rfuzzo";
    repo = "Cyberpunk-utility";
    rev = "master";
    sha256 = "sha256-LiR+44b9MzWbvkxnDy6cDujgijGmTw0PscdawVS/dh0=";
    name = src.repo;
  };

  cargoHash = "sha256-CEXqaP8fif2Y3wTQaOX4XmHkmVSVUAMQG9C76shComs=";
  sourceRoot = "${src.name}/${pname}";

  meta = with lib; {
    description = "A conflict-checker app for Cyberpunk 2077 archives";
    homepage = "https://github.com/rfuzzo/Cyberpunk-utility";
    license = licenses.unlicense;
    maintainers = [ maintainers.shackra ];
  };
}
