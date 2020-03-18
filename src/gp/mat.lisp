(in-package :gp)

(defun mat (&optional arg1 arg2 arg3
	      arg4 arg5 arg6
	      arg7 arg8 arg9)
    
  (let* ((p (foreign-alloc 'gp-mat))
	 (s (make-mat :ptr p)))
    
    (unwind-protect
	 (cond ((and (xyz-p arg3)
		     (xyz-p arg2)
		     (xyz-p arg1)
		     (null arg9)
		     (null arg8)
		     (null arg7)
		     (null arg6)
		     (null arg5)
		     (null arg4)) (let ((col1 (ptr arg1))
					(col2 (ptr arg2))
					(col3 (ptr arg3)))
				    (setf (gp-mat-ref p 0 0) (gp-xy-x col1)
					  (gp-mat-ref p 1 0) (gp-xy-y col1)
					  (gp-mat-ref p 2 0) (gp-xyz-z col1)
					  (gp-mat-ref p 0 1) (gp-xy-x col2)
					  (gp-mat-ref p 1 1) (gp-xy-y col2)
					  (gp-mat-ref p 2 1) (gp-xyz-z col2)
					  (gp-mat-ref p 0 2) (gp-xy-x col3)
					  (gp-mat-ref p 1 2) (gp-xy-y col3)
					  (gp-mat-ref p 2 2) (gp-xyz-z col3))))

	       ((and (realp arg9)
		     (realp arg8)
		     (realp arg7)
		     (realp arg6)
		     (realp arg5)
		     (realp arg4)
		     (realp arg3)
		     (realp arg2)
		     (realp arg1)) (setf (gp-mat-ref p 0 0) (coerce arg1 'double-float)
					 (gp-mat-ref p 0 1) (coerce arg1 'double-float)
					 (gp-mat-ref p 0 2) (coerce arg2 'double-float)
					 (gp-mat-ref p 1 0) (coerce arg3 'double-float)
					 (gp-mat-ref p 1 1) (coerce arg4 'double-float)
					 (gp-mat-ref p 1 2) (coerce arg5 'double-float)
					 (gp-mat-ref p 2 0) (coerce arg6 'double-float)
					 (gp-mat-ref p 2 1) (coerce arg7 'double-float)
					 (gp-mat-ref p 2 2) (coerce arg8 'double-float)))
	  
	       ((and (null arg1)
		     (null arg2)
		     (null arg3)
		     (null arg4)
		     (null arg5)
		     (null arg6)
		     (null arg7)
		     (null arg8)
		     (null arg9)) (setf (gp-mat-ref p 0 0) 0.0d0
					(gp-mat-ref p 0 1) 0.0d0
					(gp-mat-ref p 0 2) 0.0d0
					(gp-mat-ref p 1 0) 0.0d0
					(gp-mat-ref p 1 1) 0.0d0
					(gp-mat-ref p 1 2) 0.0d0
					(gp-mat-ref p 2 0) 0.0d0
					(gp-mat-ref p 2 1) 0.0d0
					(gp-mat-ref p 2 2) 0.0d0))
	       
	       (t "Invalid arguments to constructor: ~S ~S ~S ~S ~S ~S ~S ~S ~S"
		  arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9))
      (oc:finalize s :native)
      s)))
      
(declaim (inline gp-mat-multiply!-with-scalar))
(defun gp-mat-multiply!-with-scalar (p double)
  (declare (type double-float double)) 
  (setf (gp-mat-ref p 0 0) (* double (gp-mat-ref p 0 0))
	(gp-mat-ref p 0 1) (* double (gp-mat-ref p 0 1))
	(gp-mat-ref p 0 2) (* double (gp-mat-ref p 0 2))
	(gp-mat-ref p 1 0) (* double (gp-mat-ref p 1 0))
	(gp-mat-ref p 1 1) (* double (gp-mat-ref p 1 1))
	(gp-mat-ref p 1 2) (* double (gp-mat-ref p 1 2))
	(gp-mat-ref p 2 0) (* double (gp-mat-ref p 2 0))
	(gp-mat-ref p 2 1) (* double (gp-mat-ref p 2 1))
	(gp-mat-ref p 2 2) (* double (gp-mat-ref p 2 2)))
  (values))
	     
(defmethod oc:multiply! ((mat mat) (scalar real))
  (gp-mat-multiply!-with-scalar (ptr mat) (coerce scalar 'double-float)))

(declaim (inline gp-mat-identity!))
(defun gp-mat-identity! (p)
  (setf (gp-mat-ref p 0 0) 1.0d0
	(gp-mat-ref p 0 1) 0.0d0
	(gp-mat-ref p 0 2) 0.0d0
	(gp-mat-ref p 1 0) 0.0d0
	(gp-mat-ref p 1 1) 1.0d0
	(gp-mat-ref p 1 2) 0.0d0
	(gp-mat-ref p 2 0) 0.0d0
	(gp-mat-ref p 2 1) 0.0d0
	(gp-mat-ref p 2 2) 1.0d0)
  (values))

(defmethod oc:copy ((matrix mat))
  (let* ((p-src (ptr matrix))
	 (p-dst (foreign-alloc 'gp-mat))
	 (new-mat (make-mat :ptr p-dst)))
    (setf (mem-aref p-dst :double 0) (mem-aref p-src :double 0)
	  (mem-aref p-dst :double 1) (mem-aref p-src :double 1)
	  (mem-aref p-dst :double 2) (mem-aref p-src :double 2)
	  (mem-aref p-dst :double 3) (mem-aref p-src :double 3)
	  (mem-aref p-dst :double 4) (mem-aref p-src :double 4)
	  (mem-aref p-dst :double 5) (mem-aref p-src :double 5)
	  (mem-aref p-dst :double 6) (mem-aref p-src :double 6)
	  (mem-aref p-dst :double 7) (mem-aref p-src :double 7)
	  (mem-aref p-dst :double 8) (mem-aref p-src :double 8))
    (oc:finalize new-mat :native)
    new-mat))

(defmethod oc:column ((matrix mat) (index integer))
  (assert (<= 1 index 3))
  (xyz (gp-mat-ref (ptr matrix) (1- index) 0)
       (gp-mat-ref (ptr matrix) (1- index) 1)
       (gp-mat-ref (ptr matrix) (1- index) 2)))

(defmethod (setf oc:column) ((xyz xyz) (matrix mat) (index integer))
  (assert (<= 1 index 3))
  (let ((p-xyz (ptr xyz))
	(p-mat (ptr matrix)))
    (setf (gp-mat-ref p-mat (1- index) 0) (gp-xy-x p-xyz)
	  (gp-mat-ref p-mat (1- index) 1) (gp-xy-y p-xyz)
	  (gp-mat-ref p-mat (1- index) 2) (gp-xyz-z p-xyz))
    (values)))

(defmethod oc:row ((matrix mat) (index integer))
  (assert (<= 1 index 3))
  (xyz (gp-mat-ref (ptr matrix) 0 (1- index))
       (gp-mat-ref (ptr matrix) 1 (1- index))
       (gp-mat-ref (ptr matrix) 2 (1- index))))

(defmethod (setf oc:row) ((xyz xyz) (matrix mat) (index integer))
  (assert (<= 1 index 3))
  (let ((p-xyz (ptr xyz))
	(p-mat (ptr matrix)))
    (setf (gp-mat-ref p-mat 0 (1- index)) (gp-xy-x p-xyz)
	  (gp-mat-ref p-mat 1 (1- index)) (gp-xy-y p-xyz)
	  (gp-mat-ref p-mat 2 (1- index)) (gp-xyz-z p-xyz))
    (values)))

