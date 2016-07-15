;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname structural-versus-generative-recursion) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (general P)
  (cond
    [(trivial? P) (solve P)]
    [else
      (combine-solutions
        P
        (general (generate P)))]))


(define (special P)
  (cond
    [(empty? P) (solve P)]
    [else
      (combine-solutions
        P
        (special (rest P)))]))
