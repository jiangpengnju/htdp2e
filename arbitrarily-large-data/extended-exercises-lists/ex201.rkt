;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex201) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design an interactive GUI program that continually moves a one-segment worm
; and enables a player to control the movement of the worm with the four
; cardinal arrow keys. Your program should use a red disk to render the
; one-and-only segment of the worm. For each clock tick, the worm should move
; a diameter.


(require 2htdp/image)
(require 2htdp/universe)


; constants
(define R 5)
(define D (* 2 R))
(define NX 20)
(define NY 20)
(define WIDTH (* NX D))
(define HEIGHT (* NY D))

; visual constants
(define SEG (circle R "solid" "red"))
(define MT (empty-scene WIDTH HEIGHT))


; A Direction is one of:
; - "left"
; - "right"
; - "up"
; - "down"

(define-struct worm [x y d])
; A Worm is a structure: (make-worm N N Direction)
; interpretation: (make-worm x y d) represents a worm that is x segments from left
; and y segments from top, and its current moving direction is d

(define ex1 (make-worm 0 0 "down"))
(define ex2 (make-worm 5 8 "right"))
(define ex3 (make-worm 10 5 "left"))
(define ex4 (make-worm 19 19 "up"))



; Worm -> Image
; adds the image of worm onto the scene

(check-expect (render ex1)
              (place-image SEG
                           R R
                           MT))
(check-expect (render ex2)
              (place-image SEG
                           (+ R (* 5 D)) (+ R (* 8 D))
                           MT))
(check-expect (render ex4)
              (place-image SEG
                           (+ R (* 19 D)) (+ R (* 19 D))
                           MT))

(define (render w)
  (place-image SEG
               (+ R (* (worm-x w) D)) (+ R (* (worm-y w) D)) 
               MT))


; Worm -> Worm
; moves given worm w one D at its current direction.

(check-expect (tock ex1) (make-worm 0 1 "down"))
(check-expect (tock ex2) (make-worm 6 8 "right"))
(check-expect (tock ex3) (make-worm 9 5 "left"))
(check-expect (tock ex4) (make-worm 19 18 "up"))

(define (tock w)
  (cond
    [(string=? "left" (worm-d w)) (worm-up-x w (sub1 (worm-x w)))]
    [(string=? "right" (worm-d w)) (worm-up-x w (add1 (worm-x w)))]
    [(string=? "up" (worm-d w)) (worm-up-y w (sub1 (worm-y w)))]
    [(string=? "down" (worm-d w)) (worm-up-y w (add1 (worm-y w)))]))


; Worm Number -> Worm
; Worm's x field updater
(define (worm-up-x w x)
  (make-worm x
             (worm-y w)
             (worm-d w)))

; Worm Number -> Worm
; Worm's y field updater
(define (worm-up-y w y)
  (make-worm (worm-x w)
             y
             (worm-d w)))


; Worm KeyEvent -> Worm
; controls the worm w with key event ke

(check-expect (control ex1 "down") ex1)
(check-expect (control ex1 "right") (worm-up-d ex1 "right"))
(check-expect (control ex1 "left") (worm-up-d ex1 "left"))
(check-expect (control ex2 "right") ex2)
(check-expect (control ex2 "left") ex2)
(check-expect (control ex2 "up") (worm-up-d ex2 "up"))
(check-expect (control ex2 "down") (worm-up-d ex2 "down"))

(define (control w ke)
  (cond
    [(and (key=? "left" ke)
          (or (string=? "up" (worm-d w))
              (string=? "down" (worm-d w))))
     (worm-up-d w "left")]
    [(and (key=? "right" ke)
          (or (string=? "up" (worm-d w))
              (string=? "down" (worm-d w))))
     (worm-up-d w "right")]
    [(and (key=? "up" ke)
          (or (string=? "left" (worm-d w))
              (string=? "right" (worm-d w))))
     (worm-up-d w "up")]
    [(and (key=? "down" ke)
          (or (string=? "left" (worm-d w))
              (string=? "right" (worm-d w))))
     (worm-up-d w "down")]
    [else w]))


; Worm Direction -> Worm
; worm's d field updater
(define (worm-up-d w d)
  (make-worm (worm-x w)
             (worm-y w)
             d))


; main
; Number -> Worm
; simulates a worm game at the tick rate r
(define (worm-main r)
  (big-bang
   (make-worm 5 9 "right")
   [to-draw render]
   [on-tick tock r]
   [on-key control]))


