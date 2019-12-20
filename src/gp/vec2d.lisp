(in-package :gp)

(defun vec2d (&rest args)
  
  (let* ((pointer (foreign-alloc '(:struct gp-vec2d)))
	 (struct (make-vec2d :ptr pointer)))
    
    (cond ((null args)
	   (setf (gp-xy-x pointer) 1.0d0
		 (gp-xy-y pointer) 0.0d0))

	  ((and (rest args)
		(null (rest (rest args)))
		(realp (first args))
		(realp (second args)))
	   (setf (gp-xy-x pointer) (coerce (first args) 'double-float)
		 (gp-xy-y pointer) (coerce (second args) 'double-float)))

	  (t (destructuring-bind (&key (v nil v-supplied-p)
				       (xv nil xv-supplied-p)
				       (yv nil yv-supplied-p)
				       (coord nil coord-supplied-p)
				       (p1 nil p1-supplied-p)
				       (p2 nil p2-supplied-p)) args
	       (cond ((and (dir2d-p v)
			   (null xv-supplied-p)
			   (null yv-supplied-p)
			   (null coord-supplied-p)
			   (null p1-supplied-p)
			   (null p2-supplied-p))
		      (let ((p-v (ptr v)))
			(setf (gp-xy-x pointer) (gp-xy-x p-v)
			      (gp-xy-y pointer) (gp-xy-y p-v))))
		     
		     ((and (null v-supplied-p)
			   (realp xv)
			   (realp yv)
			   (null coord-supplied-p)
			   (null p1-supplied-p)
			   (null p2-supplied-p))
		      (setf (gp-xy-x pointer) (coerce xv 'double-float)
			    (gp-xy-y pointer) (coerce yv 'double-float)))
		     
		     ((and (null v-supplied-p)
			   (null xv-supplied-p)
			   (null yv-supplied-p)
			   (xy-p coord)
			   (null p1-supplied-p)
			   (null p2-supplied-p))
		      (let ((p-coord (ptr coord)))
			(setf (gp-xy-x pointer) (gp-xy-x p-coord)
			      (gp-xy-y pointer) (gp-xy-y p-coord))))
		     
		     ((and (null v-supplied-p)
			   (null xv-supplied-p)
			   (null yv-supplied-p)
			   (null coord-supplied-p)
			   (pnt2d-p p1) (pnt2d-p p2))
		      (let ((p-p1 (ptr p1))
			    (p-p2 (ptr p2)))
			(setf (gp-xy-x pointer) (- (gp-xy-x p-p2) (gp-xy-x p-p1))
			      (gp-xy-y pointer) (- (gp-xy-y p-p2) (gp-xy-y p-p1)))))))))

    (finalize struct (lambda () (print 'freeing-vec2d) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object vec2d) stream)
  (format stream "(~S ~A ~A)" (type-of object) (x object) (oc:y object)))

(defmethod x ((vec vec2d))
  (gp-xy-x (ptr vec)))

(defmethod y ((vec vec2d))
  (gp-xy-y (ptr vec)))

(defmethod (setf gp:coord) ((src xy) (dst vec2d))
  (let ((p-src (ptr src))
	(p-dst (ptr dst)))
    (gp-xy-set-coord p-src p-dst)))

(defmethod (setf x) ((x real) (vec vec2d))
  (setf (gp-xy-x (ptr vec)) (coerce x 'double-float)))

(defmethod (setf y) ((y real) (vec vec2d))
  (setf (gp-xy-y (ptr vec)) (coerce y 'double-float)))

(defmethod gp:coord ((vec vec2d))
  (make-xy :ptr (ptr vec) :own vec))

(defmethod gp:magnitude ((vec vec2d))
  (gp-xy-modulus (ptr vec)))

(defmethod oc:magnitude ((vec vec2d))
  (oc::_wrap_gp_Vec2d_Magnitude (ptr vec)))

(defmethod gp:square-magnitude ((vec vec2d))
  (gp-xy-square-modulus (ptr vec)))

(defmethod oc:square-magnitude ((vec vec2d))
  (oc::_wrap_gp_Vec2d_SquareMagnitude (ptr vec)))

(defmethod gp:dot ((vec1 vec2d) (vec2 vec2d))
  (gp-xy-dot (ptr vec1) (ptr vec2)))

(defmethod oc:dot ((vec1 vec2d) (vec2 vec2d))
  (oc::_wrap_gp_Vec2d_Dot (ptr vec1) (ptr vec2)))

(declaim (inline gp-xy-cross))
(defun gp-xy-cross (p1 p2)
  (- (* (gp-xy-x p1) (gp-xy-y p2)) (* (gp-xy-y p1) (gp-xy-x p2))))

(defmethod gp:crossed ((vec1 vec2d) (vec2 vec2d))
  (gp-xy-cross (ptr vec1) (ptr vec2)))

(defmethod oc:crossed ((vec1 vec2d) (vec2 vec2d))
  (let* ((p-result (oc::_wrap_gp_Vec2d_Crossed (ptr vec1) (ptr vec2)))
	 (result (make-vec2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Vec2d p-result)) :dont-save t)
    result))

(defmethod gp:cross-magnitude ((vec1 vec2d) (vec2 vec2d))
  (abs (gp-xy-cross (ptr vec1) (ptr vec2))))

(defmethod oc:cross-magnitude ((vec1 vec2d) (vec2 vec2d))
  (oc::_wrap_gp_Vec2d_CrossMagnitude (ptr vec1) (ptr vec2)))

(defmethod gp:cross-square-magnitude ((vec1 vec2d) (vec2 vec2d))
  (let* ((val (gp-xy-cross (ptr vec1) (ptr vec2))))
    (* val val)))

(defmethod oc:cross-square-magnitude ((vec1 vec2d) (vec2 vec2d))
  (oc::_wrap_gp_Vec2d_CrossSquareMagnitude (ptr vec1) (ptr vec2)))

(declaim (inline gp-xy-angle))
(defun gp-xy-angle (p1 p2)
  (let ((norm (gp-xy-modulus p1))
	(other-norm (gp-xy-modulus p2)))
    (assert (and (> norm +resolution+) (> other-norm +resolution+)))
    (let* ((d (* norm other-norm))
	   (cosine (/ (gp-xy-dot p1 p2) d))
	   (sine (/ (gp-xy-cross p1 p2) d)))

      (atan sine cosine))))

(defmethod gp:equal? ((vec1 vec2d) (vec2 vec2d) &rest args
		      &key (linear-tolerance 1.0d-36)
			(angular-tolerance 1.0d-36)
			&allow-other-keys)
  (declare (ignore args))
  (let* ((p1 (ptr vec1))
	 (p2 (ptr vec2))
	 (norm (gp-xy-modulus p1))
	 (other-norm (gp-xy-modulus p2)))
    (let* ((val (abs (- norm other-norm)))
	   (equal-length? (<= val linear-tolerance)))
      (when equal-length?
	(when (and (> norm linear-tolerance)
		   (> other-norm linear-tolerance))
	  (let ((ang (abs (gp-xy-angle p1 p2))))
	    (<= ang angular-tolerance)))))))

(defmethod oc:equal? ((vec1 vec2d) (vec2 vec2d) &rest args
		      &key (linear-tolerance 1.0d-36)
			(angular-tolerance 1.0d-36)
			&allow-other-keys)
  (declare (ignore args))
  (oc::_wrap_gp_Vec2d_IsEqual (ptr vec1) (ptr vec2)
			      (coerce linear-tolerance 'double-float)
			      (coerce angular-tolerance 'double-float)))

(defmethod gp:angle ((vec1 vec2d) (vec2 vec2d))
  (gp-xy-angle (ptr vec1) (ptr vec2)))

(defmethod oc:angle ((vec1 vec2d) (vec2 vec2d))
  (oc::_wrap_gp_Vec2d_Angle (ptr vec1) (ptr vec2)))

(declaim (inline gp-xy-normal))
(defun gp-xy-normal (p-xy result-constructor result-foreign-type)
  (let* ((p-result (foreign-alloc result-foreign-type))
	 (result (funcall result-constructor :ptr p-result)))
    (setf (gp-xy-x p-result) (gp-xy-y p-xy)
	  (gp-xy-y p-result) (- (gp-xy-x p-xy)))
    (finalize result (lambda () (foreign-free p-result)) :dont-save t)
    result))
    
(defmethod gp:normal ((vec vec2d))
  (gp-xy-normal (ptr vec) #'make-vec2d '(:struct gp-vec2d)))

(defmethod oc:normal ((vec vec2d))
  (let* ((p-result (oc::_wrap_gp_Vec2d_GetNormal (ptr vec)))
	 (result (make-vec2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Vec2d p-result)) :dont-save t)
    result))
  
(defmethod gp:normal? ((vec1 vec2d) (vec2 vec2d) &optional (angular-tolerance 1.0d-36))
  (let ((ang (abs (- #.(/ pi 2.0d0) (abs (gp-xy-angle (ptr vec1) (ptr vec2)))))))
    (<=  ang angular-tolerance)))

(defmethod oc:normal? ((vec1 vec2d) (vec2 vec2d) &optional (angular-tolerance 1.0d-36))
  (oc::_wrap_gp_Vec2d_IsNormal (ptr vec1) (ptr vec2) (coerce angular-tolerance 'double-float)))

(defmethod gp:opposite? ((vec1 vec2d) (vec2 vec2d) &optional (angular-tolerance 1.0d-36))
  (let ((ang (abs (gp-xy-angle (ptr vec1) (ptr vec2)))))
    (<= (- pi ang) angular-tolerance)))

(defmethod oc:opposite? ((vec1 vec2d) (vec2 vec2d) &optional (angular-tolerance 1.0d-36))
  (oc::_wrap_gp_Vec2d_IsOpposite (ptr vec1) (ptr vec2) (coerce angular-tolerance 'double-float)))

(defmethod gp:parallel? ((vec1 vec2d) (vec2 vec2d) &optional (angular-tolerance 1.0d-36))
  (let ((ang (abs (gp-xy-angle (ptr vec1) (ptr vec2)))))
    (or (<= ang angular-tolerance) (<= (- pi ang) angular-tolerance))))

(defmethod oc:parallel? ((vec1 vec2d) (vec2 vec2d) &optional (angular-tolerance 1.0d-36))
  (oc::_wrap_gp_Vec2d_IsParallel (ptr vec1) (ptr vec2) (coerce angular-tolerance 'double-float)))

(defmethod gp:add! ((vec1 vec2d) (vec2 vec2d))
  (gp-xy-add! (ptr vec1) (ptr vec2)))

(defmethod oc:add! ((vec1 vec2d) (vec2 vec2d))
  (oc::_wrap_gp_Vec2d_Add (ptr vec1) (ptr vec2)))

(defmethod gp:added ((vec1 vec2d) (vec2 vec2d))
  (gp-xy-added (ptr vec1) (ptr vec2) #'make-vec2d '(:struct gp-vec2d)))

(defmethod oc:added ((vec1 vec2d) (vec2 vec2d))
  (let* ((p-result (oc::_wrap_gp_Vec2d_Added (ptr vec1) (ptr vec2)))
	 (result (make-vec2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Vec2d p-result)) :dont-save t)
    result))

(defmethod gp:divide! ((vec vec2d) (scalar real))
  (gp-xy-divide! (ptr vec) (coerce scalar 'double-float)))

(defmethod oc:divide! ((vec vec2d) (scalar real))
  (oc::_wrap_gp_Vec2d_Divide (ptr vec) (coerce scalar 'double-float)))

(defmethod gp:multiply! ((vec vec2d) (scalar real))
  (gp-xy-multiply!-with-scalar (ptr vec) scalar))

(defmethod oc:multiply! ((vec vec2d) (scalar real))
  (oc::_wrap_gp_Vec2d_Multiply (ptr vec) (coerce scalar 'double-float)))

(defmethod gp:divided ((vec vec2d) (scalar real))
  (gp-xy-divided (ptr vec) (coerce scalar 'double-float) #'make-vec2d '(:struct gp-vec2d)))

(defmethod oc:divided ((vec vec2d) (scalar real))
  (let* ((p-result (oc::_wrap_gp_Vec2d_Divided (ptr vec) (coerce scalar 'double-float)))
	 (result (make-vec2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Vec2d p-result)) :dont-save t)
    result))

(defmethod gp:multiplied ((vec vec2d) (scalar real))
  (let* ((p1 (ptr vec))
	 (p2 (foreign-alloc '(:struct gp-vec2d)))
	 (result (make-vec2d :ptr p2))
	 (coef (coerce scalar 'double-float)))
    (setf (gp-xy-x p2) (/ (gp-xy-x p1) coef)
	  (gp-xy-y p2) (/ (gp-xy-y p1) coef))
    (finalize result (lambda () (foreign-free p2)) :dont-save t)
    result))

(defmethod oc:multiplied ((vec vec2d) (scalar real))
  (let* ((p-result (oc::_wrap_gp_Vec2d_Multiplied (ptr vec) (coerce scalar 'double-float)))
	 (result (make-vec2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Vec2d p-result)) :dont-save t)
    result))

(defmethod gp:normalize! ((vec vec2d))
  (gp-xy-normalize! (ptr vec)))

(defmethod oc:normalize! ((vec vec2d))
  (oc::_wrap_gp_Vec2d_Normalize (ptr vec)))

(defmethod gp:normalized ((vec vec2d))
  (let* ((p (ptr vec))
	 (d (gp-xy-modulus p)))
    (assert (> d +resolution+))
    (gp-xy-divided p d #'make-vec2d '(:struct gp-vec2d))))

(defmethod oc:normalized ((vec vec2d))
  (let* ((p-result (oc::_wrap_gp_Vec2d_Normalized (ptr vec)))
	 (result (make-vec2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Vec2d p-result)) :dont-save t)
    result))
  
(defmethod gp:reverse! ((vec vec2d))
  (gp-xy-reverse! (ptr vec)))

(defmethod oc:reverse! ((vec vec2d))
  (oc::_wrap_gp_Vec2d_Reverse (ptr vec)))

(defmethod gp:reversed ((vec vec2d))
  (let* ((p-xy (ptr vec))
	 (p-result (foreign-alloc '(:struct gp-vec2d)))
	 (result (make-vec2d :ptr p-result)))
    (setf (gp-xy-x p-result) (- (gp-xy-x p-xy))
	  (gp-xy-y p-result) (- (gp-xy-y p-xy)))
    (finalize result (lambda () (foreign-free p-result)) :dont-save t)
    result))

(defmethod oc:reversed ((vec vec2d))
  (let* ((p-result (oc::_wrap_gp_Vec2d_Reversed (ptr vec)))
	 (result (make-vec2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Vec2d p-result)) :dont-save t)
    result))

(defmethod gp:subtract! ((vec vec2d) (right vec2d))
  (let ((p-vec (ptr vec))
	(p-right (ptr right)))
    (setf (gp-xy-x p-vec) (- (gp-xy-x p-vec) (gp-xy-x p-right))
	  (gp-xy-y p-vec) (- (gp-xy-y p-vec) (gp-xy-y p-right)))
    (values)))

(defmethod oc:subtract! ((vec vec2d) (right vec2d))
  (oc::_wrap_gp_Vec2d_Subtract (ptr vec) (ptr right)))

(defmethod gp:subtracted ((vec vec2d) (right vec2d))
  (let* ((p-result (foreign-alloc '(:struct gp-vec2d)))
	 (result (make-vec2d :ptr p-result))
	 (p-vec (ptr vec))
	 (p-right (ptr right)))
    (setf (gp-xy-x p-result) (- (gp-xy-x p-vec) (gp-xy-x p-right))
	  (gp-xy-y p-result) (- (gp-xy-y p-vec) (gp-xy-y p-right)))
    (finalize result (lambda () (foreign-free p-result)) :dont-save t)
    result))

(defmethod oc:subtracted ((vec vec2d) (right vec2d))
  (let* ((p-result (oc::_wrap_gp_Vec2d_Subtracted (ptr vec) (ptr right)))
	 (result (make-vec2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Vec2d p-result)) :dont-save t)
    result))


