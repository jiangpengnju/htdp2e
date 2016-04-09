;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex183) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; On some occasions lists are formed with cons and list.
; Reformulate the following lists using cons and '() exclusively:

; 1.
(cons "a" (list 0 #f))

; 2.
(list (cons 1 (cons 13 '())))

; 3.
(cons (list 1 (list 13 '())) '())

; 4.
(list '() '() (cons 1 '()))

; 5.
(cons "a" (cons (list 1) (list #f '())))

; Then formulate the lists using only list.
; Use check-expect to express your answers.



(check-expect (cons "a" (list 0 #f))
              (cons "a" (cons 0 (cons #f '()))))
(check-expect (list (cons 1 (cons 13 '())))
              (cons (cons 1 (cons 13 '()))
                    '()))
(check-expect (cons (list 1 (list 13 '())) '())
              (cons (cons 1 (cons (cons 13 (cons '() '())) '()))
                    '()))
(check-expect (list '() '() (cons 1 '()))
              (cons '()
                    (cons '()
                          (cons (cons 1 '())
                                '()))))
(check-expect (cons "a" (cons (list 1) (list #f '())))
              (cons "a"
                    (cons (cons 1 '())
                          (cons #f (cons '() '())))))


(check-expect (cons "a" (list 0 #f))
              (list "a" 0 #f))
(check-expect (list (cons 1 (cons 13 '())))
              (list (list 1 13)))
(check-expect (cons (list 1 (list 13 '())) '())
              (list (list 1 (list 13 '()))))
(check-expect (list '() '() (cons 1 '()))
              (list '() '() (list 1)))
(check-expect (cons "a" (cons (list 1) (list #f '())))
              (list "a" (list 1) #f '()))