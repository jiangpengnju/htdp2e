;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname word-games-composition-illustrated.v4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Complete the disign of in-dictionary function.
; Hint: read the dictionary on your computer into a list of strings.

(require 2htdp/batch-io)



; constants
; On OS X:
(define DICTIONARY-LOCATION "/usr/share/dict/words")

(define DICTIONARY-AS-LIST (read-lines DICTIONARY-LOCATION))


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

(check-expect (in-dictionary (list "cat" "tac" "act"))
              (list "cat" "act"))

(define (in-dictionary los)
  (cond
    [(empty? los) '()]
    [(good-word? (first los) DICTIONARY-AS-LIST)
     (cons (first los) (in-dictionary (rest los)))]
    [else
     (in-dictionary (rest los))]))


; String List-of-strings -> Boolean
; is given s in the dictionary as a list

(check-expect (good-word? "abc" (list "abc" "bcd")) #t)
(check-expect (good-word? "cat" DICTIONARY-AS-LIST) #t)
(check-expect (good-word? "tac" DICTIONARY-AS-LIST) #f)

(define (good-word? s l)
  (cond
    [(empty? l) #f]
    [(string=? s (first l)) #t]
    [(string>? s (first l))
     (good-word? s (rest l))]
    [else #f]))



; List-of-words -> List-of-strings
; turn all words in low into Strings

(check-expect (words->strings '()) '())
(check-expect (words->strings (list (list "c" "a" "t")
                                   (list "t" "a" "c")))
              (list "cat" "tac"))

(define (words->strings low)
  (cond
    [(empty? low) '()]
    [else
     (cons (word->string (first low))
           (words->strings (rest low)))]))


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


