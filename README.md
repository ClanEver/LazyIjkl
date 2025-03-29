# 💤 LazyIjkl

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim) but `ijkl`. If you are an `ijkl` obsessive like me, then you've come to the right place.

I've made these adjustments:

- Created a terminal shortcut toggle that maps `hjki` to `ihjk`
- In nvim, remapped `ihjk` back to `hjki` in text input modes (insert, command, etc.)
- Made some compatibility adjustments for keymaps searching in snacks picker, flash.nvim, and which-key.nvim

This way, all motion commands and shortcuts are 'shifted', but text input in various editing modes remains unaffected.

---

I use this with [wezterm](https://github.com/wezterm/wezterm).

~/.wezterm.lua

<details>
<summary>win (ctrl-alt-n to switch)</summary>

```lua
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- ctrl-alt-n switch ijkl
config.keys = config.keys or {}
table.insert(config.keys, {
    key = 'n',
    mods = 'CTRL|ALT',
    action = act.EmitEvent 'toggle-vim-key-mapping',
})

wezterm.GLOBAL = wezterm.GLOBAL or {}
wezterm.GLOBAL.vim_key_mapping_enabled = wezterm.GLOBAL.vim_key_mapping_enabled or false

wezterm.on('toggle-vim-key-mapping', function(window, pane)
    wezterm.GLOBAL.vim_key_mapping_enabled = not wezterm.GLOBAL.vim_key_mapping_enabled
end)

local function add_vim_map(source_key, target_key)
    if source_key == source_key:lower() then
        add_vim_map(source_key:upper(), target_key:upper())
    end
    for _, mods in ipairs({ '', 'CTRL', 'ALT', 'CTRL|ALT' }) do
        table.insert(config.keys, {
            key = source_key,
            mods = mods,
            action = wezterm.action_callback(function(window, pane)
                if wezterm.GLOBAL.vim_key_mapping_enabled then
                    window:perform_action(act.SendKey { key = target_key, mods = mods }, pane)
                else
                    window:perform_action(act.SendKey { key = source_key, mods = mods }, pane)
                end
            end
            ),
        })
    end
end

add_vim_map('j', 'h')
add_vim_map('k', 'j')
add_vim_map('i', 'k')
add_vim_map('h', 'i')

return config
```

</details>

<details>
<summary>mac (cmd-ctrl-n to switch)</summary>

```lua
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- cmd-ctrl-n switch ijkl
config.keys = config.keys or {}
table.insert(config.keys, {
    key = 'n',
    mods = 'SUPER|CTRL',
    action = act.EmitEvent 'toggle-vim-key-mapping',
})

wezterm.GLOBAL = wezterm.GLOBAL or {}
wezterm.GLOBAL.vim_key_mapping_enabled = wezterm.GLOBAL.vim_key_mapping_enabled or false

wezterm.on('toggle-vim-key-mapping', function(window, pane)
    wezterm.GLOBAL.vim_key_mapping_enabled = not wezterm.GLOBAL.vim_key_mapping_enabled
end)

local function add_vim_map(source_key, target_key)
    if source_key == source_key:lower() then
        add_vim_map(source_key:upper(), target_key:upper())
    end
    for _, mods in ipairs({ '', 'SUPER', 'CTRL', 'ALT', 'SUPER|CTRL', 'SUPER|ALT', 'CTRL|ALT', 'SUPER|CTRL|ALT' }) do
        table.insert(config.keys, {
            key = source_key,
            mods = mods,
            action = wezterm.action_callback(function(window, pane)
                if wezterm.GLOBAL.vim_key_mapping_enabled then
                    window:perform_action(act.SendKey { key = target_key, mods = mods }, pane)
                else
                    window:perform_action(act.SendKey { key = source_key, mods = mods }, pane)
                end
            end
            ),
        })
    end
end

add_vim_map('j', 'h')
add_vim_map('k', 'j')
add_vim_map('i', 'k')
add_vim_map('h', 'i')

return config
```

</details>

---

Use LazyIjkl

- Make a backup of your current Neovim files:

  ```sh
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  ```

- Clone the starter

  ```sh
  git clone https://github.com/ClanEver/LazyIjkl ~/.config/nvim
  ```

- Remove the `.git` folder, so you can add it to your own repo later

  ```sh
  rm -rf ~/.config/nvim/.git
  ```

- Start Neovim! (Don't forget to press the `ijkl` mapping shortcut in the terminal!)

  ```sh
  nvim
  ```

---

If you disable flash.nvim, please uncomment these lines in `~/.config/nvim/lua/config/keymaps.lua`.

```lua
    for _, find_key in ipairs({
      -- ↓↓↓ these lines
      -- "f",
      -- "F",
      -- "t",
      -- "T",
      -- ↑↑↑
      "r",
    }) do
```