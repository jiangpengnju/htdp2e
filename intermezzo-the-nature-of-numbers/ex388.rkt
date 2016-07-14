;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex388) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct inex [mantissa sign exponent])
; An Inex is a structure:
;    (make-inex N99 S N99)
; An N99 is a Number between 0 and 99 (inclusive)
; A S is a Number +1 or -1


; N Number N -> Inex
; make an instance of Inex after checking the arguments
(define WRONG "inex: (<= 0 m 99), s in {+1, -1}, (<= 0 e 99) expected")

(check-error (create-inex 120 10 1) WRONG)
(define (create-inex m s e)
  (cond
    [(and (<= 0 m 99) (<= 0 e 99) (or (= s 1) (= s -1)))
     (make-inex m s e)]
    [else
     (error WRONG)]))


; Inex -> Number
; convert an inex into its numeric equivalent
(check-expect (inex->number (create-inex 0 1 0)) 0)
(check-expect (inex->number (create-inex 12 1 2)) 1200)
(check-expect (inex->number (create-inex 1 -1 2)) 0.01)
(define (inex->number an-inex)
  (* (inex-mantissa an-inex)
     (expt 10 (* (inex-exponent an-inex) (inex-sign an-inex)))))


(define MAX-POSITIVE (create-inex 99 1 99))
(define MIN-POSITIVE (create-inex 1 -1 99))


; Inex Inex -> Inex
; adds two Inex instances of the SAME exponent
(check-expect (inex+ (create-inex 1 1 0) (create-inex 2 1 0))
              (create-inex 3 1 0))
(check-expect (inex+ (create-inex 55 1 0) (create-inex 55 1 0))
              (create-inex 11 1 1))
(check-expect (inex+ (create-inex 56 1 0) (create-inex 56 1 0))
              (create-inex 11 1 1))
(define (inex+ i1 i2)
  (local ((define raw-mantissa-sum
            (+ (inex-mantissa i1) (inex-mantissa i2)))
          (define sign (inex-sign i1))
          (define exponent (inex-exponent i1)))
    (cond
      [(<= raw-mantissa-sum 99) (create-inex raw-mantissa-sum sign exponent)]
      [else (create-inex (round (/ raw-mantissa-sum 10)) sign (add1 exponent))])))


; Inex Inex -> Inex
; multiply two Inex instances
(check-expect (inex* (create-inex 2 1 4) (create-inex 8 1 10))
              (create-inex 16 1 14))
(check-expect (inex* (create-inex 20 1 1) (create-inex 5 1 4))
              (create-inex 10 1 6))
(check-expect (inex* (create-inex 27 -1 1) (create-inex 7 1 4))
              (create-inex 19 1 4))
(check-expect (inex* (create-inex 80 -1 5) (create-inex 70 1 0))
              (create-inex 56 -1 3))
(define (inex* i1 i2)
  (local ((define raw-mantissa-mul
            (* (inex-mantissa i1) (inex-mantissa i2)))
          (define raw-sign-mul-exponent
            (+ (* (inex-sign i1) (inex-exponent i1))
               (* (inex-sign i2) (inex-exponent i2))))
          ; Inex -> S
          (define (extract-sign sign-exponent-production)
            (if (>= sign-exponent-production 0) 1 -1))
          ; Inex -> Number
          (define (extract-exponent sign-exponent-production)
            (/ sign-exponent-production
               (extract-sign sign-exponent-production))))
    (cond
      [(<= raw-mantissa-mul 99)
       (create-inex raw-mantissa-mul
                    (extract-sign raw-sign-mul-exponent)
                    (extract-exponent raw-sign-mul-exponent))]
      [(<= raw-mantissa-mul 999)
       (create-inex (round (/ raw-mantissa-mul 10))
                    (extract-sign (add1 raw-sign-mul-exponent))
                    (extract-exponent (add1 raw-sign-mul-exponent)))]
      [(<= raw-mantissa-mul 9999)
       (create-inex (round (/ raw-mantissa-mul 100))
                    (extract-sign (+ 2 raw-sign-mul-exponent))
                    (extract-exponent (+ 2 raw-sign-mul-exponent)))])))