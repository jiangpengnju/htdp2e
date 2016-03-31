;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex105) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Develop a data representation for the following four kinds of zoo animals:

; spiders, whose relevant attributes are the number of remainig legs and
; the space they need in case of transport;

; elephants, whose only attributes are the space they need in case of transport;

; boa constrictor, whose attributes include length and girth; and

; armadillo, for whom you must determine appropriate attributes; they need to
; include attributes that determine space needed for transportation.


;; Develop a template for functions that consumes representations of zoo animals.
;; Design the function fits?. The function consumes a zoo animal and the volume
;; of a cage. It determines whether the cage is large enough for the animal.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define-struct spider [legs space])
; A Spider is (make-spider Number Number)
; representation: (make-spider l s) means a spider with l legs remaining and needs
; s space for transportation


; A Elephant is a Number
; representation: how much space does the elephant need for transportation


(define-struct boa-constrictor [length girth])
; A Boa-constrictor is (make-boa-constrictor Number Number)
; representation: (make-boa-constrictor l g) is a boa constrictor which is l long,
; and its girth is g


(define-struct armadillo [length width height])
; An Armadillo is (make-armadillo Number Number Number)
; interpretation: (make-armadillo l w h) is an armadillo whose length is l, width
; w, and height h


; An Animal is one of the following:
; - Spider
; - Elephant
; - Boa-constrictor
; - Armadillo



; Animal Number -> Boolean
; determines whether a cage of the given space is large enough for the animal.

(check-expect (fit? 123 100) #f)
(check-expect (fit? 123 200) #t)
(check-expect (fit? (make-spider 5 3) 4) #t)
(check-expect (fit? (make-boa-constrictor 10 4) 50) #f)
(check-expect (fit? (make-boa-constrictor 10 4) 60) #t)
(check-expect (fit? (make-armadillo 6 4 3) 100) #t)

(define (fit? animal space)
  (>= space
      (cond
        [(number? animal) animal]
        [(spider? animal) (spider-space animal)]
        [(boa-constrictor? animal)
         (/ (* (boa-constrictor-girth animal)
               (boa-constrictor-girth animal)
               (boa-constrictor-length animal))
            pi)]
        [(armadillo? animal)
         (* (armadillo-length animal)
            (armadillo-width animal)
            (armadillo-height animal))])))