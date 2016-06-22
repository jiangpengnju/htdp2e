;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname specifying-with-lambda) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; [List-of Number] [Number Number -> Boolean] -> [List-of Number]
; sort alon0 according tp cmp

(check-expect (sort-cmp '("a" "c" "b") string<?) '("a" "b" "c"))
(check-expect (sort-cmp '(2 1 3 4 6 5) <) '(1 2 3 4 5 6))

(check-satisfied (sort-cmp '("a" "c" "b") string<?) (sorted string<?))
(check-satisfied (sort-cmp '(2 1 3 4 6 5) <) (sorted <))

(check-expect ((sorted-variant-of '(1 3 2) <) '(1 2 3)) #t)
(check-expect ((sorted-variant-of '(1 3 2) <) '(1 3)) #f)

(define (sort-cmp alon0 cmp)
  (local (; [List-of Number] -> [List-of Number]
          ; produces a variant of alon sorted by cmp
          (define (isort alon)
            (cond
              [(empty? alon) '()]
              [else (insert (first alon) (isort (rest alon)))]))
          
          ; Number [List-of Number] -> [List-of Number]
          ; inserts n into the sorted list of numbers alon 
          (define (insert n alon)
            (cond
              [(empty? alon) (cons n '())]
              [else (if (cmp n (first alon))
                        (cons n alon)
                        (cons (first alon)
                              (insert n (rest alon))))])))
    (isort alon0)))


; [X X -> Boolean] -> [[List-of X] -> Boolean]
; produces a function that determines whether some list is sorted according to cmp

(check-expect ((sorted string<?) '("a" "b" "c")) #t)
(check-expect ((sorted string<?) '("a" "c" "b")) #f)
(check-expect ((sorted <) '(1 2 3 4 5 6)) #t)

(define (sorted cmp)
  (lambda (l)
    (cond
      [(or (empty? l) (empty? (rest l))) #t]
      [else
       (and (cmp (first l) (second l))
            ((sorted cmp) (rest l)))])))

; [X X -> Boolean] [NEList-of X] -> Boolean 
; determine whether l is sorted according to cmp

(check-expect (sorted? < '(1 2 3)) #true)
(check-expect (sorted? < '(2 1 3)) #false)

(define (sorted? cmp l)
  (cond
    [(empty? (rest l)) #t]
    [else
     (and (cmp (first l) (second l))
          (sorted? cmp (rest l)))]))


; [List-of X] [X X -> Boolean] -> [[List-of X] -> Boolean]

(check-expect ((sorted-variant-of '(2 1 3 4) <) '(1 2 3 4)) #t)

(define (sorted-variant-of k cmp)
  (lambda (l0)
    (and (sorted? cmp l0)
         (contains? l0 k)
         (contains? k l0))))


; [List-of X] [List-of X] -> Boolean
; are all items in k members of list l

(check-expect (contains? '(1 2 3) '(2 1 4 3)) #f)
(check-expect (contains? '(1 2 3 4) '(2 1 3)) #t)

(define (contains? l k)
  (andmap (lambda (item-in-k) (member? item-in-k l)) k))


; [List-of Number] -> [List-of Number]
; produces a sorted version of l
(define (sort-cmp/worse l)
  (local ((define sorted-version (sort-cmp l <)))
    (cons (- (first sorted-version) 1) sorted-version)))

; (check-expect (sort-cmp/worse '(1 2 3)) '(1 2 3))
; (check-satisfied (sort-cmp/worse '(1 2 3)) (sorted-variant-of '(1 2 3) <))


; Number -> [List-of Number]
; generates a list which composed of n random numbers.
(define (generate-a-list-of-random-numbers n)
  (build-list n (lambda (k) (random n))))

(define a-list (generate-a-list-of-random-numbers 500))
;(check-satisfied (sort-cmp a-list <) (sorted-variant-of a-list <))




