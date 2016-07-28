;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname traversing-graphs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define sample-graph
  '((A B E)
    (B E F)
    (C D)
    (D)
    (E C F)
    (F D G)
    (G)))

(define cyclic-graph
  '((A B E)
    (B E F)
    (C B D)
    (D)
    (E C F)
    (F D G)
    (G)))

; A Graph is a [List-of [List-of Node]]

; A Path is [List-of Node]
; interpretation: The list of nodes sepecifies a sequence of
; immediate neighbors that leads from the first Node on the
; list to the last one



; Node Graph -> [List-of Node]
; produces the list of immediate neighbors of n in g
(check-expect (neighbors 'B sample-graph) '(E F))
(check-expect (neighbors 'D sample-graph) '())
(check-error (neighbors 'K sample-graph) "node 'K not found in graph")
(define (neighbors n g)
  (cond
    [(empty? g) (error "node " n " not found in graph")]
    [(symbol=? n (first (first g)))
     (rest (first g))]
    [else (neighbors n (rest g))]))


; Node Node Graph -> [List-of Node]
; finds a path from origination to destination in G;
; if there is no path, the function produces #false

(check-expect (find-path 'C 'D sample-graph) '(C D))
(check-member-of (find-path 'E 'D sample-graph) '(E F D) '(E C D))
(check-expect (find-path 'C 'G sample-graph) #false)

(define (find-path origination destination G)
  (cond
    [(symbol=? origination destination) (list destination)]
    [else
     (local ((define next (neighbors origination G))
             (define candidate (find-path/list next destination G)))
       (cond
         [(boolean? candidate) #false]
         [else (cons origination candidate)]))]))


; [List-of Node] Node Graph -> [Maybe Path]
; finds a path from some node on lo-originations to destination
; if there is no path, the function produces #false
(define (find-path/list lo-os d g)
  (cond
    [(empty? lo-os) #false]
    [else (local ((define candidate (find-path (first lo-os) d g)))
            (cond
              [(boolean? candidate) (find-path/list (rest lo-os) d g)]
              [else candidate]))]))




(find-path 'A 'G sample-graph)