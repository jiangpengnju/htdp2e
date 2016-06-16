;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex216) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Consider the following data representation for finite state machines:

; Represent the FSM from ex111 in this context.

; Design the function fsm-simulate, which accepts an FSM.v2 and runs it on
; player's key strokes. If the sequence of key stroke forces the FSM.v2 to reach
; a final state, fsm-simulate stops.
; Hint: The function uses initial field of the given fsm structure to keep
; track of the current state.
;---------------------------------------------------------------------------;

(require 2htdp/universe)
(require 2htdp/image)


(define-struct fsm [initial transitions final])
; An FSM.v2 is a structure:
;  (make-fsm FSM-State LOT FSM-State)
; A LOT is one of:
;  - '()
;  - (cons Transition.v3 LOT)

(define-struct transition [current key next])
; A Transition.v3 is
;    (make-transition FSM-State KeyEvent FSM-State)

; FSM-State is a String that specifies a color.

; interpretation:  A FSM represents the transitions that a finite
;  state machine can take from one state to another in reaction to
;  key strokes


;;; Examples:
; ex111 fsm - The very first state
(define fsm-111
  (make-fsm "white"
            (list (make-transition "white" "a" "yellow")
                  (make-transition "yellow" "b" "yellow")
                  (make-transition "yellow" "c" "yellow")
                  (make-transition "yellow" "d" "green"))
            "green"))

; ex111 fsm - The middle state
(define fsm-111-m
  (make-fsm "yellow"
            (list (make-transition "white" "a" "yellow")
                  (make-transition "yellow" "b" "yellow")
                  (make-transition "yellow" "c" "yellow")
                  (make-transition "yellow" "d" "green"))
            "green"))

; ex111 fsm - The end state
(define fsm-111-e
  (make-fsm "green"
            (list (make-transition "white" "a" "yellow")
                  (make-transition "yellow" "b" "yellow")
                  (make-transition "yellow" "c" "yellow")
                  (make-transition "yellow" "d" "green"))
            "green"))

; FSM-State FSM-State -> Boolean
; equality predicate for states.

(check-expect (state=? "red" "red") #t)
(check-expect (state=? "green" "red") #f)

(define (state=? s1 s2)
  (string=? s1 s2))


; FSM.v2 -> FSM.v2
; match the keys pressed by a player with the given FSM.v2
(define (fsm-simulate a-fsm)
  (big-bang a-fsm
   [to-draw state-as-colored-square]
   [on-key find-next-state]
   [stop-when stop]))


; FSM.v2 -> Boolean
; stops when reach the final state
(define (stop a-fsm)
  (state=? (fsm-initial a-fsm)
           (fsm-final a-fsm)))


; FSM.v2 -> Image
; renders a world state as an image

(check-expect (state-as-colored-square fsm-111)
              (square 100 "solid" "white"))

(define (state-as-colored-square a-fs)
  (square 100 "solid" (fsm-initial a-fs)))


; FSM.v2 KeyEvent -> FSM.v2
; finds the next state from a key stroke ke and current state cs

(check-expect (find-next-state fsm-111 "a")
              fsm-111-m)
(check-expect (find-next-state fsm-111-m "b")
              fsm-111-m)
(check-expect (find-next-state fsm-111-m "c")
              fsm-111-m)
(check-expect (find-next-state fsm-111-m "d")
              fsm-111-e)

(define (find-next-state a-fsm ke)
  (make-fsm (find (fsm-transitions a-fsm) (fsm-initial a-fsm) ke)
            (fsm-transitions a-fsm)
            (fsm-final a-fsm)))


; FSM FSM-State KeyEvent -> FSM-State
; finds the state matching current in the transition table with given ke

(check-expect (find (fsm-transitions fsm-111) "white" "a") "yellow")
(check-expect (find (fsm-transitions fsm-111) "yellow" "b") "yellow")
(check-expect (find (fsm-transitions fsm-111) "yellow" "c") "yellow")
(check-expect (find (fsm-transitions fsm-111) "yellow" "d") "green")
(check-error (find (fsm-transitions fsm-111) "yellow" "k") "not found: yellow k")

(define (find transitions current ke)
  (cond
    [(empty? transitions)
     (error (string-append "not found: " current " " ke))]
    [(and (state=? current (transition-current (car transitions)))
          (key=? ke (transition-key (car transitions))))
     (transition-next (car transitions))]
    [else
     (find (cdr transitions) current ke)]))

; run the fsm 111 simulation
(fsm-simulate fsm-111)