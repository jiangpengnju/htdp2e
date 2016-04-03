;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex130) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Create BSL lists that represent

; 1. a list of celestial bodies, say, at least all the planets in our solar system;
; 2. a list of items for a meal, for example, steak, Freanch fries, beans,
;    bread, water, brie cheese, and ice cream; and
; 3. a list of colors.

; Sketch box representations of these lists.


; A:
; 1.
(cons "The Sun"
      (cons "Mercury"
            (cons "Venus"
                  (cons "Earth"
                        (cons "Mars"
                              (cons "Jupiter"
                                    (cons "Saturn"
                                          (cons "Uranus"
                                                (cons "Neptune" '())))))))))


; 2.
(cons "Steak"
      (cons "French fires"
            (cons "beans"
                  (cons "bread"
                        (cons "water"
                              (cons "brie cheese"
                                    (cons "ice cream" '())))))))

; 3.
(cond "red"
      (cons "orange"
            (cons "yellow"
                  (cons "green"
                        (cons "cyan"
                              (cons "blue"
                                    (cons "purple" '())))))))
                      