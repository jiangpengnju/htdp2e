;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex173) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design a program that removes all articles from a text file. The program consumes
; the name n of a file, reads the file, removes the articles, and writes the
; result out to a file whose name is the result of concatenating "no-articles-"
; with n. For this exercise, an article is one of the following three words:
; "a", "an", and "the".

; Use read-words/line so that the transformation retains the organization of
; the original text into lines and words. When the program is designed, run it
; on the Piet Hein poem.


(require 2htdp/batch-io)


(define line0 '())
(define line1 (cons "a" (cons "cat" '())))
(define line2 (cons "the" (cons "good" (cons "side" (cons "of" (cons "a" '()))))))

(define lls0 '())
(define lls1 (cons line1 (cons line2 '())))

; LLS -> LLS
; remove articles from the lls

(check-expect (remove-articles lls0) '())
(check-expect (remove-articles lls1)
               (cons (cons "" (cons "cat" '()))
                     (cons (cons "" (cons "good" (cons "side" (cons "of" (cons "" '())))))
                           '())))

(define (remove-articles lls)
  (cond
    [(empty? lls) '()]
    [else
     (cons
      (remove-articles-line (first lls))
      (remove-articles (rest lls)))]))


; List-of-strings -> List-of-strings
; remove articles from line

(check-expect (remove-articles-line line0) '())
(check-expect (remove-articles-line line1)
              (cons "" (cons "cat" '())))

(define (remove-articles-line alos)
  (cond
    [(empty? alos) '()]
    [else
     (cons (handle-word (first alos))
           (remove-articles-line (rest alos)))]))


; String -> String
; replace the word with "", if it is an article

(check-expect (handle-word "abc") "abc")
(check-expect (handle-word "a") "")
(check-expect (handle-word "the") "")

(define (handle-word w)
  (if (or (string=? "a" w)
          (string=? "an" w)
          (string=? "the" w))
      ""
      w))


; LLS -> String
; collapse a list of lines into a string

(define (collapse lls)
  (cond
    [(empty? lls) ""]
    [else
     (string-append (collapse-line (first lls))
                    (if (empty? (rest lls))
                        ""
                        "\n")
                    (collapse (rest lls)))]))


; List-of-string -> String
; collapse given line

(define (collapse-line alos)
  (cond
    [(empty? alos) ""]
    [else
     (string-append (first alos)
                    (if (empty? (rest alos))
                        ""
                        " ")
                    (collapse-line (rest alos)))]))


; String -> .String
; consumes the name n of a file, reads the file, removes the articles,
; and writes the result out to a file whose name is the result of "no-articles-<n>"
(define (no-article n)
  (write-file (string-append "no-articles-" n)
              (collapse (remove-articles (read-words/line n)))))