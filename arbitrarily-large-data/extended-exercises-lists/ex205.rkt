;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex205) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Equip your program from ex204 with food. At any point in time, the box should
; contain one piece of food. To keep things simple, a piece of food is of the same
; size as worm segment. When the worm's head is located at the same position as the
; food, the worm eats the food, meaning the worm's tail is txtended by one segment.
; As the piece of food is eaten, another one shows up at a different location.




(require 2htdp/image)
(require 2htdp/universe)


; constants
(define R 5)
(define D (* 2 R))
(define NX 20)
(define NY NX)
(define MAX NX)
(define WIDTH (* NX D))
(define HEIGHT (* NY D))
(define HIT-BORDER-TXT "worm hit border")
(define HIT-ITSELF-TXT "worm hit itself")
(define FONT-SIZE 15)
(define FONT-COLOR "black")

; visual constants
(define SEG (circle R "solid" "red"))
(define FOOD (circle R "solid" "green"))
(define HEAD SEG)
(define MT (empty-scene WIDTH HEIGHT))
(define HIT-BORDER (text HIT-BORDER-TXT FONT-SIZE FONT-COLOR))
(define HIT-ITSELF (text HIT-ITSELF-TXT FONT-SIZE FONT-COLOR))


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


(define-struct world-state (worm food))
; A WorldState is a structure: (make-world-state Worm Posn)
; interpretation: (make-world-state w p) represents the current state of the game: w
;    for the worm, p for the position of food.

(define s1 (make-world-state w1 (make-posn 8 9)))
(define s2 (make-world-state w2 (make-posn 5 5)))
(define s3 (make-world-state w3 (make-posn 15 11)))   ; about-to-eat


; WorldState -> Image
; add the image of worm and food according to the ws

(check-expect (render-world-state s1)
              (place-image FOOD
                           (+ R (* 8 D)) (+ R (* 9 D))
                           (render-worm w1)))

(define (render-world-state ws)
  (render-food (world-state-food ws)
               (render-worm (world-state-worm ws))))


; Posn Image -> Image
; add image of food at position p to given im

(check-expect (render-food (make-posn 8 9) MT)
              (place-image FOOD
                           (+ R (* 8 D)) (+ R (* 9 D))
                           MT))

(define (render-food p im)
  (place-image FOOD
               (+ R (* D (posn-x p))) (+ R (* D (posn-y p)))
               im))


; Worm -> Image
; adds the image of all segments of w onto the scene

(check-expect (render-worm w1) (place-image SEG (+ R (* 5 D)) (+ R (* 8 D)) MT))

(define (render-worm w)
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


; WorldState -> WorldState
; moves the worm one step more; handle food eating, if get a food

(check-expect (tock-world-state s1)
              (make-world-state (make-worm (list (make-posn 5 7)) "up")
                                (make-posn 8 9)))
(check-random (tock-world-state s3)
              (make-world-state (make-worm (list (make-posn 15 11)
                                                 (make-posn 15 10)
                                                 (make-posn 15 9)
                                                 (make-posn 14 9)) "down")
                                (food-create (make-posn 15 11))))

(define (tock-world-state ws)
  (cond
    [(about-to-eat? ws)
     (make-world-state (worm-fed (world-state-worm ws) (world-state-food ws))
                       (food-create (world-state-food ws)))]
    [else
     (make-world-state (tock-worm (world-state-worm ws))
                       (world-state-food ws))]))


; Worm Posn -> Worm
; generates a worm just after feeding by food at position p

(check-expect (worm-fed w3 (make-posn 15 11))
              (make-worm (list (make-posn 15 11)
                               (make-posn 15 10)
                               (make-posn 15 9)
                               (make-posn 14 9)) "down"))

(define (worm-fed w p)
  (make-worm (add-at-head (worm-shape w) p)
             (worm-d w)))


; WorldState -> Boolean
; check if the worm can get the food, in the given ws

(check-expect (about-to-eat? s1) #f)
(check-expect (about-to-eat? s3) #t)

(define (about-to-eat? ws)
  (equal? (world-state-food ws)
          (tock-head (world-state-worm ws))))


; Posn -> Posn
; create food at a random position except for the orign p AND the body of the worm

(check-satisfied (food-create (make-posn 1 1)) not-equal-1-1?)

(define (food-create p)
  (food-check-create p (make-posn (random MAX) (random MAX))))


; Posn Posn -> Posn
; generative recursion
; if generated position is the same as the origin one, try again
(define (food-check-create p candidate)
  (if (equal? p candidate) (food-create p) candidate))


; Posn -> Boolean
; use for testing only
(define (not-equal-1-1? p)
  (not (and (= (posn-x p) 1) (= (posn-y p) 1))))


; Worm -> Worm
; moves given worm w one step from its current direction.

(check-expect (tock-worm w1) (make-worm (list (make-posn 5 7)) "up"))
(check-expect (tock-worm w2) (make-worm (list (make-posn 11 9)
                                              (make-posn 10 9)
                                              (make-posn 9 9)) "right"))

(define (tock-worm w)
  (worm-up-shape w (tock-shape w)))


; Worm NELos -> Worm
; Worm' shape field updator
(define (worm-up-shape w segs)
  (make-worm segs
             (worm-d w)))


; Worm -> NELos
; produces the shape of given worm for next time tick.

(check-expect (tock-shape w1) (list (make-posn 5 7)))
(check-expect (tock-shape w2) (list (make-posn 11 9)
                                    (make-posn 10 9)
                                    (make-posn 9 9)))

(define (tock-shape w)
  (cut-the-last
   (add-at-head (worm-shape w)
                (tock-head w)))) 


; Worm -> Segment
; computes the head position for next time tick
(define (tock-head w)
  (advance (first (worm-shape w)) (worm-d w)))

; Segment Direction -> Segment
; computes the position for next time tick,
; current position and direction

(check-expect (advance (make-posn 5 8) "up") (make-posn 5 7))
(check-expect (advance (make-posn 10 9) "right") (make-posn 11 9))

(define (advance seg d)
  (cond
    [(string=? "left" d) (make-posn (sub1 (posn-x seg)) (posn-y seg))]
    [(string=? "right" d) (make-posn (add1 (posn-x seg)) (posn-y seg))]
    [(string=? "up" d) (make-posn (posn-x seg) (sub1 (posn-y seg)))]
    [(string=? "down" d) (make-posn (posn-x seg) (add1 (posn-y seg)))]))


; NELos Segment -> NELos
; add a new head segment at the head of nelos
(define (add-at-head nelos head)
  (cons head nelos))


; Nelos -> Nelos
; cut the last segment of given nelos which contains at least 2 segments

(check-expect (cut-the-last (list (make-posn 5 7)
                                  (make-posn 5 8)))
              (list (make-posn 5 7)))
(check-expect (cut-the-last (list (make-posn 11 9)
                                  (make-posn 10 9)
                                  (make-posn 9 9)
                                  (make-posn 8 9)))
              (list (make-posn 11 9)
                    (make-posn 10 9)
                    (make-posn 9 9)))

(define (cut-the-last nelos)
  (cond
    [(empty? (rest (rest nelos))) (list (first nelos))]
    [else (cons (first nelos)
                (cut-the-last (rest nelos)))]))


; WorldState KeyEvent -> WorldState
; controls the worm movement by keyboard
(define (control ws ke)
  (world-state-up-worm ws
                       (control-worm (world-state-worm ws) ke)))


; WorldState Worm -> WorldState
; WorldState's updator for worm field
(define (world-state-up-worm ws worm)
  (make-world-state worm
                    (world-state-food ws)))


; WorldState Posn -> WorldState
; WorldState's updator for food field
(define (worm-state-up-food ws p)
  (make-world-state (world-state-worm ws)
                    p))


; Worm KeyEvent -> Worm
; controls the worm w with key event ke

(check-expect (control-worm w1 "down") w1)
(check-expect (control-worm w1 "right") (worm-up-d w1 "right"))
(check-expect (control-worm w1 "left") (worm-up-d w1 "left"))
(check-expect (control-worm w2 "right") w2)
(check-expect (control-worm w2 "left") w2)
(check-expect (control-worm w2 "up") (worm-up-d w2 "up"))
(check-expect (control-worm w2 "down") (worm-up-d w2 "down"))

(define (control-worm w ke)
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
  (make-worm (worm-shape w)
             d))



; WorldState -> Boolean
; decides if the game is over
(define (stop? ws)
  (stop-worm? (world-state-worm ws)))


; Worm -> Boolean
; decides if the game is over
(define (stop-worm? w)
  (or (hit-wall? w)
      (hit-itself? w)))


; Worm -> Boolean
; decides if the worm hits the wall

(check-expect (hit-wall? w1) #f)
(check-expect (hit-wall? (make-worm (list (make-posn 20 3)) "right")) #t)

(define (hit-wall? w)
  (or (< (posn-x (first (worm-shape w))) 0)
      (> (posn-x (first (worm-shape w))) (sub1 NX))
      (< (posn-y (first (worm-shape w))) 0)
      (> (posn-y (first (worm-shape w))) (sub1 NY))))


; Worm -> Boolean
; decides if the worm hits itself

(check-expect (hit-itself? w1) #f)
(check-expect (hit-itself? (make-worm (list (make-posn 10 10)
                                            (make-posn 11 10)
                                            (make-posn 11 11)
                                            (make-posn 10 11)
                                            (make-posn 10 10))
                                      "left"))
              #t)

(define (hit-itself? w)
  (cond
    [(or (empty? (worm-shape w)) (empty? (rest (worm-shape w)))) #f]
    [else
     (member? (first (worm-shape w)) (rest (worm-shape w)))]))


; WorldState -> Image
; renders the scene when game stops
(define (render-stop ws)
  (render-stop-worm (world-state-worm ws)))


; Worm -> Image
; renders the worm when game stops

(check-expect (render-stop-worm (make-worm (list (make-posn 20 3)) "right"))
              (place-image HIT-BORDER
                           (/ WIDTH 2) (* 3/4 HEIGHT)
                           (render-worm (make-worm (list (make-posn 20 3)) "right"))))
(check-expect (render-stop-worm (make-worm (list (make-posn 10 10)
                                            (make-posn 11 10)
                                            (make-posn 11 11)
                                            (make-posn 10 11)
                                            (make-posn 10 10))
                                      "left"))
              (place-image HIT-ITSELF
                           (/ WIDTH 2) (* 3/4 HEIGHT)
                           (render-worm (make-worm (list (make-posn 10 10)
                                                         (make-posn 11 10)
                                                         (make-posn 11 11)
                                                         (make-posn 10 11)
                                                         (make-posn 10 10))
                                                   "left"))))


(define (render-stop-worm w)
  (render-txt
   (cond
     [(hit-wall? w) HIT-BORDER]
     [(hit-itself? w) HIT-ITSELF])
   (render-worm w)))


; String Image -> Image
; add text to given image im
(define (render-txt txt im)
  (place-image txt
               (/ WIDTH 2) (* 3/4 HEIGHT)
               im))



; Number Boolean -> Number
; simulates a worm with tail, with randomly generated food;
; display the final length of the tails~
(define (main-worm r s)
  (worm-length
   (big-bang s2
            [to-draw render-world-state]
            [on-tick tock-world-state r]
            [on-key control]
            [stop-when stop? render-stop]
            [state s])))


; WorldState -> Number
; calculates the length of the worm with given ws
(define (worm-length ws)
  (length (worm-shape (world-state-worm ws))))


(main-worm 0.2 #f)

;> (main-worm 0.5)