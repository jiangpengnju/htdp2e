;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arithmetic_of_images) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; 1. creation of basic images:
(circle 10 "solid" "red")
(ellipse 10 20 "solid" "yellow")
(rectangle 10 20 "solid" "blue")
(text "hello" 12 "green")
(triangle 15 "solid" "black")
(star 12 "solid" "green")

(regular-polygon 20 7 "solid" "red")
(regular-polygon 20 3 "outline" "red")


; 2. image properties:
(image-width (circle 10 "solid" "red"))
(image-height (rectangle 10 20 "solid" "blue"))
(+ (image-width (circle 10 "solid" "blue"))
   (image-height (rectangle 10 20 "solid" "blue")))

; 3. combining images:   "anchor point"
(overlay (square 4 "solid" "orange")
         (circle 6 "solid" "yellow"))       ; using the center as anchor point
(underlay (circle 6 "solid" "yellow")
          (square 5 "solid" "orange"))
(place-image (circle 6 "solid" "yellow")
             10 10
             (empty-scene 100 100))
(overlay/xy (rectangle 20 20 "outline" "black")
            20 0
            (rectangle 20 20 "outline" "black"))
(overlay/xy (rectangle 20 20 "solid" "red")
            -10 -10
            (rectangle 20 20 "solid" "black"))
(overlay/align "right" "bottom"
               (rectangle 20 20 "solid" "silver")
               (rectangle 30 30 "solid" "seagreen")
               (rectangle 40 40 "solid" "silver")
               (rectangle 50 50 "solid" "seagreen"))

(empty-scene 200 100)
(place-image (rectangle 10 5 "solid" "black")
             50 20
             (empty-scene 200 100))
(scene+line (empty-scene 200 100)
            0 300 180 0 "red")
(scene+line (ellipse 50 30 "outline" "maroon")
            0 40 40 0 "gray")