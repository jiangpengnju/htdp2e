;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex199) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design insert-everywhere/in-all-words.

; Start with a complete wish list entry. Supplement it with tests for empty lists,
; a list with one-letter word and another list with two-letter word, etc.

; Hints:
; (1) Reconsider the examples.
; (2) You want to use the BSL+ operation append, which consumes two lists
;      and produces the concatenation of the two lists
; (3) The solution to this ex is a series of functions. Patiently stick to
;      the design recipe and systematically work through your wish list.


(require 2htdp/batch-io)



; constants
; On OS X:
(define DICTIONARY-LOCATION "/usr/share/dict/words")

(define DICTIONARY-AS-LIST (read-lines DICTIONARY-LOCATION))


; A Word is one of:
; - '()
; (cons 1String Word)
; interpretation: a String as a list of single Strings (letters)

(define word1 (list "d" "e"))
(define word2 (list "c" "a" "t"))
(define word3 (list "r" "a" "t"))


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

(check-expect (good-word? "aaa" '()) #f)
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



; Word -> List-of-words
; creates a list of all arrangements of the letters in w

(define (arrangements w)
  (cond
    [(empty? w) (list '())]
    [else (insert-everywhere/in-all-words
           (first w) (arrangements (rest w)))]))


; 1String List-of-words -> List-of-words
; produces a list of words like low, but with the first argument

(check-expect (insert-everywhere/in-all-words "r" (list '()))
              (list (list "r")))
(check-expect (insert-everywhere/in-all-words "e" (list (list "r")))
              (list (list "e" "r")
                    (list "r" "e")))

(define (insert-everywhere/in-all-words letter low)
  (cond
    [(empty? low) '()]
    [(empty? (first low)) (list (list letter))]
    [else
     (append (insert-everywhere/in-one-word letter (first low))
             (insert-everywhere/in-all-words letter (rest low)))]))


; 1String Word -> List-of-words
; produce a list of words whose items are like w, but with letter inserted
; at the beginning, between all letters, and at the end of w.

(check-expect (insert-everywhere/in-one-word "r" '())
              (list (list "r")))
(check-expect (insert-everywhere/in-one-word "e" (list "r"))
              (list (list "e" "r")
                    (list "r" "e")))
(check-expect (insert-everywhere/in-one-word "d" (list "e" "r"))
              (list (list "d" "e" "r")
                    (list "e" "d" "r")
                    (list "e" "r" "d")))

(define (insert-everywhere/in-one-word letter w)
  (cond
    [(empty? w) (list (list letter))]
    [else
     (cons (cons letter w)
           (add-at-head (first w)
                        (insert-everywhere/in-one-word letter (rest w))))]))


; 1String List-of-words -> List-of-words
; add the letter to the head of all items of low

(check-expect (add-at-head "e" (list (list "d" "r")
                                     (list "r" "d")))
              (list (list "e" "d" "r")
                    (list "e" "r" "d")))

(define (add-at-head letter low)
  (cond
    [(empty? low) '()]
    [else
     (cons (cons letter (first low))
           (add-at-head letter (rest low)))]))
