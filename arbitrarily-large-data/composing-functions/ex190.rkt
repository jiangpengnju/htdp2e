;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex190) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design prefixes. The function consumes a list of 1Strings and produces
; the list of all prefixes. Recall that a list p is a prefix of l if p
; and l are the same up through all items in p. For example,
; (list 1 2 3) is a prefix of itself and (list 1 2 3 4).

; Design the function suffixes, which consumes a list of 1Strings and
; produces all suffixes. A list s is a suffix of l if p and l are the
; same from the end, up through all items in s. For example, (list 2 3 4)
; is a suffix of itself and (list 1 2 3 4).

(define lo1s1 '())
(define lo1s2 (list "A"))
(define lo1s3 (list "B"))
(define lo1s4 (list "A" "B"))

; Lo1S -> LoLo1S
; produces given alo1s's all prefixes.

(check-expect (prefixes lo1s1) '())
(check-expect (prefixes lo1s2) (list (list "A")))
(check-expect (prefixes lo1s3) (list (list "B")))
(check-expect (prefixes lo1s4) (list (list "A")
                                     (list "A" "B")))

(define (prefixes alo1s)
  (cond
    [(empty? alo1s) '()]
    [else
     (cons (list (first alo1s))
           (add-at-head (first alo1s) (prefixes (rest alo1s))))]))


; 1String LoLo1S -> LoLo1S
; append s at the head of each element of given lol1s

(check-expect (add-at-head "C" '())
              '())
(check-expect (add-at-head "A" (list (list "B")
                                     (list "B" "C")))
              (list (list "A" "B")
                    (list "A" "B" "C")))

(define (add-at-head s lolo1s)
  (cond
    [(empty? lolo1s) '()]
    [else
     (cons (cons s (first lolo1s))
           (add-at-head s (rest lolo1s)))]))



; Lo1S -> LoLo1S
; produces given lo1s's all suffixes

(check-expect (suffixes '()) '())
(check-expect (suffixes (list "C"))
              (list (list "C")))
(check-expect (suffixes (list "B" "C"))
              (list (list "B" "C")
                    (list "C")))
(check-expect (suffixes (list "A" "B" "C"))
              (list (list "A" "B" "C")
                    (list "B" "C")
                    (list "C")))

(define (suffixes lo1s)
  (cond
    [(empty? lo1s) '()]
    [else
     (cons lo1s
           (suffixes (rest lo1s)))]))
