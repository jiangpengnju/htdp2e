;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex177) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function create-eidtor. The function consumes two strings and
; produces an Editor. The first string is the text to the left of the cursor
; and the second string is the text to the right of the cursor.


(define-struct editor [pre post])
; An Editor is (make-editor Lo1S Lo1S)
; An Lo1S is one of:
; - '()
; - (cons 1String Lo1S)

(define good
  (cons "g" (cons "o" (cons "o" (cons "d" '())))))
(define all
  (cons "a" (cons "l" (cons "l" '()))))
(define lla
  (cons "l" (cons "l" (cons "a" '()))))

(define ed1
  (make-editor all good))
(define ed2
  (make-editor lla good))


; String String -> Editor
; creates editor with given pre- and post- cursor strings

(check-expect (create-editor "all" "good")
              (make-editor (rev (explode "all")) (explode "good")))

(define (create-editor pre post)
  (make-editor (rev (explode pre))
               (explode post)))


; Lo1S -> Lo1S
; produces a reverse version of the given list

(check-expect (rev all) lla)
(check-expect (rev '()) '())

(define (rev l)
  (cond
    [(empty? l) '()]
    [else (add-at-end (rev (rest l)) (first l))]))


; Lo1S 1String -> Lo1S
; create a new list by adding s to the end of l

(check-expect (add-at-end '() "a") (cons "a" '()))
(check-expect (add-at-end (cons "c" (cons "b" '())) "a")
              (cons "c" (cons "b" (cons "a" '()))))

(define (add-at-end l s)
  (cond
    [(empty? l) (cons s '())]
    [else
     (cons (first l)
           (add-at-end (rest l) s))]))