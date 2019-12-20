(in-package :gp)

(defun pnt2d (&rest args &key Xp Yp Coord &allow-other-keys)
  (let* ((pointer (foreign-alloc '(:struct gp-pnt2d)))
	 (struct (make-pnt2d :ptr pointer)))

    (cond ((null args)
	   (setf (gp-xy-x pointer) 0.0d0
		 (gp-xy-y pointer) 0.0d0))

	  ((and args (xy-p (car args)) (null (rest args)))
	   (let ((p-xy (ptr (car args))))
	     (setf (gp-xy-x pointer) (gp-xy-x p-xy)
		   (gp-xy-y pointer) (gp-xy-y p-xy))))

	  ((and (realp (car args)) (realp (cadr args))
		(null (cddr args)))
	   (setf (gp-xy-x pointer) (coerce (car args) 'double-float)
		 (gp-xy-y pointer) (coerce (cadr args) 'double-float)))

	  ((and (realp Xp) (realp Yp) (null coord))
	   (setf (gp-xy-x pointer) (coerce Xp 'double-float)
		 (gp-xy-y pointer) (coerce Yp 'double-float)))

	  ((and (xy-p coord) (null Xp) (null Yp))
	   (let ((p-xy (ptr coord)))
	     (setf (gp-xy-x pointer) (gp-xy-x p-xy)
		   (gp-xy-y pointer) (gp-xy-y p-xy))))

	  (t (error "Invalid initargs to constructor: ~S" args)))
	   
    (finalize struct (lambda () (print 'freeing-pnt2d) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object pnt2d) stream)
  (format stream "(~S ~A ~A)" (type-of object) (x object) (y object)))

(defmethod (setf gp:coord) ((src xy) (dst pnt2d))
  (let ((p-src (ptr src))
	(p-dst (ptr dst)))
    (gp-xy-set-coord p-src p-dst)))

(defmethod x ((xy pnt2d))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy pnt2d))
  (gp-xy-y (ptr xy)))

(defmethod (setf x) ((x real) (pnt pnt2d))
  (setf (gp-xy-x (ptr pnt)) (coerce x 'double-float)))

(defmethod (setf y) ((y real) (pnt pnt2d))
  (setf (gp-xy-y (ptr pnt)) (coerce y 'double-float)))

(defmethod gp:coord ((pnt pnt2d))
  (make-xy :ptr (ptr pnt) :own pnt))

(declaim (inline gp-pnt2d-square-distance))
(defun gp-pnt2d-square-distance (p-pnt1 p-pnt2)
  (let* ((delta-x (- (gp-xy-x p-pnt2) (gp-xy-x p-pnt1)))
	 (delta-y (- (gp-xy-y p-pnt2) (gp-xy-y p-pnt1))))
    (+ (* delta-x delta-x) (* delta-y delta-y))))

(declaim (inline gp-pnt2d-distance))
(defun gp-pnt2d-distance (p1 p2)
  (sqrt (gp-pnt2d-square-distance p1 p2)))

(defmethod gp:equal? ((pnt pnt2d) (other pnt2d)
		      &rest args
		      &key (linear-tolerance 1.0d-36)
			&allow-other-keys)
  (declare (ignore args))
  (<= (gp-pnt2d-distance (ptr pnt) (ptr other)) linear-tolerance))

(defmethod oc:equal? ((pnt pnt2d) (other pnt2d)
		      &rest args
		      &key (linear-tolerance 1.0d-36)
			&allow-other-keys)
  (declare (ignore args))
  (oc::_wrap_gp_Pnt2d_IsEqual (ptr pnt) (ptr other) (coerce linear-tolerance 'double-float)))

(defmethod gp:distance ((pnt1 pnt2d) (pnt2 pnt2d))
  (gp-pnt2d-distance (ptr pnt1) (ptr pnt2)))

(defmethod oc:distance ((pnt1 pnt2d) (pnt2 pnt2d))
  (oc::_wrap_gp_Pnt2d_Distance (ptr pnt1) (ptr pnt2)))

(defmethod gp:square-distance ((pnt1 pnt2d) (pnt2 pnt2d))
  (gp-pnt2d-square-distance (ptr pnt1) (ptr pnt2)))

(defmethod oc:square-distance ((pnt1 pnt2d) (pnt2 pnt2d))
  (oc::_wrap_gp_Pnt2d_SquareDistance (ptr pnt1) (ptr pnt2)))


