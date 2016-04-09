;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex184) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Determine the values of the following expressions:

; 1.
(list (string=? "a" "b") (string=? "c" "c") #false)

; 2.
(list (+ 10 20) (* 10 20) (/ 10 20))

; 3.
(list "dana" "jane" "mary" "laura")

; Use check-expect to experss your answers.


(check-expect (list (string=? "a" "b") (string=? "c" "c") #false)
              (list #f #t #f))

(check-expect (list (+ 10 20) (* 10 20) (/ 10 20))
              (list 30 200 1/2))

(check-expect (list "dana" "jane" "mary" "laura")
              (list "dana" "jane" "mary" "laura"))



