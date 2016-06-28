;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname designing-with-interwined-data) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

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



(define (fun-for-sexpr an-sexpr)
  (cond
    [(atom? an-sexpr) ... an-sexpr ...]
    [else ... an-sexpr ...]))


(define (fun-for-sexpr a-sl)
  (cond
    [(empty? a-sl) ...]
    [else
     (... (first a-sl) ...
          (rest a-sl) ...)]))


(define (fun-for-atom an-atom)
  (cond
    [(number? an-atom) ...]
    [(string? an-atom) ...]
    [(symbol? an-atom) ...]))

