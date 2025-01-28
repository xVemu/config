{ lib, config, pkgs, ... }:

{
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # Don't change
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.lazydocker
  ];

  programs.home-manager.enable = true;
  programs.eza.enable = true;
  programs.bat.enable = true;
  programs.zoxide.enable = true;

  programs.tealdeer = {
    enable = true;
    settings.updates.auto_update = true;
  };

  programs.git = {
    enable = true;

    extraConfig = {
      core = {
        autocrlf = "input";
        filemode = false;
      };
      push.followTags = true;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraLuaConfig = ''
        vim.opt.showmode = false
        vim.opt.termguicolors = true
        vim.opt.background = 'dark'
        vim.opt.autoindent = true
        vim.opt.smarttab = true
        vim.opt.mouse = 'a'
        vim.opt.number = true
        vim.opt.relativenumber = true

        vim.cmd("colorscheme solarized")
        vim.g.solarized_termcolors = 256
        vim.g.lightline = {
          colorscheme = 'solarized',
        }

        vim.cmd("syntax enable")
        vim.cmd("filetype plugin on")
    '';
    plugins = with pkgs.vimPlugins; [
#      vim-colemak
      vim-colors-solarized
      lightline-vim
    ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g theme_hide_hostname yes
      set -g fish_prompt_pwd_dir_length 0
    '';

    shellAliases = {
      cat="bat";
      ls="eza";
      l="eza -l";
      vi="nvim";
      mv="mv -iv";
      cp="cp -riv";
      mkdir="mkdir -vp";
    };

    plugins = [
      {
        name = "extract";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-extract";
          rev = "master";
          sha256 = "hFM8uDHDfKBVn4CgRdfRaD0SzmVzOPjfMxU9X6yATzE=";
        };
      }
      {
        name = "last-working-dir";
        src = pkgs.fetchFromGitHub {
          owner = "kfkonrad";
          repo = "last-working-dir-fish-pkg";
          rev = "master";
          sha256 = "GWTMrQ8xFjgKCnAWIdw/iZ1rYQBvgf2HjKdCv5G4Mfc=";
        };
      }
      {
        name = "agnoster";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "theme-agnoster";
          rev = "master";
          sha256 = "OFESuesnfqhXM0aij+79kdxjp4xgCt28YwTrcwQhFMU=";
        };
      }
      {
        name = "nix-fish";
        src = pkgs.fetchFromGitHub {
          owner = "kidonng";
          repo = "nix.fish";
          rev = "master";
          sha256 = "GMV0GyORJ8Tt2S9wTCo2lkkLtetYv0rc19aA5KJbo48=";
        };
      }
    ];
  };
}
