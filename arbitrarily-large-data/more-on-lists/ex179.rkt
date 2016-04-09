;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex179) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design functions:

; editor-lft
; editor-rgt
; editor-del

; Again, it's critical that you work through a good range of examples.


(require 2htdp/image)
(require 2htdp/universe)


; constants
(define HEIGHT 20)   ; the height of the eidtor
(define WIDTH 200)   ; its width
(define FONT-SIZE 16)  ; the font size
(define FONT-COLOR "black")  ; the font color

; graphical constants
(define MT (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 HEIGHT "solid" "red"))


(define-struct editor [pre post])
; An Editor is (make-editor Lo1S Lo1S)
; An Lo1S is one of:
; - '()
; - (cons 1String Lo1S)

(define good
  (cons "g" (cons "o" (cons "o" (cons "d" '())))))
(define all
  (cons "a" (cons "l" (cons "l" '()))))
(define lla
  (cons "l" (cons "l" (cons "a" '()))))

(define ed1
  (make-editor all good))
(define ed2
  (make-editor lla good))


; Editor -> Image
; renders an editor as an image of the two texts seperated by the cursor
(define (editor-render e)
  MT)


; Editor KeyEvent -> Editor
; deals with a key event, given some editor

(check-expect (editor-kh (create-editor "" "") "e")
              (create-editor "e" ""))
(check-expect (editor-kh (create-editor "cd" "fgh") "e")
              (create-editor "cde" "fgh"))

(check-expect (editor-kh (create-editor "cd" "fgh") "\b")
              (create-editor "c" "fgh"))
(check-expect (editor-kh (create-editor "" "xyz") "\b")
              (create-editor "" "xyz"))

(check-expect (editor-kh (create-editor "cd" "fgh") "left")
              (create-editor "c" "dfgh"))
(check-expect (editor-kh (create-editor "cd" "fgh") "right")
              (create-editor "cdf" "gh"))
(check-expect (editor-kh (create-editor "" "fgh") "left")
              (create-editor "" "fgh"))
(check-expect (editor-kh (create-editor "cd" "") "right")
              (create-editor "cd" ""))

(check-expect (editor-kh (create-editor "cd" "fgh") "\t")
              (create-editor "cd" "fgh"))
(check-expect (editor-kh (create-editor "cd" "fgh") "\r")
              (create-editor "cd" "fgh"))

(check-expect (editor-kh (create-editor "cd" "fgh") "up")
              (create-editor "cd" "fgh"))

(define (editor-kh ed ke)
  (cond
    [(key=? "left" ke) (editor-lft ed)]
    [(key=? "right" ke) (editor-rgt ed)]
    [(key=? "\b" ke) (editor-del ed)]
    [(key=? "\r" ke) ed]
    [(key=? "\t" ke) ed]
    [(= (string-length ke) 1) (editor-ins ed ke)]
    [else ed]))


; Editor 1String -> Editor
; insert the 1String k between pre and post

(check-expect (editor-ins (create-editor "" "") "e")
              (create-editor "e" ""))
(check-expect (editor-ins (create-editor "cd" "fgh") "e")
              (create-editor "cde" "fgh"))

(define (editor-ins ed k)
  (make-editor (cons k (editor-pre ed))
                  (editor-post ed)))


; Editor -> Editor
; moves the cursor position one 1String left, if possible

(check-expect (editor-lft (create-editor "cd" "fgh"))
              (create-editor "c" "dfgh"))
(check-expect (editor-lft (create-editor "" "fgh"))
              (create-editor "" "fgh"))

(define (editor-lft ed)
  (if (left-empty? ed)
         ed
         (make-editor (rest (editor-pre ed))
                      (cons (first (editor-pre ed))
                            (editor-post ed)))))


; Editor -> Editor
; moves the cursor position one 1String right, if possible

(check-expect (editor-rgt (create-editor "cd" "fgh"))
              (create-editor "cdf" "gh"))
(check-expect (editor-rgt (create-editor "cd" ""))
              (create-editor "cd" ""))

(define (editor-rgt ed)
  (if (right-empty? ed)
         ed
         (make-editor (cons (first (editor-post ed))
                            (editor-pre ed))
                      (rest (editor-post ed)))))

; Editor -> Editor
; deletes one 1String to the left of the cursor, if possible

(check-expect (editor-del (create-editor "cd" "fgh"))
              (create-editor "c" "fgh"))
(check-expect (editor-del (create-editor "" "xyz"))
              (create-editor "" "xyz"))

(define (editor-del ed)
  (if (left-empty? ed)
         ed
         (make-editor (rest (editor-pre ed))
                      (editor-post ed))))


; Editor -> Boolean
; if the pre part of the editor ed is ""

(check-expect (left-empty? (create-editor "ab" "cd")) #f)
(check-expect (left-empty? (create-editor "" "cd")) #t)

(define (left-empty? ed)
  (empty? (editor-pre ed)))


; Editor -> Boolean
; if the post part of the editor ed is ""

(check-expect (right-empty? (create-editor "ab" "cd")) #f)
(check-expect (right-empty? (create-editor "ab" "")) #t)

(define (right-empty? ed)
  (empty? (editor-post ed)))


; String String -> Editor
; creates editor with given pre- and post- cursor strings

(check-expect (create-editor "all" "good")
              (make-editor (rev (explode "all")) (explode "good")))

(define (create-editor pre post)
  (make-editor (rev (explode pre))
               (explode post)))


; Lo1S -> Lo1S
; produces a reverse version of the given list

(check-expect (rev all) lla)
(check-expect (rev '()) '())

(define (rev l)
  (cond
    [(empty? l) '()]
    [else (add-at-end (rev (rest l)) (first l))]))


; Lo1S 1String -> Lo1S
; create a new list by adding s to the end of l

(check-expect (add-at-end '() "a") (cons "a" '()))
(check-expect (add-at-end (cons "c" (cons "b" '())) "a")
              (cons "c" (cons "b" (cons "a" '()))))

(define (add-at-end l s)
  (cond
    [(empty? l) (cons s '())]
    [else
     (cons (first l)
           (add-at-end (rest l) s))]))