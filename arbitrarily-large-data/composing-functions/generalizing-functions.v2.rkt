;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname generalizing-functions.v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Polygon is one of: 
; – (list Posn Posn Posn)
; – (cons Posn Polygon)
 
(define MT (empty-scene 50 50))
 
; Polygon -> Image 
; adds an image of p to MT
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
(define (last p)
  (cond
    [(empty? (rest (rest (rest p)))) (third p)]
    [else (last (rest p))]))