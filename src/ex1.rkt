#lang s-exp "ts-lang.rkt"

(pretty-print
(src
  (import "react" (useState (a b)))
  (import "./assets/react.svg" reactLogo)
  (import "./vite.svg" viteLogo)
  (import "./App.css")

  ; (fun App () #:return React.ReactElement
  ;   (const (count setCount) (call useState (0)))

  ;   (return
  ;     (jsx
  ;       (fragment ()
  ;         (div ()
  ;           (a ((href "https://vitejs.dev") (target "_blank"))
  ;             (img ((src viteLogo) (alt "vite logo") (class "logo")))
  ;           )
  ;           (a ((href "https://react.dev") (target "_blank"))
  ;             (img ((src reactLogo) (alt "react logo") (class "logo")))
  ;           )
  ;         )
  ;         (h1 () "Vite + React")
  ;         (div ((class "card"))
  ;           (button ((onClick (lambda () ((call setCount (lambda (x) (+ x 1)))))))
  ;             "count is: "
  ;             (jsxe count)
  ;           )
  ;           (p ()
  ;             "Edit "
  ;             (code () "src/App.tsx")
  ;             " and save to test HMR"
  ;           )
  ;         )
  ;         (p ((class "read-the-docs"))
  ;           "Click on the Vite and React logos to learn more"
  ;         )
  ;       )
  ;     )
  ;   )
  ; )
)
)
