;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex206) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; When you are presented with a complex data definition-- like the one for the state
; of a Tetris game-- you start by creating instances of the various data collections.
; Here are some suggestive names for examples you can later use for functional examples:
; ...
; Design the program tetris-render, which turns a given instance of Tetris into an
; Image. Use DrRacket's interaction area to develop the expression that renders some
; of your (extremely) simple data examples. Then formulate the functional examples
; as unit tests and the function itself.

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
(define block-dropping (make-block 5 0))
(define tetris0 (make-tetris block-dropping landscape0))
(define tetris0-drop (make-tetris (make-block 5 6) (list (make-block 5 9)
                                                         (make-block 7 9))))
(define block-landed (make-block 0 (- HEIGHT 1)))
(define block-on-block (make-block 0 (- HEIGHT 2)))



; Tetris -> Image
; turns given tetris t into an image
(check-expect (tetris-render tetris0)
              (place-image BLOCK
                           (+ HALF (* 5 SIZE)) (+ HALF (* 0 SIZE))
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