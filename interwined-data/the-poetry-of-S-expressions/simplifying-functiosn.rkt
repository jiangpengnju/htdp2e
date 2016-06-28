;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname simplifying-functiosn) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; S-expr Symbol Atom -> S-expr
; replaces all occurrences of old in sexp with new

(check-expect (substitute 'world 'hello 0) 'world)
(check-expect (substitute '(world hello) 'hello 'bye) '(world bye))
(check-expect (substitute '(((world) bye) bye) 'bye '42) '(((world) 42) 42))

(define (substitute sexp old new)
  (cond
    [(atom? sexp) (if (eq? sexp old) new sexp)]
    [else (map (lambda (s) (substitute s old new)) sexp)]))


; S-expr -> Boolean
; checks if a sexp is an Atom
(define (atom? sexpr)
  (or (number? sexpr) (string? sexpr) (symbol? sexpr)))