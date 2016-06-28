;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname trees) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ancestor Family Tree

(define-struct no-parent [])

(define-struct child [father mother name date eyes])

(define MTFT (make-no-parent))

; A FT (family tree) is one of:
;    - MTFT
;    - (make-child FT FT String N String]


; Oldest Generation:
(define Carl (make-child MTFT MTFT "Carl" 1926 "green"))
(define Bettina (make-child MTFT MTFT "Bettina" 1926 "green"))

; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "yellow"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child MTFT MTFT "Fred" 1966 "pink"))
 
; Youngest Generation: 
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))



; FT -> ???
; ...
(define (fun-for-FT a-ftree)
  (cond
    [(no-parent? a-ftree) ...]
    [else   ; (child? a-ftree)
     (... (fun-for-FT (child-father a-ftree)) ...
      ... (fun-for-FT (child-mother a-ftree)) ...
      ... (child-name a-ftree) ...
      ... (child-date a-ftree) ...
      ... (child-eyes a-ftree) ...)]))
