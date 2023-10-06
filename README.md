# PrettyVim

A pretty [Neovim](https://github.com/neovim/neovim) Configuration with the packer package manager

## Screenshots

![Neovim Screenshot](Screenshots/neovim.png)

## Plugins

- packer - The Package Installer
- plenary - For the Lua functions that many of my plugins use
- nvim-web-devicons - icons for the file expolorer
- nui - UI library for Neovim
- catppuccin - Coloscheme used for Neovim
- vim-surround - Adding , deleting, changing things when they are inside of quotes
- vim-ReplaceWithRegister - Replace contents with motion
- Comment.nvim - A shortcut to comment (Using gc)
- nvim-hardline - Statusline or Bar
- dashboard - startup screen
- telescope - telescope plugin
- nvim.cmp and cmp-buffer and cmp-path - Auto completion
- LuaSnip and cmp_luasnip and friendly-snippets - Code snippets
- mason - Managing & installing of lsp servers
- nvim-lspconfig and cmp-nvim-lsp and lspsaga.nvim and typescript.nvim and lspkind.nvim - For configuraing lsp servers
- SmoothCursor - Smooth cursor animation Neovim
- nvim-scrollview - Scroll bar for Neovim
- web-tools - Plugin for Web development in Neovim
- tree-sitter - Syntax Highlighting
- presence.nvim - Discord Rich Presence (you want to show off to others what you are using)
- toggleterm - Togglable terminal for Neovim

## Requirements

- Neovim 0.9.X 
- [Node](https://github.com/nodejs/node) and [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) for Mason to work

## Usage

1. Clone the repo

```
git clone https://github.com/SakuraBlossomTree/PrettyVim.git 
```

2. Create the nvim config directory(Optional)

If you don't find a nvim config directory, just create one using this command

If you already have the nvim config directory, you can skip this steip

```
mkdir ~/.config/nvim
```

2. Copy the one directory and one file which are there

- lua/sakurablossomtree directory
- init.lua file

It is not required to copy the plugin directory because it just contains the packer manager compiled stuff

You want to copy it to your config folder for nvim

```
cp -r ~/PrettyVim/lua ~/.config/nvim
cp -r ~/PrettyVim/init.lua ~/.config/nvim
```

3. Go to plugins-setup.lua file, which will be in the lua/sakurablossomtree directory

Open the file using Neovim run the command ```:PackerSync``` to install and sync packer, after that anytime you want to update the plugins or intall some new ones just open the file again and add the plugin and write the file using the command ```:w```

4. Enjoy PrettyVim

## Colorscheme

It is using catppuccin mocha

## Keybinds 

```lua
-- general keymaps

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- plugins keymaps

keymap.set("n", "<leader>e", ":Neotree<CR>") -- opens file explorer
keymap.set("n", "<leader>q", ":close<CR>") -- closes file explorer

local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})

keymap.set('n', '<leader>vt', ":ToggleTerm size=40 direction=vertical<CR>")

keymap.set('n', '<leader>ht', ":ToggleTerm size=10 direction=horizontal<CR>")

keymap.set('n', '<leader>s', ":MarkdownPreviewToggle<CR>")
```
