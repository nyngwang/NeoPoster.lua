<img src="https://neovim.io/logos/neovim-mark-flat.png" align="right" width="100" />

NeoPoster.lua
===

Always want to create one to show some ascii arts.
Found an ancient one but it's buggy in some edge cases,
and written in Vim Script.

So ... wheel reinvented!


## Preview

<img src="https://user-images.githubusercontent.com/24765272/222985745-07eb6b07-e9cc-421b-b294-3080428f9ecb.png" width="600">


## Setup

notes:
- `default_path`: will be used when calling `NeoPoster [{filepath}]`.
  - don't need to add quotes for `filepath` and `~` is allowed.
  - don't know how to support `<Tab>`-completion of `filepath`.😅 (PR welcome)


```lua
use {
  'nyngwang/NeoPoster.lua',
  config = function ()
    require('neo-poster').setup {
      call_on_VimEnter = true, -- let me create it for you on VimEnter, since it's kinda tricky.
      default_path = '~/.config/nvim/lua/ningwang/data/ascii_art/miku.txt', -- change it to point to your own file.
    }
  end
}
```


## Ref.

https://github.com/thinca/vim-splash
