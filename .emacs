;; Prototype for smali coloring for emacs
;;
;; Maintained by Tim Strazzere <strazz@gmail.com>
;;
;; Thanks to Jon Larimer <jlarimer@gmail.com> for the
;; vim syntax file, I lifted some things from it :)

(require 'generic-x)

(define-generic-mode
  'smali-mode
  ;; comment (fix later)
  '(
    ;; i use these as comments...
    "//"
    ;; true smali comments
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
   )

  ;; other things to colorize
  '(
    ;; namespaces
    (
     "L[a-zA-Z\/]+;" . font-lock-constant-face
    )
    ;; array types
    ;; non-array types
    (
     "[a-zA-Z]+\:\[+[B|V|Z|S|C|I|J|F|D]" . font-lock-constant-face
    )
    ;; registers, maybe parameters should be a different color?
    (
     "v[0-9]\\|p[0-9]" . font-lock-variable-name-face
    )
    ;; directives
    (
     ".class\\|.super\\|.proto\\|.implements\\|.field\\|.subannotation\\|.annotation\\|.enum\\|.method\\|.registers\\|.locals\\|.array-data\\|.packed-switch\\|.sparse-switch\\|.catch\\|.catchall\\|.line\\|.parameter\\|.local\\|.prologue\\|.epilogue\\|.source\\|\.end\s+\(field|subannotation|annotation|method|array-data)\\|\.end\s+\(packed-switch|sparse-switch|parameter|local)\\|\.restart\s+local" . font-lock-builtin-face
    )
    ;; access
    (
     "public\\|private\\|protected\\|static\\|final\\|synchronized\\|bridge\\|varargs\\|native\\|abstract\\|strictfp\\|synthetic\\|constructor\\|declared-synchronized\\|interface\\|enum\\|annotation\\|volatile\\|transient" . font-lock-builtin-face
    )
   )

  '(
    "\\.smali$"
   )

   nil

   "A mode for smali files"
)