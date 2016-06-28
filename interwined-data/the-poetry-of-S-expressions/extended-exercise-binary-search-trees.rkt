;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname extended-exercise-binary-search-trees) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct no-info [])
(define NONE (make-no-info))

(define-struct node [ssn name left right])

; A BinaryTree (short: BT) is one of:
; - NONE
; - (make-node Number Symbol BT BT)

(define bt1
  (make-node 15 'd NONE (make-node 24 'i NONE NONE)))

(define bt2
  (make-node 15 'd (make-node 87 'h NONE NONE) NONE))


