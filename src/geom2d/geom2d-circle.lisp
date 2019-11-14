(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-circle) &rest initargs &key A R &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep A 'gp::ax22d))
  (assert (typep R 'number))
  (let ((ff-pointer (_wrap_new_Geom2d_Circle (ptr A) (coerce R 'double-float))))
    (setf (ff-pointer instance) ff-pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer))
     :dont-save t)
    (values)))
