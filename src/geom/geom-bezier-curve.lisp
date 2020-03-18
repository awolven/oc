(in-package :oc)

(defmethod initialize-instance :after ((instance geom-bezier-curve)
				       &rest initargs &key CurvePoles PoleWeights
							&allow-other-keys)
  (let ((ff-pointer
	 (cond ((and (typep CurvePoles 'tcol-gp-array1-of-pnt)
		     (typep PoleWeights 'tcol-std-array1-of-real))
		(_wrap_new_Geom_BezierCurve__SWIG_1 (ff-pointer CurvePoles)
						    (ff-pointer PoleWeights)))

	       ((and (typep CurvePoles 'tcol-gp-array1-of-pnt)
		     (null PoleWeights))
		(_wrap_new_Geom_BezierCurve__SWIG_0 (ff-pointer CurvePoles)))

	       (t (error "Invalid arguments to constructor: ~S" initargs)))))

    (setf (ff-pointer instance) ff-pointer)
;;    (oc:finalize instance)
    (values)))

(defmethod increase-degree ((curve geom-bezier-curve) (degree integer))
  (_wrap_Geom_BezierCurve_Increase (ff-pointer curve) degree))

(defmethod insert-pole-after ((curve geom-bezier-curve) (index integer)
			      (P gp::pnt) &optional (weight nil Weight-provided-p))
  (if Weight-provided-p
      (_wrap_Geom_BezierCurve_InsertPoleAfter__SWIG_1 (ff-pointer curve) index (ptr P)
						      (coerce weight 'double-float))
      (_wrap_Geom_BezierCurve_InsertPoleAfter__SWIG_0 (ff-pointer curve) index (ptr P))))

(defmethod insert-pole-before ((curve geom-bezier-curve) (index integer)
			       (P gp::pnt) &optional (weight nil Weight-provided-p))
  (if Weight-provided-p
      (_wrap_Geom_BezierCurve_InsertPoleBefore__SWIG_1 (ff-pointer curve) index (ptr P)
						       (coerce weight 'double-float))
      (_wrap_Geom_BezierCurve_InsertPoleBefore__SWIG_0 (ff-pointer curve) index (ptr P))))

(defmethod remove-pole ((curve geom-bezier-curve) (index integer))
  (_wrap_Geom_BezierCurve_RemovePole (ff-pointer curve) index))

(defmethod segment ((curve geom-bezier-curve) (U1 real) (U2 real))
  (_wrap_Geom_BezierCurve_Segment (ff-pointer curve)
				  (coerce U1 'double-float)
				  (coerce U2 'double-float)))

(defmethod (setf pole) ((index integer) (P gp::pnt) (curve geom-bezier-curve))
  (_wrap_Geom_BezierCurve_SetPole__SWIG_0 (ff-pointer curve) index (ptr P)))

(defmethod (setf pole-with-weight) ((index integer) (P gp::pnt) (weight real)
				    (curve geom-bezier-curve))
  (_wrap_Geom_BezierCurve_SetPole__SWIG_1 (ff-pointer curve) index (ptr P)
					  (coerce weight 'double-float)))

(defmethod (setf weight) ((index integer) (weight real) (curve geom-bezier-curve))
  (_wrap_Geom_BezierCurve_SetWeight (ff-pointer curve) index (coerce weight 'double-float)))

(defmethod rational? ((curve geom-bezier-curve))
  (_wrap_Geom_BezierCurve_IsRational (ff-pointer curve)))

(defmethod degree ((curve geom-bezier-curve))
  (_wrap_Geom_BezierCurve_Degree (ff-pointer curve)))

(defmethod number-of-poles ((curve geom-bezier-curve))
  (_wrap_Geom_BezierCurve_NbPoles (ff-pointer curve)))

(defmethod pole ((curve geom-bezier-curve) (index integer))
  (let* ((pointer (_wrap_Geom_BezierCurve_Pole (ff-pointer curve) index))
	 (struct (gp::make-pnt :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod poles ((curve geom-bezier-curve))
  (let* ((ff-pointer (_wrap_Geom_BezierCurve_Poles (ff-pointer curve)))
	 (array (allocate-instance (load-time-value (find-class 'tcol-gp-array1-of-pnt)))))
    (setf (ff-pointer array) ff-pointer)
    (oc:finalize array)
    array))

(defmethod weight ((curve geom-bezier-curve) (index integer))
  (_wrap_Geom_BezierCurve_Weight (ff-pointer curve) index))

(defmethod weights ((curve geom-bezier-curve))
  (let* ((ff-pointer (_wrap_Geom_BezierCurve_Weights (ff-pointer curve)))
	 (array (allocate-instance (load-time-value (find-class 'tcol-std-array1-of-real)))))
    (setf (ff-pointer array) ff-pointer)
    (oc:finalize array)
    array))

(defun max-3d-bezier-curve-degree ()
  (_wrap_Geom_BezierCurve_MaxDegree))

(defmethod resolution ((curve geom-bezier-curve) (ToleranceUV real))
  (with-foreign-object (&UTolerance :double)
    (_wrap_Geom_BezierCurve_Resolution (ff-pointer curve) (coerce ToleranceUV 'double-float)
					 &UTolerance)
    (mem-aref &Utolerance :double)))

(defun make-bezier-curve-3d (poles weights)
  (let* ((poles-length (length poles))
	 (poles-array (make-instance 'tcol-gp-array1-of-pnt :theLower 1 :theUpper poles-length)))
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
      (make-instance 'geom-bezier-curve :poleweights weights-array
		     :curvepoles poles-array))))
