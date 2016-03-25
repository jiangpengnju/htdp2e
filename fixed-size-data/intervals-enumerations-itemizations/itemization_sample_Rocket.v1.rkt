;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname itemization_sample_Rocket.v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sample Problem: Design a program that launches a rocket when the user of your
; program presses the space bar.
; The program first displays the rocket sitting at the bottom of the canvas.
; Once launched, it moves upward at three pixels per clock tick.



; A LR (short for: launching rocket) is one of:
; - "resting"
; - non-negative number
; interpretation: "resting" represents a rocket on the ground;
; a number denotes the height of a rocket in flight. (Here, 'height' means
; the distance between the top of the canvas and the reference point.)




