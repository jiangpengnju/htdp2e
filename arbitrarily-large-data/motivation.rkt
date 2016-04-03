;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname motivation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

Many programming problems, however, deal with an undermined number of pieces of
information that must be processed as one piece of data.
For example, one program may have to compute the average of a bunch of numbers
and another may have to keep track of an arbitrary number of objects in an
interactive game.



This part:  data of (finite but) arbitrary size

- list
- updated design recipe