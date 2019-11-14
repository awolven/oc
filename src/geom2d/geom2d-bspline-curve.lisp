(in-package :oc)

(defmethod initialize-instance :after ((instance geom2d-bspline-curve) &rest initargs
				       &key Poles Weights Knots Multiplicities Degree
					 (Periodic nil Periodic-supplied-p)
					 &allow-other-keys)

  (let ((ff-pointer
	 (cond ((and (typep Poles 'TColgp_Array1OfPnt2d) (null Weights)
		     (typep Knots 'TColstd_Array1OfReal) (typep Multiplicities 'TColstd_Array1OfInteger)
		     (typep Degree 'integer) Periodic-supplied-p)
		(_wrap_new_Geom2d_BSplineCurve__SWIG_0
		 (ff-pointer Poles) (ff-pointer Knots) (ff-pointer Multiplicities)
		 Degree (if Periodic (if (eq Periodic 0) 0 1) 0)))
	       ((and (typep Poles 'TColgp_Array1OfPnt2d) (null Weights)
		     (typep Knots 'TColstd_Array1OfReal) (typep Multiplicities 'TColstd_Array1OfInteger)
		     (typep Degree 'integer) (null Periodic-supplied-p))
		(_wrap_new_Geom2d_BSplineCurve__SWIG_1
		 (ff-pointer Poles) (ff-pointer Knots) (ff-pointer Multiplicities)
		 Degree))
	       ((and (typep Poles 'TColgp_Array1OfPnt2d) (typep Weights 'TColstd_Array1OfReal)
		     (typep Knots 'TColstd_Array1OfReal) (typep Multiplicities 'TColstd_Array1OfInteger)
		     (typep Degree 'integer) Periodic-supplied-p)
		(_wrap_new_Geom2d_BSplineCurve__SWIG_2
		 (ff-pointer Poles) (ff-pointer Weights) (ff-pointer Knots) (ff-pointer Multiplicities)
		 Degree (if Periodic (if (eq Periodic 0) 0 1) 0)))
	       ((and (typep Poles 'TColgp_Array1OfPnt2d) (typep Weights 'TColstd_Array1OfReal)
		     (typep Knots 'TColstd_Array1OfReal) (typep Multiplicities 'TColstd_Array1OfInteger)
		     (typep Degree 'integer) (null Periodic-supplied-p))
		(_wrap_new_Geom2d_BSplineCurve__SWIG_3
		 (ff-pointer Poles) (ff-pointer Weights) (ff-pointer Knots) (ff-pointer Multiplicities)
		 Degree))
	       (t (error "Invalid initargs: ~S" initargs)))))
    (setf (ff-pointer instance) ff-pointer)
    (sb-ext:finalize
     instance
     (lambda ()
       (_wrap_Handle_MMgt_TShared_DecrementRefCounter ff-pointer))
     :dont-save t)
    (values)))

(defun make-bspline-curve-2d (poles weights knots multiplicities degree &optional (periodic nil))
  (let* ((poles-length (length poles))
	 (poles-array (make-instance 'tcol-gp-array1-of-pnt2d :theLower 1 :theUpper poles-length)))
    (loop for i from 0 below poles-length
       do (let ((element (elt poles i)))
	    (unless element (return))
	    (set-value poles-array (1+ i) element)))
    (let* ((weights-length (length weights))
	   (weights-array (make-instance 'tcol-std-array1-of-real :theLower 1 :theUpper weights-length)))
      (loop for i from 0 below weights-length
	 do (let ((element (elt weights i)))
	      (unless element (return))
	      (set-value weights-array (1+ i) element)))
      (let* ((knots-length (length knots))
	     (knots-array (make-instance 'tcol-std-array1-of-real :theLower 1 :theUpper knots-length)))
	(loop for i from 0 below knots-length
	   do (let ((element (elt knots i)))
		(unless element (return))
		(set-value knots-array (1+ i) element)))

	(let* ((multiplicities-length (length multiplicities))
	       (multiplicities-array (make-instance 'tcol-std-array1-of-integer :theLower 1 :theUpper
						    multiplicities-length)))
	  (loop for i from 0 below multiplicities-length
	     do (let ((element (elt multiplicities i)))
		  (unless element (return))
		  (set-value multiplicities-array (1+ i) element)))
	  (make-instance 'geom2d-bspline-curve
			 :Poles poles-array
			 :Weights weights-array
			 :Knots knots-array
			 :Multiplicities multiplicities-array
			 :Degree degree
			 :Periodic periodic))))))
