(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-bspline-curve) &rest initargs
				       &key Poles Weights Knots Multiplicities Degree
					 (Periodic nil Periodic-supplied-p)
					 &allow-other-keys)

  (let ((ff-pointer
	 (cond ((and (typep Poles 'TCol-gp-Array1-Of-Pnt2d) (null Weights)
		     (typep Knots 'TCol-std-Array1-Of-Real) (typep Multiplicities 'TCol-std-Array1-Of-Integer)
		     (typep Degree 'integer) Periodic-supplied-p)
		(_wrap_new_Geom2d_BSplineCurve__SWIG_0
		 (ff-pointer Poles) (ff-pointer Knots) (ff-pointer Multiplicities)
		 Degree Periodic))
	       ((and (typep Poles 'TCol-gp-Array1-Of-Pnt2d) (null Weights)
		     (typep Knots 'TCol-std-Array1-Of-Real) (typep Multiplicities 'TCol-std-Array1-Of-Integer)
		     (typep Degree 'integer) (null Periodic-supplied-p))
		(_wrap_new_Geom2d_BSplineCurve__SWIG_1
		 (ff-pointer Poles) (ff-pointer Knots) (ff-pointer Multiplicities)
		 Degree))
	       ((and (typep Poles 'TCol-gp-Array1-Of-Pnt2d) (typep Weights 'TCol-std-Array1-Of-Real)
		     (typep Knots 'TCol-std-Array1-Of-Real) (typep Multiplicities 'TCol-std-Array1-Of-Integer)
		     (typep Degree 'integer) Periodic-supplied-p)
		(_wrap_new_Geom2d_BSplineCurve__SWIG_2
		 (ff-pointer Poles) (ff-pointer Weights) (ff-pointer Knots) (ff-pointer Multiplicities)
		 Degree Periodic))
	       ((and (typep Poles 'TCol-gp-Array1-Of-Pnt2d) (typep Weights 'TCol-std-Array1-Of-real)
		     (typep Knots 'TCol-std-Array1-Of-Real) (typep Multiplicities 'TCol-std-Array1-Of-Integer)
		     (typep Degree 'integer) (null Periodic-supplied-p))
		(_wrap_new_Geom2d_BSplineCurve__SWIG_3
		 (ff-pointer Poles) (ff-pointer Weights) (ff-pointer Knots) (ff-pointer Multiplicities)
		 Degree))
	       (t (error "Invalid initargs: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    (values)))

(defmethod increase-degree ((curve geom2d-bspline-curve) (degree integer))
  (_wrap_Geom2d_BSplineCurve_IncreaseDegree (ff-pointer curve) degree))

(defmethod increase-multiplicity ((curve geom2d-bspline-curve)
				  (index integer)
				  (m integer))
  (_wrap_Geom2d_BSplineCurve_IncreaseMultiplicity__SWIG_0 (ff-pointer curve) index m))

(defmethod increase-multiplicity2 ((curve geom2d-bspline-curve)
				   (index1 integer) (index2 integer)
				   (m integer))
  (_wrap_Geom2d_BSplineCurve_IncreaseMultiplicity__SWIG_1 (ff-pointer curve)
							  index1 index2 m))

(defmethod increment-multiplicity ((curve geom2d-bspline-curve)
				   (index1 integer) (index2 integer)
				   (m integer))
  (_wrap_Geom2d_BSplineCurve_IncrementMultiplicity (ff-pointer curve) index1 index2 m))

(defmethod insert-knot ((curve geom2d-bspline-curve) (u real) &optional (m 1 m-supplied-p)
						       (parametric-tolerance 0.0d0 pt-supplied-p))
  (if m-supplied-p
      (if pt-supplied-p
	  (_wrap_Geom2d_BSplineCurve_InsertKnot__SWIG_0 (ff-pointer curve)
							(coerce u 'double-float)
							m
							(coerce parametric-tolerance 'double-float))
	  (_wrap_Geom2d_BSplineCurve_InsertKnot__SWIG_1 (ff-pointer curve)
							(coerce u 'double-float) m))
      (_wrap_Geom2d_BSplineCurve_InsertKnot__SWIG_2 (ff-pointer curve)
						    (coerce u 'double-float))))

(defmethod insert-knots ((curve geom2d-bspline-curve) (knots tcol-std-array1-of-real)
			 (mults tcol-std-array1-of-integer)
			 &optional (parametric-tolerance 0.0d0 pt-supplied-p)
			   (add? nil add?-supplied-p))
  (if pt-supplied-p
      (if add?-supplied-p
	  (_wrap_Geom2d_BSplineCurve_InsertKnots__SWIG_0 (ff-pointer curve)
							 (ff-pointer knots)
							 (ff-pointer mults)
							 (coerce parametric-tolerance 'double-float)
							 (if add? (if (eq add? 0) 0 1) 0))
	  (_wrap_Geom2d_BSplineCurve_InsertKnots__SWIG_1 (ff-pointer curve)
							 (ff-pointer knots)
							 (ff-pointer mults)
							 (coerce parametric-tolerance 'double-float)))
      (_wrap_Geom2d_BSplineCurve_InsertKnots__SWIG_2 (ff-pointer curve)
						     (ff-pointer knots)
						     (ff-pointer mults))))

(defmethod remove-knot ((curve geom2d-bspline-curve)
			(index integer)
			(m integer)
			(tolerance real))
  (_wrap_Geom2d_BSplineCurve_RemoveKnot (ff-pointer curve) index m (coerce tolerance 'double-float)))

(defmethod insert-pole-with-weight-after ((curve geom2d-bspline-curve)
					  (index integer)
					  (p gp::pnt2d)
					  (weight real))
  (_wrap_Geom2d_BSplineCurve_InsertPoleAfter__SWIG_0 (ff-pointer curve) index p (coerce weight 'double-float)))

(defmethod insert-pole-with-weight-before ((curve geom2d-bspline-curve)
					   (index integer)
					   (p gp::pnt2d)
					   (weight real))
  (_wrap_Geom2d_BSplineCurve_InsertPoleBefore__SWIG_0 (ff-pointer curve) index p (coerce weight 'double-float)))

(defmethod remove-pole ((curve geom2d-bspline-curve)
			(index integer))
  (_wrap_Geom2d_BSplineCurve_RemovePole (ff-pointer curve) index))

(defmethod segment ((curve geom2d-bspline-curve) (u1 real) (u2 real))
  (_wrap_Geom2d_BSplineCurve_Segment (ff-pointer curve)
				     (coerce u1 'double-float)
				     (coerce u2 'double-float)))

(defmethod (setf knot) ((k real) (index integer) (curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_SetKnot__SWIG_0 (ff-pointer curve) index (coerce k 'double-float) ))

(defmethod (setf knots) ((k tcol-std-array1-of-real) (curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_SetKnots (ff-pointer k) (ff-pointer curve)))

(defmethod (setf knot2) ((k real) (m integer) (index integer) (curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_SetKnot__SWIG_1 (ff-pointer curve) index (coerce k 'double-float) m))

(defmethod periodic-normalization ((curve geom2d-bspline-curve))
  (with-foreign-object (&u :double)
    (_wrap_Geom2d_BSplineCurve_PeriodicNormalization (ff-pointer curve) &u)
    (mem-aref &u :double)))

(defmethod (setf periodic) (value (curve geom2d-bspline-curve))
  (if value
      (_wrap_Geom2d_BSplineCurve_SetPeriodic (ff-pointer curve))
      (_wrap_Geom2d_BSplineCurve_SetNotPeriodic (ff-pointer curve))))

(defmethod (setf origin) ((index integer) (curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_SetOrigin (ff-pointer curve) index))

(defmethod (setf pole) ((p gp::pnt2d) (index integer) (curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_SetPole__SWIG_0 (ff-pointer curve) index (ptr p)))

(defmethod (setf pole2) ((p gp::pnt2d) (weight real) (index integer) (curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_SetPole__SWIG_1 (ff-pointer curve) index (ptr p)
					     (coerce weight 'double-float)))

(defmethod (setf weight) ((weight real) (index integer) (curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_SetWeight (ff-pointer curve) index (coerce weight 'double-float)))

(defmethod move-point ((curve geom2d-bspline-curve) (u real) (p gp::pnt2d)
		       (index1 integer) (index2 integer))
  (with-foreign-objects ((&first-modified-pole :int)
			 (&last-modified-pole :int))
    (_wrap_Geom2d_BSplineCurve_MovePoint (ff-pointer curve) (coerce u 'double-float) (ptr p)
					 index1 index2
					 &first-modified-pole &last-modified-pole)
    (values t
	    (mem-aref &first-modified-pole :int)
	    (mem-aref &last-modified-pole :int))))

(defmethod move-point-and-tangent ((curve geom2d-bspline-curve) (u real) (p gp::pnt2d)
				   (tangent gp::vec2d) (tolerance real)
				   (starting-condition integer) (ending-condition integer))
  (with-foreign-object (&error-status :int)
    (_wrap_Geom2d_BSplineCurve_MovePointAndTangent (ff-pointer curve)
						   (coerce u 'double-float)
						   (ptr p) (ptr tangent)
						   (coerce tolerance 'double-float)
						   starting-condition ending-condition
						   &error-status)
    (let ((error-status (mem-aref &error-status :int)))
      (if (zerop error-status)
	  t
	  (values nil error-status)))))

(defmethod G1? ((curve geom2d-bspline-curve) (theTf real) (theTl real) (theAngTol real))
  (_wrap_Geom2d_BSplineCurve_IsG1 (ff-pointer curve)
				  (coerce theTf 'double-float)
				  (coerce theTl 'double-float)
				  (coerce theAngTol 'double-float)))

(defmethod rational? ((curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_IsRational (ff-pointer curve)))

(defmethod degree ((curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_Degree (ff-pointer curve)))

(defmethod local-value ((curve geom2d-bspline-curve) (u real) (from-k1 integer) (to-k2 integer))
  (let* ((pointer (_wrap_Geom2d_BSplineCurve_LocalValue (ff-pointer curve) (coerce u 'double-float)
							from-k1 to-k2))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod local-zeroeth-derivative ((curve geom2d-bspline-curve)
				   (u real) (from-k1 integer) (to-k2 integer))
  (let* ((p (foreign-alloc '(:struct gp::gp-pnt2d)))
	 (struct (gp::make-pnt2d :ptr p)))
    (_wrap_Geom2d_BSplineCurve_LocalD0
     (ff-pointer curve) (coerce u 'double-float) from-k1 to-k2 p)
    (oc:finalize struct :native)
    struct))

(defmethod local-first-derivative ((curve geom2d-bspline-curve)
				   (u real) (from-k1 integer) (to-k2 integer))
  (let* ((p (foreign-alloc '(:struct gp::gp-pnt2d)))
	 (struct-p (gp::make-pnt2d :ptr p))
	 (v1 (foreign-alloc '(:struct gp::gp-vec2d)))
	 (struct-v1 (gp::make-vec2d :ptr v1)))
    (_wrap_Geom2d_BSplineCurve_LocalD1
     (ff-pointer curve) (coerce u 'double-float) from-k1 to-k2 p v1)
    (oc:finalize struct-p :native)
    (oc:finalize struct-v1 :native)
    (values struct-v1 struct-p)))

(defmethod local-second-derivative ((curve geom2d-bspline-curve)
				   (u real) (from-k1 integer) (to-k2 integer))
  (let* ((p (foreign-alloc '(:struct gp::gp-pnt2d)))
	 (struct-p (gp::make-pnt2d :ptr p))
	 (v1 (foreign-alloc '(:struct gp::gp-vec2d)))
	 (struct-v1 (gp::make-vec2d :ptr v1))
	 (v2 (foreign-alloc '(:struct gp::gp-vec2d)))
	 (struct-v2 (gp::make-vec2d :ptr v2)))
    (_wrap_Geom2d_BSplineCurve_LocalD2
     (ff-pointer curve) (coerce u 'double-float) from-k1 to-k2 p v1 v2)
    (oc:finalize struct-p :native)
    (oc:finalize struct-v1 :native)
    (oc:finalize struct-v2 :native)
    (values struct-v2 struct-v1 struct-p)))

(defmethod local-third-derivative ((curve geom2d-bspline-curve)
				   (u real) (from-k1 integer) (to-k2 integer))
  (let* ((p (foreign-alloc '(:struct gp::gp-pnt2d)))
	 (struct-p (gp::make-pnt2d :ptr p))
	 (v1 (foreign-alloc '(:struct gp::gp-vec2d)))
	 (struct-v1 (gp::make-vec2d :ptr v1))
	 (v2 (foreign-alloc '(:struct gp::gp-vec2d)))
	 (struct-v2 (gp::make-vec2d :ptr v2))
	 (v3 (foreign-alloc '(:struct gp::gp-vec2d)))
	 (struct-v3 (gp::make-vec2d :ptr v3)))
    (_wrap_Geom2d_BSplineCurve_LocalD3
     (ff-pointer curve) (coerce u 'double-float) from-k1 to-k2 p v1 v2 v3)
    (oc:finalize struct-p :native)
    (oc:finalize struct-v1 :native)
    (oc:finalize struct-v2 :native)
    (oc:finalize struct-v3 :native)
    (values struct-v3 struct-v2 struct-v1 struct-p)))

(defmethod local-nth-derivative ((curve geom2d-bspline-curve) (u real)
				 (from-k1 integer) (to-k2 integer) (n integer))
  (let* ((pointer (_wrap_Geom2d_BSplineCurve_LocalDN (ff-pointer curve) (coerce u 'double-float)
						     from-k1 to-k2 n))
	 (struct (gp::make-vec2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod first-u-knot-index ((curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_FirstUKnotIndex (ff-pointer curve)))

(defmethod knot ((curve geom2d-bspline-curve) (index integer))
  (_wrap_Geom2d_BSplineCurve_Knot (ff-pointer curve) index))

(defmethod knots ((curve geom2d-bspline-curve))
  (let ((ff-pointer (_wrap_Geom2d_BSplineCurve_Knots (ff-pointer curve)))
	(instance (allocate-instance (load-time-value (find-class 'tcol-std-array1-of-real)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    instance))

(defmethod knot-sequence ((curve geom2d-bspline-curve))
  (let ((ff-pointer (_wrap_Geom2d_BSplineCurve_KnotSequence (ff-pointer curve)))
	(instance (allocate-instance (load-time-value (find-class 'tcol-std-array1-of-real)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    instance))

(defmethod knot-distribution ((curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_KnotDistribution (ff-pointer curve)))

(defmethod last-u-knot-index ((curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_LastUKnotIndex (ff-pointer curve)))

(defmethod locate-u ((curve geom2d-bspline-curve) (u real) (parametric-tolerance real)
		     &optional (with-knot-repetition nil with-knot-repetition-supplied-p))
  (with-foreign-objects ((&I1 :int) (&I2 :int))
    (if with-knot-repetition-supplied-p
	(_wrap_Geom2d_BSplineCurve_LocateU__SWIG_0
	 (ff-pointer curve) (coerce u 'double-float) (coerce parametric-tolerance 'double-float)
	 &I1 &I2 (if with-knot-repetition (if (eq with-knot-repetition 0) 0 1) 0))
	(_wrap_Geom2d_BSplineCurve_LocateU__SWIG_1
	 (ff-pointer curve) (coerce u 'double-float) (coerce parametric-tolerance 'double-float)
	 &I1 &I2))
    (values (mem-aref &I1 :int) (mem-aref &I2 :int))))

(defmethod multiplicity ((curve geom2d-bspline-curve) (index integer))
  (_wrap_Geom2d_BSplineCurve_Multiplicity (ff-pointer curve) index))

(defmethod multiplicities ((curve geom2d-bspline-curve))
  (let ((ff-pointer (_wrap_Geom2d_BSplineCurve_Multiplicities (ff-pointer curve)))
	(instance (allocate-instance (load-time-value (find-class 'tcol-std-array1-of-integer)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    instance))

(defmethod number-of-knots ((curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_NbKnots (ff-pointer curve)))

(defmethod number-of-poles ((curve geom2d-bspline-curve))
  (_wrap_Geom2d_BSplineCurve_NbPoles (ff-pointer curve)))

(defmethod pole ((curve geom2d-bspline-curve) (index integer))
  (let* ((pointer (_wrap_Geom2d_BSplineCurve_Pole (ff-pointer curve) index))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod poles ((curve geom2d-bspline-curve))
  (let ((ff-pointer (_wrap_Geom2d_BSplineCurve_Poles (ff-pointer curve)))
	(instance (allocate-instance (load-time-value (find-class 'tcol-gp-array1-of-pnt2d)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    instance))

(defmethod weight ((curve geom2d-bspline-curve) (index integer))
  (_wrap_Geom2d_BSplineCurve_Weight (ff-pointer curve) index))

(defmethod weights ((curve geom2d-bspline-curve))
  (let ((ff-pointer (_wrap_Geom2d_BSplineCurve_Weights (ff-pointer curve)))
	(instance (allocate-instance (load-time-value (find-class 'tcol-std-array1-of-real)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    instance))

(defun max-2d-bspline-curve-degree ()
  (_wrap_Geom2d_BSplineCurve_MaxDegree))

(defmethod resolution ((curve geom2d-bspline-curve) (ToleranceUV real))
  (with-foreign-object (&UTolerance :double)
    (_wrap_Geom2d_BSplineCurve_Resolution (ff-pointer curve) (coerce ToleranceUV 'double-float)
					  &UTolerance)
    (mem-aref &Utolerance :double)))

(defun make-bspline-curve-2d (poles weights knots multiplicities degree &optional (periodic nil))
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
      (let* ((knots-length (length knots))
	     (knots-array (make-instance 'tcol-std-array1-of-real :theLower 1 :theUpper knots-length)))
	(loop for i from 0 below knots-length
	   do (let ((element (elt knots i)))
		(unless element (return))
		(set-value knots-array (1+ i) element)))

	(let* ((multiplicities-length (length multiplicities))
	       (multiplicities-array (make-instance 'tcol-std-array1-of-integer :theLower 1 :theUpper
						    multiplicities-length)))
	  (loop for i from 0 below multiplicities-length
	     do (let ((element (elt multiplicities i)))
		  (unless element (return))
		  (set-value multiplicities-array (1+ i) element)))
	  (make-instance 'geom2d-bspline-curve
			 :Poles poles-array
			 :Weights weights-array
			 :Knots knots-array
			 :Multiplicities multiplicities-array
			 :Degree degree
			 :Periodic periodic))))))
