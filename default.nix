let
  pkgs = import
    (builtins.fetchTarball {
      # Descriptive name to make the store path easier to identify
      name = "nixpkgs-21.11-darwin-2022-02-15";
      url = "https://github.com/NixOS/nixpkgs/archive/b61bf7a96aa6ddd3c425fa1db8c45acfdd82e36b.tar.gz";
      # Hash obtained using `nix-prefetch-url --unpack <url>`
      sha256 = "0dw23adh6b0jxa58nba31bf4033cd6yiwzgzp5bbl4zf2jaw9prh";
    })
    {
      system =
        if builtins.currentSystem == "aarch64-darwin"
        then "x86_64-darwin" else builtins.currentSystem;
    };
in
pkgs.mkShell {
  buildInputs = (with pkgs.python39Packages; [ weasyprint pdftotext ]);
  FONTCONFIG_FILE = "${pkgs.fontconfig.out}/etc/fonts/fonts.conf";
}
