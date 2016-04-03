;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex133) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Use DrRacket to run contains-flatt? in this example:
(cons "Fagan"
      (cons "Findler"
            (cons "Fisler"
                  (cons "Flanagan"
                        (cons "Flatt"
                              (cons "Felleisen"
                                    (cons "Friedman" '())))))))
; What answer do you expect?


; List-of-names -> Boolean
; determines whether "Flatt" occurs on a-list-of-names

(check-expect (contains-flatt? '()) #f)

(check-expect (contains-flatt? (cons "Findler" '())) #f)
(check-expect (contains-flatt? (cons "Flatt" '())) #t)

(check-expect (contains-flatt? (cons "Mur" (cons "Fish" (cons "Find" '()))))
              #f)
(check-expect (contains-flatt? (cons "A" (cons "Flatt" (cons "C" '()))))
              #t)

(define (contains-flatt? a-list-of-names)
  (cond
    [(empty? a-list-of-names) #f]
    [(cons? a-list-of-names)
     (or (string=? (first a-list-of-names) "Flatt")
         (contains-flatt? (rest a-list-of-names)))]))


(contains-flatt? (cons "Fagan"
                       (cons "Findler"
                             (cons "Fisler"
                                   (cons "Flanagan"
                                         (cons "Flatt"
                                               (cons "Felleisen"
                                                     (cons "Friedman" '()))))))))