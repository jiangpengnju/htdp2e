;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname defining_structure_types) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; In general, a structure type definition has this shape:

; (define-struct StructureName [FieldName ... FieldName])

; It defines three kind of functions:

; 1. one constructor
; 2. a selector per field
; 3. one structure predicate


; For example:
;(define-struct posn [x y])

; will defines:

; constructor
; make-posn

; two selectors
; posn-x
; posn-y

; one structure predicate:
; posn?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-struct entry [name phone email])

(define pl
  (make-entry "Sarah Lee" "666-7777" "lee@classy-university.edu"))

(define bh
  (make-entry "Tara Harper" "444-5555" "harper@small-college.edu"))

(entry-name pl)
(entry-name bh)
(entry-email pl)
(entry-phone pl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;!!!!!!!!!!!!!!;;;;;;;;;;;
; Every structure type definition introduces a new kind of structure, distinct
; from all others. Programmers want this kind of expressive power because they
; wish to convey an INTENTION with the STRUCTURE NAME.
; Wherever a structure is created, selected, or tested, the text of the
; program explicitly reminds the reader of this INTENTION.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct ball [location velocity])

(make-ball 10 -3)
; represents a ball that is 10 pixels from the top and moves up at 3 pixels
; per clock tick.


(define-struct vel [deltax deltay])

; a ball that is 30 pixels from the left, 40 pixels from the top.
; It moves 10 pixels toward the left per clock tick, and drops at 5 pixels
; per clock tick.
(define ball1 (make-ball (make-posn 30 40) (make-vel -10 5)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Let us briefly look at the example of contact list.
; Many cell phones support contact list that allow three phone numbers
; per name: one for a home line, one for the office, and one for a cell
; phone number. For phone numbers, we wish to include both the area code
; and the local number. Since this nests the information, it's best to
; create a nested data representation, too:

(define-struct centry [name home office cell])

(define-struct phone [area number])

(make-centry "Shriram Fisler"
             (make-phone 206 "234-2453")
             (make-phone 101 "776-1099")
             (make-phone 343 "123-5555"))