;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname imageRecursionApplication) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (ntuple image n)
  (cond
    [(<= n 0) (error "Invalid.")]
    [(= n 1) image]
    [else (beside image (ntuple image (- n 1)))]))
(define (fractal image n)
  (cond
    [(<= n 0) (error "Invalid")]
    [(= n 1 ) image]
    [else (above (ntuple image n) (fractal image (- n 1)))]))
(define (pattern image n)
  (cond
    [(<= n 0) (error "Invalid")]
    [(= n 1) image]
    [else (beside (above (ntuple image n) (fractal image (- n 1))) (pattern image (- n 1)))]))
 
             