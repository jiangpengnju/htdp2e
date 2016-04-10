;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex193) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Here are two more ideas for defining render-poly:

; 1. render-poly could cons the last item of p onto p and then call connect-dots.

; 2. render-poly could add the first item of p to the end of p via a version of
; add-at-end that works on Polygons.

; Use both ideas to define render-poly; make sure both definitions pass the
; test cases.


(require 2htdp/image)

; A Polygon is one of: 
; – (list Posn Posn Posn)
; – (cons Posn Polygon)

(define MT (empty-scene 50 50))

; Polygon -> Image 
; adds an image of p to MT

(check-expect
 (render-polygon
  (list (make-posn 20 0) (make-posn 10 10) (make-posn 30 10)))
 (scene+line
  (scene+line
   (scene+line MT 20 0 10 10 "red")
   10 10 30 10 "red")
  30 10 20 0 "red"))

(define (render-polygon p)
  (render-line (connect-dots p) (first p) (last p)))

; A NELoP is one of: 
; – (cons Posn '())
; – (cons Posn NELoP)

; NELoP -> Image
; connects the Posns in p in an image
(define (connect-dots p)
  (cond
    [(empty? (rest p)) MT]
    [else
     (render-line
      (connect-dots (rest p)) (first p) (second p))]))

; Image Posn Posn -> Image 
; draws a red line from Posn p to Posn q into im
(define (render-line im p q)
  (scene+line
   im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))

; Polygon -> Posn
; extracts the last item from p

(check-expect (last (list (make-posn 10 10)
                          (make-posn 20 10)
                          (make-posn 20 20)
                          (make-posn 10 20)))
              (make-posn 10 20))

(define (last p)
  (cond
    [(empty? (rest (rest (rest p)))) (third p)]
    [else (last (rest p))]))


; Polygon -> Image
; adds an image of p onto MT  .v1

(check-expect
 (render-poly.v1
  (list (make-posn 20 0) (make-posn 10 10) (make-posn 30 10)))
 (scene+line
  (scene+line
   (scene+line MT 20 0 10 10 "red")
   10 10 30 10 "red")
  30 10 20 0 "red"))

(define (render-poly.v1 p)
  (connect-dots (cons (last p) p)))


; Polygon -> Image
; adds an image of p onto MT  .v2

(check-expect
 (render-poly.v2
  (list (make-posn 20 0) (make-posn 10 10) (make-posn 30 10)))
 (scene+line
  (scene+line
   (scene+line MT 20 0 10 10 "red")
   10 10 30 10 "red")
  30 10 20 0 "red"))

(define (render-poly.v2 p)
  (connect-dots (add-at-end (first p) p)))


; Posn Polygon -> Polygon
; add Posn p to the end of poly

(check-expect (add-at-end (make-posn 1 2)
                          (list (make-posn 10 10)
                                (make-posn 20 10)
                                (make-posn 20 20)
                                (make-posn 10 20)))
              (list (make-posn 10 10)
                    (make-posn 20 10)
                    (make-posn 20 20)
                    (make-posn 10 20)
                    (make-posn 1 2)))

(define (add-at-end p poly)
  (cond
    [(empty? (rest (rest (rest poly))))
     (list (first poly) (second poly) (third poly) p)]
    [else
     (cons (first poly) (add-at-end p (rest poly)))]))