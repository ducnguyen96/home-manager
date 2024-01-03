{ pkgs, inputs, ... }:

let 
  marketplace-extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
    rvest.vs-code-prettier-eslint
  ];
in 
{
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [ 
      jnoortheen.nix-ide
      dbaeumer.vscode-eslint
      eamodio.gitlens
      esbenp.prettier-vscode
      github.copilot
    ] ++ marketplace-extensions;

    userSettings = {
      github.copilot.enable."*" = true;
      security.workspace.trust.enabled = false;

      "[css]".editor.defaultFormatter = "esbenp.prettier-vscode";
      "[html]".editor.defaultFormatter = "esbenp.prettier-vscode";
      "[javascript]".editor.defaultFormatter = "rvest.vs-code-prettier-eslint";
      "[json]".editor.defaultFormatter = "esbenp.prettier-vscode";
      "[jsonc]".editor.defaultFormatter = "rvest.vs-code-prettier-eslint";
      "[nix]".editor.defaultFormatter = "jnoortheen.nix-ide";
    };
  };
}