(in-package :gp)

(defun dir (&optional (x 0.0d0) (y 0.0d0) (z 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-dir)))
	 (struct (make-dir :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float)
	  (gp-xyz-z pointer) (coerce z 'double-float))
    (oc:finalize struct :native)
    struct))

(defmethod print-object ((object dir) stream)
  (format stream "(~S ~A ~A ~A)" (type-of object) (x object) (y object) (z object)))
  
(defmethod gp:coord ((dir dir))
  (make-xyz :ptr (ptr dir) :own dir))

(defmethod (setf gp:coord) ((src xyz) (dst dir))
  (let ((p-src (ptr src))
	(p-dst (ptr dst)))
    ;; normalize?
    (gp-xyz-set-coord p-src p-dst)
    dst))

(defmethod x ((xyz dir))
  (gp-xy-x (ptr xyz)))

(defmethod y ((xyz dir))
  (gp-xy-y (ptr xyz)))

(defmethod z ((xyz dir))
  (gp-xyz-z (ptr xyz)))

(defmethod (setf x) ((x real) (xyz dir))
  (setf (gp-xy-x (ptr xyz)) (coerce x 'double-float)))

(defmethod (setf y) ((y real) (xyz dir))
  (setf (gp-xy-y (ptr xyz)) (coerce y 'double-float)))

(defmethod (setf z) ((z real) (xyz dir))
  (setf (gp-xyz-z (ptr xyz)) (coerce z 'double-float)))

(defmethod gp:dot ((v1 dir) (v2 dir))
  (gp-xyz-dot (ptr v1) (ptr v2)))

(defmethod oc:dot ((dir1 dir) (dir2 dir))
  (oc::_wrap_gp_Dir_Dot (ptr dir1) (ptr dir2)))

(defmethod oc:dot-cross ((dir1 dir) (dir2 dir) (dir3 dir))
  (oc::_wrap_gp_Dir_DotCross (ptr dir1) (ptr dir2) (ptr dir3)))

(defmethod gp:multiplied ((v dir) scalar)
  (dir (* (x v) scalar) (* (y v) scalar) (* (z v) scalar)))

(defmethod gp:divided ((v dir) scalar)
  (dir (/ (x v) scalar) (/ (y v) scalar) (/ (z v) scalar)))
