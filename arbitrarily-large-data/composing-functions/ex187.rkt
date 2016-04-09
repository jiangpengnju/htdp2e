;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex187) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design a program that sorts lists of email messages by date:

(define-struct email [from date message])
; An Email Message is a structure
;      (make-email String Number String)
; interpretation: (make-email f d m) represents text m sent by f, d seconds
;     after the beginning of time


; Also develop a program that sorts lists of email messages by name.
; To compare strings alphabetically, using the string<? primitive.



; An Loe (list of emails) is one of:
; - '()
; - (cons Email Loe)
; interpretation: an instance of Loe represents a number of emails

(define email1 (make-email "Ana" 123 "balabala"))
(define email2 (make-email "Bob" 321 "cacaca"))
(define email3 (make-email "Carl" 100 "qqq"))

(define ex1 '())
(define ex2 (list email1 email2))
(define ex3 (list email2 email1 email3))


; Loe -> Loe
; sorts the emails by the date field, ascendingly

(check-expect (sort-by-date ex1) '())
(check-expect (sort-by-date ex2) (list email1 email2))
(check-expect (sort-by-date ex3) (list email3 email1 email2))

(define (sort-by-date aloe)
  (cond
    [(empty? aloe) '()]
    [else (insert-by-date (first aloe) (sort-by-date (rest aloe)))]))


; Email Loe -> Loe
; insert e into the date-ordered list of emails

(check-expect (insert-by-date email1 '()) (list email1))
(check-expect (insert-by-date email1 (list email2)) (list email1 email2))
(check-expect (insert-by-date email2 (list email3 email1))
              (list email3 email1 email2))

(define (insert-by-date e l)
  (cond
    [(empty? l) (list e)]
    [else
     (if (<= (email-date e) (email-date (first l)))
         (cons e l)
         (cons (first l) (insert-by-date e (rest l))))]))


; Loe -> Loe
; sorts the emails by the name field, alphabetically ascendingly

(check-expect (sort-by-name ex1) '())
(check-expect (sort-by-name ex3) (list email1 email2 email3))

(define (sort-by-name aloe)
  (cond
    [(empty? aloe) '()]
    [else (insert-by-name (first aloe) (sort-by-name (rest aloe)))]))


; Email Loe -> Loe
; insert e into the name-ordered list of emails

(check-expect (insert-by-name email1 '()) (list email1))
(check-expect (insert-by-name email1 (list email2 email3))
              (list email1 email2 email3))

(define (insert-by-name e l)
  (cond
    [(empty? l) (list e)]
    [else
     (if (string<? (email-from e) (email-from (first l)))
         (cons e l)
         (cons (first l) (insert-by-name e (rest l))))]))