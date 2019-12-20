(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-transformation) &rest initargs
				       &key Trsf &allow-other-keys)
  (let ((ff-pointer
	 (cond ((null initargs) (_wrap_new_Geom2d_Transformation__SWIG_0))
	       ((typep Trsf 'gp::trsf2d)
		(_wrap_new_Geom2d_Transformation__SWIG_1 (ptr Trsf)))
	       (t (error "Invalid initargs to constructor: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (sb-ext:finalize instance (lambda ()
				(_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer))
		     :dont-save t)
    (values)))

(defmethod (setf mirror) ((P gp::pnt2d) (transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_SetMirror__SWIG_0 (ff-pointer transform) (ptr P))
  P)

(defmethod (setf mirror) ((A gp::ax2d) (transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_SetMirror__SWIG_1 (ff-pointer transform) (ptr A))
  A)

(defmethod (setf rotation2) ((P gp::pnt2d) (Ang number) (transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_SetRotation (ff-pointer transform) (ptr P) (coerce Ang 'double-float)))

(defmethod (setf scale2) ((P gp::pnt2d) (S number) (transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_SetScale (ff-pointer transform) (ptr P) (coerce S 'double-float)))

(defmethod (setf transformation2) ((from-system gp::ax2d)
				   (to-system gp::ax2d)
				   (transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_SetTransformation__SWIG_0 (ff-pointer transform)
							 (ptr from-system)
							 (ptr to-system)))

(defmethod (setf transformation) ((to-system gp::ax2d) (transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_SetTransformation__SWIG_1 (ff-pointer transform)
							 (ptr to-system)))

(defmethod (setf translation) ((V gp::vec2d) (transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_SetTranslation__SWIG_0 (ff-pointer transform)
						      (ptr V)))

(defmethod (setf translation2) ((P1 gp::pnt2d) (P2 gp::pnt2d) (transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_SetTranslation__SWIG_1 (ff-pointer transform) (ptr P1) (ptr P2)))

(defmethod (setf geom-processor) ((Trsf gp::trsf2d) (transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_SetTrsf2d (ff-pointer transform) (ptr Trsf)))

(defmethod negative? ((transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_IsNegative (ff-pointer transform)))

(defmethod transform-form ((transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_Form (ff-pointer transform)))

(defmethod scale-factor ((transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_ScaleFactor (ff-pointer transform)))

(defmethod geom-processor ((transform geom2d-transformation))
  (let* ((pointer (_wrap_Geom2d_Transformation_Trsf2d (ff-pointer transform)))
	 (struct (gp::make-trsf2d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Trsf2d pointer)) :dont-save t)
    struct))

(defmethod get-value2 ((transform geom2d-transformation) (row integer) (col integer))
  (assert (<= 0 row 2))
  (assert (<= 0 col 3))
  (_wrap_Geom2d_Transformation_Value (ff-pointer transform) row col))

(defmethod invert! ((transform geom2d-transformation))
  (_wrap_Geom2d_Transformation_Invert (ff-pointer transform)))

(defmethod inverted ((transform geom2d-transformation))
  (let ((ff-pointer (_wrap_Geom2d_Transformation_Inverted (ff-pointer transform)))
	(result (allocate-instance (load-time-value (find-class 'geom2d-transformation)))))
    (setf (ff-pointer result) ff-pointer)
    (sb-ext:finalize result
		     (lambda ()
		       (_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer)))
    result))

(defmethod multiplied ((transform geom2d-transformation) (other geom2d-transformation))
  (let ((ff-pointer (_wrap_Geom2d_Transformation_Multiplied (ff-pointer transform)
							    (ff-pointer other)))
	(result (allocate-instance (load-time-value (find-class 'geom2d-transformation)))))
    (setf (ff-pointer result) ff-pointer)
    (sb-ext:finalize result
		     (lambda ()
		       (_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer)))
    result))
    
(defmethod multiply! ((transform geom2d-transformation) (other geom2d-transformation))
  (_wrap_Geom2d_Transformation_Multiply (ff-pointer transform) (ff-pointer other)))

(defmethod power! ((transform geom2d-transformation) (N integer))
  (_wrap_Geom2d_Transformation_Power (ff-pointer transform) N))

(defmethod powered ((transform geom2d-transformation) (N integer))
  (let ((ff-pointer (_wrap_Geom2d_Transformation_Powered (ff-pointer transform) N))
	(result (allocate-instance (load-time-value (find-class 'geom2d-transformation)))))
    (setf (ff-pointer result) ff-pointer)
    (sb-ext:finalize result
		     (lambda ()
		       (_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer)))
    result))

(defmethod pre-multiply! ((transform geom2d-transformation) (other geom2d-transformation))
  (_wrap_Geom2d_Transformation_PreMultiply (ff-pointer transform) (ff-pointer other)))

(defmethod transforms! ((transform geom2d-transformation) (X number) (Y number))
  (with-foreign-objects ((&x :double)
			 (&y :double))
    (setq X (coerce X 'double-float)
	  Y (coerce Y 'double-float))
    (_wrap_Geom2d_Transformation_Transforms (ff-pointer transform) X Y)
    (values (mem-aref &x :double) (mem-aref &y :double))))

(defmethod copy ((transform geom2d-transformation))
  (let ((ff-pointer (_wrap_Geom2d_Transformation_Copy (ff-pointer transform)))
	(result (allocate-instance (load-time-value (find-class 'geom2d-transformation)))))
    (setf (ff-pointer result) ff-pointer)
    (sb-ext:finalize result
		     (lambda ()
		       (_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer)))
    result))
