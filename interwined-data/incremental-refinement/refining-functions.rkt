;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname refining-functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require htdp/dir)

(define d0 (create-dir "/Users/jiangpeng/Coding/htdp2e/interwined-data")) ; on OS X
;(define d1 (create-dir "/var/log/")) ; on OS X



; Dir.v3 -> Number
; determines how many files a given Dir.v3 contains

; (check-expect (how-many sample.v3) 7)

(define (how-many a-dir)
  (+ (how-many-dir* (dir-dirs a-dir))
     (how-many-file* (dir-files a-dir))))


; Dir* -> Number
; determines how many files in a given Dir*
(define (how-many-dir* alod)
  (cond
    [(empty? alod) 0]
    [else (+ (how-many (first alod))
             (how-many-dir* (rest alod)))]))

; File* -> Number
; determines how many files in a given File*
(define (how-many-file* alof)
  (length alof))


(how-many d0)