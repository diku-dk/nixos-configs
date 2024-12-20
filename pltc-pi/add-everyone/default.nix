{ mkDerivation, base, hpack, stdenv, github, lib }:

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
