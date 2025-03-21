
Windows: Alarcritty setup



shell:
  program: "C:\\Program Files\\Git\\bin\\bash.exe"
  args:
    - --login
working_directory: "C:\\Users\\joett\\code"

cursor:
  style:
    shape: Block
    blinking: On

selection:
  save_to_clipboard: false

mouse:
  hide_when_typing: true

font:
  normal:
    family: FiraCode Nerd Font
    style: Regular
  bold:
    family: FiraCode Nerd Font
    style: Bold
  italic:
    family: FiraCode Nerd Font
    style: Italic
  bold_italic:
    family: FiraCode Nerd Font
    style: Bold Italic
  size: 25.0

window:
  startup_mode: Fullscreen
  decorations: none







**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
