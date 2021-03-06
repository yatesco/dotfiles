;;; cy-yasnippets.el --- Stop typing, start expanding templates

;; Copyright © 2011-2017 Colin Yates
;;
;; Author: Colin Yates
;; URL: https://colinyates.co.uk
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Save time, expand templates!

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(use-package yasnippet
  :diminish 'yas-minor-mode
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.d/my-snippets" ;; my own snippets
	  "~/.emacs.d/vendor-snippets" ;; vendor snippets, if any
	  ))
  :config
  (yas-global-mode 1))

(provide 'cy-yasnippets)

;;; cy-yasnippets.el ends here
