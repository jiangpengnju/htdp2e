;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex207) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the interactive program tetris-main, which displays blocks dropping in a
; straight line from the top of the canvas and landing on the floor or on
; blocks that are really resting. The input to tetris-main should determine the
; rate at which the clock ticks.

; To discover whether a block landed, we suggest you drop it and check whether it is
; on the floor or it overlaps with one of the blocks on the list of resting block.
; Hint: Read up on the BSL+ primitive member?.

; When a block lands, your program should immediately create another block that
; descends on the column to the right of the current one. If the current block is
; already in the right-most column, the next block should use the left-most one.
; Alternatively, define the function block-generate, which randomly selects a
; column different from the current one; see ex205 for inspiration.


(require 2htdp/image)
(require 2htdp/universe)


; physical constants
(define WIDTH 10)   ; the maximal number of blocks horizontally
(define HEIGHT 10)

; graphical constants
(define SIZE 10)   ; blocks are square
(define HALF (/ SIZE 2))
(define BLOCK      ; they are rendered as red squares with black rims
  (overlay (rectangle (- SIZE 1) (- SIZE 1) "solid" "red")
           (rectangle SIZE SIZE "outline" "black")))

(define SCENE-SIZE (* WIDTH SIZE))
(define MT (empty-scene SCENE-SIZE SCENE-SIZE))


; A Tetris is (make-tetris Block Landscape)
(define-struct tetris [block landscape])
; A Landscape is one of:
; - '()
; - (cons Block Landscape)
; Block is (make-block N N)
(define-struct block [x y])

; interpretation: given (make-tetris (make-block x y) (list b1 b2 ...))
; (x, y) is the logical position of the dropping block, while b1, b2, etc are
; the positions of the resting blocks
; A logical position (x, y) determines how many SIZEs the block is from the
; left-x-and from the top-y.

(define landscape0 '())
(define block-dropping (make-block 4 0))
(define tetris0 (make-tetris block-dropping landscape0))
(define tetris0-drop (make-tetris (make-block 5 6) (list (make-block 5 9)
                                                         (make-block 7 9))))
(define block-landed (make-block 0 (- HEIGHT 1)))
(define block-on-block (make-block 0 (- HEIGHT 2)))



; Tetris -> Image
; turns given tetris t into an image
(check-expect (tetris-render tetris0)
              (place-image BLOCK
                           (+ HALF (* 4 SIZE)) (+ HALF (* 0 SIZE))
                           MT))
(check-expect (tetris-render tetris0-drop)
              (place-image BLOCK
                           (+ HALF (* 5 SIZE)) (+ HALF (* 6 SIZE))
                           (place-image BLOCK
                                        (+ HALF (* 5 SIZE)) (+ HALF (* 9 SIZE))
                                        (place-image BLOCK
                                                     (+ HALF (* 7 SIZE))
                                                     (+ HALF (* 9 SIZE))
                                                     MT))))

(define (tetris-render t)
  (render-block (tetris-block t)
                (render-landscape (tetris-landscape t))))


; Block Image -> Image
; add the image of Block at the position b onto the im
(check-expect (render-block (make-block 4 5) MT)
              (place-image BLOCK
                           (+ HALF (* 4 SIZE)) (+ HALF (* 5 SIZE))
                           MT))

(define (render-block b im)
  (place-image BLOCK
               (+ HALF (* (block-x b) SIZE)) (+ HALF (* (block-y b) SIZE))
               im))


; Landscape -> Image
; renders the landscape on the MT
(check-expect (render-landscape (list (make-block 5 9)
                                      (make-block 7 9)))
              (place-image BLOCK
                           (+ HALF (* 5 SIZE)) (+ HALF (* 9 SIZE))
                           (place-image BLOCK
                                        (+ HALF (* 7 SIZE))
                                        (+ HALF (* 9 SIZE))
                                        MT)))
(check-expect (render-landscape '()) MT)

(define (render-landscape l)
  (cond
    [(empty? l) MT]
    [else
     (render-block (first l)
                   (render-landscape (rest l)))]))


; Tetris -> Tetris
; computes tetris for next clock tick, with given t
(check-expect (tock tetris0-drop)
              (make-tetris (make-block 5 7)
                           (list (make-block 5 9) (make-block 7 9))))
(check-expect (tock (make-tetris block-on-block
                                 (list block-landed)))
              (make-tetris (make-block 1 0)
                           (list block-on-block block-landed)))

(define (tock t)
  (if (landed? (tetris-block t) (tetris-landscape t))
      (make-tetris (new-block (block-x (tetris-block t)))
                   (cons (tetris-block t) (tetris-landscape t)))
      (make-tetris (drop (tetris-block t)) (tetris-landscape t))))


; Block Landscape -> Boolean
; discovers whether given block b already landed
(check-expect (landed? block-landed '()) #t)
(check-expect (landed? block-on-block (list block-landed)) #t)
(check-expect (landed? (make-block 4 5) '()) #f)

(define (landed? b l)
  (or (= (- HEIGHT 1) (block-y b))
      (member? (drop b) l)))


; Block -> Block
; adds 1 to the y field of given block b
(check-expect (drop (make-block 0 0)) (make-block 0 1))
(check-expect (drop (make-block 4 5)) (make-block 4 6))

(define (drop b)
  (make-block (block-x b) (add1 (block-y b))))


; Number -> Block
; generates new block -- v1: on the column to the right of the current one.
(check-expect (new-block 0) (make-block 1 0))
(check-expect (new-block 9) (make-block 0 0))

(define (new-block x)
  (make-block (modulo (add1 x) WIDTH) 0))

; Number - Tetris
; simple tetris game, with the clock ticking rate r
(define (tetris-main r)
  (big-bang tetris0
            [to-draw tetris-render]
            [on-tick tock r]))