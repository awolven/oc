(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-line) &rest initargs &key A L P V &allow-other-keys)
  (let ((ff-pointer (cond ((and (gp:ax2d-p A) (null L) (null P) (null V)) (_wrap_new_Geom2d_Line__SWIG_0 (ptr A)))
			  ((and (gp:lin2d-p L) (null A) (null P) (null V)) (_wrap_new_Geom2d_Line__SWIG_1 (ptr L)))
			  ((and (gp:pnt2d-p P) (gp:dir2d-p V) (null A) (null L))
			   (_wrap_new_Geom2d_Line__SWIG_2 (ptr P) (ptr V)))
			  (t (error "Invalid arguments to constructor: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    (values)))

(defmethod direction ((self geom2d-line))
  (let* ((pointer (_wrap_Geom2d_Line_Direction (ff-pointer self)))
	 (struct (gp:make-dir2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod processor ((self geom2d-line))
  (let* ((pointer (_wrap_Geom2d_Line_Lin2d (ff-pointer self)))
	 (struct (gp:make-lin2d :ptr pointer)))
    (oc:finalize struct)
    struct))

(defmethod location ((self geom2d-line))
  (let* ((pointer (_wrap_Geom2d_Line_Location (ff-pointer self)))
	 (struct (gp:make-pnt2d :ptr pointer)))
    (oc:finalize struct)
    struct))		     

(defmethod oc:position ((self geom2d-line))
  (let ((ax2d (gp:make-ax2d :ptr (_wrap_Geom2d_Line_Position (ff-pointer self)))))
    (oc:finalize ax2d)
    ax2d))

(defmethod (setf direction) ((dir gp:dir2d) (self geom2d-line))
  (_wrap_Geom2d_Line_SetDirection (ff-pointer self) (ptr dir))
  dir)

(defmethod (setf processor) ((lin gp:lin2d) (self geom2d-line))
  (_wrap_Geom2d_Line_SetLin2d (ff-pointer self) (ptr lin))
  lin)

(defmethod (setf location) ((pnt gp:pnt2d) (self geom2d-line))
  (_wrap_Geom2d_Line_SetLocation (ff-pointer self) (ptr pnt))
  pnt)

(defmethod (setf oc:position) ((ax2d gp:ax2d) (self geom2d-line))
  (_wrap_Geom2d_Line_SetPosition (ff-pointer self) (ptr ax2d))
  ax2d)

(defmethod distance ((line geom2d-line) (p gp:pnt2d))
  (_wrap_Geom2d_Line_Distance (ff-pointer line) (ptr p)))
