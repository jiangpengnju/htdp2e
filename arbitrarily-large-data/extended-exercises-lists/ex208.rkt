;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex208) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Modify the program so that a player can control the left or right movement of the
; dropping block. Each time the player presses the 'left' arrow key, the dropping
; block should shift one column to the left unless it is in column 0 or there is
; already a stack of resting blocks to its left.
; Similarly, each time the player presses the "right" arrow key, the dropping block
; should move one column to the right if possible.


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
(check-random (drop (make-block 0 0)) (make-block 0 1))
(check-random (drop (make-block 4 5)) (make-block 4 6))

(define (drop b)
  (make-block (block-x b) (add1 (block-y b))))


; Number -> Block
; generates new block -- v1: on the column to the right of the current one.
(define (new-block x)
  (block-generate x))


; Number -> Block
; generate a block at a random column different from the current one
(check-satisfied (block-generate 1) not-equal-1?)

(define (block-generate x)
  (block-check-generate x (make-block (random WIDTH) 0)))


; Number Block -> Block
; generative recursion
(define (block-check-generate x candidate)
  (if (equal? x (block-x candidate)) (block-generate x) candidate))


; Block -> Boolean
; use for testing only
(define (not-equal-1? b)
  (not (= 1 (block-x b))))


; Tetris KeyEvent -> Tetris
; key event handler for tetris
(define (ke-handler t ke)
  (cond
    [(and (key=? "left" ke) (can-move-left (tetris-block t) (tetris-landscape t)))
     (make-tetris (move-left (tetris-block t)) (tetris-landscape t))]
    [(and (key=? "right" ke) (can-move-right (tetris-block t) (tetris-landscape t)))
     (make-tetris (move-right (tetris-block t)) (tetris-landscape t))]
    [else t]))


; Block -> Block
; moves a block one SIZE left
(define (move-left b)
  (make-block (sub1 (block-x b)) (block-y b)))


; Block -> Block
; moves a block one SIZE right
(define (move-right b)
  (make-block (add1 (block-x b)) (block-y b)))


; Block Landscape -> Boolean
; computes if the block can move left
(define (can-move-left b l)
  (and (> (block-x b) 0)
       (not (member? (move-left b) l))))


; Block Landscape -> Boolean
(define (can-move-right b l)
  (and (< (block-x b) (- WIDTH 1))
       (not (member? (move-right b) l))))
  

; Number - Tetris
; simple tetris game, with the clock ticking rate r
(define (tetris-main r)
  (big-bang tetris0
            [to-draw tetris-render]
            [on-tick tock r]
            [on-key ke-handler]))