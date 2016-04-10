;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex203) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Develop a data representation for worms with tails. A worm's tail is
; a possibly empty sequence of "connected" segments. Here "connected" means that
; the coordinates of a segment differ grom those of its predecessor in at most
; one direction and, if rendered, the two segments touch. To keep things simple,
; treat all segments -- head and tail segments -- the same.

; Then modify your program form ex201 to accommodate a multi-segment worm.
; Keep things simple: (1) your program may render all worm segments as red disks;
; (2) one way to think of the worm's movement is to add a segment in the direction
; in which it is moving and to delete the last segment; and (3) ignore that the
; worm may run into the wall or into itself.


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
(define HEAD SEG)
(define MT (empty-scene WIDTH HEIGHT))


; A Direction is one of:
; - "left"
; - "right"
; - "up"
; - "down"


; A Segment is a Posn
; interpretation: an instance of Segment represents one logical position

; A NELos (Non-empty list of segments) is one of:
; - (cons Segment '())
; - (cons Segment Tail)
; interpretation: an instance of NELos represents the location of a worm (logically).
(define l1 (cons (make-posn 5 8) '()))
(define l2 (list (make-posn 10 9)
                 (make-posn 9 9)
                 (make-posn 8 9)))
(define l3 (list (make-posn 15 10)
                 (make-posn 15 9)
                 (make-posn 14 9)))


(define-struct worm [shape d])
; A head is a structure: (make-worm NELos Direction)
; interpretation: (make-head nelos d) represents a worm has the shape shown as nelos,
; and heading to direction d

(define w1 (make-worm l1 "up"))
(define w2 (make-worm l2 "right"))
(define w3 (make-worm l3 "down"))



; Worm -> Image
; adds the image of all segments of w onto the scene

(check-expect (render w1) (place-image SEG (+ R (* 5 D)) (+ R (* 8 D)) MT))

(define (render w)
  (render-segments (worm-shape w)))


; NELos -> Image
; add image of Segment to all the segments in the nelos

(check-expect (render-segments (list (make-posn 5 8)))
              (place-image SEG (+ R (* 5 D)) (+ R (* 8 D)) MT))
(check-expect (render-segments (list (make-posn 10 9)
                                     (make-posn 9 9)
                                     (make-posn 8 9)))
              (place-image SEG (+ R (* 10 D)) (+ R (* 9 D))
                           (place-image SEG (+ R (* 9 D)) (+ R (* 9 D))
                                        (place-image SEG (+ R (* 8 D)) (+ R (* 9 D)) MT))))

(define (render-segments nelos)
  (cond
    [(empty? (rest nelos)) (render-seg MT (first nelos))]
    [else
     (render-seg (render-segments (rest nelos)) (first nelos))]))


; Image Segment -> Image
; form a new image by adding SEG onto im

(check-expect (render-seg MT (make-posn 0 0))
              (place-image SEG
                           R R
                           MT))
(check-expect (render-seg MT (make-posn 5 8))
              (place-image SEG
                           (+ R (* 5 D)) (+ R (* 8 D))
                           MT))

(define (render-seg im seg)
  (place-image SEG
               (+ R (* (posn-x seg) D)) (+ R (* (posn-y seg) D)) 
               im))


; Worm -> Worm
; moves given worm w one its current direction.

(check-expect (tock w1) (make-worm (list (make-posn 5 7)) "up"))
(check-expect (tock w2) (make-worm (list (make-posn 11 9)
                                         (make-posn 10 9)
                                         (make-posn 9 9)) "right"))

(define (tock w)
  w)



; Worm KeyEvent -> Worm
; key event handler for Worm w
(define (control w ke)
  w)



; Number -> 
; simulates a worm with tail.
(define (main-worm-with-tail r)
  (big-bang l1
            [to-draw render]
            [on-tick tock r]
            [on-key control]))