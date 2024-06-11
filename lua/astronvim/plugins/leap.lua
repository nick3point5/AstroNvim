return {
  "ggandor/leap.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require('leap').add_default_mappings()
  end
}
