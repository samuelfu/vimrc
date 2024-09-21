require("sfu")

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('navarasu/onedark.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v4.x'})
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('tpope/vim-commentary')
Plug('tpope/vim-fugitive')
Plug('debugloop/telescope-undo.nvim')
Plug('nvim-treesitter/nvim-treesitter-context')
Plug('karb94/neoscroll.nvim')
Plug('mawkler/modicator.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('OXY2DEV/markview.nvim')
vim.call('plug#end')

require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
-- Custom telescope border highlights
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#5c6370" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#5c6370" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#5c6370" })

-- LSP Setup
local lsp = require('lsp-zero')
lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'lua_ls',
    'pyright',  -- Python language server
    'jdtls',    -- Java language server
    'clangd',  -- C language server
    'ruby_lsp',      -- Ruby LSP
    'sorbet',       -- Sorbet
  },
  handlers = {
    lsp.default_setup,
  },
})

-- LSP autosuggest navgiation
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp.setup({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.cmd("tab split") vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('lspconfig').tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Python setup
require('lspconfig').pyright.setup({})

-- Java setup
require('lspconfig').jdtls.setup({})

require('lspconfig').clangd.setup({
})

require('lspconfig').bashls.setup({})

-- Ruby LSP setup
require('lspconfig').ruby_lsp.setup({})

-- Sorbet setup
require('lspconfig').sorbet.setup({})

lsp.setup()

-- Shift tab to open buffers
vim.api.nvim_set_keymap('n', '<S-Tab>', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- Smooth scrolling
require('neoscroll').setup({
  mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
    '<C-u>', '<C-d>',
    '<C-b>', '<C-f>',
    '<C-y>', '<C-e>',
    'zt', 'zz', 'zb',
  },
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing = 'linear',           -- Default easing function
  pre_hook = nil,              -- Function to run before the scrolling animation starts
  post_hook = nil,             -- Function to run after the scrolling animation ends
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

-- Visuals
require('lualine').setup()
require('modicator').setup()

vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.number = true
vim.opt.showmode = false

vim.diagnostic.config({
    virtual_text = true
})
