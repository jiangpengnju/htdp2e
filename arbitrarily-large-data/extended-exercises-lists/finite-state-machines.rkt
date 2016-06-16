;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname finite-state-machines) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A natural thought is to look for a general solution, that is, a world program
; that consumes a data description of a FSM and then recognizes whether a player 
; presses a matching sequence of keys. This section presents the design of just
; such a world program, though a greatly simplified one. In particular, the FSMs
; come without initial or final states and they ignore the actual key strokes;
; instead they transition from one state to another whenever any key is pressed.
; Furthermore, we require that the states are color strings. That way, the
; FSM-interpreting program can simply display the current state as a color.


;; NOTE: You can not design this program with the priciples of the first two parts.
;  Indeed, solving this problem has to wait until "Algorithms that Backtrack;
;   see exercise 450.

;---------------------------------------------------------------------------;


; A FSM is one of:
;    - '()
;    - (cons Transition FSM)

(define-struct transition [current next])
; A Transition is
;    (make-transition FSM-State FSM-State)

; FSM-State is a String that specifies a color.

; interpretation:  A FSM represents the transitions that a finite
;  state machine can take from one state to another in reaction to
;  key strokes

