;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Week5 CMPE100 Classwork1and2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Contract: number -> number
;Purpose: Calculates the number of the product that has been produced by workers in the specific time of a day.
;Examples:
;(product 7) answer should be: 30
;(product 5) answer should be: "Company is closed"
;Definition:
(define (product hour)
  (cond
    [(or (< hour 6) (> hour 18)) "Company is closed"]
    [(and (>= hour 6) (< hour 10)) 30]
    [(and (>= hour 10) (< hour 14)) 40]
    [(and (>= hour 14) (< hour 18)) 35]))
;Tests:
(check-expect (product 11) 40)
(check-expect (product 2) "Company is closed")


;Contract: number number -> number
;Purpose: Calculates the new price of an item with respect to the weekly discount values.
;Examples:
;(new-price 100 3) answer should be; 75
;(new-price 25 4) answer should be; 12.5
;Definition;
(define (new-price price week)
  (cond
    [(<= week 2) (* 1 price)]
    [(= week 3) (- price (/ (* 25 price) 100))]
    [(= week 4) (- price (/ (* 50 price) 100))]
    [(= week 5) (- price (/ (* 75 price) 100))]))
;Tests:
(check-expect (new-price 100 4) (- 100 (/ (* 50 100) 100)))
(check-expect (new-price 19 5) (- 19 (/ (* 75 19) 100)))