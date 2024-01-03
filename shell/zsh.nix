{ config, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history = {
      save = 10000;
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    shellAliases = {
      g = "git";
    };

    zplug = {
      enable = true;
      zplugHome = "${config.xdg.configHome}/zsh/zplug";
      plugins = [
        {name = "Aloxaf/fzf-tab";}
        {name = "zdharma-continuum/fast-syntax-highlighting";}
        {name = "zsh-users/zsh-history-substring-search";}
        {name = "zsh-users/zsh-completions";}
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "hlissner/zsh-autopair";}
      ];
    };
  };
}