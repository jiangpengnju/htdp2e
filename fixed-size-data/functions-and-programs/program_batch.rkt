;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname program_batch) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

; 1. Batch program
(define (f2c f)
  (* 5/9 (- f 32)))

(define (convert in out)
  (write-file out
              (string-append
               (number->string
                (f2c
                 (string->number
                  (read-file in))))
               "\n")))

(write-file "sample.dat" "212")
(convert "sample.dat" 'stdout)
(convert "sample.dat" "out.dat")
(read-file "out.dat")

