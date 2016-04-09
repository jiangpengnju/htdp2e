;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex186) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Recall from Intermezzo:BSL that BSL comes with several different ways to
; formulate tests. One of them is check-satisfied, which determines whether
; an expression satisfies a certain property.

; Use sorted>? from ex146 to re-formulate the tests for sort> with
; check-satisfied.

; Now consider this function definition:

; List-of-numbers -> List-of-numbers
; produces a sorted version of l
(define (sort>/bad l)
  '(9 8 7 6 5 4 3 2 1 0))

; Can you formulate a test case that shows sort>/bad is NOT a sorting function?
;; A: yes.   (check-expect (sort>/bad '()) '())

; Can you use check-satisfied to formulate this test case?
;; A: not (for now).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; List-of-numbers -> Boolean
; are the items of anelot sorted in descending order

(check-expect (sorted>? (list 3 2 1)) #t)
(check-expect (sorted>? (list 2 3 1)) #f)
(check-expect (sorted>? (list 2)) #t)
(check-expect (sorted>? '()) #t)

(define (sorted>? alon)
  (cond
    [(empty? alon) #t]
    [(empty? (rest alon)) #t]
    [else
     (and (> (first alon) (first (rest alon)))
          (sorted>? (rest alon)))]))


; List-of-numbers -> List-of-numbers
; produces a sorted version of alon

(check-satisfied (sort> '()) sorted>?)
(check-satisfied (sort> (cons 12 (cons 20 (cons -5 '())))) sorted>?)
(check-satisfied (sort> (list 3 2 1)) sorted>?)
(check-satisfied (sort> (list 1 2 3)) sorted>?)

(define (sort> alon)
  (cond
    [(empty? alon) '()]
    [else
     (insert (first alon) (sort> (rest alon)))]))


; Number List-of-numbers -> List-of-numbers
; insert n into the sorted list of numbers alon

(check-expect (insert 12 (list 20 -5)) (list 20 12 -5))
(check-expect (insert 1 '()) (list 1))
(check-expect (insert 3 (list 2 1)) (list 3 2 1))
(check-expect (insert 1 (list 3 2)) (list 3 2 1))

(define (insert n alon)
  (cond
    [(empty? alon) (list n)]
    [else
     (if (>= n (first alon))
         (cons n alon)
         (cons (first alon) (insert n (rest alon))))]))