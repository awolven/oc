(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-parabola)
				       &rest initargs
				       &key Prb MirrorAxis Focal (Sense t Sense-provided-p)
					 Axis D F &allow-other-keys)
  (let ((ff-pointer
	 (cond ((and Prb (not (or MirrorAxis Focal Sense-provided-p Axis D F)))
		(_wrap_new_Geom2d_Parabola__SWIG_0 (ptr Prb)))

	       ((and (gp::ax2d-p MirrorAxis) Focal Sense-provided-p
		     (not (or Prb Axis D F)))
		(_wrap_new_Geom2d_Parabola__SWIG_1 (ptr MirrorAxis) (coerce focal 'double-float)
						   Sense))

	       ((and (gp::ax2d-p MirrorAxis) Focal (null Sense-provided-p)
		     (not (or Prb Axis D F)))
		(_wrap_new_Geom2d_Parabola__SWIG_2 (ptr MirrorAxis) (coerce focal 'double-float)))

	       ((and (gp::ax22d-p Axis) Focal
		     (not (or Prb MirrorAxis Sense-provided-p D F)))
		(_wrap_new_Geom2d_Parabola__SWIG_3 (ptr Axis) (coerce Focal 'double-float)))

	       ((and (gp::ax2d-p D) (gp::pnt2d-p F)
		     (not (or Prb MirrorAxis Focal Sense-provided-p Axis)))
		(_wrap_new_Geom2d_Parabola__SWIG_4 (ptr D) (ptr F)))

	       (t (error "Invalid initargs to constructor: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (sb-ext:finalize instance (lambda ()
				(_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer)))
    (values)))

(defmethod (setf focal-length) ((focal number) (parabola geom2d-parabola))
  (_wrap_Geom2d_Parabola_SetFocal (ff-pointer parabola) (coerce focal 'double-float)))

(defmethod (setf geom-processor) ((prb gp::parab2d) (parabola geom2d-parabola))
  (_wrap_Geom2d_Parabola_SetParab2d (ff-pointer parabola) (ptr prb)))

(defmethod geom-processor ((parabola geom2d-parabola))
  (let* ((pointer (_wrap_Geom2d_Parabola_Parab2d (ff-pointer parabola)))
	 (struct (gp::make-parab2d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Parab pointer))
		     :dont-save t)
    struct))

(defmethod directrix ((parabola geom2d-parabola))
  (let* ((pointer (_wrap_Geom2d_Parabola_Directrix (ff-pointer parabola)))
	 (struct (gp::make-ax2d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Ax2d pointer))
		     :dont-save t)
    struct))

(defmethod focus ((parabola geom2d-parabola))
  (let* ((pointer (_wrap_Geom2d_Parabola_Focus (ff-pointer parabola)))
	 (struct (gp::make-pnt2d :ptr pointer)))
    (sb-ext:finalize struct (lambda ()
			      (_wrap_delete_gp_Pnt2d pointer))
		     :dont-save t)
    struct))
			      
(defmethod focal-length ((parabola geom2d-parabola))
  (_wrap_Geom2d_Parabola_Focal (ff-pointer parabola)))

(defmethod parameter ((parabola geom2d-parabola))
  (_wrap_Geom2d_Parabola_Parameter (ff-pointer parabola)))
