(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-circle)
				       &rest initargs
				       &key C A R (Sense t Sense-provided-p)
					 &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and (typep A 'gp::ax22d)
		     (typep R 'number)
		     (null C) (null Sense-provided-p))
		(_wrap_new_Geom2d_Circle__SWIG_2 (ptr A) (coerce R 'double-float)))
	       
	       ((and (typep A 'gp::ax2d)
		     (typep R 'number)
		     Sense-provided-p
		     (null C))
		(_wrap_new_Geom2d_Circle__SWIG_1 (ptr A) (coerce R 'double-float) Sense))

	       ((and (typep C 'gp::circ2d)
		     (null A) (null R) (null Sense-provided-p))
		(_wrap_new_Geom2d_Circle__SWIG_0 (ptr C)))

	       (t (error "Invalid initargs to constructor: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer))
     :dont-save t)
    (values)))

(defmethod (setf geom-processor) ((C gp::circ2d) (circle geom2d-circle))
  (_wrap_Geom2d_Circle_SetCirc2d (ff-pointer circle) (ptr C)))

(defmethod (setf radius) ((R number) (circle geom2d-circle))
  (setq R (coerce R 'double-float))
  (_wrap_Geom2d_Circle_SetRadius (ff-pointer circle) R)
  R)

(defmethod geom-processor ((circle geom2d-circle))
  (let* ((pointer (_wrap_Geom2d_Circle_Circ2d (ff-pointer circle)))
	 (struct (gp::make-circ2d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Circ2d pointer))
		     :dont-save t)
    struct))

(defmethod radius ((circle geom2d-circle))
  (_wrap_Geom2d_Circle_Radius (ff-pointer circle)))

