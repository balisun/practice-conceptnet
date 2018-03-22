(in-package :cl-user)
(defpackage practice-conceptnet
  (:use :cl)
  (:export #:up
           #:stop))
(in-package :practice-conceptnet)


(defvar *bpp* (make-instance 'ningle:<app>))

(defvar *bpp-handler*)

(setf (ningle:route *bpp* "/:word")
      #'(lambda (params)
          (drakma:http-request (format nil
                                       "http://api.conceptnet.io/c/en/~A"
                                       (cdr (assoc :word params))))))

(defun up ()
  (setf *bpp-handler*
        (clack:clackup *bpp*)))

(defun stop ()
  (clack:stop *bpp-handler*))
