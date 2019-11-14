(in-package :oc)

(defun ff-pointer-finalize (object deleter)
  #+sbcl
  (let ((pointer (ff-pointer object)))
    (sb-ext:finalize object #'(lambda ()
				(funcall deleter pointer)
				(values))
		     :dont-save t)))
