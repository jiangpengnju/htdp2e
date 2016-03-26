;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex76) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Formulate data definitions for the following structure type definitions:
; Make sensible assumptions as to what kind of values go into each field.

(define-struct movie [title producer year])
; A Movie is a structure: (make-movie String String Number)
; interpretation: a movie's title, producer, and year.


(define-struct person [name hair eyes phone])
; A Person is a structure: (make-person String String String Number)
; interpretation: describes a person's name, hair color, eyes color, and phone number.


(define-struct pet [name number])
; A Pet is a structure: (make String Number])
; interpretation: describes a pet's name and ID


(define-struct CD [artist title price])
; A CD is a stucture: (make String Number])
; interpretation: the title and price of a CD


(define-struct sweater [material size producer])
; a Sweater is a structure: (make String Number String)
; interpretation: a sweater's material, size number, and producer name.
