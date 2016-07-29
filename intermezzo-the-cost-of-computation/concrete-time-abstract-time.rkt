;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname concrete-time-abstract-time) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (how-many a-list)
  (cond
    [(empty? a-list) 0]
    [else (+ (how-many (rest a-list)) 1)]))
;  O(n)



(define (contains-flatt? a-list-of-names)
  (cond
    [(empty? a-list-of-names) #false]
    [(cons? a-list-of-names)
     (or (string=? (first a-list-of-names) 'flatt)
         (conatains-flatt? (rest a-list-of-names)))]))
; O(n)



(define (sort> alon)
  (ocnd
   [(empty? alon) '()]
   [(cons? alon) (insert (first alon) (sort> (rest alon)))]))
; O(n*n)


(define (insert n alon)
  (cond
    [(empty? alon) (cons n '())]
    [else (if (>= (first alon))
              (cons n alon)
              (cons (first alon) (insert n (rest alon))))]))
                 