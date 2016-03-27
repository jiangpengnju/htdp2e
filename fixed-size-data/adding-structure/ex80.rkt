;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex80) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Create templates for functions that consume instances of the following structure
; types:

(define-struct movie [title director year])

(define (f1 m)
  (... (movie-title m) ... (movie-director m) ... (movie-year m) ...))


(define-struct person [name hair eyes phone])

(define (f2 p)
  (... (person-name p) ... (person-hair p) ...
       (person-eyes p) ... (person-phone p) ...))


(define-struct pet [name number])

(define (f3 p)
  (... (pet-name p) ... (pet-number p) ...))


(define-struct CD [artist title price])

(define (f4 cd)
  (... (CD-artist cd) ... (CD-title cd) ... (CD-price cd) ...))


(define-struct sweater [material size color])

(define (f5 s)
  (... (sweater-material s) ... (sweater-size s) ... (sweater-color s) ...))