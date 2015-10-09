;;;; session-control.lisp

(in-package #:session-control)

(defun destroy-session ()
  (declare (special *session-controller*))
  (unless (boundp '*session-controller*)
    (error "~S is unbound, is the SESSION-CONTROL middleware active?"
           '*session-controller*))
  (funcall *session-controller* :destroy))

(defun change-session-id ()
  (declare (special *session-controller*))
  (unless (boundp '*session-controller*)
    (error "~S is unbound, is the SESSION-CONTROL middleware active?"
           '*session-controller*))
  (funcall *session-controller* :new-id))

(defun session-controller (env)
  "Return a function that can manipulate the Lack session in ENV."
  (lambda (command &rest args)
    (declare (ignore args))
    (ecase command
      (:destroy (when (getf env :lack.session)
                  (setf (getf (getf env :lack.session.options) :expire) t)))
      (:new-id (when (getf env :lack.session)
                 (setf (getf (getf env :lack.session.options) :change-id) t))))
    (values)))

(defparameter *session-control-middleware*
  (lambda (app)
    (lambda (env)
      (let ((*session-controller* (session-controller env)))
        (declare (special *session-controller*))
        (funcall app env)))))
