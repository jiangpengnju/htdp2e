;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex25) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; The first 1String in "hello world" is "h". How does the following function
; compute this result?   Use the stepper.
(define (string-first s)
  (substring s 0 1))

(string-first "hello world")