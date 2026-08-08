local M = {}

function M.setup_treesitter_queries()
  vim.treesitter.query.set("jjdescription", "highlights", [[
[
  (comment)
  (generated_comment)
] @comment

(comment_content) @spell

(subject) @markup.heading

(type) @keyword

(scope) @variable.parameter

(change_id) @constant

(filepath) @string.special.path

((rest) @comment
  (#not-lua-match? @comment "diff %-%-"))

"JJ: ignore-rest" @comment

[
  "("
  ")"
] @punctuation.bracket

":" @punctuation.delimiter

"!" @punctuation.special

[
  "A"
  "C"
] @diff.plus

"D" @diff.minus

[
  "M"
  "R"
] @diff.delta
]])

  vim.treesitter.query.set("jjdescription", "injections", [[
((comment_content) @injection.content
  (#set! injection.language "comment"))

((rest) @injection.content
  (#lua-match? @injection.content "diff %-%-")
  (#set! injection.language "diff"))
]])
end

return M
