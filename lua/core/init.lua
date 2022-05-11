local function init()
  require 'core.vim'.init()
  require 'core.packer'.init()
end

return {
  init = init,
}
