{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  environment.etc."xdg/nvim/init.lua".text = ''
    vim.opt.cc = "80"
    vim.opt.expandtab = true
    vim.opt.number = true
    vim.opt.tabstop = 4

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "nix",
      callback = function(ev)
        vim.opt.tabstop = 2
      end
    })

    vim.lsp.enable('nixd');
  '';

  environment.systemPackages = with pkgs; [
    nixd
  ];
}
