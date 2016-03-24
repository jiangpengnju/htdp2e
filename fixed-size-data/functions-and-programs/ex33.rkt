;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex33) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Recall the letter program. 

(require 2htdp/batch-io)

(define (letter fst lst signature-name)
  (string-append
   (opening fst)
   "\n\n"
   (body fst lst)
   "\n\n"
   (closing signature-name)))

; auxiliary functions
(define (opening fst)
  (string-append "Dear " fst ","))

(define (body fst lst)
  (string-append
   "We have discovered that all people with the last name " "\n"
   lst " have won our lottery. so, " fst ", " "\n"
   "hurry and pick up your prize."))

(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

; We launced this program once, with the inputs "Matthew", "Fisler", and "Felleisen".

;(write-file 'stdout (letter "Matthew" "Fisler" "Felleisen"))

; Here is a letter-writing batch program that reads names from three files and
; writes a letter to one:
(define (main in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))

; sample usage:
(write-file "in-fst.dat" "Matthew")
(write-file "in-lst.dat" "Fisler")
(write-file "in-signature.dat" "Felleisen")

(main "in-fst.dat" "in-lst.dat" "in-signature.dat" "out.dat")

;> (write-file 'stdout (read-file "out.dat"))
;Dear Matthew,
;
;We have discovered that all people with the last name 
;Fisler have won our lottery. so, Matthew, 
;hurry and pick up your prize.
;
;Sincerely,
;
;Felleisen'stdout