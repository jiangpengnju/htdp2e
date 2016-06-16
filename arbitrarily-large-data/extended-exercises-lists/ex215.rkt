;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex215) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Represent the FSM from exercise 111 using lists of Transition.v2s;
; ignore error and final states.

; Modify the design of simulate so that it deals with key strokes in the
; apporiate manner now. Follow the design recipe, starting the adaption of
; the data examples.

; Use the revised program to simulate a run of the FSM from ex111 on the
; following sequence of key strokes: "a", "b", "b", "c", and "d".
;---------------------------------------------------------------------------;
(require 2htdp/universe)
(require 2htdp/image)

; A FSM is one of:
;    - '()
;    - (cons Transition FSM)

; Here is a revised data definition for Transition:
;---------------------------------------------------------------------------;
(define-struct ktransition [current key next])
; A Transition.v2 is
;    (make-ktransition FSM-State KeyEvent FSM-State)

; FSM-State is a String that specifies a color.

; interpretation:  A FSM represents the transitions that a finite
;  state machine can take from one state to another in reaction to
;  key strokes


(define-struct fs [fsm current])
; A SimulationState.v2 is a structure:
;    (make-fs FSM FSM-State)


;;; Examples:
; ex111 fsm
(define fsm-111
  (list (make-ktransition "white" "a" "yellow")
        (make-ktransition "yellow" "b" "yellow")
        (make-ktransition "yellow" "c" "yellow")
        (make-ktransition "yellow" "d" "green")))



; FSM-State FSM-State -> Boolean
; equality predicate for states.

(check-expect (state=? "red" "red") #t)
(check-expect (state=? "green" "red") #f)

(define (state=? s1 s2)
  (string=? s1 s2))


; FSM FSM-State -> SimulationState.v2
; match the keys pressed by a player with the given FSM
(define (simulate.v2 a-fsm s0)
  (big-bang (make-fs a-fsm s0)
   [to-draw state-as-colored-square]
   [on-key find-next-state]))


; SimulationState.v2 -> Image
; renders a world state as an image

(check-expect (state-as-colored-square (make-fs fsm-111 "yellow"))
              (square 100 "solid" "yellow"))

(define (state-as-colored-square a-fs)
  (square 100 "solid" (fs-current a-fs)))


; SimulationState.v2 KeyEvent -> SimulationState.v2
; finds the next state from a key stroke ke and current state cs

(check-expect (find-next-state (make-fs fsm-111 "white") "a")
              (make-fs fsm-111 "yellow"))
(check-expect (find-next-state (make-fs fsm-111 "yellow") "b")
              (make-fs fsm-111 "yellow"))
(check-expect (find-next-state (make-fs fsm-111 "yellow") "c")
              (make-fs fsm-111 "yellow"))
(check-expect (find-next-state (make-fs fsm-111 "yellow") "d")
              (make-fs fsm-111 "green"))

(define (find-next-state a-fs ke)
  (make-fs (fs-fsm a-fs)
            (find (fs-fsm a-fs) (fs-current a-fs) ke)))


; FSM FSM-State KeyEvent -> FSM-State
; finds the state matching current in the transition table with given ke

(check-expect (find fsm-111 "white" "a") "yellow")
(check-expect (find fsm-111 "yellow" "b") "yellow")
(check-expect (find fsm-111 "yellow" "c") "yellow")
(check-expect (find fsm-111 "yellow" "d") "green")
(check-error (find fsm-111 "yellow" "k") "not found: yellow k")

(define (find transitions current ke)
  (cond
    [(empty? transitions)
     (error (string-append "not found: " current " " ke))]
    [(and (state=? current (ktransition-current (car transitions)))
          (key=? ke (ktransition-key (car transitions))))
     (ktransition-next (car transitions))]
    [else
     (find (cdr transitions) current ke)]))

; run the fsm 111 simulation
(simulate.v2 fsm-111 "white")