;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname add-expressive-power) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;---------------------------------------------------------------------------;
(require 2htdp/universe)
(require 2htdp/image)

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

(define-struct fs [fsm current])
; A SimulationState.v2 is a structure:
;    (make-fs FSM FSM-State)


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


; FSM FSM-State -> FSM-State
; match the keys pressed by a player with the given FSM
(define (simulate fsm s0)
  (local (; State of the World: FSM-State
          
          ; FSM-State KeyEvent -> FSM-State
          ; finds the next state in the transition table of fsm0
          (define (find-next-state s key-event)
            (find fsm s)))
    
    ; NOW LAUNCH THE WORLD
    (big-bang s0
              [to-draw state-as-colored-square]
              [on-key find-next-state])))


; FSM-State -> Image
; renders current state as colored square

(check-expect (state-as-colored-square "red")
              (square 100 "solid" "red"))

(define (state-as-colored-square s)
  (square 100 "solid" s))


; FSM FSM-State -> FSM-State
; finds the state matching current in the transition table

(check-expect (find fsm-traffic "red") "green")
(check-expect (find fsm-traffic "green") "yellow")
(check-expect (find fsm-traffic "yellow") "red")
(check-error (find fsm-traffic "black") "not found: black")

(define (find transitions current)
  (cond
    [(empty? transitions)
     (error (string-append "not found: " current))]
    [else
     (local ((define s (first transitions)))
       (if (state=? current (transition-current (first transitions)))
           (transition-next (first transitions))
           (find (rest transitions) current)))]))

; run the traffic light simulation
(simulate fsm-traffic "red")