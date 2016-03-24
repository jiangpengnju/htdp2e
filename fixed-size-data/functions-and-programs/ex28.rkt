;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex28) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; What do you expect as value of the following program:
(define (string-insert s i)
  (string-append (substring s 0 i) "_" (substring s i)))

(string-insert "helloworld" 6)

; Confirm your expectation with DrRacket and its stepper.