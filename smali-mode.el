;; Schema for smali coloring for emacs
;;
;; Maintained by Tim Strazzere <strazz@gmail.com> <diff@lookout.com>
;;
;; Thanks to Jon Larimer <jlarimer@gmail.com> for the
;; vim syntax file, I lifted some things from it :)

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

  ;; keywords
  '(
     "goto" "return-void" "nop" "const/4" "move-result" "move-result-wide"
     "move-result-object" "move-exception" "return" "return-wide"
     "return-object" "monitor-enter" "monitor-exit" "throw" "move"
     "move-wide" "move-object" "array-length" "neg-int" "not-int" "neg-long"
     "not-long" "neg-float" "neg-double" "int-to-long" "int-to-float"
     "int-to-double" "long-to-int" "long-to-float" "long-to-double"
     "float-to-int" "float-to-long" "float-to-double" "double-to-int"
     "double-to-long" "double-to-float" "int-to-byte" "int-to-char"
     "int-to-short" "add-int/2addr" "sub-int/2addr" "mul-int/2addr"
     "div-int/2addr" "rem-int/2addr" "and-int/2addr" "or-int/2addr"
     "xor-int/2addr" "shl-int/2addr" "shr-int/2addr" "ushr-int/2addr"
     "add-long/2addr" "sub-long/2addr" "mul-long/2addr" "div-long/2addr"
     "rem-long/2addr" "and-long/2addr" "or-long/2addr" "xor-long/2addr"
     "shl-long/2addr" "shr-long/2addr" "ushr-long/2addr" "add-float/2addr"
     "sub-float/2addr" "mul-float/2addr" "div-float/2addr" "rem-float/2addr"
     "add-double/2addr" "sub-double/2addr" "mul-double/2addr"
     "div-double/2addr" "rem-double/2addr" "goto/16" "sget" "sget-wide"
     "sget-object" "sget-boolean" "sget-byte" "sget-char" "sget-short" "sput"
     "sput-wide" "sput-object" "sput-boolean" "sput-byte" "sput-char" "sput-short"
     "const-string" "check-cast" "new-instance" "const-class" "const/high16"
     "const-wide/high16" "const/16" "const-wide/16" "if-eqz" "if-nez" "if-ltz"
     "if-gez" "if-gtz" "if-lez" "add-int/lit8" "rsub-int/lit8" "mul-int/lit8"
     "div-int/lit8" "rem-int/lit8" "and-int/lit8" "or-int/lit8" "xor-int/lit8"
     "shl-int/lit8" "shr-int/lit8" "ushr-int/lit8" "iget" "iget-wide" "iget-object"
     "iget-boolean" "iget-byte" "iget-char" "iget-short" "iput" "iput-wide" "iput-object"
     "iput-boolean" "iput-byte" "iput-char" "iput-short" "instance-of" "new-array"
     "iget-quick" "iget-wide-quick" "iget-object-quick" "iput-quick"
     "iput-wide-quick" "iput-object-quick" "rsub-int" "add-int/lit16" "mul-int/lit16"
     "div-int/lit16" "rem-int/lit16" "and-int/lit16" "or-int/lit16" "xor-int/lit16"
     "if-eq" "if-ne" "if-lt" "if-ge" "if-gt" "if-le" "move/from16" "move-wide/from16"
     "move-object/from16" "cmpl-float" "cmpg-float" "cmpl-double" "cmpg-double"
     "cmp-long" "aget" "aget-wide" "aget-object" "aget-boolean" "aget-byte" "aget-char"
     "aget-short" "aput" "aput-wide" "aput-object" "aput-boolean" "aput-byte" "aput-char"
     "aput-short" "add-int" "sub-int" "mul-int" "div-int" "rem-int" "and-int" "or-int"
     "xor-int" "shl-int" "shr-int" "ushr-int" "add-long" "sub-long" "mul-long" "div-long"
     "rem-long" "and-long" "or-long" "xor-long" "shl-long" "shr-long" "ushr-long"
     "add-float" "sub-float" "mul-float" "div-float" "rem-float" "add-double"
     "sub-double" "mul-double" "div-double" "rem-double" "goto/32" "const-string/jumbo"
     "const" "const-wide/32" "fill-array-data" "packed-switch" "sparse-switch" "move/16"
     "move-wide/16" "move-object/16" "invoke-virtual" "invoke-super" "invoke-direct"
     "invoke-static" "invoke-interface" "filled-new-array" "invoke-direct-empty"
     "execute-inline" "invoke-virtual-quick" "invoke-super-quick"
     "invoke-virtual/range" "invoke-super/range" "invoke-direct/range"
     "invoke-static/range" "invoke-interface/range" "filled-new-array/range"
     "invoke-virtual-quick/range" "invoke-super-quick/range" "const-wide"
     "iput-object-volatile" "sget-object-volatile" "sput-object-volatile"
     "const-class/jumbo" "check-cast/jumbo" "instance-of/jumbo" "new-instance/jumbo"
     "new-array/jumbo" "filled-new-array/jumbo" "iget/jumbo" "iget-object/jumbo"
     "iget-boolean/jumbo" "iget-byte/jumbo" "iget-char/jumbo" "iget-short/jumbo"
     "iput-wide/jumbo" "iput-object/jumbo" "iput-boolean/jumbo" "iput-byte/jumbo"
     "iput-char/jumbo" "iput-short/jumbo" "sget/jumbo" "sget-wide/jumbo" "sget-object/jumbo"
     "sget-boolean/jumbo" "sget-byte/jumbo" "sget-char/jumbo" "sget-short/jumbo"
     "sput/jumbo" "sput-wide/jumbo" "sput-object/jumbo" "sput-boolean/jumbo"
     "sput-byte/jumbo" "sput-char/jumbo" "sput-short/jumbo" "invoke-virtual/jumbo"
     "invoke-virtual/jumbo" "invoke-super/jumbo" "invoke-direct/jumbo" "invoke-static/jumbo"
     "invoke-interface/jumbo" "invoke-object/jumbo" "invoke-object-init/jumbo"
     "iget-volatile/jumbo" "iget-wide-volatile/jumbo" "iget-object-volatile/jumbo"
     "iput-volatile/jumbo" "iput-wide-volatile/jumbo" "iput-object-volatile/jumbo"
     "sget-volatile/jumbo" "sget-wide-volatile/jumbo" "sget-object-volatile/jumbo"
     "sput-volatile/jumbo" "sput-wide-volatile/jumbo" "sput-object-volatile/jumbo"
   )

  ;; other things to colorize
  '(
    ;; namespaces
    (
     "L[a-zA-Z\/0-9\_\\$]+;\\|\[L[a-zA-Z\/0-9\_\\$]+;" . font-lock-constant-face
    )
    ;; array/non-array qualified types including return values and parameters
    (
     "\\[+[BVZSCIJFD]" . font-lock-constant-face
    )
    ;; registers, maybe parameters should be a different color?
    (
     "v[0-9]+\\|p[0-9]+" . font-lock-variable-name-face
    )
    ;; directives
    (
     ".locals|\\.local\\|.end\s\\(field\\|subannotation\\|annotation\\|method\\|array-data\\|packed-switch\\|sparse-switch\\|parameter\\|local\\)\\|.class\\|.super\\|.proto\\|.implements\\|.field\\|.subannotation\\|.annotation\\|.enum\\|.method\\|.registers\s+[0-9]+\\|.array-data\\|.packed-switch\\|.sparse-switch\\|.parameter\\|.prologue\\|.epilogue\\|.source\\|.restart\slocal" . font-lock-builtin-face
    )
    ;; tags
    (
     ".catchall_[0-9a-z]+\\|.catchall\\|.catch_[0-9a-z]+\\|.catch\\|.line\s+[0-9]+\\|:goto_[0-9a-z]+\\|:cond_[0-9a-z]+\\|:try_start_[0-9a-z]+\\|:try_end_[0-9a-z]+\\|.sswitch_data_[0-9a-z]+\\|:sswitch_[0-9a-z]+" . font-lock-doc-face
    )
    ;; annotations
    (
     "accessFlags\s\\|name\s\\|values\s\\|system\s" . font-lock-variable-name-face
    )
    ;; access
    (
     "public \\|private \\|protected \\|static \\|final \\|synchronized \\|bridge \\|varargs \\|native \\|abstract \\|strictfp \\|synthetic \\|constructor \\|declared-synchronized \\|interface \\|enum \\|annotation \\|volatile \\|transient " . font-lock-builtin-face
    )
    ;; random things to color before others function
    (
     "\-\>\\|=\\|\{\\|\}\\|\s..\s\\|,\\|:" . font-lock-keyword-face
    )
    ;; functions
    (
     "<[a-zA-Z]+\>\\|\<clinit\>\\|\<init\>\\|[a-zA-Z\$0-9]+\(\\|\(\\|\)" . font-lock-function-name-face
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
