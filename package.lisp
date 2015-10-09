;;;; package.lisp

(defpackage #:session-control
  (:use #:cl)
  (:export #:*session-control-middleware*
           #:destroy-session
           #:change-session-id))
