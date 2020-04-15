(in-package :gp)

(defun oc::trsf ()
  (let* ((pointer (oc::_wrap_new_gp_Trsf__SWIG_0))
	 (struct (make-trsf :ptr pointer)))
    (oc:finalize struct)
    struct))

(defun trsf (&optional trsf2d)
  (let* ((pointer (foreign-alloc '(:struct gp-trsf)))
	 (struct (make-trsf :ptr pointer)))
    (cond ((null trsf2d)
	   (setf (gp-trsf-scale pointer) 1.0d0
		 (gp-trsf-shape pointer) +trsf-identity+)
	   (let ((p-matrix (foreign-slot-pointer pointer '(:struct gp-trsf) 'matrix)))
	     (setf (mem-aref p-matrix :double 0) 1.0d0
		   (mem-aref p-matrix :double 1) 0.0d0
		   (mem-aref p-matrix :double 2) 0.0d0
		   (mem-aref p-matrix :double 3) 0.0d0
		   (mem-aref p-matrix :double 4) 1.0d0
		   (mem-aref p-matrix :double 5) 0.0d0
		   (mem-aref p-matrix :double 6) 0.0d0
		   (mem-aref p-matrix :double 7) 0.0d0
		   (mem-aref p-matrix :double 8) 1.0d0))
	   (let ((p-loc (foreign-slot-pointer pointer '(:struct gp-trsf) 'loc)))
	     (gp-xy-x p-loc) 0.0d0
	     (gp-xy-y p-loc) 0.0d0
	     (gp-xyz-z p-loc) 1.0d0))
	  
	  ((trsf2d-p trsf2d)
	   (let ((p2 (ptr trsf2d)))
	     (setf (gp-trsf-scale pointer) (gp-trsf-scale p2)
		   (gp-trsf-shape pointer) (gp-trsf-shape p2))
	     (let ((p-mat (foreign-slot-pointer pointer '(:struct gp-trsf) 'matrix))
		   (p2-mat (foreign-slot-pointer pointer '(:struct gp-trsf2d) 'matrix)))
	       (setf (mem-aref p-mat :double 0) (mem-aref p2-mat :double 0)
		     (mem-aref p-mat :double 1) (mem-aref p2-mat :double 1)
		     (mem-aref p-mat :double 2)  0.0d0
		     (mem-aref p-mat :double 3) (mem-aref p2-mat :double 3)
		     (mem-aref p-mat :double 4) (mem-aref p2-mat :double 4)
		     (mem-aref p-mat :double 5) 0.0d0
		     (mem-aref p-mat :double 6) 0.0d0
		     (mem-aref p-mat :double 7) 0.0d0
		     (mem-aref p-mat :double 8) 1.0d0)
	       (when (eq (gp-trsf-shape pointer) +trsf-ax1-mirror+)
		 (setf (gp-trsf-scale pointer) 1.0d0)
		 (gp-mat-multiply!-with-scalar p-mat -1.0d0))))))
    (oc:finalize struct :native)
    struct))

(defmethod oc:multiply! ((trsf1 trsf) (trsf2 trsf))
  (oc::_wrap_gp_Trsf_Multiply (ptr trsf1) (ptr trsf2)))

(defmethod (setf oc:mirror) ((axis ax1) (trsf trsf))
  (oc::_wrap_gp_Trsf_SetMirror__SWIG_0 (ptr trsf) (ptr axis))
  axis)

(defmethod gp:homogeneous-vectorial-part ((trsf trsf))
  (make-mat :ptr (foreign-slot-pointer (ptr trsf) '(:struct gp-trsf) 'matrix)
	    :own trsf))

(defmethod orthogonalize! ((trsf trsf))
  (let* ((mat (oc:copy (oc:homogeneous-vectorial-part trsf)))
	 (v1 (oc:column mat 1))
	 (v2 (oc:column mat 2))
	 (v3 (oc:column mat 3)))

    (oc:normalize! v1)

    (let ((temp (oc:dot v2 v1)))
      (setf (gp-xy-x (ptr v2)) (- (gp-xy-x (ptr v2))
				  (* (gp-xy-x (ptr v1)) temp))
	    (gp-xy-y (ptr v2)) (- (gp-xy-y (ptr v2))
				  (* (gp-xy-y (ptr v1)) temp))
	    (gp-xyz-z (ptr v2)) (- (gp-xyz-z (ptr v2))
				   (* (gp-xyz-z (ptr v1)) temp)))

      (oc:normalize! v2)

      (setq temp (+ (oc:dot v3 v1) (oc:dot v3 v2)))

      (setf (gp-xy-x (ptr v3)) (- (gp-xy-x (ptr v3))
				  (* (gp-xy-x (ptr v1)) temp))
	    (gp-xy-y (ptr v3)) (- (gp-xy-y (ptr v3))
				  (* (gp-xy-y (ptr v1)) temp))
	    (gp-xyz-z (ptr v3)) (- (gp-xyz-z (ptr v3))
				   (* (gp-xyz-z (ptr v1)) temp)))

      (oc:normalize! v3)

      (setf (oc:column mat 1) v1)
      (setf (oc:column mat 2) v2)
      (setf (oc:column mat 3) v3)

      (setq v1 (oc:row mat 1)
	    v2 (oc:row mat 2)
	    v3 (oc:row mat 3))

      (oc:normalize! v1)

      (setq temp (oc:dot v2 v1))

      (setf (gp-xy-x (ptr v2)) (- (gp-xy-x (ptr v2))
				  (* (gp-xy-x (ptr v1)) temp))
	    (gp-xy-y (ptr v2)) (- (gp-xy-y (ptr v2))
				  (* (gp-xy-y (ptr v1)) temp))
	    (gp-xyz-z (ptr v2)) (- (gp-xyz-z (ptr v2))
				 (* (gp-xyz-z (ptr v1)) temp)))

      (oc:normalize! v2)

      (setq temp (+ (oc:dot v3 v1) (oc:dot v3 v2)))

      (setf (gp-xy-x (ptr v3)) (- (gp-xy-x (ptr v3))
				  (* (gp-xy-x (ptr v1)) temp))
	    (gp-xy-y (ptr v3)) (- (gp-xy-y (ptr v3))
				  (* (gp-xy-y (ptr v1)) temp))
	    (gp-xyz-z (ptr v3)) (- (gp-xyz-z (ptr v3))
				   (* (gp-xyz-z (ptr v1)) temp)))

      (oc:normalize! v3)

      (setf (oc:row mat 1) v1)
      (setf (oc:row mat 2) v2)
      (setf (oc:row mat 3) v3)

      (let ((p (ptr (oc:homogeneous-vectorial-part trsf))))
	(setf (mem-aref p :double 0) (mem-aref (ptr mat) :double 0)
	      (mem-aref p :double 1) (mem-aref (ptr mat) :double 1)
	      (mem-aref p :double 2) (mem-aref (ptr mat) :double 2)
	      (mem-aref p :double 3) (mem-aref (ptr mat) :double 3)
	      (mem-aref p :double 4) (mem-aref (ptr mat) :double 4)
	      (mem-aref p :double 5) (mem-aref (ptr mat) :double 5)
	      (mem-aref p :double 6) (mem-aref (ptr mat) :double 6)
	      (mem-aref p :double 7) (mem-aref (ptr mat) :double 7)
	      (mem-aref p :double 8) (mem-aref (ptr mat) :double 8)))
    
      (values))))

(defmethod (setf gp:translation) ((v vec) (trsf trsf))
  (let* ((p-trsf (ptr trsf))
	 (p-shape (foreign-slot-pointer p-trsf '(:struct gp-trsf) 'shape))
	 (p-scale p-trsf)
	 (p-mat (foreign-slot-pointer p-trsf '(:struct gp-trsf) 'matrix))
	 (p-loc (foreign-slot-pointer p-trsf '(:struct gp-trsf) 'loc))
	 (p-vec (ptr v)))
    (setf (mem-aref p-shape :int) +trsf-translation+
	  (mem-aref p-scale :double) 1.0d0)
    (gp-mat-identity! p-mat)
    (setf (gp-xy-x p-loc) (gp-xy-x p-vec)
	  (gp-xy-y p-loc) (gp-xy-y p-vec)
	  (gp-xyz-z p-loc) (gp-xyz-z p-vec))
    (values)))


(declaim (inline values-determinant))
(defun values-determinant (a11 a12 a13
			   a21 a22 a23
			   a31 a32 a33)
  (declare (type double-float a11 a12 a13 a21 a22 a23 a31 a32 a33))
  (+ (* a11 (- (* a22 a33) (* a32 a23)))
     (- (* a12 (- (* a21 a33) (* a31 a23))))
     (* a13 (- (* a21 a32) (* a31 a22)))))

(declaim (inline gp-trsf-set-values))
(defun gp-trsf-set-values (p-trsf
			   a11 a12 a13 a14
			   a21 a22 a23 a24
			   a31 a32 a33 a34)
  (declare (type double-float a11 a12 a13 a14 a21 a22 a23 a24 a31 a32 a33 a34))
  (let* ((s (values-determinant a11 a12 a13 a21 a22 a23 a31 a32 a33))
	 (as (abs s)))
    (when (< as +resolution+)
      (error "null determinant"))
    (if (> s 0.0d0)
	(setq s (expt s 1/3))
	(setq s (- (expt (- s) 1/3))))
    (setf (mem-aref p-trsf :double) s)
    (setf (mem-aref (foreign-slot-pointer p-trsf '(:struct gp-trsf) 'shape) :int)
	  +trsf-compound-trsf+)
  (let ((p-loc (foreign-slot-pointer p-trsf '(:struct gp-trsf) 'loc))
	(p-mat (foreign-slot-pointer p-trsf '(:struct gp-trsf) 'matrix)))
    (setf (gp-mat-ref p-mat 0 0) (/ a11 s)
	  (gp-mat-ref p-mat 0 1) (/ a12 s)
	  (gp-mat-ref p-mat 0 2) (/ a13 s)
	  (mem-aref p-loc :double 0) a14

	  (gp-mat-ref p-mat 1 0) (/ a21 s)
	  (gp-mat-ref p-mat 1 1) (/ a22 s)
	  (gp-mat-ref p-mat 1 2) (/ a23 s)
	  (mem-aref p-loc :double 1) a24

	  (gp-mat-ref p-mat 2 0) (/ a31 s)
	  (gp-mat-ref p-mat 2 1) (/ a32 s)
	  (gp-mat-ref p-mat 2 2) (/ a33 s)
	  (mem-aref p-loc :double 2) a34)

    (orthogonalize! (make-trsf :ptr p-trsf))
    (values))))

(defmethod gp::set-values ((trsf trsf) &rest args)
  (destructuring-bind (a11
		       a12 a13 a14
		       a21 a22 a23 a24
		       a31 a32 a33 a34) args
    (gp-trsf-set-values (ptr trsf)
			(coerce a11 'double-float)
			(coerce a12 'double-float)
			(coerce a13 'double-float)
			(coerce a14 'double-float)
			(coerce a21 'double-float)
			(coerce a22 'double-float)
			(coerce a23 'double-float)
			(coerce a24 'double-float)
			(coerce a31 'double-float)
			(coerce a32 'double-float)
			(coerce a33 'double-float)
			(coerce a34 'double-float))))
