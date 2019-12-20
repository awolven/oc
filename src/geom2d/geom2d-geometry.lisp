(in-package :oc)

(defmethod mirror! ((geometry geom2d-geometry) (p gp:pnt2d))
  (_wrap_Geom2d_Geometry_Mirror__SWIG_0 (ff-pointer geometry) (ptr p)))

(defmethod mirror! ((geometry geom2d-geometry) (a gp:ax2d))
  (_wrap_Geom2d_Geometry_Mirror__SWIG_1 (ff-pointer geometry) (ptr a)))

(defmethod rotate! ((geometry geom2d-geometry) (p gp:pnt2d) (angle real))
  (_wrap_Geom2d_Geometry_Rotate (ff-pointer geometry) (ptr p) (coerce angle 'double-float)))

(defmethod scale! ((geometry geom2d-geometry) (p gp:pnt2d) (s real))
  (_wrap_Geom2d_Geometry_Scale (ff-pointer geometry) (ptr p) (coerce s 'double-float)))

(defmethod translate! ((geometry geom2d-geometry) (v gp:vec2d))
  (_wrap_Geom2d_Geometry_Translate__SWIG_0 (ff-pointer geometry) (ptr v)))

(defmethod translate2! ((geometry geom2d-geometry) (p1 gp:pnt2d) (p2 gp:pnt2d))
  (_wrap_Geom2d_Geometry_Translate__SWIG_1 (ff-pointer geometry) (ptr p1) (ptr p2)))

(defmethod transform! ((point geom2d-geometry) (trsf gp:trsf2d))
  (_wrap_Geom2d_Geometry_Transform (ff-pointer point) (ptr trsf)))

(defmethod mirrored ((geometry geom2d-geometry) (p gp:pnt2d))
  (let ((pointer
	 (_wrap_Geom2d_Geometry_Mirrored__SWIG_0 (ff-pointer geometry) (ptr p)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))	  

(defmethod mirrored ((geometry geom2d-geometry) (a gp:ax2d))
  (let ((pointer (_wrap_Geom2d_Geometry_Mirrored__SWIG_1 (ff-pointer geometry) (ptr a)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod rotated ((geometry geom2d-geometry) (p gp:pnt2d) (ang real))
  (let ((pointer
	 (_wrap_Geom2d_Geometry_Rotated (ff-pointer geometry) (ptr p) (coerce ang 'double-float)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod scaled ((geometry geom2d-geometry) (p gp:pnt2d) (s real))
  (let ((pointer
	 (_wrap_Geom2d_Geometry_Scaled (ff-pointer geometry) (ptr p) (coerce s 'double-float)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))    

(defmethod transformed ((geometry geom2d-geometry) (trsf gp:trsf2d))
  (let ((pointer (_wrap_Geom2d_Geometry_Transformed (ff-pointer geometry) (ptr trsf)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod translated ((geometry geom2d-geometry) (v gp:vec2d))
  (let ((pointer (_wrap_Geom2d_Geometry_Translated__SWIG_0 (ff-pointer geometry) (ptr v)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    instance))

(defmethod translated2 ((geometry geom2d-geometry) (p1 gp:pnt2d) (p2 gp:pnt2d))
  (let ((pointer
	 (_wrap_Geom2d_Geometry_Translated__SWIG_1 (ff-pointer geometry) (ptr p1) (ptr p2)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod copy ((point geom2d-geometry))
  (let ((pointer (_wrap_Geom2d_Geometry_Copy (ff-pointer point)))
	(copy (allocate-instance (class-of point))))
    (setf (ff-pointer copy) pointer)
    (sb-ext:finalize
     copy
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    copy))
