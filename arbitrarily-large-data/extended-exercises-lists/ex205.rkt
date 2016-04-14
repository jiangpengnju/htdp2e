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
(define NY 20)
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
                (tock-head (first (worm-shape w)) (worm-d w))))) 


; Segment Direction -> Segment
; computes the head position for next time tick,
; current head position and direction

(check-expect (tock-head (make-posn 5 8) "up") (make-posn 5 7))
(check-expect (tock-head (make-posn 10 9) "right") (make-posn 11 9))

(define (tock-head seg d)
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



; Worm KeyEvent -> Worm
; controls the worm w with key event ke

(check-expect (control w1 "down") w1)
(check-expect (control w1 "right") (worm-up-d w1 "right"))
(check-expect (control w1 "left") (worm-up-d w1 "left"))
(check-expect (control w2 "right") w2)
(check-expect (control w2 "left") w2)
(check-expect (control w2 "up") (worm-up-d w2 "up"))
(check-expect (control w2 "down") (worm-up-d w2 "down"))

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
  (make-worm (worm-shape w)
             d))


; Worm -> Boolean
; decides if the game is over
(define (stop? w)
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


; Worm -> Image
; renders the scene when game stops

(check-expect (render-stop (make-worm (list (make-posn 20 3)) "right"))
              (place-image HIT-BORDER
                           (/ WIDTH 2) (* 3/4 HEIGHT)
                           (render (make-worm (list (make-posn 20 3)) "right"))))
(check-expect (render-stop (make-worm (list (make-posn 10 10)
                                            (make-posn 11 10)
                                            (make-posn 11 11)
                                            (make-posn 10 11)
                                            (make-posn 10 10))
                                      "left"))
              (place-image HIT-ITSELF
                           (/ WIDTH 2) (* 3/4 HEIGHT)
                           (render (make-worm (list (make-posn 10 10)
                                            (make-posn 11 10)
                                            (make-posn 11 11)
                                            (make-posn 10 11)
                                            (make-posn 10 10))
                                      "left"))))
                           

(define (render-stop w)
  (render-txt
   (cond
     [(hit-wall? w) HIT-BORDER]
     [(hit-itself? w) HIT-ITSELF])
   (render w)))


; String Image -> Image
; add text to given image im
(define (render-txt txt im)
  (place-image txt
               (/ WIDTH 2) (* 3/4 HEIGHT)
               im))



; Number -> Worm
; simulates a worm with tail.
(define (main-worm-with-tail r)
  (big-bang w2
            [to-draw render]
            [on-tick tock r]
            [on-key control]
            [stop-when stop? render-stop]))

;> (main-worm-with-tail 0.5)