-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>mi", function()
  local line = vim.api.nvim_get_current_line()

  local converted = line:gsub("!%[([^%]]*)%]%(([^%)]+)%)", function(alt, src)
    return '<img src="' .. src .. '" alt="' .. alt .. '">'
  end)

  vim.api.nvim_set_current_line(converted)
end, { desc = "Markdown image to HTML" })

vim.keymap.set("n", "<leader>mh", function()
  local line = vim.api.nvim_get_current_line()

  local converted = line:gsub("<img%s+([^>]-)>", function(attrs)
    local src = attrs:match('src%s*=%s*"([^"]*)"')
    local alt = attrs:match('alt%s*=%s*"([^"]*)"') or ""

    if src then
      return "![" .. alt .. "](" .. src .. ")"
    end

    return "<img " .. attrs .. ">"
  end)

  vim.api.nvim_set_current_line(converted)
end, { desc = "HTML image to Markdown" })
