;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname domain_knowledge) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 2 forms of domain knowledge.

;1. knowledge from external domains such as mathematics, music, biology, civil
; engineering, art, etc.

; 2. knowledge about the library functions in the chosen programming language.
; When you task is to translate a mathematical formula involving the tangent function,
; you need to know or guess that your chosen language comse with a function such
; as BSL's tan.


; Since you can never predict the area you will be working in, or which programming
; language you will have to use, it is imperative that you have a solid
; understanding of the full possibilities of whatever computer languages are
; around and suitable. Otherwise some domain expert with half-baked programming
; knowledge will take over your job.

; You can recognize problems that demand domain knowledge from the data definitions
; that you work out. As long as the data definitions use classes that exits in
; the chosen programming language, the definition of the function body (and program)
; mostly relies on expertise in the domain. Later, when we introduce complex forms
; of data, the design of functions demands computer science knowledge.