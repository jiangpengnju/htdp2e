;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex165) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function subst-robot, which consumes a list of toy descriptions (strings)
; and places all occurrences of "robot" with "r2d2";
; all other descriptions remain the same.

; Generalize subst-robot to the function substitute. The new function consumes two
; strings, called new and old, and a list of strings. It produces a new list of
; strings by substituting all occurrences of old with new.


; List-of-strings -> List-of-strings
; substitute all occurrences of "robot" in alos with "r2d2"

(check-expect (subst-robot '()) '())
(check-expect (subst-robot (cons "robot" '()))
              (cons "r2d2" '()))
(check-expect (subst-robot (cons "abcd" (cons "robot" '())))
              (cons "abcd" (cons "r2d2" '())))

(define (subst-robot alos)
  (cond
    [(empty? alos) '()]
    [else
      (cons
       (if (string=? "robot" (first alos))
         "r2d2" 
         (first alos))
       (subst-robot (rest alos)))]))



; String String List-of-strings -> List-of-strings
; substitute all occurrences of old in alos with new

(check-expect (substitute "new" "old" '()) '())
(check-expect (substitute "new" "old"
                          (cons "old" '()))
              (cons "new" '()))
(check-expect (substitute "new" "old"
                          (cons "abc" (cons "old" '())))
              (cons "abc" (cons "new" '())))

(define (substitute new old alos)
  (cond
    [(empty? alos) '()]
    [else
     (cons
      (if (string=? old (first alos))
          new
          (first alos))
      (substitute new old (rest alos)))]))