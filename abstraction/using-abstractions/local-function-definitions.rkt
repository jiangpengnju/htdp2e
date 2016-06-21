;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname local-function-definitions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct address [first-name last-name street])
; Addr is (make-address String String String)
; interpretation: associates a street address with a person's name

; [List-of Addr] -> String
; creates a string of first names, sorted in alphabetical order,
; seperated and surrounded by blank spaces
(define (listing l)
  (foldr string-append-with-space
         " "
         (sort (map address-first-name l) string<?)))

; String String -> String
; concatenates two strings and prefixes with space
(define (string-append-with-space s t)
  (string-append " " s t))

(define ex0
  (list (make-address "Matthias" "Fellson" "Sunburst")
        (make-address "Robert" "Findler" "South")
        (make-address "Matthew" "Flatt" "Canyon")
        (make-address "Shriram" "Krishna" "Yellow")))

(check-expect (listing ex0) " Matthew Matthias Robert Shriram ")


(define (listing.v2 l)
  (local (; String String -> String
          ; concatenates two Strings and prefixes with space
          (define (string-append-with-space s t)
            (string-append " " s t)))
    ; - IN -
    (foldr string-append-with-space
           " "
           (sort (map address-first-name l)
                 string<?))))

(check-expect (listing.v2 ex0) " Matthew Matthias Robert Shriram ")



; [List-of Number] [Number Number -> Boolean] -> [List-of Number]
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
    ; - IN -
    (isort alon0)))

(check-expect (sort-cmp '(3 1 2 5 4) <) '(1 2 3 4 5))


(define (listing.v3 l)
  (local (; String String -> String
          ; concatenates two strings and prefixes with space
          (define (string-append-with-space s t)
            (string-append " " s t))
          (define first-names (map address-first-name l))
          (define sorted-names (sort first-names string<?)))
    ; - IN -
    (foldr string-append-with-space " " sorted-names)))