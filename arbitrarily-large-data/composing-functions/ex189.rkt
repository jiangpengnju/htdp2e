;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex189) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Here is the function search:

; Number List-of-numbers -> Boolean
(define (search n alon)
  (cond
    [(empty? alon) #f]
    [else (or (= (first alon) n) (search n (rest alon)))]))

; It determines whether some number occurs in a list of numbers. The function
; may have to traverse the entire list to find out that the number of interest
; isn't contained in the list.

; Develop the function search-sorted, which determins whether a number occurs
; in a sorted list of numbers. The function must take advantage of the fact
; that the list is sorted.


; Number List-of-numbers -> Boolean
; searchs the (ascendingly) sorted list l to find out whether n occurs in the list
(define (search-sorted n alon)
  (cond
    [(empty? alon) #f]
    [(< n (first alon)) #f]
    [(= n (first alon)) #t]
    [else (search-alon n (rest alon))]))