;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex134) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Here is another way of formulating the second cond clause in contains-flatt?:

... (cond
      [(string=? (first a-list-of-names) "Flatt") #true]
      [else (contains-flatt? (rest a-list-of-names))]) ...

; Explain why this expression produces the same answers as the or expression in
; the version of figure 36.
; Which version is better? Explain.


; A: They share same meaning, or "semantics"

;   Which is better? From the perspective of Clarity, I think the 'or' version
;      is better.