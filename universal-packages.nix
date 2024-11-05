# Packages that should be available on any sensible machine.
{ pkgs }:
with pkgs;
[
   wget curl git git-lfs git-annex git-extras emacs file htop btop tree coreutils-full stow
   killall pass pinentry-curses zip unzip lz4 nmap sshfs sshpass passh xdg-utils pstree
   groff imagemagick ott graphviz gnuplot dot2tex
   gnupg
   ed
   pandoc
   ispell aspell aspellDicts.en aspellDicts.en-computers aspellDicts.da
   mime-types shared-mime-info
   lm_sensors pciutils lshw hwinfo
   scc rsync cowsay figlet toilet bc gist
   parallel
   whois
   exif
   rlwrap
   cmatrix
   bat
   libcaca # Mostly for cacaview.
   inetutils dig
   smartmontools
   ncdu # file/disk usage profiler
   tmux

   # Hacking stuff
   gcc gdb clang cmake gnumake hlint cabal-install ghc
   bison flex
   opencl-headers ocl-icd jemalloc
   ormolu
   zlib zlib.dev binutils
   automake autoconf pkg-config libtool
   nix-prefetch-git nix-top
   valgrind linuxPackages.perf clinfo
   hwloc
   shellcheck
   man-pages man-pages-posix linux-manual
   cachix
   ascii
   hyperfine
   jq
   lolcat
   xxd

   lynx
   sacc

   # Convenient Python things
   python3
   python3Packages.pip python3Packages.setuptools
   python3Packages.matplotlib python3Packages.numpy
   python3Packages.pygments
 ]

