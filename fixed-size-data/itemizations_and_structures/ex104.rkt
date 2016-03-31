;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex104) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Develop a data representation for the kinds of people you find at a university:
; student (first and last name, gpa), professor (first and last name, tenure
; status), and staff (first and last name, salary group). Then develop a
; template for functions that consume the representation of a person.

; Note: reference: http://www.hr.sao.texas.gov/compensation/schedules.html

; A GPA is a Number
; interpretation: the gpa point


; A TenureStatus is one of the following:
; - "tenured"
; - "tenure track"
; - "non-tenure track"


; A SalaryGroup is one of the following:
; - "A03"
; - "A04"
; - ...
; - "A20"
; - "B10"
; - "B11"
; - ...
; - "B35"
; - "C1"
; - "C2"
; - ...
; - "C8"


(define-struct student [first last gpa])
; A Student is a structure: (make-student String String Number)
; interpretation: (make-student fst lst p) is a student whose first name is fst,
; last name is lst, and gpa is p.


(define-struct professor [fist last tenure])
; A Professor is a structure: (make-professor String String TenureStatus)
; interpretation: (make-professor fst lst ts) is a professor whose first name is
; fst, last name lst, and tenure status is ts


(define-struct staff [first last salary])
; A Staff is a structure: (make-staff String String SalaryGroup)
; interpretation: (make-staff fst lst sg) is a staff whose first name is fst,
; last name lst, and belongs to the salary group sg.


; A PersonInUniversity is one of the following:
; - Student
; - Professor
; - Staff


; PersonInUniversity -> ...
; A SAMPLE template
(define (f p)
  (cond
    [(student? p)
     ... (student-first p) ... (student-last p) ... (student-gpa p) ...]
    [(professor? p)
     ... (professor-first p) ... (professor-last p) ... (professor-tenure p)...]
    [(staff? p)
     ... (staff-first p) ... (staff-last p) ... (staff-salary p)]))