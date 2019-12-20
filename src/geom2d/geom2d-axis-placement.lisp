(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-axis-placement)
				       &rest initargs
				       &key A P V &allow-other-keys)

  (let ((ff-pointer
	 (cond ((and (gp:ax2d-p A) (null P) (null V))
		(_wrap_new_Geom2d_AxisPlacement__SWIG_0 (ptr A)))

	       ((and (null A) (gp:pnt2d-p P) (gp:dir2d-p V))
		(_wrap_new_Geom2d_AxisPlacement__SWIG_1 (ptr P) (ptr V)))

	       (t (error "Invalid initargs to constructor: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (sb-ext:finalize instance (lambda ()
				(_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer))
		     :dont-save t)
    (values)))

(defmethod reverse! ((geometry geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_Reverse (ff-pointer geometry)))

(defmethod reversed ((geometry geom2d-axis-placement))
  (let ((ff-pointer (_wrap_Geom2d_AxisPlacement_Reversed (ff-pointer geometry)))
	(instance (allocate-instance (load-time-value (find-class 'geom2d-axis-placement)))))
    (setf (ff-pointer instance) ff-pointer)
    (sb-ext:finalize instance (lambda ()
				(_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer))
		     :dont-save t)
    instance))

(defmethod (setf axis) ((A gp:ax2d) (geometry geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_SetAxis (ff-pointer geometry) (ptr A)))

(defmethod (setf direction) ((V gp:dir2d) (self geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_SetDirection (ff-pointer geometry) (ptr V)))

(defmethod (setf location) ((P gp:pnt2d) (self geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_SetLocation (ff-pointer geometry) (ptr P)))

(defmethod angle ((axis-placement1 geom2d-axis-placement)
		  (axis-placement2 geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_Angle (ff-pointer axis-placement1)
				    (ff-pointer axis-placement2)))

(defmethod processor ((axis-placement geom2d-axis-placement))
  (let* ((ptr (_wrap_Geom2d_AxisPlacement_Ax2d (ff-pointer axis-placement)))
	 (struct (make-ax2d :ptr ptr)))
    (sb-ext:finalize struct (lambda ()
				(_wrap_delete_gp_Ax2d ptr))
		     :dont-save t)
    struct))

(defmethod direction ((axis-placement geom2d-axis-placement))
  (let* ((ptr (_wrap_Geom2d_AxisPlacement_Direction (ff-pointer axis-placement)))
	 (struct (make-dir2d :ptr ptr)))
    (sb-ext:finalize struct (lambda ()
				(_wrap_delete_gp_Dir2d ptr))
		     :dont-save t)
    struct))

(defmethod location ((axis-placement geom2d-axis-placement))
  (let* ((ptr (_wrap_Geom2d_AxisPlacement_Location (ff-pointer axis-placement)))
	 (struct (make-pnt2d :ptr ptr)))
    (sb-ext:finalize struct (lambda ()
				(_wrap_delete_gp_Pnt2d ptr))
		     :dont-save t)
    struct))




