;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname the-list-function) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(list "ABC")
(cons "ABC" '())

(list #f #t)
(cons #f (cons #t '()))

(list 1 2 3)
(cons 1 (cons 2 (cons 3 '())))


(list (+ 0 1) (+ 1 1))


(list 0 1 2 3 4 5 6 7 8 9)


(list (list "bob" 0 "a")
      (list "carl" 1 "a")
      (list "dana" 2 "b")
      (list "erik" 3 "c"))