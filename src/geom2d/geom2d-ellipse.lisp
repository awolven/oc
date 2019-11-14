(in-package :oc)

(defmethod initialize-instance :after ((object geom2d-ellipse) &rest initargs
				       &key Axis MajorAxis MajorRadius MinorRadius Sense
					 &allow-other-keys)
  (let ((pointer
	 (cond ((and MajorAxis MajorRadius MinorRadius Sense)
		(_wrap_new_Geom2d_Ellipse__SWIG_0 (ptr MajorAxis)
						  (coerce MajorRadius 'double-float)
						  (coerce MinorRadius 'double-float)
						  (if Sense (if (eq Sense 0) 0 1) 0)))
	       ((and MajorAxis MajorRadius MinorRadius)
		(_wrap_new_Geom2d_Ellipse__SWIG_1 (ptr MajorAxis)
						  (coerce MajorRadius 'double-float)
						  (coerce MinorRadius 'double-float)))
	       ((and Axis MajorRadius MinorRadius)
		(_wrap_new_Geom2d_Ellipse__SWIG_2 (ptr Axis)
						  (coerce MajorRadius 'double-float)
						  (coerce MinorRadius 'double-float)))
	       (t "Invalid arguments to constructor: ~S" initargs))))
    (setf (ff-pointer object) pointer)
    (sb-ext:finalize
     object
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    (values)))
