;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex67) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Write down the names of the functions(constructors, selectors, and predicates)
; that the following structure type definitions introduce:

(define-struct movie [title producer year])
; constructor: make-movie
; selectors: movie-title  movie-producer  movie-year
; predicate: movie?

(define-struct person [name hair eyes phone])
; constructor: make-person
; selectors: person-name  person-hair  person-eyes  person-phone
; predicate: person?

(define-struct pet [name number])
; constructor: make-pet
; selectors: pet-name  pet-number
; predicate: pet?

(define-struct CD [artist title price])
; constructor: make-CD
; selectors: CD-artist  CD-title  CD-price
; predicate: CD?

(define-struct sweater [material size producer])
; constructor: make-sweater
; selectors: sweater-material sweater-size  sweater-producer
; predicate: sweater?


; Make sensible guesses as to what kind of values go with which fields.
; Then create at least one instance per structure type definition
; and draw box representations for them.

(make-movie "Ant-man" "Marvel" 2015)
(make-person "Tyler" "black" "black" "11111111111")
(make-pet "doggy" 2344)
(make-CD "Li Keqin" "Red Sun" 12.23)
(make-sweater "cotton" "XL" "Gap")