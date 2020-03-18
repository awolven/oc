(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-hyperbola)
				       &rest initargs
				       &key H MajorAxis MajorRadius MinorRadius
					 (Sense t Sense-provided-p) Axis
					 &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and (typep H 'gp::hypr2d) (null MajorAxis) (null MajorRadius)
		     (null MinorRadius) (null Sense-provided-p) (null Axis))
		(_wrap_new_Geom2d_Hyperbola__SWIG_0 (ptr H)))

	       ((and (null H) (typep MajorAxis 'gp::ax2d) MajorRadius MinorRadius
		     Sense-provided-p)
		(_wrap_new_Geom2d_Hyperbola__SWIG_1
		 (ptr MajorAxis) (coerce MajorRadius 'double-float)
		 (coerce MinorRadius 'double-float) Sense))

	       ((and (null H) (typep MajorAxis 'gp::ax2d) MajorRadius MinorRadius
		     (null Sense-provided-p))
		(_wrap_new_Geom2d_Hyperbola__SWIG_2
		 (ptr MajorAxis) (coerce MajorRadius 'double-float)
		 (coerce MinorRadius 'double-float)))

	       ((and (null H) (null MajorAxis) (typep Axis 'gp::ax22d)
		     MajorRadius MinorRadius)
		(_wrap_new_Geom2d_Hyperbola__SWIG_3 (ptr axis)
						    (coerce MajorRadius 'double-float)
						    (coerce MinorRadius 'double-float)))

	       (t (error "Invalid initargs to constructor: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    (values)))

(defmethod (setf geom-processor) ((H gp::hypr2d) (hyperbola geom2d-hyperbola))
  (_wrap_Geom2d_Hyperbola_SetHypr2d (ff-pointer hyperbola) (ptr H)))

(defmethod (setf major-radius) ((major-radius number) (hyperbola geom2d-hyperbola))
  (_wrap_Geom2d_Hyperbola_SetMajorRadius (ff-pointer hyperbola) (coerce major-radius 'double-float)))

(defmethod (setf minor-radius) ((minor-radius number) (hyperbola geom2d-hyperbola))
  (_wrap_Geom2d_Hyperbola_SetMinorRadius (ff-pointer hyperbola) (coerce minor-radius 'double-float)))

(defmethod geom-processor ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_Hypr2d (ff-pointer hyperbola)))
	 (struct (gp::make-hypr2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod asymptote1 ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_Asymptote1 (ff-pointer hyperbola)))
	 (struct (gp::make-ax2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod asymptote2 ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_Asymptote2 (ff-pointer hyperbola)))
	 (struct (gp::make-ax2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod conjugate-branch1 ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_ConjugateBranch1 (ff-pointer hyperbola)))
	 (struct (gp::make-hypr2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod conjugate-branch2 ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_ConjugateBranch2 (ff-pointer hyperbola)))
	 (struct (gp::make-hypr2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod directrix1 ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_Directrix1 (ff-pointer hyperbola)))
	 (struct (gp::make-ax2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod directrix2 ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_Directrix2 (ff-pointer hyperbola)))
	 (struct (gp::make-ax2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod focal-length ((hyperbola geom2d-hyperbola))
  (_wrap_Geom2d_Hyperbola_Focal (ff-pointer hyperbola)))

(defmethod focus1 ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_Focus1 (ff-pointer hyperbola)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod focus2 ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_Focus2 (ff-pointer hyperbola)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod major-radius ((hyperbola geom2d-hyperbola))
  (_wrap_Geom2d_Hyperbola_MajorRadius (ff-pointer hyperbola)))

(defmethod minor-radius ((hyperbola geom2d-hyperbola))
  (_wrap_Geom2d_Hyperbola_MinorRadius (ff-pointer hyperbola)))

(defmethod other-branch ((hyperbola geom2d-hyperbola))
  (let* ((pointer (_wrap_Geom2d_Hyperbola_OtherBranch (ff-pointer hyperbola)))
	 (struct (gp::make-hypr2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod parameter ((hyperbola geom2d-hyperbola))
  (_wrap_Geom2d_Hyperbola_Parameter (ff-pointer hyperbola)))
