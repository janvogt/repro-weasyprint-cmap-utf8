let
  pkgs = import
    (builtins.fetchTarball {
      # Descriptive name to make the store path easier to identify
      name = "nixpkgs-janvogt-2022-02-16";
      url = "https://github.com/janvogt/nixpkgs/archive/d00ee7665b52ad56f1db54575887c4f793bed723.tar.gz";
      # Hash obtained using `nix-prefetch-url --unpack <url>`
      sha256 = "0qkygnn6hxyfhvykgf4rjmi1lz77bkxdz3ab2xfpcdmfwidm7gf6";
    })
    { };
  weasyprint = pkgs.python39Packages.callPackage (import ./weasyprint.nix) { };
in
pkgs.mkShell {
  buildInputs = builtins.attrValues {
    inherit (pkgs.python39Packages) pdftotext;
    inherit weasyprint;
  };
}
