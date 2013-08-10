(require 'auto-complete-clang-async)

(defun cmake--splice (LIST OFFSET LENGTH)
  (butlast (nthcdr OFFSET LIST)
           (- (length LIST) LENGTH OFFSET)))

(defun flymake-cmake-cpp-init ()
  (let ((compile-commands (cmake-get-compile-commands-for-current-file)))
    (if compile-commands
        (let* ((compile-file (gethash "file" compile-commands))
               (compile-directory (gethash "directory" compile-commands))
               (compile-flags (mapconcat 'identity (cdr (butlast (split-string (gethash "command" compile-commands) " "))) " "))
               (temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
               (old-ac-flags ac-clang-cflags))
          (progn
            (setq ac-clang-cflags compile-flags)
            (if (not (eq old-ac-cflags compile-flags))
                (ac-clang-update-cmdlineargs))
            (list "/usr/bin/clang++"
                  `("-fsyntax-only"
                    "-fno-color-diagnostics"
                    ,@(split-string compile-flags " ")
                    ,temp-file)))))))

(setq flymake-allowed-file-name-masks
      (cons '(".+\\.cpp$"
	      flymake-cmake-cpp-init
;;	      flymake-simple-cleanup
;;	      flymake-get-real-file-name
              )
	    flymake-allowed-file-name-masks))
