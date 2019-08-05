with import <nixpkgs> {};

mkShell {
  buildInputs = [ python3 parted dosfstools rsync ];
}
