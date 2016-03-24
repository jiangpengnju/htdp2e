;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Add the following two lines to the definitions area:

(define str "helloworld")
(define i 5)

; Then create an expression that deletes the ith position from str. clearly this
; expression creates a shorter string than the given one; contemplate which values
; you may choose for i.


(string-append (substring str 0 i) (substring str (add1 i)))
; the i should be in the range [ 0, (- (string-length str) 1) ]