;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname programming_with_structures) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Proper programming calls for Data Definitoins. With the introduction of
; structure type definitions, data definitions become interesting.
; Remember that a data definition provides a way of representing information
; into data and interpreting data as infromation.
; For structure types, this calls for a description of what kind of data
; goes into which field.

(define-struct posn [x y])
; A Posn is a structure: (make-posn Number Number)
; interpretation: the number of pixels from left and from top


(define-struct entry [name phone email])
; An Entry is a structure: (make-entry String String String)
; interpretation: a contact's name, 7-digit phone#, and email address


; Contrast this simplicity with structure type definition for ball, which
; obviously allows at least two distinct interpretations:

(define-struct ball [location velocity])
; A Ball-1d is a structure: (make-ball Number Number)
; interpretation 1: the position from top and the velocity
; interpretation 2: the position from left and the velocity

; Whichever one we use in a program, we must stick to it consistently.

; However, it is also possible to use ball structures in an entirely different
; mannar:

; A Ball-2d is a structure: (make-ball Pson Vel)
; interpretation: 2-dimensional position with a 2-dimensional velocity

(define-struct vel [deltax deltay])
; a Val is a structure: (make-val Number Number)
; interpretation (make-vel dx dy) means a velocity of dx pixels [per tick]
; along the horizontal and dy pixels along the vertical direction.


; Here we name a second collection of data, Ball-2d, distinct from Ball-1d,
; to describe data representations for balls that move in straight lines across
; a world canvas.
; In short, it is possible to use ONE AND THE SAME structure type in TWO DIFFERENT
; WAYS.
; Of course, within one program, it is best to stick to one and only one use;
; otherwise you are setting yourself up for problem.