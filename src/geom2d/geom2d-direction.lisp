(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-direction)
				       &rest initargs
				       &key X Y V &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and (typep X 'number) (typep Y 'number) (null V))
		(_wrap_new_Geom2d_Direction__SWIG_0 (coerce X 'double-float)
						    (coerce Y 'double-float)))
	       ((and (typep V 'gp::dir2d) (null X) (null Y))
		(_wrap_new_Geom2d_Direction__SWIG_1 (ptr V)))
	       (t "Invalid arguments to constructor: ~S" initargs))))
    (setf (ff-pointer instance) ff-pointer)
    (sb-ext:finalize instance
		     (lambda ()
		       (_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer)))
    (values)))

;; maybe rename this generic function (setf coordinate)
(defmethod (setf coord2) ((x real) (y real) (vector geom2d-direction))
  (_wrap_Geom2d_Direction_SetCoord (ff-pointer vector)
				   (coerce x 'double-float)
				   (coerce y 'double-float)))

;; maybe rename this and similar generic functions (setf geometric-primitive)
(defmethod (setf geom-processor) ((V gp::dir2d) (vector geom2d-direction))
  (_wrap_Geom2d_Direction_SetDir2d (ff-pointer vector) (ptr V)))

(defmethod (setf X) ((X number) (vector geom2d-direction))
  (_wrap_Geom2d_Direction_SetX (ff-pointer vector) (coerce X 'double-float)))

(defmethod (setf Y) ((Y number) (vector geom2d-direction))
  (_wrap_Geom2d_Direction_SetY (ff-pointer vector) (coerce Y 'double-float)))

(defmethod geom-processor ((vector geom2d-direction))
  (let* ((pointer (_wrap_Geom2d_Direction_Dir2d (ff-pointer vector)))
	 (struct (gp::make-dir2d :ptr pointer)))
    (sb-ext:finalize struct
		     (lambda ()
		       (_wrap_delete_gp_Dir2d pointer))
		     :dont-save t)
    struct))
