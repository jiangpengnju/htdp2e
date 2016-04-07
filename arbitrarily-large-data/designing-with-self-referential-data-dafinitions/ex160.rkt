;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex160) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Turn the excercise of ex154 into a world program. Its main function, dubbed riot,
; consumes how many ballons the students want to throw; its visulization show one
; balloon dropping after another at a rate of one per second.
; The function produces the list of Posns where the balloons hit.


(require 2htdp/image)
(require 2htdp/universe)


;;;; 1. define constants ;;;;

; N Image -> Image
; generates a column of n copies of img

(check-expect (column 3 IMG) (above IMG
                                    (above IMG
                                           (above IMG
                                                  empty-image))))
(check-expect (column 0 IMG) empty-image)

(define (column n img)
  (cond
    [(zero? n) empty-image]
    [(positive? n) (above img (column (sub1 n) img))]))


; N Image -> Image
; generates a row of n copies of image

(check-expect (row 0 IMG) empty-image)
(check-expect (row 3 IMG) (beside IMG IMG IMG))

(define (row n img)
  (cond
    [(zero? n) empty-image]
    [(positive? n) (beside img (row (sub1 n) img))]))


; constant
(define SEAT-SIZE 10)
(define COL 8)
(define ROW 18)
(define WIDTH (* SEAT-SIZE COL))
(define HEIGHT (* SEAT-SIZE ROW))

(define IMG (circle 10 "solid" "red"))
(define SEAT (square SEAT-SIZE "outline" "black"))
(define MT (empty-scene WIDTH HEIGHT))
(define SEATS (column ROW (row COL SEAT)))
(define HALL (overlay SEATS MT))
(define BALLOON (circle 3 "solid" "red"))


;;;; 2. data definitions ;;;;

; A List-of-posns is one of these:
; - '()
; - (cons Posn List-of-posns)
; interpretation: a list of Posns that represents the balloons' coordinates.


(define-struct pair [balloon# lob])
; A Pair is a structure (make-pair N List-of-posns)
; interpretatoin: (make-pair n lob) means n balloons must yet be thrown
; and the thrown balloons landed at lob

; A RiotWorld is a Pair
; interpretation: the state of the riot


;;;; 3. handlers ;;;;

; RiotWorld -> Image
; adds balloons with the given w's lob to the image of the HALL

(check-expect (to-image (make-pair 10 '())) HALL)
(check-expect (to-image (make-pair 3 (cons (make-posn 20 32)
                                           (cons (make-posn 57 28) '()))))
              (place-image BALLOON
                           20 32
                           (place-image BALLOON
                                        57 28
                                        HALL)))

(define (to-image w)
  (add-balloons (pair-lob w)))


; RiotWorld -> RiotWorld
; adds one balloon thrown at a random position to the current state w,
; if more balloons are wanted to be thrown

(check-random (tock (make-pair 10 '()))
              (make-pair 9 (cons (make-posn (random WIDTH)
                                            (random HEIGHT))
                                 '())))
(check-expect (tock (make-pair 0 (cons (make-posn 19 29) '())))
              (make-pair 0 (cons (make-posn 19 29) '())))

(define (tock w)
  (cond
    [(> (pair-balloon# w) 0)
     (make-pair (sub1 (pair-balloon# w))
                (cons (make-posn (random WIDTH) (random HEIGHT))
                      (pair-lob w)))]
    [else w]))



;;;; auxiliary function(s) ;;; 
; List-of-posns -> Image
; produces an image of the hall with red dots added as specified by alop

(check-expect (add-balloons '()) HALL)
(check-expect (add-balloons (cons (make-posn 20 32)
                                  (cons (make-posn 57 28) '())))
              (place-image BALLOON
                           20 32
                           (place-image BALLOON
                                        57 28
                                        HALL)))

(define (add-balloons alop)
  (cond
    [(empty? alop) HALL]
    [else (place-image BALLOON
                       (posn-x (first alop))
                       (posn-y (first alop))
                       (add-balloons (rest alop)))]))


;;;; 4. main ;;;;
; N -> RiotWorld
; throw n balloons totally, one balloon per second
(define (main n)
  (big-bang (make-pair n '())
            [to-draw to-image]
            [on-tick tock]))