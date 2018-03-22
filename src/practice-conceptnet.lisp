(in-package :cl-user)
(defpackage practice-conceptnet
  (:use :cl))
(in-package :practice-conceptnet)


(defvar *bpp* (make-instance 'ningle:<app>))
(setf (ningle:route *bpp* "/:word")
      #'(lambda (params)
          (drakma:http-request (format nil
                                       "http://conceptnet.io/c/en/~A"
                                       (cdr (assoc :word params))))))
(clack:clackup *bpp*)
