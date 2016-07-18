;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a-glimpse-at-parsing) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; A File is one of: 
; – '()
; – (cons "\n" File)
; – (cons 1String File)
; interpretation: "\n" represents the newline character 


; A Line is [List-of 1String]


(define NEWLINE "\n")

; File -> [List-of Line]
; converts a file into a list of lines
(check-expect (file->list-of-lines
               (list "a" "b" "c" "\n" "d" "e" "\n" "f" "g" "h" "\n"))
              (list (list "a" "b" "c") (list "d" "e") (list "f" "g" "h")))
(check-expect (file->list-of-lines '()) '())
(check-expect (file->list-of-lines (list "\n")) (list '()))
(check-expect (file->list-of-lines (list "\n" "\n")) (list '() '()))
(define (file->list-of-lines afile)
  (cond
    [(empty? afile) '()]
    [else
     (cons (first-line afile)
           (file->list-of-lines (remove-first-line afile)))]))


; File -> Line
; retrieves the prefix of afile up to the first occurence of NEWLINE
(define (first-line afile)
  (cond
    [(empty? afile) '()]
    [(string=? (first afile) NEWLINE) '()]
    [else (cons (first afile) (first-line (rest afile)))]))


; File -> File
; gets the suffix of a file behind the first occurence of NEWLINE
(define (remove-first-line afile)
  (cond
    [(empty? afile) '()]
    [(string=? (first afile) NEWLINE) (rest afile)]
    [else (remove-first-line (rest afile))]))