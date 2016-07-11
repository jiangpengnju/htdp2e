;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname rendering-XML-enumerations) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; An Xexpr.v2 is
;  - (cons Symbol [List-of Xexpr.v2])
;  - (cons Symbol (cons [List-of Attribute] [List-of Xexpr.v2]))

; An Attribute is
;   (cons Symbol (cons String '()))


(define a0 '((initial "red")))

(define e0 '(machine))
(define e1 `(machine ,a0))
(define e2 '(machine (action)))
(define e3 '(machine () (action)))
(define e4 `(machine ,a0 (action (action))))


; [List-of Attribute] Symbol -> [String or #false]
; if the loa associates x with a string, retrieves this string;
; otherwise returns #false.

(check-expect (lookup-attribute a0 'initial) "red")
(check-expect (lookup-attribute a0 'notexist) #f)

(define (lookup-attribute loa x)
  (local ((define record (assq x loa)))
    (if (false? record)
        #f
        (second record))))


; Xexpr.v2 -> Symbol
; retrieves the name of xe

(check-expect (xexpr-name e0) 'machine)
(check-expect (xexpr-name e1) 'machine)

(define (xexpr-name xe)
  (first xe))


; Xexpr.v2 -> [List-of Xexpr.v2]
; retrieves the content of xe

(check-expect (xexpr-content e0) '())
(check-expect (xexpr-content e1) '())
(check-expect (xexpr-content e2) '((action)))
(check-expect (xexpr-content e3) '((action)))
(check-expect (xexpr-content e4) '((action (action))))

(define (xexpr-content xe)
  (local ((define optional-loa+content (rest xe)))
    (cond
      [(empty? optional-loa+content) '()]
      [else (local ((define loa-or-x (first optional-loa+content)))
              (if (list-of-attributes? loa-or-x)
                  (rest optional-loa+content)
                  optional-loa+content))])))


; Xexpr.v2 -> [List-of Attribute]
; retrieves the list of attributes of xe

(check-expect (xexpr-attributes e0) '())
(check-expect (xexpr-attributes e1) '((initial "red")))
(check-expect (xexpr-attributes e2) '())
(check-expect (xexpr-attributes e3) '())
(check-expect (xexpr-attributes e4) '((initial "red")))

(define (xexpr-attributes xe)
  (local ((define optional-loa+content (rest xe)))
    (cond
      [(empty? optional-loa+content) '()]
      [else (local ((define loa-or-x (first optional-loa+content)))
              (if (list-of-attributes? loa-or-x)
                  loa-or-x
                  '()))])))


; [List-of Attributes] or Xexpr.v2 -> Boolean
; determines whether x is an element of [List-of Attribute]
(define (list-of-attributes? x)
  (or (empty? x)
      (local ((define possible-attribute (first x)))
        (cons? possible-attribute))))