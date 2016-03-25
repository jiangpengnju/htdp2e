;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname programming_with_conditionals) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; General Shape:
;(cond
;  [ConditionExpression1 ResultExpression1]
;  [ConditionExpression2 ResultExpression2]
;  ...
;  [ConditionExpressionN ResultExpressionN])


(define (next traffic-light-state)
  (cond
    [(string=? "red" traffic-light-state) "green"]
    [(string=? "green" traffic-light-state) "yellow"]
    [(string=? "yellow" traffic-light-state) "red"]))


;(cond
;  [ConditionExpression1 ResultExpression1]
;  [ConditionExpression2 ResultExpression2]
;  ...
;  [else DefaultResultExpression])


; PositiveNumber is a Number greater than or equal to 0.

; PositiveNumber -> String
; computes the reward level from the given score s
(check-expect (reward 3) "bronze")
(check-expect (reward 13) "silver")
(check-expect (reward 33) "gold")

(define (reward s)
  (cond
    [(<= 0 s 10) "bronze"]
    [(and (< 10 s) (<= s 20)) "silver"]
    [else "gold"]))