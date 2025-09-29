-- local typescript = require "refactoring.treesitter.langs.typescript"
local ls = require("luasnip")
-- local utils = require("snippets.utils")
-- local partial = require("luasnip.extras").partial
local fmt = require("luasnip.extras.fmt").fmt
-- local su = require('nvim.utils.lua.string')
-- local tl = su.box_trim_lines
-- local tabstop = su.get_space_str(vim.opt.tabstop:get())
local s = ls.snippet
local i = ls.insert_node
-- local f = ls.function_node
local c = ls.choice_node
-- local d = ls.dynamic_node
-- local t = ls.t --> text node
-- local sn = ls.snippet_node
-- local rep = require("luasnip.extras").rep
local sn = ls.snippet_node
local t = ls.text_node
local f = ls.function_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")
local types = require("luasnip.util.types")
--

local utils = require("luasnippets.utils")

ls.filetype_extend("typescriptreact", { "typescript", "javascriptreact", "javascript" })

return {
  s(
    "arr",
    fmt(
      [[
   {{[...Array({})].map((_, i) => (
     {}
   ))}}
   ]],
      {
        i(1),
        i(2),
      }
    )
  ),

  s(
    "cmp",
    c(1, {
      fmt(
        [=[
        export const {} = ({}) => {{
          return (
            {}
          )
        }}
      ]=],
        { i(1), i(2), i(0) }
      ),
    }),
    c(1, {
      fmt(
        [=[
      export const {}: React.FC<{{children: ReactNode}}> = ({}) => {{
        return (
          {}
        )
      }}
      ]=],
        { i(1), i(2), i(3) }
      ),
    })
  ),
  s(
    "map",
    fmt(
      [[
    {{{}.map({} => (
      <{} key={{{}}}>
        {}
      </{}>
    ))}}
  ]],
      { i(1), i(2), i(3), i(4), i(5), rep(3) }
    )
  ),
}
