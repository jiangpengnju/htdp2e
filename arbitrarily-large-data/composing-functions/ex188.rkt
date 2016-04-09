;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex188) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design a program that sorts lists of game players by score:


(define-struct gp [name score])
; A GamePlayer is a structure:
;      (make-gp String Number)
; interpretation: (make-gp p s) represents player p who scored a maximum of s points


; A Logp (List of Game Players) is one of:
; - '()
; - (cons GamePlayer Logp)
; interpretation: an instance of Logp represents a list of game players

(define gp1 (make-gp "A" 30))
(define gp2 (make-gp "B" 20))
(define gp3 (make-gp "C" 10))

(define l1 '())
(define l2 (list gp1 gp2))
(define l3 (list gp2 gp1))
(define l4 (list gp2 gp3 gp1))
(define l5 (list gp1 gp2 gp3))


; Logp -> Logp
; sorts list of game players by score, descendingly.

(check-expect (sort-by-score> l1) '())
(check-expect (sort-by-score> l3) l2)
(check-expect (sort-by-score> l4) l5)

(define (sort-by-score> alogp)
  (cond
    [(empty? alogp) '()]
    [else (insert (first alogp) (sort-by-score> (rest alogp)))]))


; GamePlayer Logp -> Logp
; insert gp into the score descendingly ordered list of game players l

(check-expect (insert gp1 '()) (list gp1))
(check-expect (insert gp1 (list gp2 gp3))
              (list gp1 gp2 gp3))
(check-expect (insert gp2 (list gp1 gp3))
              (list gp1 gp2 gp3))

(define (insert gp l)
  (cond
    [(empty? l) (list gp)]
    [else
     (if (>= (gp-score gp) (gp-score (first l)))
         (cons gp l)
         (cons (first l) (insert gp (rest l))))]))