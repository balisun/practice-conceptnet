#|
  This file is a part of practice-conceptnet project.
  Copyright (c) 2018 Bali Sun (balisun@libgirl.com)
|#

(in-package :cl-user)
(defpackage practice-conceptnet-test-asd
  (:use :cl :asdf))
(in-package :practice-conceptnet-test-asd)

(defsystem practice-conceptnet-test
  :author "Bali Sun"
  :license ""
  :depends-on (:practice-conceptnet
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "practice-conceptnet"))))
  :description "Test system for practice-conceptnet"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
