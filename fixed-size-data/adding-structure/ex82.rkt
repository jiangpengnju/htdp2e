;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex82) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function compare-word. The function consumes two three-letter words.
; (See ex78)
; It produces a word that indicates where the given ones agree and disagree.
; The function retains the content of the structure(see ex78) fields if the two agree;
; otherwise it places #false in the field of the resulting word.
; Hint: The excercises mentions two tasks: the comparison of words and the
; comparison of "letters".


; A Letter is one of:
; lower case "a" through "z"
; #false


(define-struct 3lword [l1 l2 l3])
; A 3LWord is a structure: (make-word Letter Letter Letter)
; interpretation: (make-3lword l1 l2 l3) represents a word consists of three Letters
; l1, l2, l3 (in order)

(define ex1 (make-3lword "a" "b" "c"))
(define ex2 (make-3lword "q" "e" "r"))
(define ex3 (make-3lword #false "b" "d"))
(define ex4 (make-3lword "a" "m" "c"))
(define ex5 (make-3lword "a" #false "c"))


; 3LWord 3LWord -> 3LWord
; retains the content of the structure fields if the two agree;
; otherwise it places #false in the field of the resulting word

(check-expect (compare-word ex1 ex1) ex1)
(check-expect (compare-word ex1 ex4) ex5)

(define (compare-word w1 w2)
  (make-3lword (compare-letter (3lword-l1 w1) (3lword-l1 w2))
               (compare-letter (3lword-l2 w1) (3lword-l2 w2))
               (compare-letter (3lword-l3 w1) (3lword-l3 w2))))


; Letter Letter -> Letter
; retains the Letter if l1 and l2 is the same; otherwise replaces #false

(check-expect (compare-letter "a" "a") "a")
(check-expect (compare-letter "a" "b") #false)
(check-expect (compare-letter #false "b") #false)
  
(define (compare-letter l1 l2)
  (cond
    [(equal? l1 l2) l1]
    [else #false]))

