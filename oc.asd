(defsystem :oc
  :description "Lisp OpenCascade bindings."
  :depends-on (:cffi)
  :author "Andrew K Wolven <awolven@gmail.com>"
  :components
  ((:file "load-oc")
   (:file "package")
   (:file "oc")
   (:file "opencascade")))
	  
