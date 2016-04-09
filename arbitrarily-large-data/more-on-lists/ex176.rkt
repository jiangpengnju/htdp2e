;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex176) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Matric calculations.
; In principle, matrix just means rectangle of numbers.
; Here is one possible data representation of matrices:

; A Matrix is one of:
; - (cons Row '())
; - (cons Row Matrix)
; constraints: all rows in the matrix are of the same length

; A Row is one of:
; - '()
; - (cons Number Row)


(define row1 (cons 11 (cons 12 '())))
(define row2 (cons 21 (cons 22 '())))
(define mat1 (cons row1 (cons row2 '())))


; Matrix -> Matrix
; transpose the items on the given matrix along the diagonal

(define wor1 (cons 11 (cons 21 '())))
(define wor2 (cons 12 (cons 22 '())))
(define tam1 (cons wor1 (cons wor2 '())))

(check-expect (transpose (cons row1 '()))
              (cons (cons 11 '())
                    (cons (cons 12 '())
                          '())))
(check-expect (transpose mat1) tam1)

(define (transpose lln)
  (cond
    [(empty? (first lln)) '()]
    [else (cons (first* lln) (transpose (rest* lln)))]))


; Matrix -> Row
; produces the first column of given mat as a row

(check-expect (first* (cons row1 '())) (cons 11 '()))
(check-expect (first* mat1) wor1)

(define (first* mat)
  (cond
    [(empty? (rest mat)) (cons (first (first mat)) '())]
    [else
     (cons (first (first mat))
           (first* (rest mat)))]))


; Matrix -> Matrix
; removes the first column of given mat

(check-expect (rest* (cons row1 '())) (cons (cons 12 '()) '()))
(check-expect (rest* mat1) (cons (cons 12 '())
                                 (cons (cons 22 '())
                                       '())))
                                 
(define (rest* mat)
  (cond
    [(empty? (rest mat)) (cons (rest (first mat)) '())]
    [else
     (cons (rest (first mat))
           (rest* (rest mat)))]))