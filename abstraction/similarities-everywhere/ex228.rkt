;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex228) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Take a look a this data definition:

; A [Bucket ITEM] is
;   (make-bucket N [List-of ITEM]
; interpretation:  the n in the (make-bucket n l) is the length of l
;                  i.e., (= (length l) n) is always true

; When you initiate Bucket with String, IR, and Posn, you get three different data
; collections. Describe each of them with a sentence and with two distinct example.

; Now consider this instantiations:
;  [Bucket [List-of [List-of String]]]

; Construct three distict pieces of data that belong to this collection.

;;----------------------------------------------------------------------------

; A Bucket-with-String is [Bucket String]
    (make-bucket 2 '("abc" "def"))

; A Bucket-with-IR is [Bucket IR]
     (make-bucket 3 (list (make-ir "pen" 1)
                          (make-ir "ball" 100)
                          (make-ir "book" 20)))

; A Bucket-with-Posn is a [Bucket Posn]
     (make-bucket 1 (list (make-posn 3 4)))


(make-bucket 2 (list (list "a" "b" "c")
                     (list "k" "l" "m")))
