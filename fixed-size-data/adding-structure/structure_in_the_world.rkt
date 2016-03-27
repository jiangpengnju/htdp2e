;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname structure_in_the_world) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; When a world program must track two different and independent pieces of information,
; we must use a collection of structures to represent the word state data.
; One field keeps track of one piece of information and the other field the second
; piece of infromation.


; Consider a space invader game, in which a UFO descends along a straight vertical
; line and some tank moves horizontally at the bottom of a scene. If BOTH objects
; move at known constant speeds, all that's needed to describe these two objects
; is one piece of infromation per object: the y-coordinate for the UFO and the
; x-coordinate for the tank. Putting these TOGETHER requires a structure with
; two fields:


(define-struct space-game [ufo tank])
; A Space-Game is a structure: (make-space-game Number Number)
; interpretation: (make-space-game uy tx) means that the UFO' y-coordinate is
;               currently uy, and the tank's x-coordinate is at tx.

(define ex1 (make-space-game 20 30))
(define ex2 (make-space-game 33 18))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clearly, a UFO that descends only along a vertical line is boring. To turn this
; idea into an interesting game where the tank attacks the UFO with some weapon,
; the UFO must be able to descend in non-trivial lines, perhaps jumping randomly.
; An implementation of this idea means that we need two coordinates to describe
; the location of the UFO, so that our revised data definition for the space
; game becomes:


; SpaceGame is (make-space-game Posn Number).
; interpretation: (make-space-game (make-posn ux uy) tx) means that the UFO is
;       currently at (ux, uy) and the tank's coordinate is tx.