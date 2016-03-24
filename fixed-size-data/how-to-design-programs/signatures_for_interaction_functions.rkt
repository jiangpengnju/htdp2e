;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname signatures_for_interaction_functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/universe)

; WorldState: a data definition of your choice
; a collection of data that represents the state of the world

; render :
;    WorldState -> Image
; big-bang evaluates (render cw) to obtain image of current world cw when needed

; clock-tick-handler:
;    WorldState -> WorldState
; for each tick of the clock, big-bang evaluates (clock-tick-handler cw) for
; current world cw to obtain new world

; key-stroke-handler :
;    WorldState String -> WorldState
; for each key stroke, big-bang evaluates (key-stroke-handler cw ke) for current
; world cw and key stroke ke to obtain new world

; mouse-event-handler :
;    WorldState Number Number String -> WorldState
; for each manipulation of the mouse, big-bang evaluates (mouse-event-handler cw
; x y me) for current world cw, coordinates x and y, and mouse event me to obtain
; new world

; end? :
;    WorldState -> Boolean
; after an event is processed, big-bang evaluate (end? cw) for current world cw
; to determine whether the program stops
