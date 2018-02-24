;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Week5 CMPE100 Classwork1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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