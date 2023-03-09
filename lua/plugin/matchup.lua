return {
  "andymass/vim-matchup",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = nil }
    vim.g.matchup_matchpref = { html = { nolists = 1 } }
  end,
}
