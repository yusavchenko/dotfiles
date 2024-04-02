return {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  -- or                              , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 
      "nvim-telescope/telescope-live-grep-args.nvim" ,
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  }
}
