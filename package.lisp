;;;; package.lisp

(defpackage #:session-control
  (:use #:cl)
  (:export #:*session-control-middleware*
           #:*session-controller*
           #:destroy-session
           #:change-session-id))
