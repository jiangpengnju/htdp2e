;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex136) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


; List-of-names -> Boolean
; determines whether "Flatt" occurs on a-list-of-names

(define (contains-flatt? a-list-of-names)
  (cond
    [(empty? a-list-of-names) #f]
    [(cons? a-list-of-names)
     (or (string=? (first a-list-of-names) "Flatt")
         (contains-flatt? (rest a-list-of-names)))]))



; Use DrRacket's stepper to check the calculation for:
(contains-flatt? (cons "Flatt" (cons "C" '())))
; Also use the stepper to determine the value of
(contains-flatt? (cons "A" (cons "Flatt" (cons "C" '()))))
; What happens when "Flatt" is replaced with "B"?
