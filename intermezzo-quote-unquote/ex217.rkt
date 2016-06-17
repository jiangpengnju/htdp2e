;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex217) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Eliminate quote from the following expressions so that they use list instead:

'(1 "a" 2 #false 3 "c")
'()
; .  and this table-like shape:
'(("alan" 1000)
  ("barb" 2000)
  ("carl" 3000)
  ("dawn" 4000))



;;;;;- -- -- - - - -

(list 1 "a" 2 #false 3 "c")

(list)

(list (list "alan" 1000)
      (list "barb" 2000)
      (list "carl" 3000)
      (list "dawn" 4000))


;;;--------------------------
;; Now eliminate list in favor of cons where needed.

(cons 1
      (cons "a"
            (cons 2
                  (cons #false
                        (cons 3
                              (cons "c" '()))))))


(cons (cons "alan"
            (cons 1000 '()))
      (cons (cons "barb"
                  (cons 2000 '()))
            (cons (cons "carl"
                        (cons 3000 '()))
                  (cons (cons "dawn"
                              (cons 4000 '()))
                        '()))))