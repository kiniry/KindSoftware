;; The following elisp code expressions can be added to your .emacs or
;; .xemacs/init.el startup file to institute the KindSoftware code
;; standards (except the brackets for every block of code in a conditional
;; or loop) automatically.  Note that, in fact, it is actually much safer
;; just to take someone's working .emacs file and customize it for
;; yourself.  This way, subtle dependencies in the setup are handled.

;; This file was last updated by Joe Kiniry <kiniry@kindsoftware.com> on
;; August 5, 2001.

;; Indents are in blocks of two spaces
(setq-default c-basic-offset 2)

;; make sure we don't use tabs in indents
(setq-default indent-tabs-mode nil)

(cond ((or (string-match "4." c-version)
           (string-match "5." c-version))

       ;; Setup for CC-mode version 4 and above.

       ;; Set up indention for programming in C, C++, Objective C, and
       ;; Java

       (defun c-lineup-javadoc-comments (langelem)
         ;; Define a new custom indentation function for handling
         ;; Javadoc comments.  Line up all first *'s.  First create a
         ;; new context so the point, mark, and current buffer are not
         ;; munged, even in the case of abnormal exit.
         (save-excursion
           ;; goto the point that is defining our indention depth
           (goto-char (cdr langelem))
           ;; is it the first line of a javadoc comment?
           (if (looking-at "/\\*")
               ;; yes! so return a 1
               1
               0)))

       ;; We define a new CC-mode style for our group's code standards.
       ;; We'll call this style "caltech-java".
       (defconst caltech-java-style
           '((c-basic-offset . 2)
             (c-comment-only-line-offset . (0 . 0))
             (c-offsets-alist . 
              ((access-label          . 0)
               (arglist-close         . c-lineup-arglist)
               (arglist-intro         . c-lineup-arglist-intro-after-paren)
               (c                     . c-lineup-javadoc-comments)
               (case-label            . +)
               (inher-cont            . c-lineup-java-inher)
               (inline-open           . 0)
               (knr-argdecl-intro     . 5)
               (label                 . +)
               (statement-case-open   . +)
               (statement-cont        . 0)
               (substatement-open     . 0)
               (statement-block-intro . +)
               (topmost-intro-cont    . +)))))

       ;; Customizations for all c-mode, c++-mode, objc-mode, and java-mode.
       
       (defun kindsoftware-java-mode-hook ()
         "Hooking in the KindSoftware code standard
for CC-mode version 4 and turning on cc mode's minor modes."
         ;; Add kindsoftware-java style and set it for the current buffer.
         (c-add-style "kindsoftware-java" kindsoftware-java-style t)
         ;; Add any user-specific customizations here (should be none).
         ;;
         ;; CC Mode has two minor modes; auto-newline and hungry-delete.
         ;; If you don't like the behavior of either of these minor modes,
         ;; comment out the following expression.  More information on
         ;; these minor modes is available in the CC Mode info pages.
         (c-toggle-auto-hungry-state 1)

         ;; Keybindings for all supported languages can be added here.
         ;; We can put these in c-mode-map because all the other maps
         ;; inherit from it.  We put several keybindings in here for
         ;; OO-Browser functionality.  This is nice for completion of
         ;; class names, jumping to code, etc.

         (define-key c-mode-map "\C-c\C-f" 'br-find)
         (define-key c-mode-map "\C-\M-i" 'br-complete-type)
         (define-key c-mode-map "\C-c\C-w" 'br-class-path)
         ;; (define-key c-mode-map <KEY> <FUNC>)

         ;; Show current line number in modeline when programming.
         (line-number-mode 1)
         )
       
       ;; Add hook to Java mode to start everything up everytime we
       ;; enter a Java buffer.
       (add-hook 'java-mode-hook 'kindsoftware-java-mode-hook))
      
      ((string-match "3." c-version)
       ;; Customization for CC-mode version 3.
       ))
