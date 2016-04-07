;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex163) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design convertFC. The function converts a list of Fahrenheit measurements to
; a list of Celsius measurements.


; List-of-numbers -> List-of-numbers
; converts a list of temperature from Fahrenheit to Celsius

(check-expect (convertFC '()) '())
(check-within (convertFC (cons 0 '()))
              (cons -17.78 '())
              0.01)
(check-within (convertFC (cons 50 (cons 0 '())))
              (cons 10 (cons -17.78 '()))
              0.01)
(check-error (convertFC (cons -999 '())))

(define (convertFC alof)
  (cond
    [(empty? alof) '()]
    [else
     (if (legal-f (first alof))
         (cons (f2c (first alof))
               (convertFC (rest alof)))
         (error "out of range: " (first alof)))]))


; Number -> Boolean
; is given number n a legal fahrenheit

(check-expect (legal-f 213) #t)
(check-expect (legal-f -460) #f)

(define (legal-f n)
  (>= n -459.67))


; Number -> Number
; convert given f from Faherient to Celsius

(check-within (f2c 0) -17.78 0.01)
(check-expect (f2c 50) 10)

(define (f2c f)
  (* (- f 32) 5/9))