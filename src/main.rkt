#lang racket/gui

;(require "text_editor.rkt")
;(require "canvas.rkt")

(require "tofu_parser.rkt")

(define openfilename #f)
(define (setopenfile filename)
  (set! openfilename filename))

; Top-level window
(define main_frame (new frame% [label "Untitled - ToFu"]
                               [width 1600] [height 800]))


; Add menus and shortcuts

; Configure the General Interface
(define hpanel (new horizontal-panel% [parent main_frame]))

; Configure the Text-Editor
(define c (new editor-canvas% [parent hpanel]))
(define t (new text%))
(send c set-editor t)

; Configure the Canvas
(define b (new canvas% [parent hpanel]
               [paint-callback
                (lambda (canvas dc)
                  (draw-tofu-file dc openfilename))]))

; Add a menu bar
(define m (new menu-bar% [parent main_frame]))

(define (update_windows text-editor visualizer)
  (send text-editor save-file openfilename 'text #t)
  (send visualizer on-paint))

; Call backs

; Allow an user to save a file with another name
(define (save-file-as mi ce)
  (setopenfile 
   (path->string
    (put-file "Open File" main_frame #f #f "json" null '(("Any" "*.*")))))
  (update_windows t b))

; Allow the user to save the current state of the file, and see the changes
(define (save-file mi ce)
  (if (equal? #f openfilename)
      (save-file-as mi ce)
      (update_windows t b)))

; Open an existing file for modification
(define (open-file mi ce)
  (setopenfile (path->string
                (get-file "Open File" main_frame #f #f "json" null '(("Any" "*.json")))))
  (send t load-file (string->path openfilename))
  (send b on-paint))
(send main_frame show #t)

; Menu
(define fm (new menu% [label "File"] [parent m]))
(define fopen (new menu-item% [label "Open"] [parent fm] [callback open-file] [shortcut #\o]))
(define fsave (new menu-item% [label "Save"] [parent fm] [callback save-file] [shortcut #\s]))
(define m-edit (new menu% [label "Edit"] [parent m]))
(append-editor-operation-menu-items m-edit #f)
(send t set-max-undo-history 100)