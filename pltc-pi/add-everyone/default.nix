{ mkDerivation, base, hpack, stdenv, haskellPackages, haskell, lib }:

let github = (haskellPackages.extend (haskell.lib.packageSourceOverrides {
                         github = builtins.fetchGit {
                           url = https://github.com/phadej/github.git;
                           rev = "dd195d9b5eaba68c2408ab488af8c1dcabd2e033";
                         };
                       })).github;
in
 mkDerivation {
   pname = "add-everyone";
   version = "0.0.0";
   src = ./.;
   isLibrary = false;
   isExecutable = true;
   libraryToolDepends = [ hpack ];
   executableHaskellDepends = [ base github ];
   preConfigure = "hpack";
   license = lib.licenses.bsd3;
 }
