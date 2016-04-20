;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname simple-tetris) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; The game starts with individual blocks dropping from the top of the scene.
; Once it lands on the ground, it comes to a rest and another block starts dropping
; down from some random place.
; A player can control the dropping block with the 'left' and 'right' arrow keys.
; Once a block lands on the floor of the canvas or on top of some already resting
; block, it comes to rest and becomes immovable.
; In a short time, the blocks stack up and, if a stack of blocks reaches the ceiling
; of the canvas, the game is over. Naturally the objective of this game is to land
; as many blocks as possible.


(require 2htdp/image)
(require 2htdp/universe)


; physical constants
(define WIDTH 10)   ; the maximal number of blocks horizontally

; graphical constants
(define SIZE 10)   ; blocks are square
(define BLOCK      ; they are rendered as red squares with black rims
  (overlay (rectangle (- SIZE 1) (- SIZE 1) "solid" "red")
           (rectangle SIZE SIZE "outline" "black")))

(define SCENE-SIZE (* WIDTH SIZE))



; A Tetris is (make-tetris Block Landscape)
; A Landscape is one of:
; - '()
; - (cons Block Landscape)
; Block is (make-block N N)

; interpretation: given (make-tetris (make-block x y) (list b1 b2 ...))
; (x, y) is the logical position of the dropping block, while b1, b2, etc are
; the positions of the resting blocks
; A logical position (x, y) determines how many SIZEs the block is from the
; left-x-and from the top-y.


