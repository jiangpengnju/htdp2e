;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex149) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Compare the function definitions from this section (sum, how-many, all-true, one-true)
; with the corresponding function definitions from the preceding sections.
; Is it better to work with data definitions that accomodate empty lists as opposed
; to definitions for non-empty lists? Why? Why not?


; A: In my opinion, the latter is better for Clarity and Describing Intentions precisely.
;    However, the former one is easier to implement.

;    So, for those who use the functions the latter is better; for those who need to
;       maintain the code, the former maybe is a little easier, just a little.