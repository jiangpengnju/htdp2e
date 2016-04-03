;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname computing-with-list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sample Problem: You are working on the contact list for some new cell phone.
; The phone's owner updates -- adds and deletes names -- and cousult this list
; -- looks for specific names -- on various occasions.
; For now, you are assigned the task of designing a function that consumes this
; list of contacts and determine whether it contains the name "Flatt".



; List-of-names -> Boolean
; determines whether "Flatt" occurs on a-list-of-names

(define (contains-flatt? a-list-of-names)
  (cond
    [(empty? a-list-of-names) #f]
    [(cons? a-list-of-names)
     (or (string=? (first a-list-of-names) "Flatt")
         (contains-flatt? (rest a-list-of-names)))]))



; step through this:
(contains-flatt? (cons "Flatt" (cons "C" '())))