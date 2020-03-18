(in-package :oc)

(defmethod reverse! ((curve geom2d-curve))
  (_wrap_Geom2d_Curve_Reverse (ff-pointer curve)))

(defmethod reversed-parameter ((curve geom2d-curve) (U number))
  (_wrap_Geom2d_Curve_ReversedParameter (ff-pointer curve) (coerce U 'double-float)))

(defmethod transformed-parameter ((curve geom2d-curve) (u number) (trsf gp::trsf2d))
  (_wrap_Geom2d_Curve_TransformedParameter (ff-pointer curve) (coerce u 'double-float) (ptr trsf)))

(defmethod parametric-transformation ((curve geom2d-curve) (trsf gp::trsf2d))
  (_wrap_Geom2d_Curve_ParametricTransformation (ff-pointer curve) (ptr trsf)))

(defmethod reversed ((curve geom2d-curve))
  (let ((pointer (_wrap_Geom2d_Curve_Reversed (ff-pointer curve)))
	(curve (allocate-instance (class-of curve))))
    (setf (ff-pointer curve) pointer)
    (oc:finalize curve)
    curve))

(defmethod first-parameter ((curve geom2d-curve))
  (_wrap_Geom2d_Curve_FirstParameter (ff-pointer curve)))

(defmethod last-parameter ((curve geom2d-curve))
  (_wrap_Geom2d_Curve_LastParameter (ff-pointer curve)))

(defmethod closed? ((curve geom2d-curve))
  (_wrap_Geom2d_Curve_IsClosed (ff-pointer curve)))

(defmethod periodic? ((curve geom2d-curve))
  (_wrap_Geom2d_Curve_IsPeriodic (ff-pointer curve)))

(defmethod period ((curve geom2d-curve))
  (_wrap_Geom2d_Curve_Period (ff-pointer curve)))

(defmethod continuity ((curve geom2d-curve))
  (_wrap_Geom2d_Curve_Continuity (ff-pointer curve)))

(defmethod continuous-n? ((curve geom2d-curve) (n integer))
  (_wrap_Geom2d_Curve_IsCN (ff-pointer curve) n))

(defmethod zeroeth-derivative ((curve geom2d-curve) (u number))
  (let ((p-p (foreign-alloc '(:struct gp::gp-pnt2d))))
    (_wrap_Geom2d_Curve_D0 (ff-pointer curve) (coerce u 'double-float) p-p)
    (let ((struct (gp::make-pnt2d :ptr p-p)))
      (oc:finalize struct :native)
      struct)))

(defmethod first-derivative ((curve geom2d-curve) (u number))
  (let ((p-p (foreign-alloc '(:struct gp::gp-pnt2d)))
	(p-v1 (foreign-alloc '(:struct gp::gp-vec2d))))
    (_wrap_Geom2d_Curve_D1 (ff-pointer curve) (coerce u 'double-float) p-p p-v1)
    (let ((struct-p (gp::make-pnt2d :ptr p-p))
	  (struct-v1 (gp::make-vec2d :ptr p-v1)))
      (oc:finalize struct-p :native)
      (oc:finalize struct-v1 :native)
      (values struct-v1 struct-p))))

(defmethod second-derivative ((curve geom2d-curve) (u number))
  (let ((p-p (foreign-alloc '(:struct gp::gp-pnt2d)))
	(p-v1 (foreign-alloc '(:struct gp::gp-vec2d)))
	(p-v2 (foreign-alloc '(:struct gp::gp-vec2d))))
    (_wrap_Geom2d_Curve_D2 (ff-pointer curve) (coerce u 'double-float) p-p p-v1 p-v2)
    (let* ((struct-p (gp::make-pnt2d :ptr p-p))
	   (struct-v1 (gp::make-vec2d :ptr p-v1))
	   (struct-v2 (gp::make-vec2d :ptr p-v2)))
      (oc:finalize struct-p :native)
      (oc:finalize struct-v1 :native)
      (oc:finalize struct-v2 :native)
      (values struct-v2 struct-v1 struct-p))))

(defmethod third-derivative ((curve geom2d-curve) (u number))
  (let ((p-p (foreign-alloc '(:struct gp::gp-pnt2d)))
	(p-v1 (foreign-alloc '(:struct gp::gp-vec2d)))
	(p-v2 (foreign-alloc '(:struct gp::gp-vec2d)))
	(p-v3 (foreign-alloc '(:struct gp::gp-vec2d))))
    (_wrap_Geom2d_Curve_D3 (ff-pointer curve) (coerce u 'double-float) p-p p-v1 p-v2 p-v3)
    (let* ((struct-p (gp::make-pnt2d :ptr p-p))
	   (struct-v1 (gp::make-vec2d :ptr p-v1))
	   (struct-v2 (gp::make-vec2d :ptr p-v2))
	   (struct-v3 (gp::make-vec2d :ptr p-v3)))
      (oc:finalize struct-p :native)
      (oc:finalize struct-v1 :native)
      (oc:finalize struct-v2 :native)
      (oc:finalize struct-v3 :native)
      (values struct-v3 struct-v2 struct-v1 struct-p))))

(defmethod nth-derivative ((curve geom2d-curve) (n integer) (u number))
  (let* ((pointer (_wrap_Geom2d_Curve_D0 (ff-pointer curve) (coerce u 'double-float) n))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod evaluate-curve ((curve geom2d-curve) (U number))
  ;; opencascade returns a gp_Pnt2d
  ;; the swig wrapper, however, returns a pointer to a new gp_Pnt2d (via copy constructor)
  ;; this needs a finalizer.
  (let* ((pointer (_wrap_Geom2d_Curve_Value (ff-pointer curve) (coerce U 'double-float)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (oc:finalize struct)
    struct))
