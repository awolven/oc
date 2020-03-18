(in-package :gp)

(defun lin (&key A1
	      (P (if A1
		     (loc A1)
		     (pnt 0.0d0 0.0d0 0.0d0)))
	      (N (if A1
		     (vdir A1)
		     (dir 0.0d0 0.0d0 1.0d0))))
  (let* ((pointer (foreign-alloc '(:struct gp-lin)))
	 (struct (make-lin :ptr pointer)))
    (setf (gp-lin-pos-loc-coord-x pointer) (x P)
	  (gp-lin-pos-loc-coord-y pointer) (y P)
	  (gp-lin-pos-loc-coord-z pointer) (z P)
	  (gp-lin-pos-vdir-coord-x pointer) (x N)
	  (gp-lin-pos-vdir-coord-y pointer) (y N)
	  (gp-lin-pos-vdir-coord-z pointer) (z N))
    (oc:finalize struct :native)
    struct))

(defmethod print-object ((object lin) stream)
  (format stream "(~S :A1 ~A)" (type-of object) (gp:position object)))

(defmethod pos ((struct lin))
  (make-ax1 :ptr (foreign-slot-pointer (ptr struct) '(:struct gp-lin) 'pos) :own struct))

(defmethod gp:position ((struct lin))
  (make-ax1 :ptr (foreign-slot-pointer (ptr struct) '(:struct gp-lin) 'pos) :own struct))

