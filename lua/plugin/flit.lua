return {
  "ggandor/flit.nvim",
  opts = {
    keys = { f = "f", F = "F", t = "t", T = "T" },
    labeled_modes = "nvo",
    multiline = true,
    opts = {},
  },
  event = "BufReadPre",
  dependencies = "ggandor/leap.nvim",
}
