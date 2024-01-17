if vim.loader and vim.fn.has "nvim-0.9.1" == 1 then vim.loader.enable() end

for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify(
      ("Error setting up colorscheme: `%s`"):format(astronvim.default_colorscheme),
      vim.log.levels.ERROR
    )
  end
end

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)

vim.opt.hlsearch = false
-- vim.opt.shell = "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
vim.opt.scrolloff = 10

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Map "jk" to Escape key in insert and visual mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'jk', '<Esc>', { noremap = true, silent = true })

-- Map "kj" to Escape key in insert and visual mode
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'kj', '<Esc>', { noremap = true, silent = true })



if vim.g.vscode then
  vim.cmd.startinsert()
end

local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup {
  -- Omitting some options
  root_dir = nvim_lsp.util.root_pattern("deno.json"),

}

