;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex213) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; The BW Machine is a FSM that flips from black to white and back to black
; for every key event. Formulate a data representation for the BW Machine.

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