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
    (oc:finalize instance)
    (values)))

(defmethod reverse! ((geometry geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_Reverse (ff-pointer geometry)))

(defmethod reversed ((geometry geom2d-axis-placement))
  (let ((ff-pointer (_wrap_Geom2d_AxisPlacement_Reversed (ff-pointer geometry)))
	(instance (allocate-instance (load-time-value (find-class 'geom2d-axis-placement)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    instance))

(defmethod (setf axis) ((A gp:ax2d) (geometry geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_SetAxis (ff-pointer geometry) (ptr A)))

(defmethod (setf direction) ((V gp:dir2d) (self geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_SetDirection (ff-pointer self) (ptr V)))

(defmethod (setf location) ((P gp:pnt2d) (self geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_SetLocation (ff-pointer self) (ptr P)))

(defmethod angle ((axis-placement1 geom2d-axis-placement)
		  (axis-placement2 geom2d-axis-placement))
  (_wrap_Geom2d_AxisPlacement_Angle (ff-pointer axis-placement1)
				    (ff-pointer axis-placement2)))

(defmethod processor ((axis-placement geom2d-axis-placement))
  (let* ((ptr (_wrap_Geom2d_AxisPlacement_Ax2d (ff-pointer axis-placement)))
	 (struct (gp:make-ax2d :ptr ptr)))
    (oc:finalize struct)
    struct))

(defmethod direction ((axis-placement geom2d-axis-placement))
  (let* ((ptr (_wrap_Geom2d_AxisPlacement_Direction (ff-pointer axis-placement)))
	 (struct (gp:make-dir2d :ptr ptr)))
    (oc:finalize struct)
    struct))

(defmethod location ((axis-placement geom2d-axis-placement))
  (let* ((ptr (_wrap_Geom2d_AxisPlacement_Location (ff-pointer axis-placement)))
	 (struct (gp:make-pnt2d :ptr ptr)))
    (oc:finalize struct)
    struct))




