(in-package :gp)

(defun ax3 (&key P N Vx)
  (let ((gp-ax3 (foreign-alloc '(:struct gp-ax3))))
    (setf (gp-ax3-axis-loc-coord-x gp-ax3) (x P)
	  (gp-ax3-axis-loc-coord-y gp-ax3) (y P)
	  (gp-ax3-axis-loc-coord-z gp-ax3) (z P)

	  (gp-ax3-axis-vdir-coord-x gp-ax3) (x N)
	  (gp-ax3-axis-vdir-coord-y gp-ax3) (y N)
	  (gp-ax3-axis-vdir-coord-z gp-ax3) (z N))

    (let* ((vxdir (gp:cross-crossed N Vx N))
	   (vydir (gp:crossed N vxdir)))
	  
      (setf (gp-ax3-vxdir-coord-x gp-ax3) (x vxdir)
	    (gp-ax3-vxdir-coord-y gp-ax3) (y vxdir)
	    (gp-ax3-vxdir-coord-z gp-ax3) (z vxdir)

	    (gp-ax3-vydir-coord-x gp-ax3) (x vydir)
	    (gp-ax3-vydir-coord-y gp-ax3) (y vydir)
	    (gp-ax3-vydir-coord-z gp-ax3) (z vydir)))
    (let ((struct (make-ax3 :ptr gp-ax3)))
      (oc:finalize struct :native)
      struct)))

(defmethod vxdir ((ax3 ax3))
  (make-dir :ptr (mem-aptr (ptr ax3) :double 9) :own ax3))

(defmethod vydir ((ax3 ax3))
  (make-dir :ptr (mem-aptr (ptr ax3) :double 6) :own ax3))

(defmethod axis ((ax3 ax3))
  (make-ax1 :ptr (ptr ax3)))

(defmethod gp:direction ((ax3 ax3))
  (let ((axis (axis ax3)))
    (vdir axis)))

(defmethod gp:location ((ax3 ax3))
  (loc (axis ax3)))

(defmethod gp:direct? ((ax3 ax3))
  (> (gp:dot (gp:crossed (vxdir ax3) (vydir ax3)) (gp:direction (axis ax3))) 0.0d0))
