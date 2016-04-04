;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex143) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design ill-sized?. The function consumes a list of images loi and a positive
; number n. It produces the first image on loi that is not an n by n square;
; if it cannot find such an image, it produces #f.

; Hint: Use

; ImageOrFalse is one of:
; - Image
; - #f

; for the result part of the signature.


(require 2htdp/image)


(define N 10)
(define CIRCLE1 (circle (/ N 2) "solid" "red"))
(define RECTANGLE1 (rectangle N (* 2 N) "solid" "red"))
(define SQUARE1 (rectangle N N "solid" "red"))


; A List-of-images is one of:
; - '()
; (cons Image List-of-images)

(define ex1 '())
(define ex2
  (cons CIRCLE1
        '()))
(define ex3
  (cons RECTANGLE1
        '()))
(define ex4
  (cons RECTANGLE1
        (cons CIRCLE1 '())))
(define ex5
  (cons CIRCLE1
        (cons RECTANGLE1 '())))
(define ex6
  (cons CIRCLE1
        (cons SQUARE1 '())))


; List-of-images PositiveNumber -> ImageOrFalse
; determines whether there is any image on aloi is NOT of the size NxN.
; return the first one if any, #false otherwise.

(check-expect (ill-sized? ex1 N) #f)
(check-expect (ill-sized? ex2 N) #f)
(check-expect (ill-sized? ex3 N) RECTANGLE1)
(check-expect (ill-sized? ex4 N) RECTANGLE1)
(check-expect (ill-sized? ex5 N) RECTANGLE1)
(check-expect (ill-sized? ex6 N) #f)

(define (ill-sized? aloi n)
  (cond
    [(empty? aloi) #f]
    [else
     (if (not (perfect-square? (first aloi) n))
         (first aloi)
         (ill-sized? (rest aloi) n))]))


; Image PositiveNumber -> Boolean
; is the given image of the size n x n

(check-expect (perfect-square? CIRCLE1 N) #t)
(check-expect (perfect-square? RECTANGLE1 N) #f)
(check-expect (perfect-square? SQUARE1 N) #t)

(define (perfect-square? image n)
  (and (= n (image-width image))
       (= n (image-height image))))