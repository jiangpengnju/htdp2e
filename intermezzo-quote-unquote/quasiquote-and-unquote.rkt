;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname quasiquote-and-unquote) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define x 42)

'(40 41 x 43 44)
`(40 41 x 43 44)
`(40 41 ,x 43 44)

(list 40 41 'x 43 44)
(list 40 41 'x 43 44)
(list 40 41 42 43 44)


; String String -> ... deeply nested list ...
; produces a (representation of) a web page with given author and title
(define (my-first-web-page author title)
  `(html
    (head
     (title ,title)
     (meta ((http-equiv "content-type")
            (content "text-html"))))
    (body
     (h1 ,title)
     (p "I, " ,author ", made this page."))))

(my-first-web-page "Jiang" "Hello World")