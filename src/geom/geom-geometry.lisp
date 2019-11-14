(in-package :oc)

(defmethod mirror! ((geometry geom-geometry) (p pnt))
  (_wrap_Geom_Geometry_Mirror__SWIG_0 (ff-pointer geometry) (ptr p)))

(defmethod mirror! ((geometry geom-geometry) (a1 ax1))
  (_wrap_Geom_Geometry_Mirror__SWIG_1 (ff-pointer geometry) (ptr a1)))

(defmethod mirror! ((geometry geom-geometry) (a2 ax2))
  (_wrap_Geom_Geometry_Mirror__SWIG_2 (ff-pointer geometry) (ptr a2)))

(defmethod rotate! ((geometry geom-geometry) (a1 ax1) (ang number))
  (_wrap_Geom_Geometry_Rotate (ff-pointer geometry) (ptr a1) (coerce ang 'double-float)))

(defmethod scale! ((geometry geom-geometry) (p pnt) (s number))
  (_wrap_Geom_Geometry_Scale (ff-pointer geometry) (ptr p) (coerce s 'double-float)))

(defmethod translate! ((geometry geom-geometry) (v vec))
  (_wrap_Geom_Geometry_Translate__SWIG_0 (ff-pointer geometry) (ptr v)))

(defmethod translate2! ((geometry geom-geometry) (p1 pnt) (p2 pnt))
  (_wrap_Geom_Geometry_Translate__SWIG_1 (ff-pointer geometry) (ptr p1) (ptr p2)))

(defmethod mirrored ((geometry geom-geometry) (p pnt))
  (let ((pointer (_wrap_Geom_Geometry_Mirrored__SWIG_0 (ff-pointer geometry) (ptr p)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    instance))

(defmethod mirrored ((geometry geom-geometry) (a1 ax1))
  (let ((pointer (_wrap_Geom_Geometry_Mirrored__SWIG_1 (ff-pointer geometry) (ptr a1)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    instance))

(defmethod mirrored ((geometry geom-geometry) (a2 ax2))
  (let ((pointer (_wrap_Geom_Geometry_Mirrored__SWIG_2 (ff-pointer geometry) (ptr a2)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    instance))

(defmethod rotated ((geometry geom-geometry) (a1 ax1) (ang number))
  (let ((pointer (_wrap_Geom_Geometry_Rotated (ff-pointer geometry) (ptr a1) (coerce ang 'double-float)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    instance))

(defmethod scaled ((geometry geom-geometry) (p pnt) (s number))
  (let ((pointer (_wrap_Geom_Geometry_Scaled (ff-pointer geometry) (ptr p) (coerce s 'double-float)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    instance))

(defmethod transformed ((geometry geom-geometry) (trsf trsf))
  (let ((pointer (_wrap_Geom_Geometry_Transformed (ff-pointer geometry) (ptr trsf)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    instance))

(defmethod translated ((geometry geom-geometry) (v vec))
  (let ((pointer (_wrap_Geom_Geometry_Translated__SWIG_0 (ff-pointer geometry) (ptr v)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    instance))

(defmethod translated2 ((geometry geom-geometry) (p1 pnt) (p2 pnt))
  (let ((pointer (_wrap_Geom_Geometry_Translated__SWIG_1 (ff-pointer geometry) (ptr p1) (ptr p2)))
	(instance (allocate-instance (class-of geometry))))
    (setf (ff-pointer instance) pointer)
    instance))
