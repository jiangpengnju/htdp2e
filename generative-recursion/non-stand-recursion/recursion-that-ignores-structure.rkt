;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname recursion-that-ignores-structure) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; [List-of Number] -> [List-of Number]
; creates a list of numbers with the same numbers as alon,
; sorted in ascending order
(check-expect (quick-sort '(3 2 1)) '(1 2 3))
(check-expect (quick-sort '(11 8 14 7)) '(7 8 11 14))
(check-expect (quick-sort '(11 9 2 18 12 14 4 1))
              '(1 2 4 9 11 12 14 18))
(define (quick-sort alon)
  (cond
    [(empty? alon) '()]
    [else (local ((define pivot (first alon))
                  (define smaller-items (filter (lambda (x) (< x pivot)) alon))
                  (define larger-items (filter (lambda (x) (> x pivot)) alon)))
            (append (quick-sort smaller-items)
                    (list pivot)
                    (quick-sort larger-items)))]))