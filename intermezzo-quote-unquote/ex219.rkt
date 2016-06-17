;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex219) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Eliminate quasiquote, unquote and unquote-splicing from the following
; expressions so that they are written with list instead:

'(table ((border "1"))
          (tr (td "1")   (td "2")    (td "3")   (td "4"))
          (tr (td "2.8") (td "-1.1") (td "3.4") (td "1.3")))


; List-of-numbers -> ... nested list ...
; creates a row for an HTML table from a list of numbers
(define (make-row l)
  (cond
    [(empty? l) '()]
    [else (cons (make-cell (first l)) (make-row (rest l)))]))


; Number -> ... nested list ...
; create a cell for an HTML table from a number
(define (make-cell n)
  `(td ,(number->string n)))


; List-of-numbers List-of-numbers -> ... nested list ...
; creates an HMTL table from two lists of numbers
(define (make-table row1 row2)
  `(table ((border "1"))
          (tr ,@(make-row row1))
          (tr ,@(make-row row2))))

;;----------------------------
`(0 ,@'(1 2 3) 4)

`(("alan" ,(* 2 500))
  ("barb" 2000)
  (,@'(list "carl" " , the great")    1500)
  ("dawn" 2300))

`(html
  (body
   (table ((border "1"))
          (tr ((width "200")) ,@(make-row '(1 2)))
          (tr ((width "200")) ,@(make-row '(99 65))))))

; ----------------------------------
(list 0 1 2 3 4)

(list (list "alan" 1000)
      (list "barb" 2000)
      (list 'list "carl" " , the great" 1500)
      (list "dawn" 2300))

(list 'html
      (list 'body
            (list 'table
                  (list (list 'border "1"))
                  (list 'tr
                        (list (list 'width "200"))
                        (list (list 'td "1") (list 'td "2")))
                  (list 'tr
                        (list (list 'width "200"))
                        (list (list 'td "99") (list 'td "65"))))))
                        