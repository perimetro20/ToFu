#lang racket/gui

(provide
 ; Parse and draw a file
 draw-tofu-file)

(require json)

(define (vector-vertices vector)
  (hash-ref vector 'vertices))

(define (vector-to-path vector)
  (let ([p (new dc-path%)])
    (send p move-to (hash-ref (first (vector-vertices vector)) 'x) (hash-ref (first (vector-vertices vector)) 'y))
    (for ([vertex (in-list (rest (vector-vertices vector)))])
      (send p line-to (hash-ref vertex 'x) (hash-ref vertex 'y)))
    p))
    
(define (draw-vector dc vector)
  (let ([path (vector-to-path vector)])
    (send dc draw-path path)))

(define (draw-tofu dc tofu)
  (for ([vector (in-list (hash-ref tofu 'vectors))])
    (draw-vector dc vector)))

(define (read-tofu-file file)
  (call-with-input-file file read-json))

(define (draw-tofu-file dc file)
  (if file 
      (let ([file-content (read-tofu-file file)])
        (send dc erase)
        (draw-tofu dc file-content))
      (send dc draw-text "Welcome to ToFu" 10 10)))

;(define file-content (read-tofu-file "data.json"))
