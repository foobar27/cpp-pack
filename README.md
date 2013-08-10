## cpp-pack

An emacs-live pack for c++-development.

### Features

 * automatic configuration of flymake for c++ source and header files.
 * automatic detection of compile-flags for current file (via cmake's json format, )

### Install

Execute `make` in the directory `lib/emacs-clang-complete-async`.

In your `~/.emacs-live.el`, add this:

    (live-add-packs '("/path/to/cpp-pack"))

### Usage

In the base-directory of your project, you should set the
`CMAKE_EXPORT_COMPILE_COMMANDS` variable to `ON`. Currently only the
clang toolchain is supported.

    cd my-project
    mkdir build
    CC=/usr/bin/clang CXX=/usr/bin/clang++ cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

You should also create a file called `.dir-locals.el` in your project root with:

    ((nil . ((cmake-build-directory "/absolute/path/to/build-directory))))

## Configure

Basic flymake configuration:

    (add-hook 'find-file-hook 'flymake-find-file-hook)
    (setq flymake-no-changes-timeout 10)
    (setq flymake-gui-warnings-enabled nil)

Enable auto-complete globally

    (add-hook 'auto-complete-mode-hook 'ac-common-setup)

You can configure the following keybindings:

    (global-set-key [f3] 'flymake-display-err-menu-for-current-line)
    (global-set-key (kbd "C-`") 'flymake-goto-next-error)
    (global-set-key (kbd "C-~") 'flymake-goto-prev-error)
