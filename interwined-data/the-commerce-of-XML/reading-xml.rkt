;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname reading-xml) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/batch-io)
(require 2htdp/image)


(define PREFIX "https://www.google.com.hk/finance?q=")
(define SUFFIX "&btnG=search")
(define SIZE 22)
(define SPACER (text "  " SIZE 'white))

(define-struct data [price delta])
; StockWorld is
;   (make-data String String)
; price and delta sepcify the current price and how
; much it changed since the last update

; String -> StockWorld
; retrieves stock price and its change of the specified company
; every 15 seconds and displays together with available time stamp
(define (stock-alert company)
  (local ((define url (string-append PREFIX company SUFFIX))

          ; [StockWorld -> StockWorld]
          ; retrieves price and change from url
          (define (retrieve-stock-data url)
            (local ((define x (read-xexpr/web url)))
              (make-data (get x "price") (get x "priceChange"))))

          ; StockWorld -> Image
          ; renders the stock market data as a single long line
          (define (render-stock-data w)
            (local ((define pt (text (data-price w) SIZE 'black))
                    (define dt (text (data-delta w) SIZE 'red)))
              (overlay (beside pt SPACER dt)
                       (rectangle 300 35 'solid 'white)))))
    ; - IN -
    (big-bang (retrieve-stock-data "no-use")
              [on-tick retrieve-stock-data 15]
              [to-draw render-stock-data]
              [name company])))


; Xexpr.v3 String -> String
; extract meta elements from xe with the attribute value s
(define (get xe s)
  "test")