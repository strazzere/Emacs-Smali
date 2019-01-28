;;; smali-mode.el --- Major mode for editing Smali/Baksmali files
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;; Filename: smali-mode.el
;; Description:
;; Author: Tim Strazzere <strazz@gmail.com> <diff@protonmail.com>
;; Maintainer:
;; Copyright (C) 2015-219, Tim Strazzere, all rights reserved.
;; Created:
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 0
;; URL:
;; Keywords: languages smali
;; Compatibility:
;;
;; Features that might be required by this library:
;;
;;   None
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change log:
;;
;;
;;; Code:

(require 'generic)

;;;###autoload
(define-generic-mode
  'smali-mode
  ;; comments
  '(
    ;; actual compilable smali comments
    "#"
    ;; personal branch compiles these, public branch won't so beware
    "//"
   )

  ;; keywords we can't or won't regex
  '(
     "goto" "nop" "return" "throw" "move" "const" "execute-inline" "array-length"
   )

  ;; everything we can regex (opcodes followed by the rest)
  '(
    ;; const opcodes with switches
    (
     "const\\(\/\\(4\\|16\\|32\\|high16\\)\\|-\\(clas\\(s\/jumbo\\|s\\)\\|wid\\(e\/\\(high16\\|16\\|32\\)\\|e\\)\\|strin\\(g\/jumbo\\|g\\)\\)\\)" . font-lock-keyword-face
    )
    ;; move opcodes with switches
    (
     "move\\(-\\(wid\\(e\/from16\\|e\/16\\|e\\)\\|objec\\(t\/from16\\|t\/16\\|t\\)\\|resul\\(t-\\(wide\\|object\\|exception\\)\\|t\\)\\|exception\\)\\|\/\\(16\\|from16\\)\\)" . font-lock-keyword-face
    )
    ;; goto opcodes with switches
    (
     "goto\/\\(16\\|32\\)" . font-lock-keyword-face
    )
    ;; get/put opcodes with switches
    (
     "\\(s\\|i\\|a\\)\\(get\\|put\\)-\\(wid\\(e-quick\\|e\/jumbo\\|e-volatile\/jumbo\\|e\\)\\|objec\\(t-quick\\|t-volatil\\|\\(e/jumbo\\|e\\)\\|t\\)\\|boolea\\(n\/jumbo\\|n\\)\\|byt\\(e\/jumbo\\|e\\)\\|cha\\(r\/jumbo\\|r\\)\\|shor\\(t\/jumbo\\|t\\)\\|quic\\(k\/jumbo\\|k\\)\\|volatile\/jumbo\\)" . font-lock-keyword-face
    )
    ;; get/put opcodes without switches
    (
     "\s\\(s\\|i\\|a\\)\\(get\\|put\\)" . font-lock-keyword-face
    )
    ;; return opcodes
    (
     "return-\\(voi\\(d-barrier\\|d\\)\\|wide\\|object\\)" . font-lock-keyword-face
    )
    ;; fill/ed opcodes
    (
     "fill\\(-array-data\\|ed-new-arra\\(y\/range\\|y\/jumbo\\|y\\)\\)" . font-lock-keyword-face
    )
    ;; new opcodes
    (
     "new-\\(arra\\(y\/jumbo\\|y\\)\\|instanc\\(e\/jumbo\\|e\\)\\)" . font-lock-keyword-face
    )
    ;; cast opcodes
    (
     "check-cas\\(t\/jumbo\\|t\\)" . font-lock-keyword-face
    )
    ;; instance-of opcodes
    (
     "instance-o\\(f\/jumbo\\|f\\)" . font-lock-keyword-face
    )
    ;; conditional statement, both positive and negative, opcodes
    (
     "if-\\(e\\(qz\\|q\\)\\|n\\(ez\\|e\\)\\|l\\(tz\\|ez\\|t\\|e\\)\\|g\\(tz\\|ez\\|t\\|e\\)\\)" . font-lock-keyword-face
    )
    ;; comparative statement opcodes
    (
     "cm\\(pl\\|pg\\|p\\)-\\(float\\|double\\|long\\)" . font-lock-keyword-face
    )
    ;; int/long/double/float operator opcodes with switches
    (
     "\\(add\\|sub\\|rsub\\|mul\\|div\\|rem\\|and\\|or\\|xor\\|shl\\|shr\\|ushr\\)-\\(int\\|long\\|float\\|double\\)\/\\(2addr\\|lit\\(8\\|16\\)\\)" . font-lock-keyword-face
    )
    ;; int/long/double/float operator opcodes without switches
    (
     "\\(add\\|sub\\|rsub\\|mul\\|div\\|rem\\|and\\|or\\|xor\\|shl\\|shr\\|ushr\\)-\\(int\\|long\\|float\\|double\\)"  . font-lock-keyword-face
    )
    ;; to (transformation) opcodes
    (
     "\\(int\\|long\\|float\\|double\\)-to-\\(int\\|long\\|float\\|double\\|char\\|byte\\|short\\)" . font-lock-keyword-face
    )
    ;; invoke opcodes
    (
     "invoke-\\(direc\\(t-empty\\|t\/range\\|t\/jumbo\\|t\\)\\|objec\\(t-ini\\(t\/jumbo\\|t\/range\\)\\|t\/jumbo\\)\\|stati\\(c\/range\\|j\/jumbo\\|c\\)\\|interfac\\(e\/range\\|e\/jumbo\\|e\\)\\|virtua\\(l-quic\\(k\/range\\|k\\)\\|l\/range\\|l\/jumbo\\|l\\)\\|supe\\(r-quic\\(k\/range\\|k\\)\\|r\/range\\|r\/jumbo\\|r\\)\\)" . font-lock-keyword-face
    )
    ;; monitor op-codes
    (
     "monitor-\\(enter\\|exit\\)" . font-lock-keyword-face
    )
    ;; negative and not opcodes
    (
     "\\(neg\\|not\\)-\\(int\\|long\\|float\\|double\\)" . font-lock-keyword-face
    )

    ;;
    ;; everything else to colorize
    ;;

    ;; namespaces
    (
     "\[L[a-zA-Z\/0-9\_\\$]+;\\|L[a-zA-Z\/0-9\_\\$]+;" . font-lock-constant-face
    )
    ;; directives
    (
     "\\.\\(locals\\|local\\|class\\|super\\|implements\\|field\\|subannotation\\|annotation\\|enum\\|method\\|registers\\|array-data\\|packed-switch\\|sparse-switch\\|parameter\\|param\\|prologue\\|epilogue\\|source\\|restart\slocal\\|end\s\\(field\\|subannotation\\|annotation\\|method\\|array-data\\|packed-switch\\|sparse-switch\\|parameter\\|local\\)\\)" . font-lock-builtin-face
    )
    ;;packed switch opcodes need to be below this to properly work
    (
     "\\(packed\\|sparse\\)-switch" . font-lock-keyword-face
    )
    ;; tags
    (
     "\\(\\.\\|:\\)\\(\\(catc\\(h[0-9a-z\_]+\\|h\\)\\)\\|line\\|goto_[0-9a-z]+\\|cond_[0-9a-z]+\\|try[0-9a-z\_]+\\|\\(s\\|p\\)switch\\(_data_\\|_\\)[0-9a-z]+\\|array\\(_data_\\|_\\)[0-9a-z]+\\)" . font-lock-doc-face
    )
    ;; argument/line/hex numbers
    (
     "\s\\(\\(-0\\|0\\)x[0-9a-ftsL]+\\|[0-9]+\\)" . font-lock-constant-face
    )
    ;; annotations
    (
     "\\(accessFlags\\|name\\|values\\|system\\)\s" . font-lock-variable-name-face
    )
    ;; access
    (
     "\\(public\\|private\\|protected\\|static\\|final\\|synchronized\\|bridge\\|varargs\\|native\\|abstract\\|strictfp\\|synthetic\\|constructor\\|declared-synchronized\\|interface\\|enum\\|annotation\\|volatile\\|transient\\)\s" . font-lock-builtin-face
    )
    ;; random things to color before others function
    (
     "\-\>\\|=\\|\{\\|\}\\|\s..\s\\|,\\|:" . font-lock-keyword-face
    )
    ;; functions
    (
     "\<\\(clinit\\|init\\)\>\\|[\_a-zA-Z\$0-9]+\(\\|\(\\|\)" . font-lock-function-name-face
    )
    ;; odex specific functions, vtable/field lookups, inlines
    (
     "\\(vtable\\|field\\|inline\\)\@[0-9a-zA-Z]+" . font-lock-function-name-face
    )
    ;; instance field names
    (
     "\s\\([a-zA-Z0-9\$\_\-]+\\)" . font-lock-variable-name-face
    )
    ;; array/non-array qualified types including return values and parameters
    (
     "\\[+[BVZSCIJFD]" . font-lock-variable-name-face
    )
    ;; member variables, registers and parameters
    (
     "[a-zA-Z0-9\$\_\-]+" . font-lock-variable-name-face
    )
    ;; const-strings
    (
     "\\"[*]+\\"" . font-lock-string-face
    )
    ;; boolean values
    (
     "true" . font-lock-variable-name-face
    )
   )

  '(
    "\\.smali$"
   )

  (list
   (function
    (lambda ()
      (setq imenu-generic-expression
	    '(("Method" "^\\.method.* \\(.*\\)(" 1)
	      ("Annotation" "^\\.annotation.* \\(.*\\);$" 1)
	      ("Field" "^\\.field.* \\([^ :]+\\)[:;]" 1)
	      ))
      (set-syntax-table
       (let ((table (make-syntax-table)))
	 (modify-syntax-entry ?< "." table)
	 (modify-syntax-entry ?> "." table)
	 table))
      )))

   "A mode for smali files"
)

(add-to-list 'auto-mode-alist '(".smali$" . smali-mode))

(provide 'smali-mode)
;;; smali-mode.el ends here
