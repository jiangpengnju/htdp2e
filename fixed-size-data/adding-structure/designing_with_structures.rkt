;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname designing_with_structures) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sample Problem: Design a function that computes the distance of objects in
; a 3-dimensinal space to the origin of the coordinate system.


; 1. Data Definition
;  -- When you need a structure type definition?
;     A: the problem calls for the representation of pieces of information that
;        belong together or describe a natural whole.
;
;  -- A data definition for a structure type INTRODUCEs a NAME for the collection
;     of instances that are LEGITIMATE -- use only names of built-in data collections
;     or previously defined data definitions.
;     It MUST describe which kind of data goes with which field.
;
;  -- use the data definition to create SAMPLE data structure.

(define-struct r3 [x y z])
; R3 is (make-r3 Number Number Number)

(define ex1 (make-r3 1 2 13))
(define ex2 (make-r3 -1 0 3))


; 2. signature, purpose statement, function header

; R3 -> Number
; computes the distance of p to the origin.
(define (r3-distance-to-0 p) 0)


; 3. functional examples. (see above)
; -- use the examples from the first step to create functional examples.

; R3 -> Number
; computes the distance of p to the origin.

(check-expect (r3-distance-to-p ex1) (sqrt (+ (sqr 1) (sqr 2) (sqr 13))))
(check-expect (r3-distance-to-p ex2) (sqrt (+ (sqr -1) (sqr 0) (sqr 3))))

(define (r3-distance-to-0 p) 0)


; 4. funtion templeate.
;  -- a function that consumes structrue USUALLY EXTRACTs the values from the
;     various fields in the structure. To remind yourself of this possibility,
;     Write templates for such functions containing a selector for each field.

; -- Do NOT create selector expresstions if a field value is ITSELF a STRUCTURE.
;     It is better to wish for an AUXILIARY FUNCTION that processes the extracted
;      field values.

; R3 -> Number
; computes the distance of p to the origin.

(check-expect (r3-distance-to-p ex1) (sqrt (+ (sqr 1) (sqr 2) (sqr 13))))
(check-expect (r3-distance-to-p ex2) (sqrt (+ (sqr -1) (sqr 0) (sqr 3))))

(define (r3-distance-to-0 p)
  (... (r3-x p) ... (r3-y p) ... (r3-z p)))


; 5. complete the function
; -- you  may not need (some of) the selector expressions from the template.

; R3 -> Number
; computes the distance of p to the origin.

(check-expect (r3-distance-to-p ex1) (sqrt (+ (sqr 1) (sqr 2) (sqr 13))))
(check-expect (r3-distance-to-p ex2) (sqrt (+ (sqr -1) (sqr 0) (sqr 3))))

(define (r3-distance-to-0 p)
  (sqrt (+ (sqr (r3-x p)) (sqr (r3-y p)) (sqr (r3-z p)))))


; 6. test
