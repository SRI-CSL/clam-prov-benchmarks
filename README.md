# Benchmarks for clam-prov #

0. Requirements

Some of the scripts called by `generate_bitcode.sh` are defined only
for OS Mac. Sorry about that. It shouldn't be hard to adapt them for
Linux but I haven't done yet.

- [cmake](https://cmake.org/) >= 3.13
- [ninja](https://ninja-build.org/)
- [llvm](https://releases.llvm.org/download.html) 11.0.1
- [gllvm](https://github.com/SRI-CSL/gllvm) >= 1.3.0
- [gmp](https://gmplib.org/)
- [boost](https://www.boost.org/) >=1.65

1. Download all the C projects, compile, and generate LLVM bitcode using [gllvm](https://github.com/SRI-CSL/gllvm):

```
./generate_bitcode.sh
```

2. Download and install [clam-prov](https://github.com/SRI-CSL/clam-prov.git):

```
./install_clam-prov.sh
```

3. Run `clam-prov` on the C projects built in Step 1:

```
./run_benchmarks.sh

```

