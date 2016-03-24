;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname designing_functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; Temperature is a Number.
; interpretion degrees Celsius

;; 1. Information-Data translation:
; We use plain numbers to represent temperatures.

;; 2. Signature, Purpose Statement, Stub
; Number String Image -> Image
; adds s to img, y pixels from top, 10 pixels to the left
(define (add-image y s img)
  (empty-scene 100 100))

;; 3. Functional Examples
; Number-> Number
; computes the area of a square whose side is len
; given: 2, expect: 4
; given: 7, expect: 49
(define (area-of-square len) 0)

;; 4. Function Template
; Number-> Number
; computes the area of a square whose side is len
; given: 2, expect: 4
; given: 7, expect: 49
(define (area-of-square len)
  (... len ...))

;; 5. Coding - function definition.
; Number -> Number
; computes the area of a square whose side is len 
; given: 2, expect: 4
; given: 7, expect: 49
(define (area-of-square len)
  (sqr len))

; Number String Image -> Image
; adds s to img, y pixels from top, 10 pixels to the left
; given:
; 5 for y,
; "hello" for s, and
; (empty-scene 100 100) for img
; expected:
; (place-image (text "hello" 10 "red") 10 5 (empty-scene 100 100))
(define (add-image y s img)
  (place-image (text s 10 "red") 10 y img))


;; 6. Testing
; (area-of-square 2)    ; 4
; (area-of-square 7)    ; 49
