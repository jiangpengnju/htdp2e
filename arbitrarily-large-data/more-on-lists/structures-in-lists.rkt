;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname structures-in-lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define-struct work [employee rate hours])
; Work is a structure: (make-work String Number Number)
; interpreration: (make-work n r h) combines the name(n)
; with the pay rate(r) and the number of hours(h) worked.


; Low (list of works) is one of:
; - '()
; - (cons Work Low)
; interpretation: an instance of Low represents the hours worked of a number of employees.

(define ex1 '())
(define ex2 (cons (make-work "Robby" 11.95 39)
                  '()))
(define ex3 (cons (make-work "Matthew" 12.95 45)
                  (cons (make-work "Robby" 11.95 39)
                        '())))


; Low -> List-of-numbers
; computes the weekly wages for all given weekly work records

(check-expect (wage*.v2 '()) '())
(check-expect (wage*.v2 ex2) (cons (* 11.95 39) '()))
(check-expect (wage*.v2 ex3) (cons (* 12.95 45)
                                   (cons (* 11.95 39)
                                         '())))

(define (wage*.v2 an-low)
  (cond
    [(empty? an-low) '()]
    [else (cons (wage.v2 (first an-low))
                (wage*.v2 (rest an-low)))]))


; Work -> Number
; computes the wage for the given work record w

(check-expect (wage.v2 (make-work "Robby" 11.95 39)) (* 11.95 39))
(check-expect (wage.v2 (make-work "Matthew" 12.95 45)) (* 12.95 45))

(define (wage.v2 w)
  (* (work-rate w)
     (work-hours w)))