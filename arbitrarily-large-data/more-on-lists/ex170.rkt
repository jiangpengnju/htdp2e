;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex170) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Here is one way to represent a phone number:

; Design the function replace. It consumes a list of Phones and produces one.
; It replaces all occurrence of area code 713 with 281.


(define-struct phone [area switch four])
; A Phone is a structure: (make-phone Three Three Four)
; A Three is between 100 and 999;
; A Four is between 1000 and 9999;


; A Lop (list of phones) is one of:
; - '()
; - (cons Phone Lop)
; interpretation: an instance of Lop represents a number of phones



; Lop -> Lop
; replaces all occurrence of area code 713 of alop with 281

(check-expect (replace '()) '())
(check-expect (replace (cons (make-phone 713 111 1111) '()))
              (cons (make-phone 281 111 1111) '()))
(check-expect (replace (cons (make-phone 123 111 1111) (cons (make-phone 713 111 1111) '())))
              (cons (make-phone 123 111 1111) (cons (make-phone 281 111 1111) '())))

(define (replace alop)
  (cond
    [(empty? alop) '()]
    [else
     (cons
      (if (= 713 (phone-area (first alop)))
          (phone-up-area (first alop) 281)
          (first alop))
      (replace (rest alop)))]))


; Phone -> Phone
; area updater
(define (phone-up-area p new)
  (make-phone new
              (phone-switch p)
              (phone-four p)))