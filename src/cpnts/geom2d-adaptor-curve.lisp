(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-adaptor-curve) &rest initargs
				       &key C UFirst ULast &allow-other-keys)
  (setf (ff-pointer instance) (cond ((null initargs) (_wrap_new_Geom2dAdaptor_Curve__SWIG_0))
				    ((and (typep C 'geom2d-curve) (null UFirst) (null ULast)) (_wrap_new_Geom2dAdaptor_Curve__SWIG_1 (ff-pointer C)))
				    ((and (typep C 'geom2d-curve) UFirst ULast) (_wrap_new_Geom2dAdaptor_Curve__SWIG_2 (ff-pointer C)
														       (coerce UFirst 'double-float)
														       (coerce ULast 'double-float)))
				    (t (error "Invalid initargs to constructor: ~S" initargs))))
  (ff-pointer-finalize instance #'_wrap_delete_Geom2dAdaptor_Curve)
  (values))
