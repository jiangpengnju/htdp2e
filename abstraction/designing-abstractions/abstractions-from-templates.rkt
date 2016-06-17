;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname abstractions-from-templates) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Abstract from the templates directly.

(define (fun-for-l l)
  (cond
    [(empty? l) ...]
    [else (... (first l) ... (fun-for-l (rest l)) ...)]))


; [List-of X] Y [X Y -> Y] -> Y
(define (reduce l base combine)
  (cond
    [(empty? l) base]
    [else (combine (first l)
                   (reduce (rest l) base combine))]))

; [List-of Number] -> Number
(define (sum lon)
  (reduce lon 0 +))

; [List-of Number] -> Number
(define (product lon)
  (reduce lon 1 *))