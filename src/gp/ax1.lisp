(in-package :gp)

(defun ax1 (&optional (loc (pnt 0.0d0 0.0d0 0.0d0)) (vdir (dir 0.0d0 0.0d0 1.0d0)))
  (let* ((pointer (foreign-alloc '(:struct gp-ax1)))
	 (struct (make-ax1 :ptr pointer)))
    (setf (gp-ax1-loc-coord-x pointer) (x loc)
	  (gp-ax1-loc-coord-y pointer) (y loc)
	  (gp-ax1-loc-coord-z pointer) (z loc)

	  (gp-ax1-vdir-coord-x pointer) (x vdir)
	  (gp-ax1-vdir-coord-y pointer) (y vdir)
	  (gp-ax1-vdir-coord-z pointer) (z vdir))
    (finalize struct (lambda () (print 'freeing-ax1) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object ax1) stream)
  (let ((pointer (ptr object)))
    (format stream "(ax1 (pnt ~A ~A ~A) (dir ~A ~A ~A))"
	    (gp-ax1-loc-coord-x pointer)
	    (gp-ax1-loc-coord-y pointer)
	    (gp-ax1-loc-coord-z pointer)

	    (gp-ax1-vdir-coord-x pointer)
	    (gp-ax1-vdir-coord-y pointer)
	    (gp-ax1-vdir-coord-z pointer))))

(defmethod loc ((struct ax1))
  (make-pnt :ptr (foreign-slot-pointer (ptr struct) '(:struct gp-ax1) 'loc) :own struct))

(defmethod gp:location ((struct ax1))
  (make-pnt :ptr (foreign-slot-pointer (ptr struct) '(:struct gp-ax1) 'loc) :own struct))

(defmethod vdir ((struct ax1))
  (make-dir :ptr (foreign-slot-pointer (ptr struct) '(:struct gp-ax1) 'loc) :own struct))
