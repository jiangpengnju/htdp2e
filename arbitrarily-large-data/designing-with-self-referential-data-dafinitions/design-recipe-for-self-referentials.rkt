;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname design-recipe-for-self-referentials) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
Design Recipe (for self-referential data definitions)

1. When: If a problem statement discusses COMPOUND information of ARBITRARY size,
         you need a self-referential data definition.
   Two conditions TO BE VALID:
     a. at least two clauses.
     b. at least one of the clauses must NOT Refer back to the class of data that is
          being defined.

    CHECK THE VALIDITY WITH THE CREATION OF EXAMPLES!


; A List-of-strings is one of:
; - '()
; - (cons String List-of-strings)

(define ex1 '())
(define ex2 (cons "a" '()))
(define ex3 (cons "b" (cons "a" '())))


2. Signature, Purpose Statement, Dummy definition.
    Nothing changes.

; List-of-strings -> Number
; count how many strings alos contains
(define (how-many alos)
  0)


3. Functional Examples

(check-expect (how-many ex1) 0)
(check-expect (how-many ex2) 1)
(check-expect (how-many ex3) 2)


4*. Template
    looks like a data definition for mixed data -- itemizations and structs.
    We formulate a cond expression with as many cond clauses as there clauses in
      the data definition.
    AND, write down appropriate selector expressions in all cond lines that process
       compound values.

SHAPE:
(define (fun-for-los alos)
  (cond
    [(empty? alos) ...]
    [else
     (... (first alos) ... (rest alos)...)]))

That is, a template expresses as code what the data definition for the input
expresses as a mix of English and BSL.
Hence all important pieces of the data definition must find a counterpart
in the template, and this guideline should also hold when a data definition
is self-referential—contains an arrow from inside the definition to the term
being defined. In particular, when a data definition is self-referential in the
ith clause and the kth field of the structure mentioned there, the template
should be self-referential in the ith cond clause and the selector expression
for the kth field.
For each such selector expression, add an arrow back to the function parameter.
At the end, your template must have as many arrows as we have in the data definition.

UPDATED SHAPE:
(define (fun-for-los alos)
  (cond
    [(empty? alos) ...]
    [else
     (... (first alos) ...
          ... (fun-for-los (rest alos)) ...)]))


5. Function Definition
   Start with 'base case' -- cond lines that do not contain natural recursions.
   Then deal with the self-referential cases.
    For the natural recursion we assume that
        the function already works as specified in our purpose statement.

; List-of-strings -> Number
; determines how many strings are on alos
(define (how-many alos)
  (cond
    [(empty? alos) ...]
    [else
     (... (first alos) ... (how-many (rest alos)) ...)]))


(define (how-many alos)
  (cond
    [(empty? alos) 0]
    [else (+ (how-many (rest alos)) 1)]))


- Find the 'combinator' -- Tabulating arguments, intermediate values, and results
- Not all selector expressions in the template are necessarily relevent.
- Sometimes, you need auxiliary function -- make a Wish.


6. Testing.
coverage

