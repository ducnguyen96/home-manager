{
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;

    extensions = [ pkgs.vscode-extensions.jnoortheen.nix-ide ];
  };
}