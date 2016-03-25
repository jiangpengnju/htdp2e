;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex50) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Enter the definition of reward and the application (reward 18) into the
; Definition Area of DrRacket and use the stepper to find out HOW DrRacket
; evaluates applications of the function.


; PositiveNumber is a Number greater than or equal to 0.

; PositiveNumber -> String
; computes the reward level from the given score s

(define (reward s)
  (cond
    [(<= 0 s 10) "bronze"]
    [(and (< 10 s) (<= s 20)) "silver"]
    [else "gold"]))



(reward 18)