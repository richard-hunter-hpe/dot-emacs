# Dot Emacs

## Known Issues

- early init is a bit futzy, have to comment out the loading of it in main el file
- loading lsp and flycheck is a bit hacky, runs twice for the first file in a project
- add-node-modules path only works on gui, or if using emacsclient in term
- tab bar face doesn't persist when switching themes
- lsp and javascript-eslint flycheck stuff seem to conflict a bit in lsp-ui
- find references sometimes works, sometimes doesnt
- dap-mode is completely broken
- [X] vterm has trouble loading from clean install... why?
  - https://github.com/radian-software/straight.el/issues/891
  
- vterm-toggle wont attach to keyboard map of vterm
- strange eslint errors here and there
- 
