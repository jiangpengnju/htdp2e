;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname the_universe_of_data) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Every language comes with a universe of data. This data represents information
; FROM and ABOUT the external world; it is what programs manipulate. This universe
; of data is a collection that consists of collections of BUILT-IN data but also
; of classes of data that PROGRAMS CREATE.

; Neither programs nor individual functions in programs deal with the entire
; universe of data. It is the purpose of a data definition to decribe PART of
; this universe and to name these part so that we can refer to them concisely.

; Put differently, a named data definition is a description of a collection of
; data, and the name is usable in other data definitions and in function signatures.
; In a function signature, the name specifies what data a function will deal with
; and, implicitly, which part of the universe of data it won't deal with.

