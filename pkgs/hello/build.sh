export PATH="$coreutils/bin:$gcc/bin"

mkdir -p $out/bin
gcc -o $out/bin/hello $src
