(defsystem oc
  :description "A wrapper library for using OpenCASCADE with Lisp."
  :depends-on (:cffi)
  :author "Andrew K Wolven <awolven@gmail.com>"
  :components
  ((:file "foreign-libraries")
   (:file "package")
   (:file "oc")
   (:file "gp-macros")
   (:file "gp")
   (:file "opencascade")
   (:file "init")
   (:file "examples")))
