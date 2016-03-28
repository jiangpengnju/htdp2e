;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname more_virtual_pets) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; We continue virtual zoo project from 'Virtual Pet Worlds'.
; The goal of the excercise is to combine the cat world program with the program
; for managing its happiness gauge.
; When the combined program runs, you see the cat walking across the canvas and,
; with each step, its happiness goes down. The only way to make the cat happy is
; to feed it (down arrow) or to pet it (up arrow). Finally, the goal of the last
; excercise is create another virtual, happy pet.