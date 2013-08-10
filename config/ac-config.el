(require 'auto-complete-clang-async)

(setq the-ac-clang-executable (expand-file-name "vendor/emacs-clang-complete-async/clang-complete" (live-pack-lib-dir)))

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable the-ac-clang-executable)
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process))

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup))

(my-ac-config)
