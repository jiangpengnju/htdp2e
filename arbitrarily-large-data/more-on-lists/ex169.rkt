;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex169) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function legal. Like translate from ex168 the function consumes
; and produces a list of Posns. The result contains all those Posns
; whose x-coordinates are between 0 and 100 and whose y-coordinates are
; between 0 and 200.


(define XMAX 100)
(define XMIN 0)
(define YMAX 200)
(define YMIN 0)

; List-of-posns -> List-of-posns
; choose illegal items out of alop

(check-expect (legal '()) '())
(check-expect (legal (cons (make-posn 99 110) '()))
              (cons (make-posn 99 110) '()))
(check-expect (legal (cons (make-posn 150 23)
                           (cons (make-posn 99 110)
                                 '())))
              (cons (make-posn 99 110) '()))

(define (legal alop)
  (cond
    [(empty? alop) '()]
    [else
      (if (legal-point (first alop))
          (cons (first alop) (legal (rest alop)))
          (legal (rest alop)))]))


; Posn -> Boolean
; computes if the p's coordinates are within the specified range
(define (legal-point p)
  (and (<= XMIN (posn-x p) XMAX)
       (<= YMIN (posn-y p) YMAX)))