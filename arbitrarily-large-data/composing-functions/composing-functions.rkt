;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname composing-functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

Formulate auxiliary function definitions for every dependency between
quantities in the problem statement. In short, design one function per task.


Formulate auxiliary function definitions when one data definition points to
a second data definition. Roughly, design one template per data definition.



Turning a template into a complete function definition means combining the
values of the template’s sub-expressions into the final answer. As you do so,
you might encounter several situations that suggest the need for auxiliary
functions:

1. If the composition of values requires knowledge of a particular domain of
application—for example, composing two (computer) images, accounting, music,
or science—design an auxiliary function.

2. If the composition of values requires a case analysis of the available values
—for example, is a number positive, zero, or negative— use a cond expression.
If the cond looks complex, design an auxiliary function whose inputs are the
partial results and whose function body is the cond expression.
Doing so separates out the case analysis from the recursive process.

3. If the composition of values must process an element from a self-referential
data definition—a list, a natural number, or something like those—
design an auxiliary function.

4. If everything fails, you may need to design a more general function and
define the main function as a specific use of the general function. This
suggestion sounds counter-intuitive but it is called for in a remarkably
large number of cases.







the key to managing the design of many functions and their compositions is
to maintain the often-mentioned Wish Lists


Before you put a function on the wish list, you should check whether
something like the function already exists in your language’s library
or whether something similar is already on the wish list.