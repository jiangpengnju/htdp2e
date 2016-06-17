;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname similarities-in-data-definitions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; List-of-numbers
; A Lon is one of:
; - '()
; - (cons Number Lon)


; List-of-String
; A Los is one of:
; - '()
; - (cons String Los)



;;;; "parametric data definitions" ;;;;

; A [List-of ITEM] is one of:
; - '()
; - (cons ITEM [List-of ITEM])


;;;; "instantiation" ;;;;

; [List-of Number]
; [List-of String]
; if we have defined a class of inventory records, like:
(define-struct ir [name price])
; An IR is (make-ir String Number)
; then [List-of IR] would be a name for the class of lists of inventory records.




(define-struct point [hori veri])

; A Pair-boolean-string is a
;   (make-point Boolean String)

; A Pair-number-image is a
;   (make-point Number Image)


; A [CP H V] is a structure:
;   (make-point H V)

; [CP Boolean String]
; [CP Number Image]



;;;;;;;; Once you have parametric data definitions, you can even
;;;;;; "mix and match" them to great effect.

; [List-of [CP Boolean Image]]

; [CP Number [List-of Image]]

