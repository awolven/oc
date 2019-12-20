(in-package :oc)

(defmethod mirror! ((geometry geom-geometry) (p gp:pnt))
  (_wrap_Geom_Geometry_Mirror__SWIG_0 (ff-pointer geometry) (ptr p)))

(defmethod mirror! ((geometry geom-geometry) (a1 gp:ax1))
  (_wrap_Geom_Geometry_Mirror__SWIG_1 (ff-pointer geometry) (ptr a1)))

(defmethod mirror! ((geometry geom-geometry) (a2 gp:ax2))
  (_wrap_Geom_Geometry_Mirror__SWIG_2 (ff-pointer geometry) (ptr a2)))

(defmethod rotate! ((geometry geom-geometry) (a1 gp:ax1) (ang real))
  (_wrap_Geom_Geometry_Rotate (ff-pointer geometry) (ptr a1) (coerce ang 'double-float)))

(defmethod scale! ((geometry geom-geometry) (p gp:pnt) (s real))
  (_wrap_Geom_Geometry_Scale (ff-pointer geometry) (ptr p) (coerce s 'double-float)))

(defmethod translate! ((geometry geom-geometry) (v gp:vec))
  (_wrap_Geom_Geometry_Translate__SWIG_0 (ff-pointer geometry) (ptr v)))

(defmethod translate2! ((geometry geom-geometry) (p1 gp:pnt) (p2 gp:pnt))
  (_wrap_Geom_Geometry_Translate__SWIG_1 (ff-pointer geometry) (ptr p1) (ptr p2)))

(defmethod transform! ((point geom-geometry) (trsf gp:trsf))
  (_wrap_Geom_Geometry_Transform (ff-pointer point) (ptr trsf)))

(defmethod mirrored ((geometry geom-geometry) (p gp:pnt))
  (let ((pointer (_wrap_Geom_Geometry_Mirrored__SWIG_0 (ff-pointer geometry) (ptr p)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod mirrored ((geometry geom-geometry) (a1 gp:ax1))
  (let ((pointer (_wrap_Geom_Geometry_Mirrored__SWIG_1 (ff-pointer geometry) (ptr a1)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod mirrored ((geometry geom-geometry) (a2 gp:ax2))
  (let ((pointer (_wrap_Geom_Geometry_Mirrored__SWIG_2 (ff-pointer geometry) (ptr a2)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)    
    instance))

(defmethod rotated ((geometry geom-geometry) (a1 gp:ax1) (ang real))
  (let ((pointer (_wrap_Geom_Geometry_Rotated (ff-pointer geometry) (ptr a1) (coerce ang 'double-float)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod scaled ((geometry geom-geometry) (p gp:pnt) (s real))
  (let ((pointer (_wrap_Geom_Geometry_Scaled (ff-pointer geometry) (ptr p) (coerce s 'double-float)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod transformed ((geometry geom-geometry) (trsf gp:trsf))
  (let ((pointer (_wrap_Geom_Geometry_Transformed (ff-pointer geometry) (ptr trsf)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod translated ((geometry geom-geometry) (v gp:vec))
  (let ((pointer (_wrap_Geom_Geometry_Translated__SWIG_0 (ff-pointer geometry) (ptr v)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod translated2 ((geometry geom-geometry) (p1 gp:pnt) (p2 gp:pnt))
  (let ((pointer
	 (_wrap_Geom_Geometry_Translated__SWIG_1 (ff-pointer geometry) (ptr p1) (ptr p2)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    instance))

(defmethod copy ((point geom-geometry))
  (let ((pointer (_wrap_Geom_Geometry_Copy (ff-pointer point)))
	(copy (allocate-instance (class-of point))))
    (setf (ff-pointer copy) pointer)
    (sb-ext:finalize
     copy
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter pointer))
     :dont-save t)
    copy))
