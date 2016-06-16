;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname finite-state-machines.v3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; The BW Machine is a FSM that flips from black to white and back to black
; for every key event. Formulate a data representation for the BW Machine.

;---------------------------------------------------------------------------;
(require 2htdp/universe)

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


; A SimulationState.v1 is a FSM-State.


;;; Examples:
; Traffic light
(define fsm-traffic
  (list (make-transition "red" "green")
        (make-transition "green" "yellow")
        (make-transition "yellow" "red")))

; BW Machine
(define fsm-bw
  (list (make-transition "black" "white")
        (make-transition "white" "black")))



; FSM-State FSM-State -> Boolean
; equality predicate for states.

(check-expect (state=? "red" "red") #t)
(check-expect (state=? "green" "red") #f)

(define (state=? s1 s2)
  (string=? s1 s2))


; FSM -> SimulationState.v1
; match the keys pressed by a player with the given FSM
(define (simulate.v1 fsm0)
  (big-bang initial-state
   [to-draw render-state.v1]
   [on-key find-next-state.v1]))

; SimulationState.v1 -> Image
; renders a world state as an image
(define (render-state.v1 s)
  empty-image)

; SimulationState.v1 -> SimulationState.v1
; finds the next state from a key stroke ke and current state cs
(define (find-next-state.v1 cs ke)
  cs)

;;!!
; 1. how the very first SimulationState.v1 is determined?
; 2. How can find-next-state.v1 possibly find the next state when all it is given
;    is the current state and the representation of a key stroke?