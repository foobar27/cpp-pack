;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config

(live-add-pack-lib "vendor/emacs-clang-complete-async")

(live-load-config-file "cmake-json-parser.el")
(live-load-config-file "ac-config.el")
(live-load-config-file "flymake-config.el")
