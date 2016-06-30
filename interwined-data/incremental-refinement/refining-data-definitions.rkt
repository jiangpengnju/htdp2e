;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname refining-data-definitions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Model 1 : files as atomic entities with a name and directories as containers.

; A Dir.v1 (short for directory) is one of: 
; – '()
; – (cons File.v1 Dir.v1)
; – (cons Dir.v1 Dir.v1)

; A File.v1 is a Symbol.

(define sample.v1
  (cons (cons 'part1 (cons 'part2 (cons 'part3 '())))
        (cons 'read!
              (cons (cons (cons 'hang (cons 'draw '()))
                          (cons (cons 'read! '())
                                '()))
                    '()))))

; ------------------------------------------------------------

;; Model 2: to list the names of directories

(define-struct dir [name content])
; A Dir.v2 is a structure:
;     (make-dir Symbol LOFD)

; A LOFD (short for list of Files and directories) is one of:
; - '()
; - (cons File.v2 LOFD)
; - (cons Dir.v2 LOFD)

; A File.v2 is a Symbol.


(define sample.v2
  (make-dir
   'TS
   (cons (make-dir
          'Text
          (cons 'part1 (cons 'part2 (cons 'part3 '()))))
         (cons 'read!
               (cons (make-dir
                      'Libs
                      (cons (make-dir
                             'Code
                             (cons 'hang (cons 'draw '())))
                            (cons (make-dir
                                   'Docs
                                   (cons 'read! '()))
                                  '())))
                     '())))))

; ------------------------------------------------------------

;; Model 3: to introduce attributes for files

(define-struct file [name size content])
; A File.v3 is a structure:
;    (make-file Symbol N String)

(define-struct dir.v3 [name dirs files])
; A Dir.v3 is a structure:
;    (make-dir.v3 Symbol Dir* File*)

; A Dir* is a one of:
; - '()
; - (cons Dir.v3 Dir*)

; A File* is one of:
; - '()
; - (cons File.v3 File*)

(define
  sample.v3
  (make-dir.v3
   'TS
   (cons (make-dir.v3
          'Text
          '()
          (cons (make-file 'part1 99 "")
                (cons (make-file 'part2 52 "")
                      (cons (make-file 'part3 17 "")
                            '()))))
         (cons (make-dir.v3
                'Libs
                (cons (make-dir.v3
                       'Code
                       '()
                       (cons (make-file 'hang 8 "")
                             (cons (make-file 'draw 2 "")
                                   '())))
                      (cons (make-dir.v3
                             'Docs
                             '()
                             (cons (make-file 'read! 19 "")
                                   '()))
                            '()))
                '())
               '()))
   (cons (make-file 'read! 10 "")
         '())))


