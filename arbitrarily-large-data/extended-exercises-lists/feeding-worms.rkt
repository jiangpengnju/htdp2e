;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname feeding-worms) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worm -- also known as Snake -- is one of the oldest computer games. When the game
; starts, a worm and a piece of food appear. The worm is moving toward a wall. Don't
; let it run into the wall; otherwise the game is over. Instead, use the arrow keys
; to control the worm's movements.

; The goal of the game is to have the worm eat as much food as possible. As the worm
; eats the food, it becomes longer; more and more segments appear. Once a piece of
; food is digested, another piece appears. The worm's growth endagers the worm
; itself, though. As it grows large enough, it can run into itself and, if it does,
; the game is over, too.


