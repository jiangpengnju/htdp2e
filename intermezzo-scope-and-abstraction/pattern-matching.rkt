;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname pattern-matching) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/abstraction)




(check-expect (sum-items '(1 2 3 4)) 10)

(define (sum-items a-lon)
  (match a-lon
    [(cons fst '()) fst]
    [(cons fst rst)
     (+ fst (sum-items rst))]))


(check-expect
 (match 4
   ['four  1]
   ["four" 2]
   [#true  3]
   [4      "hello world"])
 "hello world")

(check-expect
 (match 2
   [3 "one"]
   [x (+ x 3)])
 5)

(check-expect
 (match (cons 1 '())
   [(cons 1 tail) tail]
   [(cons head tail) head])
 '())

(check-expect
 (match (cons 2 '())
   [(cons 1 tail) tail]
   [(cons head tail) head])
 2)

(define p (make-posn 3 4))
(check-expect
 (match p
   [(posn x y) (sqrt (+ (sqr x) (sqr y)))])
 5)


(define-struct phone [area switch four])

(check-expect
 (match (make-phone 111 222 3333)
   [(phone x y z) (+ x y z)])
 3666)


(check-expect
 (match (cons (make-phone 713 664 9993) '())
   [(cons (phone area-code 664 9993) tail) area-code])
 713)

(check-expect
 (match (cons 1 '())
   [(cons (? symbol?) tail) tail]
   [(cons head tail) head])
 1)

(check-expect
 (match (cons 1 '())
   [(cons (? odd?) tail) tail]
   [(cons head tail) head])
 '())

;; ------------------------------------------------

; Sample Problem: Design the function last-item, which retrieves the last item
; on a non-empty list. Recall that non-empty lists are defined as follows:

; A [Non-empty-list X] is one of: 
; – (cons X '())
; – (cons X [Non-empty-list X])

; [Non-empty-list X] -> X
; retrieves the last item on a non-empty list

(check-expect (last-item '(a b c)) 'c)
(check-expect (last-item '(a)) 'a)
(check-error (last-item '()))

(define (last-item ne-l)
  (match ne-l
    [(cons lst '()) lst]
    [(cons fst rst) (last-item rst)]))


;; ------------------------------------------------

; Sample Problem: Design the function depth, which measures the number of layers
; surrounding Russian doll. Recall the corresponding data definition:

(define-struct layer [color doll])
; An RD (russian doll) is one of: 
; – "wooden doll"
; – (make-layer String RD)

; RD -> N
; how many dolls are a part of an-rd

(check-expect (depth (make-layer "red" "wooden doll")) 1)

(define (depth an-rd)
  (match an-rd
    ["wooden doll" 0]
    [(layer c inside) (+ (depth inside) 1)]))

;; ------------------------------------------------

; Sample Problem: Use match to design the function move-right.
; The latter consumes a list of Posns, which represent the positions of objects
; on a canvas, plus a number.
; It adds the latter to each x-coordinate, which represents
; an rightward movement of these objects.

; [List-of Posn] -> [List-of Posn]
; moves each object right by delta-x pixels
(check-expect (move-right (list (make-posn 1 1) (make-posn 10 14)) 3)
              (list (make-posn 4 1) (make-posn 13 14)))

(define (move-right lop delta-x)
  (map (lambda (p)
         (match p
           [(posn x y) (make-posn (+ x delta-x) y)]))
       lop))