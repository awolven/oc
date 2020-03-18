(in-package :oc)

(defmethod initialize-instance :after ((obj gc-make-arc-of-circle) &rest initargs
				       &key P1 P2 Circ Sense P3 &allow-other-keys)
  (declare (ignore initargs))
  (assert (gp:pnt-p P1))
  (assert (gp:pnt-p P2))
  (setf (ff-pointer obj)
	(cond ((and Circ Sense)
	       (assert (gp:circ-p Circ))
	       (assert (typep Sense 'boolean))
	       (_wrap_new_GC_MakeArcOfCircle__SWIG_1 Circ (ptr P1) (ptr P2) Sense))
	      (P3
	       (assert (gp:pnt-p P3))
	       (_wrap_new_GC_MakeArcOfCircle__SWIG_0 (ptr P1) (ptr P2) (ptr P3)))
	      (t (error "Insufficient arguments to constructor."))))
  (oc:finalize obj)
  (values))

(defmethod value ((self gc-make-arc-of-circle))
  (let ((curve (allocate-instance (load-time-value (find-class 'geom-trimmed-curve)))))
    (setf (ff-pointer curve) (_wrap_GC_MakeArcOfCircle_Value (ff-pointer self)))
    (oc:finalize curve)
    curve))
