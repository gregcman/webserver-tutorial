(defpackage #:webserver-tutorial
  (:use :cl))
(in-package #:webserver-tutorial)

(defvar *handler* nil)
(defun start-clack ()
  (setf *handler*
	(clack:clackup
	 (lambda (env)
	   (declare (ignore env))
	   '(200 (:content-type "text/plain") ("Hello, Clack!"))))))

(defun start-hunchentoot0 ()
  (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 4242))
  (hunchentoot:define-easy-handler (say-yo :uri "/yo") (name)
    (setf (hunchentoot:content-type*) "text/plain")
    (format nil "Hey~@[ ~A~]!" name)))
