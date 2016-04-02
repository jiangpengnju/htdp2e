;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex106) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; The administration of your home town manages a fleet of vehicles:
; automobiles, vans, buses, SUVs, and trucks. Develop a data representation for
; vehicles. The representation of each vehicle must describe the number of
; passengers that it can comfortbly accomodate, its license place, and its
; fuel consumption(miles per gallon).

; Develop a template for functions that consume representation of vehicles.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; A Type is one of the following:
; - "automobile"
; - "van"
; - "bus"
; - "SUV"
; - "truck"
; interpretation: vehicle types


(define-struct vehicle [type passengers license-place fuel-consumption])
; a Vehicle is a structure: (make-vehicle Type Number String Number)
; interpretation: (make-vehicle t np lp fc) is a vehicle of t type that can
; comfortbly accomodate np passengers, with its license at the position lp,
; and can drive fc miles per gallon



; Vehicle -> ...
(define (f v)
  (... (vehicle-type v) ...
       (vehicle-passengers v) ...
       (vehicle-license-place v) ...
       (vehicle-fuel-consumption v)...))