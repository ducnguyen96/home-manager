{ pkgs, bultins, ... }:

let
  nix-vscode-extensions = (import (builtins.fetchGit {
      url = "https://github.com/nix-community/nix-vscode-extensions";
      ref = "refs/heads/master";
      rev = "20f496592b1dd2bb1ffeae59de2619ca3ec8c1f8";
    })).extensions.${builtins.currentSystem};

  marketplace-extensions = with nix-vscode-extensions.vscode-marketplace; [
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
      window.menuBarVisibility =  "toggle";

      "[css]".editor.defaultFormatter = "esbenp.prettier-vscode";
      "[html]".editor.defaultFormatter = "esbenp.prettier-vscode";
      "[javascript]".editor.defaultFormatter = "rvest.vs-code-prettier-eslint";
      "[json]".editor.defaultFormatter = "esbenp.prettier-vscode";
      "[jsonc]".editor.defaultFormatter = "rvest.vs-code-prettier-eslint";
      "[nix]".editor.defaultFormatter = "jnoortheen.nix-ide";

      terminal.integrated = {
        defaultProfile.linux = "zsh";
      };

      editor.formatOnSave =  true;
    };
  };
}