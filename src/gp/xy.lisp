(in-package :gp)

(defun xy (&optional (x 0.0d0) (y 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-xy)))
	 (struct (make-xy :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float))
    (oc:finalize struct :native)
    struct))

(defmethod print-object ((object xy) stream)
  (format stream "(~S ~A ~A)" (type-of object) (x object) (y object)))

(defmethod x ((xy xy))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy xy))
  (gp-xy-y (ptr xy)))

(declaim (inline gp-xy-set-coord))
(defun gp-xy-set-coord (p-src p-dst)
  (setf (gp-xy-x p-dst) (gp-xy-x p-src)
	(gp-xy-y p-dst) (gp-xy-y p-src))
  (values))

(defmethod (setf gp:coord) ((src xy) (dst xy))
  (let ((p-src (ptr src))
	(p-dst (ptr dst)))
    (gp-xy-set-coord p-src p-dst)))

(defmethod (setf x) ((x real) (xy xy))
  (setf (gp-xy-x (ptr xy)) (coerce x 'double-float)))

(defmethod (setf y) ((y real) (xy xy))
  (setf (gp-xy-y (ptr xy)) (coerce y 'double-float)))

(defmethod gp:coord ((xy xy))
  xy)

(declaim (inline gp-xy-square-modulus))
(defun gp-xy-square-modulus (p)
  (let ((x (gp-xy-x p))
	(y (gp-xy-y p)))
    (+ (* x x) (* y y))))

(declaim (inline gp-xy-modulus))
(defun gp-xy-modulus (p)
  (sqrt (gp-xy-square-modulus p)))

(defmethod gp:modulus ((xy xy))
  (gp-xy-modulus (ptr xy)))

(defmethod oc:modulus ((xy xy))
  (oc::_wrap_gp_XY_Modulus (ptr xy)))

(defmethod gp:square-modulus ((xy xy))
  (gp-xy-square-modulus (ptr xy)))

(defmethod oc:square-modulus ((xy xy))
  (oc::_wrap_gp_XY_SquareModulus (ptr xy)))

(defmethod gp:equal? ((xy1 xy) (xy2 xy) &rest args
		      &key (tolerance 1.0d-36)
			&allow-other-keys)
  (declare (ignore args))
  (let ((p1 (ptr xy1))
	(p2 (ptr xy2))
	(tol (coerce tolerance 'double-float)))
    (and (<= (abs (- (gp-xy-x p1) (gp-xy-x p2))) tol)
	 (<= (abs (- (gp-xy-y p1) (gp-xy-y p2))) tol))))

(defmethod oc:equal? ((xy1 xy) (xy2 xy) &rest args
		      &key (tolerance 1.0d-36)
			&allow-other-keys)
  (declare (ignore args))
  (oc::_wrap_gp_XY_IsEqual (ptr xy1) (ptr xy2) (coerce tolerance 'double-float)))

(declaim (inline gp-xy-add!))
(defun gp-xy-add! (p1 p2)
  (setf (gp-xy-x p1) (+ (gp-xy-x p1) (gp-xy-x p2))
	(gp-xy-y p1) (+ (gp-xy-y p1) (gp-xy-y p2)))
  (values))

(defmethod gp:add! ((xy1 xy) (xy2 xy))
  (gp-xy-add! (ptr xy1) (ptr xy2)))

(defmethod oc:add! ((xy1 xy) (xy2 xy))
  (oc::_wrap_gp_XY_Add (ptr xy1) (ptr xy2)))


(declaim (inline gp-xy-added))
(defun gp-xy-added (p1 p2 result-constructor result-foreign-type)
  (let* ((p3 (foreign-alloc result-foreign-type))
	 (xy3 (funcall result-constructor :ptr p3)))
    (setf (gp-xy-x p3) (+ (gp-xy-x p1) (gp-xy-x p2))
	  (gp-xy-y p3) (+ (gp-xy-y p1) (gp-xy-y p2)))
    (oc:finalize xy3 :native)
    xy3))

(defmethod gp:added ((xy1 xy) (xy2 xy))
  (gp-xy-added (ptr xy1) (ptr xy2) #'make-xy '(:struct gp-xy)))

(defmethod oc:added ((xy1 xy) (xy2 xy))
  (make-xy :ptr (oc::_wrap_gp_XY_Added (ptr xy1) (ptr xy2))))

(defmethod gp:crossed ((xy1 xy) (xy2 xy))
  (let ((p1 (ptr xy1))
	(p2 (ptr xy2)))
    (- (* (gp-xy-x p1) (gp-xy-y p2)) (* (gp-xy-y p1) (gp-xy-x p2)))))

(defmethod oc:crossed ((xy1 xy) (xy2 xy))
  (oc::_wrap_gp_XY_Crossed (ptr xy1) (ptr xy2)))

(defmethod gp:cross-magnitude ((xy1 xy) (xy2 xy))
  (let ((p1 (ptr xy1))
	(p2 (ptr xy2)))
    (abs (- (* (gp-xy-x p1) (gp-xy-y p2)) (* (gp-xy-y p1) (gp-xy-x p2))))))

(defmethod oc:cross-magnitude ((xy1 xy) (xy2 xy))
  (oc::_wrap_gp_XY_CrossMagnitude (ptr xy1) (ptr xy2)))

(defmethod gp:cross-square-magnitude ((xy1 xy) (xy2 xy))
  (let* ((p1 (ptr xy1))
	 (p2 (ptr xy2))
	 (val (- (* (gp-xy-x p1) (gp-xy-y p2)) (* (gp-xy-y p1) (gp-xy-x p2)))))
    (* val val)))

(defmethod oc:cross-square-magnitude ((xy1 xy) (xy2 xy))
  (oc::_wrap_gp_XY_CrossSquareMagnitude (ptr xy1) (ptr xy2)))

(declaim (inline gp-xy-divide!))
(defun gp-xy-divide! (p divisor)
  (declare (type double-float divisor))
  (setf (gp-xy-x p) (/ (gp-xy-x p) divisor)
	(gp-xy-y p) (/ (gp-xy-y p) divisor))
  (values))

(defmethod gp:divide! ((xy xy) (scalar real))
  (gp-xy-divide! (ptr xy) (coerce scalar 'double-float)))

(defmethod oc:divide! ((xy xy) (scalar real))
  (oc::_wrap_gp_XY_Divide (ptr xy) (coerce scalar 'double-float)))

(declaim (inline gp-xy-divided))
(defun gp-xy-divided (p1 divisor result-constructor result-foreign-type)
  (declare (type double-float divisor))
  (let* ((p2 (foreign-alloc result-foreign-type))
	 (result (funcall result-constructor :ptr p2)))
    (setf (gp-xy-x p2) (/ (gp-xy-x p1) divisor)
	  (gp-xy-y p2) (/ (gp-xy-y p1) divisor))
    (oc:finalize result :native)
    result))

(defmethod gp:divided ((xy xy) (scalar real))
  (gp-xy-divided (ptr xy) (coerce scalar 'double-float) #'make-xy '(:struct gp-xy)))

(defmethod oc:divided ((xy xy) (scalar real))
  (oc::_wrap_gp_XY_Divided (ptr xy) (coerce scalar 'double-float)))



(declaim (inline gp-xy-dot))
(defun gp-xy-dot (p1 p2)
  (+ (* (gp-xy-x p1) (gp-xy-x p2))
     (* (gp-xy-y p1) (gp-xy-y p2))))

(defmethod gp:dot ((xy1 xy) (xy2 xy))
  (gp-xy-dot (ptr xy1) (ptr xy2)))

(defmethod oc:dot ((xy1 xy) (xy2 xy))
  (oc::_wrap_gp_XY_Dot (ptr xy1) (ptr xy2)))

(declaim (inline gp-xy-multiply!-with-scalar))
(defun gp-xy-multiply!-with-scalar (p scalar)
  (let ((multiplier (coerce scalar 'double-float)))
    (setf (gp-xy-x p) (* (gp-xy-x p) multiplier)
	  (gp-xy-y p) (* (gp-xy-y p) multiplier))
    (values)))
  
(defmethod gp:multiply! ((xy xy) (scalar real))
  (gp-xy-multiply!-with-scalar (ptr xy) scalar))

(defmethod oc:multiply! ((xy xy) (scalar real))
  (oc::_wrap_gp_XY_Multiply__SWIG_0 (ptr xy) (coerce scalar 'double-float)))

(defmethod gp:multiply! ((xy xy) (xy2 xy))
  (let ((p (ptr xy))
	(p2 (ptr xy2)))
    (setf (gp-xy-x p) (* (gp-xy-x p) (gp-xy-x p2))
	  (gp-xy-y p) (* (gp-xy-y p) (gp-xy-y p2)))
    (values)))

(defmethod oc:multiply! ((xy xy) (xy2 xy))
  (oc::_wrap_gp_XY_Multiply__SWIG_1 (ptr xy) (ptr xy2)))

(defun gp-xy-mat2d-multiply! (p-xy p-mat)
  (let ((temp (+ (* (mem-aref p-mat :double 0) (gp-xy-x p-xy))
		 (* (mem-aref p-mat :double 2) (gp-xy-y p-xy)))))
    (setf (gp-xy-y p-xy) (+ (* (mem-aref p-mat :double 1) (gp-xy-x p-xy))
			    (* (mem-aref p-mat :double 3) (gp-xy-y p-xy)))
	  (gp-xy-y p-xy) temp)
    (values)))    

(defmethod gp:multiply! ((xy xy) (mat mat2d))
  (let* ((p-xy (ptr xy))
	 (p-mat (ptr mat)))
    (gp-xy-mat2d-multiply! p-xy p-mat)))

(defmethod oc:multiply! ((xy xy) (mat mat2d))
  (oc::_wrap_gp_XY_Multiply__SWIG_2 (ptr xy) (ptr mat)))

(defmethod gp:multiplied ((xy xy) (scalar real))
  (let* ((p1 (ptr xy))
	 (p2 (foreign-alloc '(:struct gp-xy)))
	 (result (make-xy :ptr p2))
	 (coef (coerce scalar 'double-float)))
    (setf (gp-xy-x p2) (* (gp-xy-x p1) coef)
	  (gp-xy-y p2) (* (gp-xy-y p1) coef))
    (oc:finalize result :native)
    result))

(defmethod oc:multiplied ((xy xy) (scalar real))
  (let* ((p1 (ptr xy))
	 (coef (coerce scalar 'double-float))
	 (p-result (oc::_wrap_gp_XY_Multiplied__SWIG_0 p1 coef))
	 (result (make-xy :ptr p-result)))
    (oc:finalize result)
    result))

(defmethod gp:multiplied ((xy xy) (xy2 xy))
  (let* ((p1 (ptr xy))
	 (p2 (ptr xy2))
	 (p3 (foreign-alloc '(:struct gp-xy)))
	 (result (make-xy :ptr p3)))
    (setf (gp-xy-x p3) (* (gp-xy-x p1) (gp-xy-x p2))
	  (gp-xy-y p3) (* (gp-xy-y p1) (gp-xy-y p2)))
    (oc:finalize result :native)
    result))

(defmethod oc:multiplied ((xy xy) (xy2 xy))
  (let* ((p1 (ptr xy))
	 (p2 (ptr xy2))
	 (p-result (oc::_wrap_gp_XY_Multiplied__SWIG_1 p1 p2))
	 (result (make-xy :ptr p-result)))
    (oc:finalize result)
    result))
    
(defmethod gp:multiplied ((xy xy) (mat mat2d))
  (let* ((p-xy (ptr xy))
	 (p-mat (ptr mat))
	 (p-result (foreign-alloc '(:struct gp-xy)))
	 (result (make-xy :ptr p-result)))
    
    (setf (gp-xy-y p-result) (+ (* (mem-aref p-mat :double 1) (gp-xy-x p-xy))
				(* (mem-aref p-mat :double 3) (gp-xy-y p-xy)))
	  (gp-xy-y p-result) (+ (* (mem-aref p-mat :double 0) (gp-xy-x p-xy))
				(* (mem-aref p-mat :double 2) (gp-xy-y p-xy))))
    
    (oc:finalize result :native)
    result))

(defmethod oc:multiplied ((xy xy) (mat mat2d))
  (let* ((p-xy (ptr xy))
	 (p-mat (ptr mat))
	 (p-result (oc::_wrap_gp_XY_Multiplied__SWIG_2 p-xy p-mat))
	 (result (make-xy :ptr p-result)))
    (oc:finalize result)
    result))

(declaim (inline gp-xy-normalize!))
(defun gp-xy-normalize! (p)
  (let ((d (gp-xy-modulus p)))
    (assert (> d +resolution+))
    (gp-xy-divide! p d)))
  
(defmethod gp:normalize! ((xy xy))
  (gp-xy-normalize! (ptr xy)))

(defmethod oc:normalize! ((xy xy))
  (oc::_wrap_gp_XY_Normalize (ptr xy)))

(defmethod gp:normalized ((xy xy))
  (let* ((p (ptr xy))
	 (d (gp-xy-modulus p)))
    (assert (> d +resolution+))
    (let* ((p-result (foreign-alloc '(:struct gp-xy)))
	   (result (make-xy :ptr p-result)))
      (setf (gp-xy-x p-result) (/ (gp-xy-x p) d)
	    (gp-xy-y p-result) (/ (gp-xy-y p) d))
      (oc:finalize result :native)
      result)))

(defmethod oc:normalized ((xy xy))
  (let* ((p-result (oc::_wrap_gp_XY_Normalized (ptr xy)))
	 (result (make-xy :ptr p-result)))
    (oc:finalize result)
    result))

(declaim (inline gp-xy-reverse!))
(defun gp-xy-reverse! (p)
  (setf (gp-xy-x p) (- (gp-xy-x p))
	(gp-xy-y p) (- (gp-xy-y p)))
  (values))
  
(defmethod gp:reverse! ((xy xy))
  (gp-xy-reverse! (ptr xy)))

(defmethod oc:reverse! ((xy xy))
  (oc::_wrap_gp_XY_Reverse (ptr xy)))

(defmethod gp:reversed ((xy xy))
  (let* ((p-xy (ptr xy))
	 (p-result (foreign-alloc '(:struct gp-xy)))
	 (result (make-xy :ptr p-result)))
    (setf (gp-xy-x p-result) (- (gp-xy-x p-xy))
	  (gp-xy-y p-result) (- (gp-xy-y p-xy)))
    (oc:finalize result :native)
    result))

(defmethod oc:reversed ((xy xy))
  (let* ((p-result (oc::_wrap_gp_XY_Reversed (ptr xy)))
	 (result (make-xy :ptr p-result)))
    (oc:finalize result)
    result))

(defmethod gp:subtract! ((xy xy) (right xy))
  (let ((p-xy (ptr xy))
	(p-right (ptr right)))
    (setf (gp-xy-x p-xy) (- (gp-xy-x p-xy) (gp-xy-x p-right))
	  (gp-xy-y p-xy) (- (gp-xy-y p-xy) (gp-xy-y p-right)))
    (values)))

(defmethod oc:subtract! ((xy1 xy) (xy2 xy))
  (oc::_wrap_gp_XY_Subtract (ptr xy1) (ptr xy2)))

(defmethod gp:subtracted ((xy xy) (right xy))
  (let* ((p-result (foreign-alloc '(:struct gp-xy)))
	 (result (make-xy :ptr p-result))
	 (p-xy (ptr xy))
	 (p-right (ptr right)))
    (setf (gp-xy-x p-result) (- (gp-xy-x p-xy) (gp-xy-x p-right))
	  (gp-xy-y p-result) (- (gp-xy-y p-xy) (gp-xy-y p-right)))
    (oc:finalize result :native)
    result))

(defmethod oc:subtracted ((xy xy) (right xy))
  (let* ((p-result (oc::_wrap_gp_XY_Subtracted (ptr xy) (ptr right)))
	 (result (make-xy :ptr p-result)))
    (oc:finalize result)
    result))
