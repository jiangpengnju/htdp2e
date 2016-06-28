;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname S-expressions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; An S-expr (S-expression) is one of:
; - Atom
; - SL

; An SL (S-list) is one of:
; - '()
; - (cons S-expr SL)

; An Atom is one of:
; - Number
; - String
; - Symbol


; Sample Problem: Design the function count, which determines how many times
; some symbol sy occurs in some S-expression sexp.


; S-expr Symbol -> N
; counts all occurences of sy in sexp

(check-expect (count 123 'hello) 0)
(check-expect (count "hello" 'hello) 0)
(check-expect (count 'world 'hello) 0)
(check-expect (count '(world hello) 'hello) 1)
(check-expect (count '(((world) hello) hello) 'hello) 2)

(define (count sexp sy)
  (cond
    [(atom? sexp) (count-atom sexp sy)]
    [else (count-sl sexp sy)]))


(define (count-sl sl sy)
  (cond
    [(empty? sl) 0]
    [else (+ (count (first sl) sy) (count-sl (rest sl) sy))]))


(define (count-atom at sy)
  (cond
    [(number? at) 0]
    [(string? at) 0]
    [(symbol? at) (if (symbol=? at sy) 1 0)]))



; X -> Boolean
; determines if given x is atom.
(define (atom? x)
  (or (number? x) (string? x) (symbol? x)))