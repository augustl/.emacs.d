This file exists because I can't seem to remember useful stuff.

- `M-x` - run commands with Vertico list + Orderless matching + Marginalia annotations.
- `C-x C-f` - open file with modern completion UI.
- `C-x b` - switch buffers with modern completion UI.
- `TAB` - complete current minibuffer input.
- `C-j` - accept current candidate (common Vertico flow).
- `C-n` / `C-p` - move to next/previous candidate.
- `M-<` / `M->` - jump to first/last candidate.

- `C-c s l` - `consult-line`: search current buffer with live jump preview.
- `C-c s r` - `consult-ripgrep`: search current project with ripgrep and preview.
- `M-y` - `consult-yank-pop`: browse kill-ring entries before inserting.
- `M-x consult-buffer` - unified buffer/recent file switcher.
- `M-x consult-imenu` - jump to symbols/headings in current buffer.
- `M-x consult-goto-line` - preview while choosing a line.

## Project-oriented commands

- `C-x p f` - `project-find-file`: find file in current project.
- `C-x p p` - `project-switch-project`: jump between known projects.
- `C-x p b` - `project-switch-to-buffer`: switch buffer within current project.
- `C-x p g` - `project-find-regexp`: grep in current project.
- `C-x p d` - `project-dired`: open project root in dired.


## Helpful built-ins you may have missed

- `C-x C-r` - open file read-only.
- `M-g g` - go to line.
- `M-s o` - `occur` (all matches in current buffer).
- `M-s r` - `isearch-backward-regexp`.
- `C-h f` / `C-h v` / `C-h k` - describe function/variable/key.
- `C-h m` - show active modes and local keybindings.
- `C-h b` - list all keybindings.

## The modules that now replace ido

- `vertico` = candidate list UI in minibuffer.
- `orderless` = flexible multi-part matching.
- `marginalia` = extra context in candidate lists.
- `consult` = better search/navigation commands.
