#|
  This file is a part of practice-conceptnet project.
  Copyright (c) 2018 Bali Sun (balisun@libgirl.com)
|#

#|
  learn Common Lisp IDE by demo conceptnet

  Author: Bali Sun (balisun@libgirl.com)
|#

(in-package :cl-user)
(defpackage practice-conceptnet-asd
  (:use :cl :asdf))
(in-package :practice-conceptnet-asd)

(defsystem practice-conceptnet
  :version "0.1"
  :author "Bali Sun"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "practice-conceptnet"))))
  :description "learn Common Lisp IDE by demo conceptnet"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op practice-conceptnet-test))))
