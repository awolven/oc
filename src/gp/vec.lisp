(in-package :gp)

(defun vec (&optional (x 0.0d0) (y 0.0d0) (z 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-vec)))
	 (struct (make-vec :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float)
	  (gp-xyz-z pointer) (coerce z 'double-float))
    (oc:finalize struct :native)
    struct))

(defmethod print-object ((object vec) stream)
  (format stream "(~S ~A ~A ~A)" (type-of object) (x object) (y object) (z object)))

(defmethod gp:coord ((vec vec))
  (make-xyz :ptr (ptr vec) :own vec))

(defmethod (setf gp:coord) ((src xyz) (dst vec))
  (let ((p-src (ptr src))
	(p-dst (ptr dst)))
    (gp-xyz-set-coord p-src p-dst)
    dst))

(defmethod x ((xyz vec))
  (gp-xy-x (ptr xyz)))

(defmethod y ((xyz vec))
  (gp-xy-y (ptr xyz)))

(defmethod z ((xyz vec))
  (gp-xyz-z (ptr xyz)))

(defmethod (setf x) ((x real) (xyz vec))
  (setf (gp-xy-x (ptr xyz)) (coerce x 'double-float)))

(defmethod (setf y) ((y real) (xyz vec))
  (setf (gp-xy-y (ptr xyz)) (coerce y 'double-float)))

(defmethod (setf z) ((z real) (xyz vec))
  (setf (gp-xyz-z (ptr xyz)) (coerce z 'double-float)))

(defmethod gp:dot ((v1 vec) (v2 vec))
  (gp-xyz-dot (ptr v1) (ptr v2)))

(defmethod oc:dot ((vec1 vec) (vec2 vec))
  (oc::_wrap_gp_Vec_Dot (ptr vec1) (ptr vec2)))

(defmethod oc:dot-cross ((vec1 vec) (vec2 vec) (vec3 vec))
  (oc::_wrap_gp_Vec_DotCross (ptr vec1) (ptr vec2) (ptr vec3)))

(defmethod gp:multiplied ((v vec) scalar)
  (vec (* (x v) scalar) (* (y v) scalar) (* (z v) scalar)))

(defmethod gp:divided ((v vec) scalar)
  (vec (/ (x v) scalar) (/ (y v) scalar) (/ (z v) scalar)))

(defmethod oc:subtracted ((xyz1 vec) (xyz2 vec))
  (let* ((p-result (oc::_wrap_gp_Vec_Subtracted (ptr xyz1) (ptr xyz2)))
	 (result (make-vec :ptr p-result)))
    (oc:finalize result)
    result))

(defmethod oc:multiply! ((xyz vec) (scalar real))
  (oc::_wrap_gp_Vec_Multiply (ptr xyz) (coerce scalar 'double-float)))
