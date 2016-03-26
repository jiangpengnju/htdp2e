;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname posns) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(make-posn 3 4)

(define one-posn (make-posn 3 4))

(posn-x one-posn)
(posn-y one-posn)


(define p (make-posn 31 26))
(posn-x p)
(posn-y p)
(posn-y (make-posn 31 26))


;; Now consider designing a function that computes the diatance of some location
;  to the origin of the canvas:


; computes the distance of a-posn to origin

(check-expect (distance-to-0 (make-posn 0 5)) 5)
(check-expect (distance-to-0 (make-posn 7 0)) 7)
(check-expect (distance-to-0 (make-posn 3 4)) 5)
(check-expect (distance-to-0 (make-posn 5 12)) 13)

(define (distance-to-0 a-posn)
  (sqrt
   (+ (sqr (posn-x a-posn))
           (sqr (posn-y a-posn))))) 