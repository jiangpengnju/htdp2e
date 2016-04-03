;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bsl-errors) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; syntax error


; run-time error

; (/ 1 0)

; note: cond
(cond
  [(= 0 0) "inf"]
  [else (/ 1 0)])

;As a rule of thumb, it is best to keep the following in mind:
; Simplify the outermost and left-most sub-expression that is ready for evaluation.


;; raise errors
(define (checked-area-of-disk v)
  (cond
    [(number? v) (area-of-disk v)]
    [else (error "number expected")]))
