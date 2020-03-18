(in-package :gp)

(defun ax22d (&rest args &key P Vx Vy V A (Sense t Sense-arg-provided-p))
  (let ((ptr (foreign-alloc '(:struct gp-ax22d))))
    (cond ((null args) (setf (gp-ax22d-point-coord-x ptr) 0.0d0
			     (gp-ax22d-point-coord-y ptr) 0.0d0
			     (gp-ax22d-vydir-coord-x ptr) 0.0d0
			     (gp-ax22d-vydir-coord-y ptr) 1.0d0
			     (gp-ax22d-vxdir-coord-x ptr) 1.0d0
			     (gp-ax22d-vxdir-coord-y ptr) 0.0d0))
	  ((and P Vx Vy (not (or A Sense-arg-provided-p)))
	   (setf (gp-ax22d-vxdir-coord-x ptr) (x Vx)
		 (gp-ax22d-vxdir-coord-y ptr) (y Vx))
	   (flet ((cross-2d (v1 v2) (- (* (x v1) (y v2)) (* (y v1) (x v2)))))
	     (let ((value (cross-2d Vx Vy)))
	       (if (>= value 0.0d0) 
		   (setf (gp-ax22d-vydir-coord-x ptr) (- (gp-ax22d-vxdir-coord-y ptr))
			 (gp-ax22d-vydir-coord-y ptr) (gp-ax22d-vxdir-coord-x ptr))
		   (setf (gp-ax22d-vydir-coord-x ptr) (gp-ax22d-vxdir-coord-y ptr)
			 (gp-ax22d-vydir-coord-y ptr) (- (gp-ax22d-vxdir-coord-x ptr)))))))
	  ((and P V Sense-arg-provided-p (not (or Vx A)))
	   (setf (gp-ax22d-point-coord-x ptr) (x P)
		 (gp-ax22d-point-coord-y ptr) (y P)
		 (gp-ax22d-vxdir-coord-x ptr) (x V)
		 (gp-ax22d-vxdir-coord-y ptr) (y V))
	   (if Sense
	       (setf (gp-ax22d-vydir-coord-x ptr) (- (gp-ax22d-vxdir-coord-y ptr))
		     (gp-ax22d-vydir-coord-y ptr) (gp-ax22d-vxdir-coord-x ptr))
	       (setf (gp-ax22d-vydir-coord-x ptr) (gp-ax22d-vxdir-coord-y ptr)
		     (gp-ax22d-vydir-coord-y ptr) (- (gp-ax22d-vxdir-coord-x ptr)))))
	  ((and (typep A 'ax2d) Sense-arg-provided-p (not (or P Vx Vy V)))
	   (setf (gp-ax22d-point-coord-x ptr) (gp-ax2d-loc-coord-x (ptr A))
		 (gp-ax22d-point-coord-y ptr) (gp-ax2d-loc-coord-y (ptr A))
		 (gp-ax22d-vxdir-coord-x ptr) (gp-ax2d-vdir-coord-x (ptr A))
		 (gp-ax22d-vxdir-coord-y ptr) (gp-ax2d-vdir-coord-y (ptr A)))
	   (if Sense
	       (setf (gp-ax22d-vydir-coord-x ptr) (- (gp-ax22d-vxdir-coord-y ptr))
		     (gp-ax22d-vydir-coord-y ptr) (gp-ax22d-vxdir-coord-x ptr))
	       (setf (gp-ax22d-vydir-coord-x ptr) (gp-ax22d-vxdir-coord-y ptr)
		     (gp-ax22d-vydir-coord-y ptr) (- (gp-ax22d-vxdir-coord-x ptr)))))
	  (t "Invalid arguments to ax22d: ~S" args))
    (let ((struct (make-ax22d :ptr ptr)))
      (oc:finalize struct :native)
      struct)))
