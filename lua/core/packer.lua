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
  use 'wbthomason/packer.nvim'
  use {
    'gruvbox-community/gruvbox',
  }
  use { 'preservim/nerdcommenter' }
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


