;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex166b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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


(define-struct employee [name num])
; Empoyee is a structure: (make-employee String Number)
; interpretation: (make-employee name num) combines the name with the number
; of an employee


(define-struct work [employee rate hours])
; Work is a structure: (make-work Employee Number Number)
; interpreration: (make-work e r h) combines the employee(e)
; with the pay rate(r) and the number of hours(h) worked.


; Low (list of works) is one of:
; - '()
; - (cons Work Low)
; interpretation: an instance of Low represents the hours worked of
; a number of employees.


(define-struct paycheck [employee amount])
; Paycheck is a structure: (make-paycheck Employee Number)
; interpretation: (make-paycheck e amount) combines the employee(e) and the amount


(define ex1 '())
(define ex2 (cons (make-work (make-employee "Robby" 1) 11.95 39)
                  '()))
(define ex3 (cons (make-work (make-employee "Matthew" 2) 12.95 45)
                  (cons (make-work (make-employee "Robby" 1) 11.95 39)
                        '())))


; Low -> Lop
; computes the paycheckes for all given weekly work records

(check-expect (wage*.v4 '()) '())
(check-expect (wage*.v4 ex2) (cons (make-paycheck (make-employee "Robby" 1) (* 11.95 39)) '()))
(check-expect (wage*.v4 ex3) (cons (make-paycheck (make-employee "Matthew" 2) (* 12.95 45))
                                   (cons (make-paycheck (make-employee "Robby" 1) (* 11.95 39))
                                         '())))

(define (wage*.v4 an-low)
  (cond
    [(empty? an-low) '()]
    [else (cons (wage.v4 (first an-low))
                (wage*.v4 (rest an-low)))]))


; Work -> Paycheck
; computes the paycheck for the given work record w

(check-expect (wage.v4 (make-work (make-employee "Robby" 1) 11.95 39))
              (make-paycheck (make-employee "Robby" 1) (* 11.95 39)))
(check-expect (wage.v4 (make-work (make-employee "Matthew" 2) 12.95 45))
              (make-paycheck (make-employee "Matthew" 2) (* 12.95 45)))

(define (wage.v4 w)
  (make-paycheck
   (work-employee w)
   (* (work-rate w)
      (work-hours w))))