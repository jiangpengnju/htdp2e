;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex175) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design a BSL program that simulates the Unix command wc. The purpose of
; the command is to count the number of 1Strings, words, and lines in a
; given file. That is, the command consumes the name of a file and produces
; a value that consists of three numbers.


(require 2htdp/batch-io)

(define-struct stat [chars words lines])
; A Stat is a structure: (make-stat N N N)
; interpretation: (make-stat c w l) represents a file has c chars, w words, l lines


; String -> Stat
; counts the number of 1Strings, words, lines in given file with name n.

(check-expect (wc "ttt.txt") (make-stat 184 33 13))

(define (wc n)
  (make-stat (add1 (length (read-1strings n)))
             (length (read-words n))
             (length (read-lines n))))


;; TODO: how to count the last '\n' in the file?