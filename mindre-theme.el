```elisp
;;; mindre-theme.el --- Dark purple theme for Doom Emacs -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; A dark, minimal theme based on Mindre.
;;
;; Palette:
;;   Background: #141214
;;   Accent:     #B06FE5
;;
;; Designed for Doom Emacs and common Doom packages.
;;
;;; Code:

(deftheme mindre
  "A dark, minimal purple theme for Doom Emacs.")

(defgroup mindre nil
  "Mindre theme customization."
  :group 'faces)

;; ---------------------------------------------------------------------------
;; Palette
;; ---------------------------------------------------------------------------

(defconst mindre-colors
  '((bg          . "#141214")
    (bg-alt      . "#1C191E")
    (bg-active   . "#242026")
    (bg-raised   . "#2A252D")
    (bg-highlight . "#302B32")

    (fg          . "#E8E3EA")
    (fg-alt      . "#B9B1BE")
    (fg-dim      . "#8E8792")
    (fg-faint    . "#625B65")

    (black       . "#0D0B0E")
    (white       . "#F5F0F7")

    (purple      . "#B06FE5")
    (purple-light . "#C58AF0")
    (purple-dark . "#7E4FA5")
    (purple-bg   . "#2B1E35")

    (blue        . "#7C9FE8")
    (blue-light  . "#9CB8F0")
    (blue-bg     . "#20283A")

    (cyan        . "#70BFC0")
    (cyan-bg     . "#203234")

    (green       . "#63B89E")
    (green-light . "#79C99F")
    (green-bg    . "#1D302A")

    (yellow      . "#D4AD70")
    (yellow-bg   . "#332A1D")

    (orange      . "#D99A5B")
    (orange-bg   . "#35271D")

    (red         . "#E06C75")
    (red-light   . "#F08088")
    (red-bg      . "#382125")

    (border      . "#38323B")))

(defmacro mindre-with-colors (&rest body)
  "Evaluate BODY with theme colors available as variables."
  (declare (indent 0))
  `(let ,(mapcar (lambda (color)
                   `(,(car color) ,(cdr color)))
                 mindre-colors)
     ,@body))

;; ---------------------------------------------------------------------------
;; Custom faces
;; ---------------------------------------------------------------------------

(defface mindre-heading
  '((t (:inherit bold)))
  "Heading face used by Mindre."
  :group 'mindre)

(defface mindre-keyword
  '((t (:foreground "#B06FE5")))
  "Keyword face used by Mindre."
  :group 'mindre)

(defface mindre-type
  '((t (:foreground "#63B89E")))
  "Type face used by Mindre."
  :group 'mindre)

(defface mindre-string
  '((t (:foreground "#D4AD70")))
  "String face used by Mindre."
  :group 'mindre)

(defface mindre-comment
  '((t (:foreground "#625B65")))
  "Comment face used by Mindre."
  :group 'mindre)

(defface mindre-faded
  '((t (:foreground "#8E8792")))
  "Faded face used by Mindre."
  :group 'mindre)

;; ---------------------------------------------------------------------------
;; Faces
;; ---------------------------------------------------------------------------

(mindre-with-colors

  (custom-theme-set-faces
   'mindre

   ;; ------------------------------------------------------------------------
   ;; Basic
   ;; ------------------------------------------------------------------------

   `(default
     ((t (:background ,bg :foreground ,fg))))

   `(cursor
     ((t (:background ,purple :foreground ,bg))))

   `(region
     ((t (:background ,purple-bg :foreground ,fg))))

   `(highlight
     ((t (:background ,bg-highlight))))

   `(hl-line
     ((t (:background ,bg-alt))))

   `(fringe
     ((t (:background ,bg :foreground ,fg-faint))))

   `(vertical-border
     ((t (:foreground ,border))))

   `(window-divider
     ((t (:foreground ,border))))

   `(window-divider-first-pixel
     ((t (:foreground ,border))))

   `(window-divider-last-pixel
     ((t (:foreground ,border))))

   `(shadow
     ((t (:foreground ,fg-faint))))

   `(link
     ((t (:foreground ,blue-light :underline t))))

   `(button
     ((t (:foreground ,purple-light :underline t))))

   `(tooltip
     ((t (:background ,bg-raised
          :foreground ,fg))))

   ;; ------------------------------------------------------------------------
   ;; Typography
   ;; ------------------------------------------------------------------------

   `(bold
     ((t (:weight bold :foreground ,white))))

   `(italic
     ((t (:slant italic :foreground ,fg-alt))))

   `(bold-italic
     ((t (:weight bold :slant italic :foreground ,white))))

   ;; ------------------------------------------------------------------------
   ;; Mode line
   ;; ------------------------------------------------------------------------

   `(mode-line
     ((t (:background ,bg-active
          :foreground ,fg
          :box (:line-width 1 :color ,border)))))

   `(mode-line-inactive
     ((t (:background ,bg
          :foreground ,fg-faint
          :box (:line-width 1 :color ,border)))))

   `(mode-line-buffer-id
     ((t (:weight bold :foreground ,fg))))

   `(mode-line-emphasis
     ((t (:foreground ,purple-light :weight bold))))

   `(header-line
     ((t (:background ,bg-active
          :foreground ,fg
          :box nil))))

   ;; ------------------------------------------------------------------------
   ;; Font lock
   ;; ------------------------------------------------------------------------

   `(font-lock-comment-face
     ((t (:foreground ,fg-faint :slant italic))))

   `(font-lock-doc-face
     ((t (:foreground ,fg-dim))))

   `(font-lock-string-face
     ((t (:foreground ,yellow))))

   `(font-lock-constant-face
     ((t (:foreground ,purple-light))))

   `(font-lock-function-name-face
     ((t (:foreground ,blue-light :weight semibold))))

   `(font-lock-variable-name-face
     ((t (:foreground ,fg))))

   `(font-lock-builtin-face
     ((t (:foreground ,purple))))

   `(font-lock-type-face
     ((t (:foreground ,green))))

   `(font-lock-keyword-face
     ((t (:foreground ,purple :weight semibold))))

   `(font-lock-warning-face
     ((t (:foreground ,orange))))

   ;; ------------------------------------------------------------------------
   ;; Errors / warnings / success
   ;; ------------------------------------------------------------------------

   `(success
     ((t (:foreground ,green-light))))

   `(warning
     ((t (:foreground ,orange))))

   `(error
     ((t (:foreground ,red-light))))

   `(error-message
     ((t (:foreground ,red-light))))

   `(match
     ((t (:background ,purple-bg
          :foreground ,purple-light
          :weight bold))))

   `(isearch
     ((t (:background ,purple
          :foreground ,bg
          :weight bold))))

   `(isearch-fail
     ((t (:background ,red-bg
          :foreground ,red-light))))

   `(lazy-highlight
     ((t (:background ,bg-raised
          :foreground ,purple-light))))

   ;; ------------------------------------------------------------------------
   ;; Line numbers
   ;; ------------------------------------------------------------------------

   `(line-number
     ((t (:background ,bg
          :foreground ,fg-faint))))

   `(line-number-current-line
     ((t (:background ,bg-active
          :foreground ,fg
          :weight bold))))

   ;; ------------------------------------------------------------------------
   ;; Minibuffer / completion
   ;; ------------------------------------------------------------------------

   `(minibuffer-prompt
     ((t (:foreground ,purple-light
          :weight bold))))

   `(completions-annotations
     ((t (:foreground ,fg-faint))))

   `(completions-common-part
     ((t (:foreground ,purple-light
          :weight bold))))

   `(completions-first-difference
     ((t (:foreground ,orange
          :weight bold))))

   `(vertico-current
     ((t (:background ,purple-bg
          :foreground ,fg))))

   `(corfu
     ((t (:background ,bg-raised
          :foreground ,fg))))

   `(corfu-current
     ((t (:background ,purple
          :foreground ,bg
          :weight bold))))

   `(corfu-default
     ((t (:background ,bg-raised
          :foreground ,fg))))

   `(corfu-annotations
     ((t (:foreground ,fg-dim))))

   ;; ------------------------------------------------------------------------
   ;; Company
   ;; ------------------------------------------------------------------------

   `(company-tooltip
     ((t (:background ,bg-raised
          :foreground ,fg))))

   `(company-tooltip-selection
     ((t (:background ,purple-bg
          :foreground ,fg))))

   `(company-tooltip-common
     ((t (:foreground ,purple-light
          :weight bold))))

   `(company-tooltip-annotation
     ((t (:foreground ,fg-dim))))

   `(company-scrollbar-bg
     ((t (:background ,bg-alt))))

   `(company-scrollbar-fg
     ((t (:background ,purple-dark))))

   ;; ------------------------------------------------------------------------
   ;; Ivy / Consult
   ;; ------------------------------------------------------------------------

   `(ivy-current-match
     ((t (:background ,purple-bg
          :foreground ,fg
          :weight bold))))

   `(ivy-minibuffer-match-face-1
     ((t (:foreground ,purple-light))))

   `(ivy-minibuffer-match-face-2
     ((t (:foreground ,blue-light
          :weight bold))))

   `(ivy-minibuffer-match-face-3
     ((t (:foreground ,green-light
          :weight bold))))

   `(ivy-minibuffer-match-face-4
     ((t (:foreground ,yellow
          :weight bold))))

   `(consult-preview-match
     ((t (:background ,purple-bg
          :foreground ,purple-light))))

   ;; ------------------------------------------------------------------------
   ;; Search / navigation
   ;; ------------------------------------------------------------------------

   `(show-paren-match
     ((t (:background ,purple-bg
          :foreground ,purple-light
          :weight bold))))

   `(show-paren-mismatch
     ((t (:background ,red-bg
          :foreground ,red-light
          :weight bold))))

   `(trailing-whitespace
     ((t (:background ,red-bg))))

   ;; ------------------------------------------------------------------------
   ;; Diff / Git
   ;; ------------------------------------------------------------------------

   `(diff-added
     ((t (:background ,green-bg
          :foreground ,green-light))))

   `(diff-removed
     ((t (:background ,red-bg
          :foreground ,red-light))))

   `(diff-changed
     ((t (:background ,yellow-bg
          :foreground ,yellow))))

   `(diff-refine-added
     ((t (:background ,green
          :foreground ,bg))))

   `(diff-refine-removed
     ((t (:background ,red
          :foreground ,bg))))

   `(diff-header
     ((t (:foreground ,purple-light
          :weight bold))))

   `(diff-file-header
     ((t (:foreground ,fg
          :weight bold))))

   `(magit-section-heading
     ((t (:foreground ,purple-light
          :weight bold))))

   `(magit-section-highlight
     ((t (:background ,bg-alt))))

   `(magit-branch-local
     ((t (:foreground ,blue-light))))

   `(magit-branch-remote
     ((t (:foreground ,green-light))))

   `(magit-hash
     ((t (:foreground ,fg-faint))))

   `(magit-diff-added
     ((t (:background ,green-bg
          :foreground ,green-light))))

   `(magit-diff-removed
     ((t (:background ,red-bg
          :foreground ,red-light))))

   ;; ------------------------------------------------------------------------
   ;; Org
   ;; ------------------------------------------------------------------------

   `(org-document-title
     ((t (:foreground ,purple-light
          :weight bold
          :height 1.5))))

   `(org-level-1
     ((t (:foreground ,purple-light
          :weight bold
          :height 1.3))))

   `(org-level-2
     ((t (:foreground ,blue-light
          :weight bold
          :height 1.15))))

   `(org-level-3
     ((t (:foreground ,green-light
          :weight bold))))

   `(org-level-4
     ((t (:foreground ,yellow
          :weight bold))))

   `(org-level-5
     ((t (:foreground ,orange
          :weight bold))))

   `(org-level-6
     ((t (:foreground ,fg
          :weight bold))))

   `(org-level-7
     ((t (:foreground ,fg-alt
          :weight bold))))

   `(org-level-8
     ((t (:foreground ,fg-alt
          :weight bold))))

   `(org-block
     ((t (:background ,bg-alt
          :extend t))))

   `(org-block-begin-line
     ((t (:background ,bg-active
          :foreground ,fg-faint
          :extend t))))

   `(org-block-end-line
     ((t (:background ,bg-active
          :foreground ,fg-faint
          :extend t))))

   `(org-code
     ((t (:background ,bg-alt
          :foreground ,purple-light))))

   `(org-verbatim
     ((t (:background ,bg-alt
          :foreground ,yellow))))

   `(org-link
     ((t (:foreground ,blue-light
          :underline t))))

   `(org-todo
     ((t (:foreground ,purple-light
          :weight bold))))

   `(org-done
     ((t (:foreground ,green
          :weight bold))))

   `(org-warning
     ((t (:foreground ,orange
          :weight bold))))

   `(org-date
     ((t (:foreground ,blue-light
          :underline t))))

   `(org-tag
     ((t (:foreground ,fg-dim
          :weight normal))))

   `(org-table
     ((t (:foreground ,fg))))

   `(org-ellipsis
     ((t (:foreground ,fg-faint))))

   ;; ------------------------------------------------------------------------
   ;; Dired
   ;; ------------------------------------------------------------------------

   `(dired-directory
     ((t (:foreground ,purple-light
          :weight bold))))

   `(dired-header
     ((t (:foreground ,purple-light
          :weight bold))))

   `(dired-marked
     ((t (:foreground ,yellow
          :weight bold))))

   `(dired-flagged
     ((t (:foreground ,red-light
          :weight bold))))

   `(dired-symlink
     ((t (:foreground ,cyan
          :slant italic))))

   ;; ------------------------------------------------------------------------
   ;; Project / file navigation
   ;; ------------------------------------------------------------------------

   `(project-root
     ((t (:foreground ,purple-light
          :weight bold))))

   `(treemacs-root-face
     ((t (:foreground ,purple-light
          :weight bold))))

   `(treemacs-directory-face
     ((t (:foreground ,blue-light))))

   `(treemacs-file-face
     ((t (:foreground ,fg))))

   `(treemacs-git-modified-face
     ((t (:foreground ,yellow))))

   `(treemacs-git-added-face
     ((t (:foreground ,green))))

   `(treemacs-git-conflict-face
     ((t (:foreground ,red))))

   ;; ------------------------------------------------------------------------
   ;; Eglot / LSP
   ;; ------------------------------------------------------------------------

   `(eglot-highlight-symbol-face
     ((t (:background ,purple-bg
          :foreground ,purple-light))))

   `(lsp-face-highlight-textual
     ((t (:background ,purple-bg))))

   `(lsp-face-highlight-read
     ((t (:background ,purple-bg))))

   `(lsp-face-highlight-write
     ((t (:background ,purple-bg))))

   ;; ------------------------------------------------------------------------
   ;; Flycheck / Flymake
   ;; ------------------------------------------------------------------------

   `(flycheck-error
     ((t (:underline (:style wave :color ,red)))))

   `(flycheck-warning
     ((t (:underline (:style wave :color ,orange)))))

   `(flycheck-info
     ((t (:underline (:style wave :color ,green-light)))))

   `(flymake-error
     ((t (:underline (:style wave :color ,red)))))

   `(flymake-warning
     ((t (:underline (:style wave :color ,orange)))))

   `(flymake-note
     ((t (:underline (:style wave :color ,green-light)))))

   ;; ------------------------------------------------------------------------
   ;; Compilation
   ;; ------------------------------------------------------------------------

   `(compilation-error
     ((t (:foreground ,red-light))))

   `(compilation-warning
     ((t (:foreground ,orange))))

   `(compilation-info
     ((t (:foreground ,green-light))))

   ;; ------------------------------------------------------------------------
   ;; Ediff
   ;; ------------------------------------------------------------------------

   `(ediff-current-diff-A
     ((t (:background ,red-bg))))

   `(ediff-current-diff-B
     ((t (:background ,green-bg))))

   `(ediff-current-diff-C
     ((t (:background ,purple-bg))))

   `(ediff-fine-diff-A
     ((t (:background ,red))))

   `(ediff-fine-diff-B
     ((t (:background ,green))))

   `(ediff-fine-diff-C
     ((t (:background ,purple))))

   ;; ------------------------------------------------------------------------
   ;; Messages
   ;; ------------------------------------------------------------------------

   `(message-header-name
     ((t (:foreground ,purple-light
          :weight bold))))

   `(message-header-subject
     ((t (:foreground ,fg
          :weight bold))))

   `(message-cited-text
     ((t (:foreground ,fg-faint))))

   ;; ------------------------------------------------------------------------
   ;; Help / Info
   ;; ------------------------------------------------------------------------

   `(help-argument-name
     ((t (:foreground ,yellow))))

   `(help-key-binding
     ((t (:background ,bg-raised
          :foreground ,purple-light
          :weight bold))))

   `(Info-quoted
     ((t (:foreground ,yellow))))

   `(info-node
     ((t (:foreground ,purple-light
          :weight bold))))

   `(info-title-1
     ((t (:foreground ,purple-light
          :weight bold
          :height 1.4))))

   `(info-title-2
     ((t (:foreground ,blue-light
          :weight bold
          :height 1.2))))

   ;; ------------------------------------------------------------------------
   ;; Popup
   ;; ------------------------------------------------------------------------

   `(popup-face
     ((t (:background ,bg-raised
          :foreground ,fg))))

   `(popup-menu-selection-face
     ((t (:background ,purple-bg
          :foreground ,fg))))

   `(popup-menu-summary-face
     ((t (:foreground ,fg-dim))))

   ;; ------------------------------------------------------------------------
   ;; Terminal
   ;; ------------------------------------------------------------------------

   `(term-color-black
     ((t (:foreground ,fg-faint :background ,bg))))

   `(term-color-red
     ((t (:foreground ,red))))

   `(term-color-green
     ((t (:foreground ,green))))

   `(term-color-yellow
     ((t (:foreground ,yellow))))

   `(term-color-blue
     ((t (:foreground ,blue))))

   `(term-color-magenta
     ((t (:foreground ,purple))))

   `(term-color-cyan
     ((t (:foreground ,cyan))))

   `(term-color-white
     ((t (:foreground ,fg))))

   ;; ------------------------------------------------------------------------
   ;; Whitespace
   ;; ------------------------------------------------------------------------

   `(whitespace-space
     ((t (:foreground ,fg-faint))))

   `(whitespace-tab
     ((t (:foreground ,fg-faint))))

   `(whitespace-newline
     ((t (:foreground ,fg-faint))))

   `(whitespace-empty
     ((t (:background ,orange-bg))))

   ;; ------------------------------------------------------------------------
   ;; Rainbow delimiters
   ;; ------------------------------------------------------------------------

   `(rainbow-delimiters-depth-1-face
     ((t (:foreground ,purple-light))))

   `(rainbow-delimiters-depth-2-face
     ((t (:foreground ,blue-light))))

   `(rainbow-delimiters-depth-3-face
     ((t (:foreground ,green-light))))

   `(rainbow-delimiters-depth-4-face
     ((t (:foreground ,yellow))))

   `(rainbow-delimiters-depth-5-face
     ((t (:foreground ,orange))))

   `(rainbow-delimiters-depth-6-face
     ((t (:foreground ,red-light))))

   `(rainbow-delimiters-depth-7-face
     ((t (:foreground ,cyan))))

   `(rainbow-delimiters-depth-8-face
     ((t (:foreground ,purple))))

   `(rainbow-delimiters-depth-9-face
     ((t (:foreground ,blue))))

   `(rainbow-delimiters-depth-10-face
     ((t (:foreground ,green))))

   ;; ------------------------------------------------------------------------
   ;; Tabs
   ;; ------------------------------------------------------------------------

   `(tab-bar
     ((t (:background ,bg
          :foreground ,fg-dim))))

   `(tab-bar-tab
     ((t (:background ,bg-active
          :foreground ,fg
          :weight bold
          :box (:line-width 1 :color ,purple-dark)))))

   `(tab-bar-tab-inactive
     ((t (:background ,bg
          :foreground ,fg-faint))))

   `(tab-line
     ((t (:background ,bg
          :foreground ,fg-dim))))

   ;; ------------------------------------------------------------------------
   ;; Buttons
   ;; ------------------------------------------------------------------------

   `(custom-button
     ((t (:background ,bg-raised
          :foreground ,purple-light
          :box (:line-width 1 :color ,border)))))

   `(custom-button-mouse
     ((t (:background ,purple-bg
          :foreground ,purple-light))))

   `(custom-button-pressed
     ((t (:background ,purple
          :foreground ,bg))))

   ;; ------------------------------------------------------------------------
   ;; Eshell
   ;; ------------------------------------------------------------------------

   `(eshell-prompt
     ((t (:foreground ,purple-light
          :weight bold))))

   `(eshell-ls-directory
     ((t (:foreground ,blue-light
          :weight bold))))

   `(eshell-ls-executable
     ((t (:foreground ,green-light))))

   `(eshell-ls-symlink
     ((t (:foreground ,cyan
          :slant italic))))

   ;; ------------------------------------------------------------------------
   ;; Which-key
   ;; ------------------------------------------------------------------------

   `(which-key-key-face
     ((t (:foreground ,purple-light
          :weight bold))))

   `(which-key-command-description-face
     ((t (:foreground ,fg))))

   `(which-key-group-description-face
     ((t (:foreground ,blue-light))))

   ;; ------------------------------------------------------------------------
   ;; Doom modeline
   ;; ------------------------------------------------------------------------

   `(doom-modeline-bar
     ((t (:background ,purple))))

   `(doom-modeline-buffer-path
     ((t (:foreground ,fg
          :weight bold))))

   `(doom-modeline-buffer-modified
     ((t (:foreground ,orange
          :weight bold))))

   `(doom-modeline-buffer-major-mode
     ((t (:foreground ,purple-light
          :weight bold))))

   `(doom-modeline-project-dir
     ((t (:foreground ,blue-light
          :weight bold))))

   `(doom-modeline-info
     ((t (:foreground ,green-light))))

   `(doom-modeline-warning
     ((t (:foreground ,orange))))

   `(doom-modeline-urgent
     ((t (:foreground ,red-light
          :weight bold))))

   `(doom-modeline-evil-normal-state
     ((t (:foreground ,purple-light))))

   `(doom-modeline-evil-insert-state
     ((t (:foreground ,green-light))))

   `(doom-modeline-evil-visual-state
     ((t (:foreground ,yellow))))

   `(doom-modeline-evil-replace-state
     ((t (:foreground ,red-light))))))

;; ---------------------------------------------------------------------------
;; Lisp parentheses
;; ---------------------------------------------------------------------------

(defun mindre--font-lock-parens ()
  "Dim Lisp parentheses."
  (font-lock-add-keywords
   nil
   '(("(\\|)" . 'font-lock-comment-face))))

(defcustom mindre-faded-lisp-parens t
  "Whether Lisp parentheses should be dimmed."
  :type 'boolean
  :group 'mindre)

(when mindre-faded-lisp-parens
  (dolist (hook '(emacs-lisp-mode-hook
                  lisp-mode-hook
                  lisp-data-mode-hook
                  scheme-mode-hook))
    (add-hook hook #'mindre--font-lock-parens)))

(provide-theme 'mindre)

;;; mindre-theme.el ends here
```
