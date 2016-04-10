;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex195) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Complete the definitions of string->word and word->string.
; Hint: You may wish to look in the list of functions that BSL provides.


(require 2htdp/batch-io)



; constants
; On OS X:
(define DICTIONARY-LOCATION "/usr/share/dict/words")



; A Word is one of:
; - '()
; (cons 1String Word)
; interpretation: a String as a list of single Strings (letters)

(define word1 (list "c" "a" "t"))
(define word2 (list "r" "a" "t"))


; A List-of-words is one of:
; - '()
; (cons Word List-of-words)

(define low1 (list word1 word2))



; String -> List-of-strings
; find all words that the letters of some given word spell

(check-member-of (alternative-words "cat")
                 (list "act" "cat")
                 (list "cat" "act"))

; List-of-strings -> Boolean
; checks if w contains all alternative words from "rat"
(define (all-words-from-rat? w)
  (and (member? "art" w)
       (member? "tar" w)
       (member? "rat" w)))

(check-satisfied (alternative-words "rat") all-words-from-rat?)

(define (alternative-words s)
  (in-dictionary (words->strings (arrangements (string->word s)))))


; List-of-strings -> List-of-strings
; pick out all those Strings that occur in the dictionary
(define (in-dictionary los)
  empty)


; List-of-words -> List-of-strings
; turn all words in low into Strings
(define (words->strings low)
  empty)


; Word -> List-of-words
; find all re-arrangements of word
(define (arrangements word)
  (list word))


; String -> Word
; convert s to the chosen word representation

(check-expect (string->word "") '())
(check-expect (string->word "cat") (list "c" "a" "t"))

(define (string->word s)
  (explode s))


; Word -> String
; convert w to a string

(check-expect (word->string (list "c" "a" "t")) "cat")
(check-expect (word->string '()) "")

(define (word->string w)
  (implode w))


