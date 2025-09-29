-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "sontungexpt/better-diagnostic-virtual-text",
  event = "LspAttach",
  config = function()
    require("better-diagnostic-virtual-text").setup({
      ui = {
        wrap_line_after = false,
        left_kept_space = 3,
        right_kept_space = 3,
        -- arrow = "  ",
        -- up_arrow = "  ",
        -- down_arrow = "  ",
        above = false,
      },
      priority = 2003,
      inline = true,
    })
  end,
}
