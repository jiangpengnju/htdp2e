;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex166) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; functions may also produce lists of structures.

; Develop a data representation for pay checks. Assume that a pay check contains two
; pieces of information: the name of the employee and an amount. Then design the
; function wage*.v3. It consumes a list of work records and computes a list of
; (representations of) pay checks from it, one per record.

; In reality, a pay check also contains an employee number. Develop a data
; representation for employee information and change the data definition for
; work records so that it uses employee information and not just a string for
; the employee's name. Also change your data representation of paychecks so
; that it contains an employee's name an number, too. Finally, design wage*.v4,
; a function that maps lists of revised work records to lists of revised pay checks.

; Note: this ex demonstrates the "Iterative Refinement" of a task. Instead of
; using data representations that include all relevent information, we stared from
; simplistic representation of pay checks and gradually made the representation
; realistic. For this simple program, refinement is overkill; later we will
; encounter situations where iterative refinement is not just an option but a
; necessity.



(define-struct work [employee rate hours])
; Work is a structure: (make-work String Number Number)
; interpreration: (make-work n r h) combines the name(n)
; with the pay rate(r) and the number of hours(h) worked.


; Low (list of works) is one of:
; - '()
; - (cons Work Low)
; interpretation: an instance of Low represents the hours worked of
; a number of employees.


(define-struct paycheck [employee amount])
; Paycheck is a structure: (make-paycheck String Number)
; interpretation: (make-paycheck n amount) combines the name(n) and the amount


; Lop (list of paychecks) is one of:
; - '()
; - (cons Paycheck Lop)
; interpretation: an instance of Lop represents for a number of paycheckes


(define ex1 '())
(define ex2 (cons (make-work "Robby" 11.95 39)
                  '()))
(define ex3 (cons (make-work "Matthew" 12.95 45)
                  (cons (make-work "Robby" 11.95 39)
                        '())))


; Low -> Lop
; computes the paychecks for all given weekly work records

(check-expect (wage*.v3 '()) '())
(check-expect (wage*.v3 ex2) (cons (make-paycheck "Robby" (* 11.95 39)) '()))
(check-expect (wage*.v3 ex3) (cons (make-paycheck "Matthew" (* 12.95 45))
                                   (cons (make-paycheck "Robby" (* 11.95 39))
                                         '())))

(define (wage*.v3 an-low)
  (cond
    [(empty? an-low) '()]
    [else (cons (wage.v3 (first an-low))
                (wage*.v3 (rest an-low)))]))


; Work -> Paycheck
; computes the paycheck for the given work record w

(check-expect (wage.v3 (make-work "Robby" 11.95 39))
              (make-paycheck "Robby" (* 11.95 39)))
(check-expect (wage.v3 (make-work "Matthew" 12.95 45))
              (make-paycheck "Matthew" (* 12.95 45)))

(define (wage.v3 w)
  (make-paycheck
   (work-employee w)
   (* (work-rate w)
      (work-hours w))))