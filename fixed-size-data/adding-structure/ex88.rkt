;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex88) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Define a structure type that keeps track of the cat's x-coordinate and its
; happiness. Then formulate a data definition of cats, dubbed VCat, including
; an interpretation with respect to a combined world.


(define-struct vcat [x happy])
; VCat is a structure: (make-vcat Number Number)
; interpretation: (make-vcat x h) means a Virtual Cat that is currently at the x
;    x-coordinate and its happiness level is h.

(define vcat1 (make-vcat 10 30))
(define vcat2 (make-vcat 15 20))


