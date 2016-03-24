;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mixing_it_up_with_booleans) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define x 0)
(define inverse-of-x 
  (if (= x 0) 0 (/ 1 x)))

inverse-of-x

(string=? "abc" "abc")
(string<? "ab" "bc")

(define current-color "red")
(define next-color (if (string=? "green" current-color)
                       "yellow"
                       (if (string=? "yellow" current-color)
                           "red"
                           "green")))
next-color