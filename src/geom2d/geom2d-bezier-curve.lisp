(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-bezier-curve)
				       &rest initargs
				       &key CurvePoles PoleWeights
					 &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and CurvePoles PoleWeights)
		(_wrap_new_Geom2d_BezierCurve__SWIG_1 (ff-pointer CurvePoles)
						      (ff-pointer PoleWeights)))

	       (CurvePoles
		(_wrap_new_Geom2d_BezierCurve__SWIG_0 (ff-pointer CurvePoles)))

	       (t (error "Invalid initargs to constructor: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    (values)))

(defmethod increase-degree ((curve geom2d-bezier-curve) (degree integer))
  (_wrap_Geom2d_BezierCurve_Increase (ff-pointer curve) degree))

(defmethod insert-pole-after ((curve geom2d-bezier-curve) (index integer)
			      (P gp::pnt2d) &optional (weight nil Weight-provided-p))
  (if Weight-provided-p
      (_wrap_Geom2d_BezierCurve_InsertPoleAfter__SWIG_0 (ff-pointer curve) index (ptr P)
							(coerce weight 'double-float))
      (_wrap_Geom2d_BezierCurve_InsertPoleAfter__SWIG_1 (ff-pointer curve) index (ptr P))))

(defmethod insert-pole-before ((curve geom2d-bezier-curve) (index integer)
			      (P gp::pnt2d) &optional (weight nil Weight-provided-p))
  (if Weight-provided-p
      (_wrap_Geom2d_BezierCurve_InsertPoleBefore__SWIG_0 (ff-pointer curve) index (ptr P)
							(coerce weight 'double-float))
      (_wrap_Geom2d_BezierCurve_InsertPoleBefore__SWIG_1 (ff-pointer curve) index (ptr P))))

(defmethod remove-pole ((curve geom2d-bezier-curve) (index integer))
  (_wrap_Geom2d_BezierCurve_RemovePole (ff-pointer curve) index))

(defmethod segment ((curve geom2d-bezier-curve) (U1 real) (U2 real))
  (_wrap_Geom2d_BezierCurve_Segment (ff-pointer curve)
				    (coerce U1 'double-float)
				    (coerce U2 'double-float)))

(defmethod (setf pole) ((index integer) (P gp::pnt2d) (curve geom2d-bezier-curve))
  (_wrap_Geom2d_BezierCurve_SetPole__SWIG_0 (ff-pointer curve) index (ptr P)))

(defmethod (setf pole-with-weight) ((index integer) (P gp::pnt2d) (weight real)
				    (curve geom2d-bezier-curve))
  (_wrap_Geom2d_BezierCurve_SetPole__SWIG_1 (ff-pointer curve) index (ptr P)
					    (coerce weight 'double-float)))

(defmethod (setf weight) ((index integer) (weight real) (curve geom2d-bezier-curve))
  (_wrap_Geom2d_BezierCurve_SetWeight (ff-pointer curve) index (coerce weight 'double-float)))

(defmethod rational? ((curve geom2d-bezier-curve))
  (_wrap_Geom2d_BezierCurve_IsRational (ff-pointer curve)))

(defmethod degree ((curve geom2d-bezier-curve))
  (_wrap_Geom2d_BezierCurve_Degree (ff-pointer curve)))

(defmethod number-of-poles ((curve geom2d-bezier-curve))
  (_wrap_Geom2d_BezierCurve_NbPoles (ff-pointer curve)))

(defmethod pole ((curve geom2d-bezier-curve) (index integer))
  (let* ((pointer (_wrap_Geom2d_BezierCurve_Pole (ff-pointer curve) index))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod poles ((curve geom2d-bezier-curve))
  (let* ((ff-pointer (_wrap_Geom2d_BezierCurve_Poles (ff-pointer curve)))
	 (array (allocate-instance (load-time-value (find-class 'tcol-gp-array1-of-pnt2d)))))
    (setf (ff-pointer array) ff-pointer)
    (oc:finalize array)
    array))

(defmethod weight ((curve geom2d-bezier-curve) (index integer))
  (_wrap_Geom2d_BezierCurve_Weight (ff-pointer curve) index))

(defmethod weights ((curve geom2d-bezier-curve))
  (let* ((ff-pointer (_wrap_Geom2d_BezierCurve_Weights (ff-pointer curve)))
	 (array (allocate-instance (load-time-value (find-class 'tcol-std-array1-of-real)))))
    (setf (ff-pointer array) ff-pointer)
    (oc:finalize array)
    array))

(defun max-2d-bezier-curve-degree ()
  (_wrap_Geom2d_BezierCurve_MaxDegree))

(defmethod resolution ((curve geom2d-bezier-curve) (ToleranceUV real))
  (with-foreign-object (&UTolerance :double)
    (_wrap_Geom2d_BezierCurve_Resolution (ff-pointer curve) (coerce ToleranceUV 'double-float)
					 &UTolerance)
    (mem-aref &Utolerance :double)))

(defun make-bezier-curve-2d (poles weights)
  (let* ((poles-length (length poles))
	 (poles-array (make-instance 'tcol-gp-array1-of-pnt2d :theLower 1 :theUpper poles-length)))
    (loop for i from 0 below poles-length
       do (let ((element (elt poles i)))
	    (unless element (return))
	    (set-value poles-array (1+ i) element)))
    (let* ((weights-length (length weights))
	   (weights-array (make-instance 'tcol-std-array1-of-real :theLower 1 :theUpper weights-length)))
      (loop for i from 0 below weights-length
	 do (let ((element (elt weights i)))
	      (unless element (return))
	      (set-value weights-array (1+ i) element)))
      (make-instance 'geom2d-bezier-curve :poleweights weights-array
		     :curvepoles poles-array))))
