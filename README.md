# vim-development

After some years I decided to split up my personal configuration into individual
plugins, so they might be shared and maintained easier. This is the development
portion: source code settings for the Vim editor.

When a buffer whose filetype is listed in `g:code_filetypes` (C, C++, Go,
Haskell, Python, JavaScript, Rust, Lua, Vim, YAML, and many more) is opened,
the plugin sets it up for code editing.

## Features

- **Code file setup** — for every supported filetype:
  - `cursorline` enabled
  - `tabstop`, `shiftwidth` and `softtabstop` set to `b:code_indent` (2 by default)
  - The margin — the region beyond `textwidth` — highlighted with the `ErrorMsg`
    color (toggle with `<Leader>tm`)
  - `formatoptions` set to `croqj` for comment-aware editing
  - `expandtab`, so source code contains no tabs
  - `numberwidth` set to 6
- **Per-language tweaks** via ftplugins:
  - *Python*: 4-space indentation, single/double quote docstring expansion,
    `:BreakPoint` / `:UnbreakPoint` commands (pdb, ipdb, or bpdb), and
    `:make` runs `flake8` unless a `Makefile` exists
  - *Java*: 2-space indentation with a 120-column margin
  - *Make*: real tabs preserved (`noexpandtab`, 4-space width)
- **Quickfix integration**: in the quickfix window, `<F8>` jumps to the test
  failure under the cursor (e.g. Python unittest output) in a vertical split
- **CTags integration**: regenerates the `tags` file on every buffer write
  whenever one already exists (excludes `env`, `.venv` and `node_modules`)
- `.ts` files get the `typescript` filetype automatically

## Requirements

- Vim 7.3 or newer (relative number toggling requires it)
- [ctags](http://ctags.sourceforge.net/) (exuberant-ctags or universal-ctags),
  only for the tags integration

## Installation

Install it like any other plugin; I recommend using the plugin manager of your
choice. For example, with `plug.vim`, add to your `$HOME/.vimrc`:

```vim
call plug#begin()
" other plugins...
Plug 'diacus/vim-development'
" other plugins...
call plug#end()
```

## Mappings

| Mapping      | Action                                                                    |
| ------------ | ------------------------------------------------------------------------- |
| `<Leader>tn` | Toggle line numbering (relative numbering follows, on Vim ≥ 7.3)          |
| `<Leader>tl` | Toggle `cursorline` (turns `cursorcolumn` off first, if set)              |
| `<Leader>tx` | Toggle the cursor cross: `cursorline` and `cursorcolumn` at once          |
| `<Leader>tm` | Toggle the margin highlight beyond `textwidth`                            |

## Commands

| Command         | Buffer    | Action                                                              |
| --------------- | --------- | ------------------------------------------------------------------- |
| `:InsertDate`   | any       | Replace the tail of the current line, from the first `:` on, with the current date and time |
| `:CreateTags`   | code      | Generate the `tags` file of the current working directory in the background |
| `:BreakPoint`   | Python    | Insert a debugger breakpoint (`pdb`/`ipdb`/`bpdb` + a `print()` marker) above the cursor |
| `:UnbreakPoint` | Python    | Delete every breakpoint inserted with `:BreakPoint`                 |

Note: the mappings use `<Leader>`; the plugin does not set it, so configure it
in your `.vimrc` if you want a custom one, e.g. `let mapleader = " "`.

## Configuration

| Variable           | Scope  | Description                                                        |
| ------------------ | ------ | ------------------------------------------------------------------ |
| `b:code_indent`    | buffer | Number of spaces used for indentation (default: 2; the Python ftplugin sets it to 4) |
| `g:code_filetypes` | global | List of filetypes the setup is applied to; extend it in your `.vimrc`, e.g. `let g:code_filetypes += ['fsharp']` |
| `g:use_bpython`    | global | Set to 1 to make `:BreakPoint` insert `bpdb` breakpoints            |
| `g:use_ipython`    | global | Set to 1 to make `:BreakPoint` insert `ipdb` breakpoints            |

## Documentation

The full documentation, following the Vim help conventions, is available at
`doc/development.txt`:

```vim
:help development.vim
```