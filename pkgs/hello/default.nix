{ gcc, coreutils, bash, stdenv }:
derivation {
    name = "hello";
    builder = "${bash}/bin/bash";
    args = [ ./build.sh ];
    src = ./hello.c;
    inherit (stdenv.buildPlatform) system;
    inherit gcc coreutils;
}
