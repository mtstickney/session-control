;;;; session-control.asd

(asdf:defsystem #:session-control
  :description "Middleware to control sessions from Lack/Clack."
  :author "Matthew Stickney <fiendishlinux@gmail.com>"
  :license "MIT"
  :serial t
  :components ((:file "package")
               (:file "session-control")))
