;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname using-abstractions-by-example) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sample Problem: Design the function add-3-to-all. The function consumes a list
; of Posns and adds 3 to the x-coordinates of each of them.


; [List-of Posn] -> [List-of Posn]
; adds 3 to each x-coordinate on the given list.

(check-expect (add-3-to-all (list (make-posn 30 10) (make-posn 0 0)))
              (list (make-posn 33 10) (make-posn 3 0)))

(define (add-3-to-all lop)
  (local (; Posn -> Posn
          ; adds 3 to the x-coordinate on of the given Posn p
          (define (add-3-to-one p)
            (make-posn (+ (posn-x p) 3) (posn-y p))))
    (map add-3-to-one lop)))




; -------------------- ------------------------ ---------------------
; Sample Problem: Design a function that eliminates all Posns from a list
; that have a y-coordinate of larger than 100.


; [List-of Posn] -> [List-of Posn]
; eliminates Posns whose y-coordinate is larger than 100.

(check-expect (keep-good (list (make-posn 0 110) (make-posn 0 60)))
              (list (make-posn 0 60)))

(define (keep-good lop)
  (local (; Posn -> Boolean
          ; should this Posn stay on list
          (define (good? p)
            (not (> (posn-y p) 100))))
    (filter good? lop)))



; -------------------- ------------------------ ---------------------
; Sample Problem: Design a function that determines whether any of a list of
; Posns is close to some given position pt where “close” means a distance of
; at most 5 pixels.


; [List-of Posn] Posn -> Boolean
; determines if any Posn in the given list is within 5 pixels to given pt

(check-expect (close? (list (make-posn 53 54) (make-posn 4 5))
                      (make-posn 50 50))
              #t)
(check-expect (close? (list (make-posn 11 12) (make-posn 4 5))
                      (make-posn 50 50))
              #f)

(define (close? lop pt)
  (local (; Posn -> Boolean
          ; is one shot close to pt
          (define (is-one-close? p)
            (close-to p pt CLOSENESS)))
  (ormap is-one-close? lop)))

(define CLOSENESS 5)

; Posn Posn Number
; is the distance between posns p1 and p2 less than tolerance t
(define (close-to p1 p2 t)
  (<= (sqrt (+ (sqr (- (posn-x p1) (posn-x p2)))
               (sqr (- (posn-y p1) (posn-y p2)))))
      t))