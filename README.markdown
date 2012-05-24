#Smali/Baksmali mode for Emacs#

##Overview##
Quickly through this together after seeing all the VIM smali syntax variantions.
I couldn't find one for emacs - and well, that's the editor I prefer so I mashed
this up. It's probably a really bad hack, but I've never made a mode for emacs,
currently I just used the default profile to load this in, feel free to commit and
make this better. Not everything is completed, but it's done enough to make reading
smali code much better already.

Enjoy!

Tim Strazzere
strazz@gmail.com



##INSTALL##
===
Copy into your .emacs.d file in your home dir, if you don't have one, rename file to ~/.emacs.d
Load up a .smali file and enjoy!

An example of such code:

    (add-to-list 'load-path "~/.emacs.d/includes")
    ; load the smali/baksmali mode
    (autoload 'smali-mode "smali-mode" "Major mode for editing and viewing smali issues" t)
    (setq auto-mode-alist (cons '(".smali$" . smali-mode) auto-mode-alist))

##NOTES##
===
I personally use "//" comments, though these will not recompile in the publicly released
baksmali/smali packages.