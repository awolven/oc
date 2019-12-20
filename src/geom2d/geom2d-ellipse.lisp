(in-package :oc)

(defmethod initialize-instance :after ((object geom2d-ellipse) &rest initargs
				       &key E Axis MajorAxis MajorRadius MinorRadius
					 (Sense t Sense-provided-p)
					 &allow-other-keys)
  (let ((pointer
	 (cond ((and MajorAxis MajorRadius MinorRadius Sense-provided-p (null E))
		(_wrap_new_Geom2d_Ellipse__SWIG_1 (ptr MajorAxis)
						  (coerce MajorRadius 'double-float)
						  (coerce MinorRadius 'double-float)
						  Sense))
	       
	       ((and MajorAxis MajorRadius MinorRadius (null E))
		(_wrap_new_Geom2d_Ellipse__SWIG_2 (ptr MajorAxis)
						  (coerce MajorRadius 'double-float)
						  (coerce MinorRadius 'double-float)))
	       
	       ((and Axis MajorRadius MinorRadius (null E))
		(_wrap_new_Geom2d_Ellipse__SWIG_3 (ptr Axis)
						  (coerce MajorRadius 'double-float)
						  (coerce MinorRadius 'double-float)))
	       
	       ((and (typep E 'gp::elips2d)
		     (null (or Axis MajorAxis MajorRadius MinorRadius Sense-provided-p)))
		(_wrap_new_Geom2d_Ellipse__SWIG_0 (ptr E)))
	       
	       (t "Invalid arguments to constructor: ~S" initargs))))
    (setf (ff-pointer object) pointer)
    (sb-ext:finalize
     object
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    (values)))

(defmethod (setf geom-processor) ((E gp::elips2d) (ellipse geom2d-ellipse))
  (_wrap_Geom2d_Ellipse_SetElips2d (ff-pointer ellipse) (ptr E)))

(defmethod (setf major-radius) ((major-radius number) (ellipse geom2d-ellipse))
  (setq major-radius (coerce major-radius 'double-float))
  (_wrap_Geom2d_Ellipse_SetMajorRadius (ff-pointer ellipse) major-radius)
  major-radius)

(defmethod (setf minor-radius) ((minor-radius number) (ellipse geom2d-ellipse))
  (setq minor-radius (coerce minor-radius 'double-float))
  (_wrap_Geom2d_Ellipse_SetMinorRadius (ff-pointer ellipse) minor-radius)
  minor-radius)

(defmethod geom-processor ((ellipse geom2d-ellipse))
  (let* ((pointer (_wrap_Geom2d_Ellipse_Elips2d (ff-pointer ellipse)))
	 (struct (gp::make-elips2d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Elips2d pointer))
		     :dont-save t)
    struct))

(defmethod directrix1 ((ellipse geom2d-ellipse))
  (let* ((pointer (_wrap_Geom2d_Ellipse_Directrix1 (ff-pointer ellipse)))
	 (struct (gp::make-ax2d :ptr pointer)))
    (sb-ext:finalize struct
		     (lambda ()
		       (_wrap_delete_gp_Ax2d pointer))
		     :dont-save t)
    struct))

(defmethod directrix2 ((ellipse geom2d-ellipse))
  (let* ((pointer (_wrap_Geom2d_Ellipse_Directrix2 (ff-pointer ellipse)))
	 (struct (gp::make-ax2d :ptr pointer)))
    (sb-ext:finalize struct
		     (lambda ()
		       (_wrap_delete_gp_Ax2d pointer))
		     :dont-save t)
    struct))

(defmethod focal-length ((ellipse geom2d-ellipse))
  (_wrap_Geom2d_Ellipse_Focal (ff-pointer ellipse)))

(defmethod focus1 ((ellipse geom2d-ellipse))
  (let* ((pointer (_wrap_Geom2d_Ellipse_Focus1 (ff-pointer ellipse)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (sb-ext:finalize struct
		     (lambda ()
		       (_wrap_delete_gp_Pnt2d pointer))
		     :dont-save t)
    struct))

(defmethod focus2 ((ellipse geom2d-ellipse))
  (let* ((pointer (_wrap_Geom2d_Ellipse_Focus2 (ff-pointer ellipse)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (sb-ext:finalize struct
		     (lambda ()
		       (_wrap_delete_gp_Pnt2d pointer))
		     :dont-save t)
    struct))

(defmethod major-radius ((ellipse geom2d-ellipse))
  (_wrap_Geom2d_Ellipse_MajorRadius (ff-pointer ellipse)))

(defmethod minor-radius ((ellipse geom2d-ellipse))
  (_wrap_Geom2d_Ellipse_MinorRadius (ff-pointer ellipse)))

(defmethod parameter ((ellipse geom2d-ellipse))
  (_wrap_Geom2d_Ellipse_Parameter (ff-pointer ellipse)))
