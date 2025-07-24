
{ config, pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = [ pkgs.vimPlugins.lazy-nvim ];
    extraLuaConfig = with pkgs.vimPlugins;
    ''
    ${builtins.readFile ./nvim/init.lua}

    require("lazy").setup({
      rocks = { enabled = false },
      pkg = { enabled = false },
      install = { enabled = false },
      change_detection = { enabled = false },
      spec = {
        { dir = "${guess-indent-nvim}" },
	{ dir = "${gitsigns-nvim}" },
      },
    })

  '';
  };
}
