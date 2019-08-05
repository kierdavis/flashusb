with import <nixpkgs> {};

mkShell {
  buildInputs = [ python3 parted rsync ];
}
