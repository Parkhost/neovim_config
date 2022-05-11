-- vim command execution
local packer = nil
local execute = vim.api.nvim_command
-- invoke vim or user function
local fn = vim.fn

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    print('packer is not installed?')
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
   packer = require'packer'
   packer.init()
  end
  local use = packer.use
  packer.reset()

  -- PLUGINS --
  -- PACKER
  -- -- always call packer
  use 'wbthomason/packer.nvim'

  use {
    'gruvbox-community/gruvbox',
  }
  use { 'preservim/nerdcommenter' }
	  -- Language Servers
  --use {
    --'lspcontainers/lspcontainers.nvim',
    --requires = {
      --'neovim/nvim-lspconfig',
      --'nvim-lua/lsp_extensions.nvim',
    --},
    --config = function ()
      --require'Parkhost.plugins.lspconfig'.init()
    --end
  --}
  --use 'hashivim/vim-terraform'

	---- Tree Sitter
  --use {
    --'nvim-treesitter/nvim-treesitter',
    --run = 'TSUpdate',
		--config = function() require 'Parkhost.plugins.treesitter' end,
  --}

  ---- Theme
  ----use {
    ----'folke/tokyonight.nvim',
    ----config = function() require "Parkhost.plugins.tokyonight" end,
  ----}

	---- LUALINE
	--use {
		--'hoob3rt/lualine.nvim',
		--requires = {'kyazdani42/nvim-web-devicons', opt = true},
		--config = function() require "Parkhost.plugins.lualine" end,
	--}

    ---- Telescope
  --use 'nvim-lua/popup.nvim'
  --use {
    --'nvim-telescope/telescope.nvim',
    --requires = {
      --'rmagatti/session-lens',
      --'nvim-lua/plenary.nvim'
    --},
		--config = function() require "Parkhost.plugins.telescope" end,
  --}

	---- utilites
	--use 'lukas-reineke/indent-blankline.nvim'
  --use {
    --'voldikss/vim-floaterm',
    --config = function () require 'Parkhost.plugins.floaterm' end
  --}

  ---- completion
  --use {
    --'hrsh7th/nvim-cmp',
    --requires = {
      --{
        --'tzachar/cmp-tabnine',
        --run='./install.sh',
        --requires = 'hrsh7th/nvim-cmp'
      --},
      --'hrsh7th/cmp-buffer',
      --'onsails/lspkind-nvim',
      --'hrsh7th/cmp-path',
      --'hrsh7th/cmp-nvim-lua',
      --'hrsh7th/cmp-nvim-lsp',
      --'saadparwaiz1/cmp_luasnip',
      --'L3MON4D3/LuaSnip'
    --},
    --config = function ()
      --require'Parkhost.plugins.cmp'
      --require'Parkhost.plugins.cmp_tabnine'
      --require'Parkhost.plugins.lspkind'
    --end
  --}

  --use {
    --'nvim-lua/plenary.nvim',
    --'ThePrimeagen/harpoon',
    --config = function ()
      --require'Parkhost.plugins.harpoon'
    --end
  --}

 ------ git
  --use {
    --'rhysd/git-messenger.vim',
    --'lewis6991/gitsigns.nvim',
    --requires = {
    --},
    --config = function ()
      --require'Parkhost.plugins.gitsigns'.init()
    --end
  --}

    ---- Sessions
  --use {
    --'rmagatti/auto-session',
    --config = function () require 'Parkhost.plugins.auto_session' end
  --}

  ---- Utilities
  --use { 'preservim/nerdcommenter' }
  ---- END PLUGINS --
end


local function init()
  packer_verify()
  packer_startup()
  vim.g.gruvbox_contrast_dark='hard'
  vim.cmd("colorscheme gruvbox")
end

return {
  init = init
}


