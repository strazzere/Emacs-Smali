;; Schema for smali coloring for emacs
;;
;; Maintained by Tim Strazzere <strazz@gmail.com> <diff@lookout.com>
;;
;; Originally take from the vim template by Jon Larimer <jlarimer@gmail.com>
;; However, as of 09.20.2013 I don't think any of the original bits are even
;; in here.
;; 

(require 'generic)

(define-generic-mode
  'smali-mode
  ;; comments
  '(
    ;; personal branch compiles these, public branch won't so beware
    "//"
    ;; actual compilable smali comments
    "#"
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
     "\s\\(\\(-0\\|0\\)x[0-9a-ftL]+\\|[0-9]+\\)" . font-lock-constant-face
    )
    ;; annotations
    (
     "\\(accessFlags\\|name\\|values\\|system\\)\s" . font-lock-variable-name-face
    )
    ;; access
    (
     "\s\\(public\\|private\\|protected\\|static\\|final\\|synchronized\\|bridge\\|varargs\\|native\s\\|abstract\\|strictfp\\|synthetic\\|constructor\\|declared-synchronized\\|interface\\|enum\\|annotation\\|volatile\\|transient\\)" . font-lock-builtin-face
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
    ;; registers and parameters
    (
     "v[0-9]+\\|p[0-9]+" . font-lock-variable-name-face
    )
    ;; instance field names
    (
     "\s\\([a-zA-Z0-9\$\_\-]+\\)" . font-lock-variable-name-face
    )
    ;; array/non-array qualified types including return values and parameters
    (
     "\\[+[BVZSCIJFD]" . font-lock-variable-name-face
;;"\\[+[BVZSCIJFD]\\|[BVZSCIJFD]" . font-lock-variable-name-face
    )
    ;; member variables
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

   nil

   "A mode for smali files"
)

(provide 'smali-mode)
