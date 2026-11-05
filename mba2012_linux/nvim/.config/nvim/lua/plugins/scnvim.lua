return {
  "davidgranstrom/scnvim",
  ft = "supercollider",
  config = function()
    local scnvim = require("scnvim")
    local map = scnvim.map
    local map_expr = scnvim.map_expr
    scnvim.setup({
      -- your config here
      keymaps = {
        ["<localleader>l"] = scnvim.map("editor.send_line", "n"),
        ["<localleader>e"] = {
          scnvim.map("editor.send_block", "n"),
          scnvim.map("editor.send_selection", "x"),
        },
        ["<localleader>p"] = map("postwin.toggle", "n"),
      },
    })
  end,
}
