;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex168) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function translate. It consumes and produces lists of Posns.
; For each (make-posn x y) in the former, the latter contains (make-posn x (+ y 1))
; We borrow the word "translate" from geometry, where the movement of a point by
; a constant distance along a straight line is called a translation.


; List-of-posns -> List-of-posns
; add 1 to y for each (make-posn x y) in alop

(check-expect (translate '()) '())
(check-expect (translate (cons (make-posn 12 13) '()))
              (cons (make-posn 12 14) '()))
(check-expect (translate (cons (make-posn 55 55)
                               (cons (make-posn 12 13)
                                     '())))
              (cons (make-posn 55 56)
                    (cons (make-posn 12 14)
                          '())))

(define (translate alop)
  (cond
    [(empty? alop) '()]
    [else (cons (translate-point (first alop))
                (translate (rest alop)))]))



; Posn -> Posn
; add 1 to y for (make-posn x y)

(check-expect (translate-point (make-posn 12 13))
              (make-posn 12 14))
(check-expect (translate-point (make-posn 55 55))
              (make-posn 55 56))

(define (translate-point p)
  (make-posn (posn-x p)
              (add1 (posn-y p))))