-- reload("user.keymaps")
-- save binds
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["<C-s>"] = "<ESC>:w<cr>a"

-- change buffers bind
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.builtin.nvimtree.setup.view.side = "right"

local lspconfig = require("lspconfig")
lspconfig.html.setup {
    filetypes = { "html", "php" }, -- Adicione "php" como um tipo de arquivo suportado
}
