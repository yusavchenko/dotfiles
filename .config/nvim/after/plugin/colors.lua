function ColorMyTerm(color)
  -- color = color or "tokyonight-night"
  color = color or "catppuccin-mocha"
  vim.cmd.colorscheme(color)
end
ColorMyTerm();
