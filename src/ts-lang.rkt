#lang racket/base

(require (for-syntax racket/base syntax/parse racket/match))

(provide
  #%module-begin
  #%app
  #%top
  #%datum
  quote
)

(require racket/pretty)
(provide (all-from-out racket/pretty))

(provide
  src
  import
  fun
)

(begin-for-syntax
  (define (process-id-or-list-stx elem)
    (syntax-parse elem
      [(var id) (datum->syntax #'id (process-id #'id))]
      [(list id ...) (datum->syntax #'(id ...) (process-list #'(id ...)))]
    )
  )

  (define (process-id id)
    (list 'quote id)
  )

  (define (process-list lst)
    (list 'quote lst)
  )

  (define (p stx)
    (syntax-parse stx
      [((~literal src) statement:expr ...) #'(list ''source-file (list statement ...))]
      [((~literal import) module-specifier:str) #'(list ''import-declaration #f module-specifier)]
      [((~literal import) module-specifier:str name:id)
        #'(list ''import-declaration (list ''import-clause #f (quote name) #f) module-specifier)]
      [((~literal import) module-specifier:str (named:expr ...))
        #:with (processed ...)
        (map process-id-or-list-stx (syntax->datum #'(named ...)))
        #'(list ''import-declaration (list ''import-clause #f #f (list processed ...)) module-specifier)]
    )
  )
)

(define-syntaxes (src import) (values p p))

; (define-syntax (import stx)
;   (datum->syntax stx (list 'quote (syntax->datum stx)))
; )

(define-syntax (fun stx)
  (datum->syntax stx (list 'quote (syntax->datum stx)))
)
