(require 'f)
(require 's)
(require 'dash)
(require 'el-mock)


(defvar bump-version-test/test-path
  (if (null load-file-name)
      (f-dirname (buffer-file-name))
    (f-dirname load-file-name)))

(defvar bump-version-test/fixtures-path
  (f-expand "fixtures" bump-version-test/test-path))

(defvar bump-version-test/config-fixtures-path
  (f-expand "configs" bump-version-test/fixtures-path))

(defvar bump-version-test/root-path
  (f-parent bump-version-test/test-path))

(setq debug-on-entry t)
(setq debug-on-error t)

(add-to-list 'load-path bump-version-test/root-path)

(require 'bump-version
         (f-expand "bump-version"
                   bump-version-test/root-path))

(defun load-fixture-config ()
  (with-temp-buffer
    (insert-file-contents (concat bump-version-test/config-fixtures-path "/"
                                  bump-version-config-file))
    (read (buffer-string))))
