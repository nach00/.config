local ls = require("luasnip")
local utils = require("snippets.utils")
local partial = require("luasnip.extras").partial
local fmt = require("luasnip.extras.fmt").fmt
-- local su = require('nvim.utils.lua.string')
-- local tl = su.box_trim_lines
-- local tabstop = su.get_space_str(vim.opt.tabstop:get())
local s = ls.snippet
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
local t = ls.t --> text node
-- local sn = ls.snippet_node
-- local rep = require("luasnip.extras").rep

ls.add_snippets("all", {
  ls.s("time", partial(vim.fn.strftime, "%H:%M:%S")),
  ls.s("date", partial(vim.fn.strftime, "%Y-%m-%d")),
  ls.s("pwd", { partial(utils.shell, "pwd") }),
  -- })

  -- ls.add_snippets("typescript", {
  s("arraymap", {
    t("{[...Array("),
    i(1),
    t(")].map((_, i) => "),
    t({ "", "  " }),
    i(0),
    t({ "", ")" }),
  }),
})

-- ls.add_snippets("markdown", {
--   ls.s( -- Link {{{
--     {
--       trig = "[[",
--       name = "markdown_link",
--       dscr = "Create markdown link [txt](url).\nSelect link, press C-s, type link.",
--     },
--     fmt("[{}]({})\n{}", {
--       ls.i(1),
--       ls.f(function(_, snip)
--         return snip.env.TM_SELECTED_TEXT[1] or {}
--       end, {}),
--       ls.i(0),
--     })
--   ), --}}}
--
--   ls.s( -- Codeblock {{{
--     {
--       trig = "`c",
--       name = "Make code block",
--       dscr = "Select text, press <C-s>, type codeblock.",
--     },
--     fmt("```{}\n{}\n```\n{}", {
--       ls.i(1, "Language"),
--       ls.f(function(_, snip)
--         local tmp = snip.env.TM_SELECTED_TEXT
--         tmp[0] = nil
--         return tmp or {}
--       end, {}),
--       ls.i(0),
--     })
--   ), --}}}
--
--   ls.s( -- Image {{{
--     {
--       trig = "img",
--       name = "Insert image",
--       dscr = "Select text, press <C-s>, type img.",
--     },
--     fmt("![{}]({})\n{}", {
--       ls.i(1),
--       ls.i(2),
--       ls.i(0),
--     })
--   ), --}}}
--
--   ---frontmatter
--   ls.s( -- frontmatter {{{
--     {
--       trig = "---",
--       name = "frontmatter",
--       dscr = "Select text, press <C-s>, type frontmatter.",
--     },
--     fmt("---\ntitle: {}\nauther: Ray\nlayout: post\ntags:\n  - {}\ndate: {}\ntype: post\n---\n", {
--       ls.i(0, vim.fn.expand("%:t:r")),
--       ls.i(1, ""),
--       ls.i(2, os.date("%Y-%m-%d %H:%M:%S")),
--     })
--   ), --}}}
--
--   ls.s( -- Codeblock {{{
--     {
--       trig = "py",
--       name = "python code block",
--       dscr = "Select text, press <C-s>, type codeblock.",
--     },
--     fmt("```python\n{}\n```\n{}", {
--       ls.f(function(_, snip)
--         local tmp = snip.env.TM_SELECTED_TEXT
--         tmp[0] = nil
--         return tmp or {}
--       end, {}),
--       ls.i(0),
--     })
--   ), --}}}
--   ls.s( -- Codeblock {{{
--     {
--       trig = [[js]],
--       name = "js code block",
--       dscr = "Select text, press <C-s>, type codeblock.",
--     },
--     fmt("```javascript\n{}\n```\n{}", {
--       ls.f(function(_, snip)
--         local tmp = snip.env.TM_SELECTED_TEXT
--         tmp[0] = nil
--         return tmp or {}
--       end, {}),
--       ls.i(0),
--     })
--   ), --}}}
--
--   ls.s( -- Codeblock {{{
--     {
--       trig = [[go]],
--       name = "go code block",
--       dscr = "Select text, press <C-s>, type codeblock.",
--     },
--     fmt("```go\n{}\n```\n{}", {
--       ls.f(function(_, snip)
--         local tmp = snip.env.TM_SELECTED_TEXT
--         tmp[0] = nil
--         return tmp or {}
--       end, {}),
--       ls.i(0),
--     })
--   ), --}}}
--   ls.s("ch", {
--     ls.t("- [ ] "),
--     ls.i(1, "todo.."),
--   }),
--   ls.s( -- font matter {{{
--     {
--       trig = "-f",
--       name = "Make font matter",
--       dscr = "Select text, press <C-s>, type -",
--     },
--     fmt("---\ntitle: {}\nauther: Ray\nlayout: post\ntags:\n  - {}\ncreated: {}\n---\n", {
--       ls.i(0, vim.fn.expand("%:t:r")),
--       ls.i(1, ""),
--       ls.i(2, os.date("%Y-%m-%d %H:%M:%S")),
--     })
--   ), --}}}
-- })
