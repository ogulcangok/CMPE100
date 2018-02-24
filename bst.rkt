;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname bst) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct bst-student (id name left right))
;Contract: create-bst: BST Number String --> BST
;Description: Returns a version of BST with a new node added
(define (create-bst node new-id new-name)
 (cond
 [(equal? node false) (make-bst-student new-id new-name false false)]
 [(<= new-id (bst-student-id node))
 (make-bst-student
 (bst-student-id node)
 (bst-student-name node)
 (create-bst (bst-student-left node) new-id new-name)
 (bst-student-right node))]
 [else
 (make-bst-student
 (bst-student-id node)
 (bst-student-name node)
 (bst-student-left node)
 (create-bst (bst-student-right node) new-id new-name))]))
(define example-bst (create-bst (create-bst (create-bst (create-bst false 20 "Ali") 15 "Ayşe") 25 "Veli") 17 "Merve"))
(define (bst-search node id)
 (cond
 [(equal? node false) false]
 [(equal? (bst-student-id node) id) node]
 [(<= id (bst-student-id node)) (bst-search (bst-student-left node) id)]
 [else (bst-search (bst-student-right node) id)]))