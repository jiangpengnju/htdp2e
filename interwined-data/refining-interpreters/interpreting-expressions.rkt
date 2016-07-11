;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname interpreting-expressions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define-struct add [left right])
(define-struct mul [left right])


(make-add (make-mul 1 1) 10)

(make-add (make-mul 3 3)
          (make-mul 4 4))

(make-add (make-mul (make-add 1 2) 3)
          (make-mul (make-mul
                     (make-add 1 1)
                     2)
                    4))


