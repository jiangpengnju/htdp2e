;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex150) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Does copier function properly when you apply it to a natural number and a
; Boolean or an image? Or do you have to design another function?
; Read 'Similarities Everywhere' for an answer.

; An alternative definition of copier might use else for the second condition:
(define (copier.v2 n s)
  (cond
    [(zero? n) '()]
    [else (cons s (copier.v2 (sub1 n) s))]))

; How do copier and copier.v2 behave when you apply them to 0.1 and "xyz"?
; Explain. Use DrRacket's stepper to confirm you explanation.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; A N is one of:
; - 0
; - (add1 N)
; interpretation: represents the natural numbers or counting numbers


; design fuctions such as make-list yourself.

; N String -> List-of-Strings
; create a list of n strings s

(check-expect (copier 0 "hello") '())
(check-expect (copier 2 "hello") (cons "hello" (cons "hello" '())))

(define (copier n s)
  (cond
    [(zero? n) '()]
    [(positive? n) (cons s (copier (sub1 n) s))]))



;;;;;;;;;; A ;;;;;;;;;;;;;;
; Also works well for both Boolean and Image
(copier 3 #f)

(require 2htdp/image)
(copier 2 (circle 4 "outline" "red"))


(copier 0.1 "xyz")
;cond: all question results were false


(copier.v2 0.1 "xyz")
; The recursion will never stop.