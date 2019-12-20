(in-package :gp)

(defun pnt (&optional (x 0.0d0) (y 0.0d0) (z 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-pnt)))
	 (struct (make-pnt :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float)
	  (gp-xyz-z pointer) (coerce z 'double-float))
    (finalize struct (lambda () (print 'freeingpnt) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object pnt) stream)
  (format stream "(~S ~A ~A ~A)" (type-of object) (x object) (y object) (z object)))

(defmethod gp:coord ((pnt pnt))
  (make-xyz :ptr (ptr pnt) :own pnt))

(defmethod (setf gp:coord) ((src xyz) (dst pnt))
  (let ((p-src (ptr src))
	(p-dst (ptr dst)))
    (gp-xyz-set-coord p-src p-dst)
    dst))

(defmethod x ((xyz pnt))
  (gp-xy-x (ptr xyz)))

(defmethod y ((xyz pnt))
  (gp-xy-y (ptr xyz)))

(defmethod z ((xyz pnt))
  (gp-xyz-z (ptr xyz)))

(defmethod (setf x) ((x real) (xyz pnt))
  (setf (gp-xy-x (ptr xyz)) (coerce x 'double-float)))

(defmethod (setf y) ((y real) (xyz pnt))
  (setf (gp-xy-y (ptr xyz)) (coerce y 'double-float)))

(defmethod (setf z) ((z real) (xyz pnt))
  (setf (gp-xyz-z (ptr xyz)) (coerce z 'double-float)))

