(in-package :gp)

#|
  Name                        defcstruct macro-accessors defstruct constructor accessors methods constructor-wrapped methods-wrapped
---------------------------------------------------------------------------------------------------------------------------------------
  gp_Ax1                      X          X               X         X
  gp_Ax22d                    X          X               X         X
  gp_Ax2d                     X          X               X         X
  gp_Ax2                      X          X               X         X
  gp_Ax3                      X          X               X         X
  gp_Circ2d                   X          X               X         X
  gp_Circ                     X          X               X         X
  gp_Cone                     X          X               X
  gp_Cylinder                 X          X               X
  gp_Dir2d                    X                          X         X
  gp_Dir                      X                          X
  gp_Elips2d
  gp_Elips                    X          X
  gp_EulerSequence
  gp_GTrsf2d
  gp_GTrsf
  gp
  gp_Hypr2d
  gp_Hypr
  gp_Lin2d                    X                          X
  gp_Lin                      X          X               X         X
  gp_Mat2d
  gp_Mat                      X          X               X
  gp_Parab2d
  gp_Parab
  gp_Pln                      X          X               X         X
  gp_Pnt2d                    X                          X         X
  gp_Pnt                      X                          X         X
  gp_Quaternion
  gp_QuaternionNLerp
  gp_QuaternionSLerp
  gp_Sphere
  gp_Torus
  gp_Trsf2d
  gp_TrsfForm
  gp_Trsf                     X                          X
  gp_TrsfNLerp
  gp_Vec2d                    X                          X         X
  gp_Vec                      X                          X         X
  gp_VectorWithNullMagnitude
  gp_XY                       X          X               X         X
  gp_XYZ                      X          X               X         X
|#

(defconstant +resolution+ 1.0d-37)
	   
(deftype pointer () #+SBCL 'sb-sys:system-area-pointer)

(defparameter +null-pointer+ (load-time-value (make-pointer 0)))

(defstruct (gpthing (:conc-name ""))
  (ptr +null-pointer+ :type pointer))

(defcstruct gp-xy
  (x :double)
  (y :double))



(defstruct (xy (:include gpthing)))

(defun xy-x (xy)
  (gp-xy-x (ptr xy)))

(defun xy-y (xy)
  (gp-xy-y (ptr xy)))

(defmethod x ((xy xy))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy xy))
  (gp-xy-y (ptr xy)))

(defun xy (&optional (x 0.0d0) (y 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-xy)))
	 (struct (make-xy :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float))
    (finalize struct (lambda () (print 'freeing-xy) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object xy) stream)
  (format stream "(xy ~A ~A)" (x object) (y object)))

(defcstruct gp-vec2d
  (coord (:struct gp-xy)))

(defstruct (vec2d (:include gpthing)))

(defmethod x ((xy vec2d))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy vec2d))
  (gp-xy-y (ptr xy)))

(defun vec2d (&optional (x 0.0d0) (y 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-vec2d)))
	 (struct (make-vec2d :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float))
    (finalize struct (lambda () (print 'freeing-vec2d) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object vec2d) stream)
  (format stream "(vec2d ~A ~A)" (x object) (y object)))

(defcstruct gp-pnt2d
  (coord (:struct gp-xy)))

(defstruct (pnt2d (:include gpthing)))

(defmethod x ((xy pnt2d))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy pnt2d))
  (gp-xy-y (ptr xy)))

(defun pnt2d (&optional (x 0.0d0) (y 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-pnt2d)))
	 (struct (make-pnt2d :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float))
    (finalize struct (lambda () (print 'freeing-pnt2d) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object pnt2d) stream)
  (format stream "(pnt2d ~A ~A)" (x object) (y object)))

(defcstruct gp-dir2d
  (coord (:struct gp-xy)))

(defstruct (dir2d (:include gpthing)))

(defmethod x ((xy dir2d))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy dir2d))
  (gp-xy-y (ptr xy)))

(defun dir2d-0 ()
  (let* ((pointer (foreign-alloc '(:struct gp-dir2d)))
	 (struct (make-dir2d :ptr pointer)))
    (setf (gp-xy-x pointer) 0.0d0
	  (gp-xy-y pointer) 0.0d0)
    (finalize struct (lambda () (print 'freeing-dir2d) (foreign-free pointer)) :dont-save t)
    struct))

(defun dir2d-1 (&optional (v (vec2d 0.0d0 0.0d0)))
  (let* ((pointer (foreign-alloc '(:struct gp-dir2d)))
	 (struct (make-dir2d :ptr pointer)))
    (setf (gp-xy-x pointer) (x v)
	  (gp-xy-y pointer) (y v))
    (finalize struct (lambda () (print 'freeing-dir2d) (foreign-free pointer)) :dont-save t)
    struct))

(defun dir2d-2 (&optional (coord (xy 0.0d0 0.0d0)))

  ;; wrong.
  (let* ((pointer (foreign-alloc '(:struct gp-dir2d)))
	 (struct (make-dir2d :ptr pointer)))
    (setf (gp-xy-x pointer) (x coord)
	  (gp-xy-y pointer) (y coord))
    (finalize struct (lambda () (print 'freeing-dir2d) (foreign-free pointer)) :dont-save t)
    struct))
    
(defun dir2d (&optional (xv 0.0d0) (yv 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-dir2d)))
	 (struct (make-dir2d :ptr pointer)))
    (let* ((df-xv (coerce xv 'double-float))
	   (df-yv (coerce yv 'double-float))
	   (d (sqrt (+ (* df-xv df-xv) (* df-yv df-yv)))))
      (setf (gp-xy-x pointer) (/ df-xv d)
	    (gp-xy-y pointer) (/ df-yv d))
      (finalize struct (lambda () (print 'freeing-dir2d) (foreign-free pointer)) :dont-save t)
      struct)))

(defmethod print-object ((object dir2d) stream)
  (format stream "(dir2d ~S ~S)" (gp-xy-x (ptr object)) (gp-xy-y (ptr object)))
  object)

(defcstruct gp-xyz
  (x :double)
  (y :double)
  (z :double))


(defstruct (xyz (:include gpthing)))

(defmethod x ((xy xyz))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy xyz))
  (gp-xy-y (ptr xy)))

(defmethod z ((xyz xyz))
  (gp-xyz-z (ptr xyz)))


(defun xyz (&optional (x 0.0d0) (y 0.0d0) (z 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-xyz)))
	 (struct (make-xyz :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float)
	  (gp-xyz-z pointer) (coerce z 'double-float))
    (finalize struct (lambda () (print 'freeing-xyz) (foreign-free pointer)) :dont-save t)
    struct))

(defun dot (v1 v2)
  (+ (* (x v1) (x v2)) (* (y v1) (y v2)) (* (z v1) (z v2))))

(defun dot-cross (v0 v1 v2)
  (let ((xresult (- (* (y v1) (z v2)) (* (z v1) (y v2))))
	(yresult (- (* (z v1) (x v2)) (* (x v1) (z v2))))
	(zresult (- (* (x v1) (y v2)) (* (y v1) (x v2)))))
    (+ (* (x v0) xresult) (* (y v0) yresult) (* (z v0) zresult))))





(defmethod multiply ((v xy) scalar)
  (let ((new-x (* (x v) scalar))
	(new-y (* (y v) scalar)))
    (xy new-x new-y)))

(defmethod multiply ((v vec2d) scalar)
  (vec2d (* (x v) scalar) (* (y v) scalar)))

(defmethod multiply ((v xyz) scalar)
  (xyz (* (x v) scalar) (* (y v) scalar) (* (z v) scalar)))



(defmethod divide ((v xy) scalar)
  (xy (/ (x v) scalar) (/ (y v) scalar)))

(defmethod divide ((v vec2d) scalar)
  (vec2d (/ (x v) scalar) (/ (y v) scalar)))

(defmethod divide ((v xyz) scalar)
  (xyz (/ (x v) scalar) (/ (y v) scalar) (/ (z v) scalar)))

(defmethod print-object ((object xyz) stream)
  (format stream "(xyz ~A ~A ~A)" (x object) (y object) (z object)))

(defcstruct gp-pnt
  (coord (:struct gp-xyz)))

(defstruct (pnt (:include gpthing)))

(defmethod x ((xy pnt))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy pnt))
  (gp-xy-y (ptr xy)))

(defmethod z ((xyz pnt))
  (gp-xyz-z (ptr xyz)))

(defun pnt (&optional (x 0.0d0) (y 0.0d0) (z 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-pnt)))
	 (struct (make-pnt :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float)
	  (gp-xyz-z pointer) (coerce z 'double-float))
    (finalize struct (lambda () (print 'freeingpnt) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object pnt) stream)
  (format stream "(pnt ~A ~A ~A)" (x object) (y object) (z object)))

(defctype gp-trsf-form :int)
(defctype gp-mat2d (:array :double 2 2))

(defctype gp-mat (:array :double 3 3))
(defstruct (mat (:include gpthing)))

(defcstruct gp-trsf2d
  (scale :double)
  (shape gp-trsf-form)
  (matrix gp-mat2d)
  (loc (:struct gp-xy)))

(defstruct (trsf2d (:include gpthing)))

(defcstruct gp-dir
  (coord (:struct gp-xyz)))

(defstruct (dir (:include gpthing)))

(defmethod x ((xy dir))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy dir))
  (gp-xy-y (ptr xy)))

(defmethod z ((xyz dir))
  (gp-xyz-z (ptr xyz)))

(defun dir (&optional (x 0.0d0) (y 0.0d0) (z 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-dir)))
	 (struct (make-dir :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float)
	  (gp-xyz-z pointer) (coerce z 'double-float))
    (finalize struct (lambda () (print 'freeing-dir) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object dir) stream)
  (format stream "(dir ~A ~A ~A)" (x object) (y object) (z object)))

(defcstruct gp-vec
  (coord (:struct gp-xyz)))

(defstruct (vec (:include gpthing)))

(defmethod x ((xy vec))
  (gp-xy-x (ptr xy)))

(defmethod y ((xy vec))
  (gp-xy-y (ptr xy)))

(defmethod z ((xyz vec))
  (gp-xyz-z (ptr xyz)))

(defun vec (&optional (x 0.0d0) (y 0.0d0) (z 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-vec)))
	 (struct (make-vec :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce x 'double-float)
	  (gp-xy-y pointer) (coerce y 'double-float)
	  (gp-xyz-z pointer) (coerce z 'double-float))
    (finalize struct (lambda () (print 'freeing-vec) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object vec) stream)
  (format stream "(vec ~A ~A ~A)" (x object) (y object) (z object)))

(defun xyz-z (xyz)
  (assert (or (typep xyz 'xyz)
	      (typep xyz 'pnt)
	      (typep xyz 'dir)
	      (typep xyz 'vec)))
  (gp-xyz-z (ptr xyz)))









(defun cross (v1 v2)
  (let ((xresult (- (* (y v1) (z v2)) (* (z v1) (y v2))))
	(yresult (- (* (z v1) (x v2)) (* (x v1) (z v2))))
	(zresult (- (* (x v1) (y v2)) (* (y v1) (x v2)))))
    (etypecase v1
      (vec (vec xresult yresult zresult))
      (dir (dir xresult yresult zresult))
      (xyz (xyz xresult yresult zresult)))))

(defun cross-cross (v0 v1 v2)
  (let ((xresult (- (* (y v0) (- (* (x v1) (y v2)) (* (y v1) (x v2)))) (* (z v0) (- (* (z v1) (x v2)) (* (x v1) (z v2))))))
	(yresult (- (* (z v0) (- (* (y v1) (z v2)) (* (z v1) (y v2)))) (* (x v0) (- (* (x v1) (y v2)) (* (y v1) (x v2))))))
	(zresult (- (* (x v0) (- (* (z v1) (x v2)) (* (x v1) (z v2)))) (* (y v0) (- (* (y v1) (z v2)) (* (z v1) (y v2)))))))
    (etypecase v0
      (dir (dir xresult yresult zresult))
      (vec (vec xresult yresult zresult))
      (xyz (xyz xresult yresult zresult)))))

(defmethod multiply ((v vec) scalar)
  (vec (* (x v) scalar) (* (y v) scalar) (* (z v) scalar)))

(defmethod multiply ((v dir) scalar)
  (dir (* (x v) scalar) (* (y v) scalar) (* (z v) scalar)))

(defmethod divide ((v vec) scalar)
  (vec (/ (x v) scalar) (/ (y v) scalar) (/ (z v) scalar)))

(defmethod divide ((v dir) scalar)
  (dir (/ (x v) scalar) (/ (y v) scalar) (/ (z v) scalar)))

(defcstruct gp-ax1
  (loc (:struct gp-pnt))
  (vdir (:struct gp-dir)))


(defstruct (ax1 (:include gpthing)))

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
  (make-pnt :ptr (foreign-slot-pointer (ptr struct) '(:struct gp-ax1) 'loc)))

(defmethod vdir ((struct ax1))
  (make-dir :ptr (foreign-slot-pointer (ptr struct) '(:struct gp-ax1) 'loc)))

(defcstruct gp-ax2
  (axis (:struct gp-ax1))
  (vydir (:struct gp-dir))
  (vxdir (:struct gp-dir)))



(defstruct (ax2 (:include gpthing)))

(defun ax2 (&key (P (pnt 0.0d0 0.0d0 0.0d0)) (N (dir 0.0d0 0.0d0 1.0d0)) (Vx (dir 1.0d0 0.0d0 0.0d0)))
  (let* ((pointer (foreign-alloc '(:struct gp-ax2)))
	 (struct (make-ax2 :ptr pointer)))
    (setf (gp-ax2-axis-loc-coord-x pointer) (x P)
	  (gp-ax2-axis-loc-coord-y pointer) (y P)
	  (gp-ax2-axis-loc-coord-z pointer) (z P)
	  (gp-ax2-axis-vdir-coord-x pointer) (x N)
	  (gp-ax2-axis-vdir-coord-y pointer) (y N)
	  (gp-ax2-axis-vdir-coord-z pointer) (z N)
	  (gp-ax2-vxdir-coord-x pointer) (- (* (y N) (- (* (x Vx) (y N)) (* (y Vx) (x N))))
					    (* (z N) (- (* (z Vx) (x N)) (* (x Vx) (z N)))))
	  (gp-ax2-vxdir-coord-y pointer) (- (* (z N) (- (* (y Vx) (z N)) (* (z Vx) (y N))))
					    (* (x N) (- (* (x Vx) (y N)) (* (y Vx) (x N)))))
	  (gp-ax2-vxdir-coord-z pointer) (- (* (x N) (- (* (z Vx) (x N)) (* (x Vx) (z N))))
					    (* (y N) (- (* (y Vx) (z N)) (* (z Vx) (y N)))))
	  (gp-ax2-vydir-coord-x pointer) (- (* (y N) (gp-ax2-vxdir-coord-z pointer))
					    (* (z N) (gp-ax2-vxdir-coord-y pointer)))
	  (gp-ax2-vydir-coord-y pointer) (- (* (z N) (gp-ax2-vxdir-coord-x pointer))
					    (* (x N) (gp-ax2-vxdir-coord-z pointer)))
	  (gp-ax2-vydir-coord-z pointer) (- (* (x N) (gp-ax2-vxdir-coord-y pointer))
					    (* (y N) (gp-ax2-vxdir-coord-x pointer))))
    (finalize struct (lambda () (print 'freeing-ax2) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object ax2) stream)
  (let ((pointer (ptr object)))
    (format stream "(ax2 :P (pnt ~A ~A ~A) :N (dir ~A ~A ~A) :Vx (dir ~A ~A ~A))"
	    (gp-ax2-axis-loc-coord-x pointer)
	    (gp-ax2-axis-loc-coord-y pointer)
	    (gp-ax2-axis-loc-coord-z pointer)
	    
	    (gp-ax2-axis-vdir-coord-x pointer)
	    (gp-ax2-axis-vdir-coord-y pointer)
	    (gp-ax2-axis-vdir-coord-z pointer)
	    
	    (gp-ax2-vxdir-coord-x pointer)
	    (gp-ax2-vxdir-coord-y pointer)
	    (gp-ax2-vxdir-coord-z pointer))))

(defcstruct gp-ax22d
  (point (:struct gp-pnt2d))
  (vydir (:struct gp-dir2d))
  (vxdir (:struct gp-dir2d)))



(defstruct (ax22d (:include gpthing)))

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
      (finalize struct (lambda () (print 'freeing-ax22d) (foreign-free ptr)))
      struct)))

(defcstruct gp-ax3
  (axis (:struct gp-ax1))
  (vydir (:struct gp-dir))
  (vxdir (:struct gp-dir)))



(defstruct (ax3 (:include gpthing)))

(defmethod vxdir ((ax3 ax3))
  (make-dir :ptr (mem-aptr (ptr ax3) :double 9)))

(defmethod vydir ((ax3 ax3))
  (make-dir :ptr (mem-aptr (ptr ax3) :double 6)))

(defun ax3 (&key P N Vx)
  (let ((gp-ax3 (foreign-alloc '(:struct gp-ax3))))
    (setf (gp-ax3-axis-loc-coord-x gp-ax3) (x P)
	  (gp-ax3-axis-loc-coord-y gp-ax3) (y P)
	  (gp-ax3-axis-loc-coord-z gp-ax3) (z P)

	  (gp-ax3-axis-vdir-coord-x gp-ax3) (x N)
	  (gp-ax3-axis-vdir-coord-y gp-ax3) (y N)
	  (gp-ax3-axis-vdir-coord-z gp-ax3) (z N))

    (let* ((vxdir (cross-cross N Vx N))
	   (vydir (cross N vxdir)))
	  
      (setf (gp-ax3-vxdir-coord-x gp-ax3) (x vxdir)
	    (gp-ax3-vxdir-coord-y gp-ax3) (y vxdir)
	    (gp-ax3-vxdir-coord-z gp-ax3) (z vxdir)

	    (gp-ax3-vydir-coord-x gp-ax3) (x vydir)
	    (gp-ax3-vydir-coord-y gp-ax3) (y vydir)
	    (gp-ax3-vydir-coord-z gp-ax3) (z vydir)))
    (let ((struct (make-ax3 :ptr gp-ax3)))
      (finalize struct (lambda () (print 'freeingax3) (foreign-free gp-ax3)))
      struct)))	    

(defcstruct gp-lin
  (pos (:struct gp-ax1)))



(defstruct (lin (:include gpthing)))

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
    (finalize struct (lambda () (foreign-free pointer)) :dont-save t)
    struct))

(defmethod pos ((struct lin))
  (make-ax1 :ptr (foreign-slot-pointer (ptr struct) '(:struct gp-lin) 'pos)))

(defmethod print-object ((object lin) stream)
  (format stream "(lin :A1 ~A)" (pos object)))

(defcstruct gp-circ
  (pos (:struct gp-ax2))
  (radius :double))



(defstruct (circ (:include gpthing)))

(defun circ (&key A2 R)
  (let* ((pointer (foreign-alloc '(:struct gp-circ)))
	 (struct (make-circ :ptr pointer)))
    (setf (gp-circ-pos-axis-loc-coord-x pointer) (gp-ax2-axis-loc-coord-x (ptr A2))
	  (gp-circ-pos-axis-loc-coord-y pointer) (gp-ax2-axis-loc-coord-y (ptr A2))
	  (gp-circ-pos-axis-loc-coord-z pointer) (gp-ax2-axis-loc-coord-z (ptr A2))
	  (gp-circ-pos-axis-vdir-coord-x pointer) (gp-ax2-axis-vdir-coord-x (ptr A2))
	  (gp-circ-pos-axis-vdir-coord-y pointer) (gp-ax2-axis-vdir-coord-y (ptr A2))
	  (gp-circ-pos-axis-vdir-coord-z pointer) (gp-ax2-axis-vdir-coord-z (ptr A2))
	  (gp-circ-pos-vydir-coord-x pointer) (gp-ax2-vydir-coord-x (ptr A2))
	  (gp-circ-pos-vydir-coord-y pointer) (gp-ax2-vydir-coord-y (ptr A2))
	  (gp-circ-pos-vydir-coord-z pointer) (gp-ax2-vydir-coord-z (ptr A2))
	  (gp-circ-pos-vxdir-coord-x pointer) (gp-ax2-vxdir-coord-x (ptr A2))
	  (gp-circ-pos-vxdir-coord-y pointer) (gp-ax2-vxdir-coord-y (ptr A2))
	  (gp-circ-pos-vxdir-coord-z pointer) (gp-ax2-vxdir-coord-z (ptr A2))
	  (gp-circ-radius pointer) (coerce R 'double-float))
    (finalize struct (lambda () (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object circ) stream)
  (let ((A2 (make-ax2 :ptr (foreign-slot-pointer (ptr object) '(:struct gp-circ) 'pos))))
    (format stream "(circ :A2 ~A :R ~A)" A2 (gp-circ-radius (ptr object)))))

(defcstruct gp-circ2d
  (pos (:struct gp-ax22d))
  (radius :double))


(defstruct (circ2d (:include gpthing)))

(defun circ2d (&rest args &key (XAxis (ax2d)) (Radius most-positive-double-float) (Sense t) (Axis (ax22d :A XAxis :Sense Sense)))
  (let ((ptr (foreign-alloc '(:struct gp-circ2d))))
    (cond ((and XAxis Radius (typep Axis 'ax22d))
	   (if (< Radius 0)
	       (error "Radius cannot be negative: ~S" Radius)
	       (setf (gp-circ2d-pos-loc-coord-x ptr) (gp-ax2d-loc-coord-x (ptr Axis))
		     (gp-circ2d-pos-loc-coord-y ptr) (gp-ax2d-loc-coord-y (ptr Axis))
		     (gp-circ2d-pos-vdir-coord-x ptr) (gp-ax2d-vdir-coord-x (ptr Axis))
		     (gp-circ2d-pos-vdir-coord-y ptr) (gp-ax2d-vdir-coord-y (ptr Axis))
		     
		     (gp-circ2d-radius ptr) (coerce Radius 'double-float))))
	  (t (error "Invalid arguments to circ2d: ~S" args)))
    (let ((struct (make-circ2d :ptr ptr)))
      (finalize struct (lambda () (print 'freeingcirc2d) (foreign-free ptr)))
      struct)))	       

(defcstruct gp-cone
  (pos (:struct gp-ax3))
  (radius :double)
  (semi-angle :double))



(defstruct (cone (:include gpthing)))

(defcstruct gp-cylinder
  (pos (:struct gp-ax3))
  (radius :double))



(defstruct (cylinder (:include gpthing)))

(defcstruct gp-elips
  (pos (:struct gp-ax2))
  (major-radius :double)
  (minor-radius :double))
  


(defstruct (elips (:include gpthing)))



(defcstruct gp-trsf
  (scale :double)
  (shape :int)
  (matrix gp-mat)
  (loc (:struct gp-xyz)))



(defstruct (trsf (:include gpthing)))

(defmethod set-mirror ((trsf gp:trsf) (axis gp:ax1))
  (oc::_wrap_gp_Trsf_SetMirror__SWIG_0 (ptr trsf) (ptr axis))
  (values))

#+NIL
(defun trsf (&key scale shape mat loc)
  (let* ((pointer (foreign-alloc '(:struct gp-trsf)))
	 (struct (make-trsf :ptr pointer)))
    (setf (gp-trsf-scale pointer) 1.0d0
	  (gp-trsf-shape pointer))))

(defstruct (parab (:include gpthing)))

(defcstruct gp-ax2d
  (loc (:struct gp-pnt2d))
  (vdir (:struct gp-dir2d)))


(defstruct (ax2d (:include gpthing)))

(defun ax2d (&optional (loc (pnt2d 0.0d0 0.0d0)) (vdir (dir2d 1.0d0 0.0d0)))
  (let* ((pointer (foreign-alloc '(:struct gp-ax2d)))
	 (struct (make-ax2d :ptr pointer)))
    (setf (gp-ax2d-loc-coord-x pointer) (x loc)
	  (gp-ax2d-loc-coord-y pointer) (y loc)

	  (gp-ax2d-vdir-coord-x pointer) (x vdir)
	  (gp-ax2d-vdir-coord-y pointer) (y vdir))
    (finalize struct (lambda () (print 'freeing-ax2d) (foreign-free pointer)) :dont-save t)
    struct))

(defmethod location ((ax2d ax2d))
  (make-pnt2d :ptr (ptr ax2d)))

(defmethod direction ((ax2d ax2d))
  (make-dir2d :ptr (mem-aptr (ptr ax2d) :double 2)))

(defcstruct gp-lin2d
  (pos (:struct gp-ax2d)))


(defstruct (lin2d (:include gpthing)))

(defun lin2d (&rest args &key (A (ax2d)) (P (pnt2d)) (V (dir2d)) B C)
  (let* ((pointer (foreign-alloc '(:struct gp-lin2d)))
	 (struct (make-lin2d :ptr pointer)))
    (cond ((or (null args) (and A (null P) (null V) (null B) (null C)))
	   (setf (gp-lin2d-pos-loc-coord-x pointer) (gp-ax2d-loc-coord-x (ptr A))
		 (gp-lin2d-pos-loc-coord-y pointer) (gp-ax2d-loc-coord-y (ptr A))
		 (gp-lin2d-pos-vdir-coord-x pointer) (gp-ax2d-vdir-coord-x (ptr A))
		 (gp-lin2d-pos-vdir-coord-y pointer) (gp-ax2d-vdir-coord-y (ptr A))))
	  ((and (null A) (null B) (null C) P V)
	   (setf (gp-lin2d-pos-loc-coord-x pointer) (gp-xy-x (ptr P))
		 (gp-lin2d-pos-loc-coord-y pointer) (gp-xy-y (ptr P))
		 (gp-lin2d-pos-vdir-coord-x pointer) (gp-xy-x (ptr V))
		 (gp-lin2d-pos-vdir-coord-y pointer) (gp-xy-y (ptr V))))
	  ((and A B C (null P) (null V))
	   (setq A (coerce A 'double-float)
		 B (coerce B 'double-float)
		 C (coerce C 'double-float))
	   (let ((norm2 (+ (* A A) (* B B))))
	     (when (<= norm2 +resolution+)
	       (error "coefficients too small"))
	     (setf (gp-lin2d-pos-loc-coord-x pointer) (- (/ (* A C) norm2))
		   (gp-lin2d-pos-loc-coord-y pointer) (- (/ (* B C) norm2))
		   (gp-lin2d-pos-vdir-coord-x pointer) (- B)
		   (gp-lin2d-pos-vdir-coord-y pointer) A)))
	  (t (error "Invalid arguments to constructor: ~S" args)))
    (finalize struct (lambda () (print 'freeing-lin2d) (foreign-free pointer)) :dont-save t)
    struct))

(defstruct (hypr (:include gpthing)))

(defcstruct gp-pln
  (pos (:struct gp-ax3)))


(defstruct (pln (:include gpthing)))

(defun pln (&rest args &key ax3 P V A B C D)
  (let ((pln-ptr (foreign-alloc '(:struct gp-pln))))
    (flet ((copy-ax3-into-pln (ax3-ptr pln-ptr)
	     (setf (gp-pln-pos-axis-loc-coord-x pln-ptr) (gp-ax3-axis-loc-coord-x ax3-ptr)
		   (gp-pln-pos-axis-loc-coord-y pln-ptr) (gp-ax3-axis-loc-coord-y ax3-ptr)
		   (gp-pln-pos-axis-loc-coord-z pln-ptr) (gp-ax3-axis-loc-coord-z ax3-ptr)
		   
		   (gp-pln-pos-axis-vdir-coord-x pln-ptr) (gp-ax3-axis-vdir-coord-x ax3-ptr)
		   (gp-pln-pos-axis-vdir-coord-y pln-ptr) (gp-ax3-axis-vdir-coord-y ax3-ptr)
		   (gp-pln-pos-axis-vdir-coord-z pln-ptr) (gp-ax3-axis-vdir-coord-z ax3-ptr)
		   
		   (gp-pln-pos-vydir-coord-x pln-ptr) (gp-ax3-vydir-coord-x ax3-ptr)
		   (gp-pln-pos-vydir-coord-y pln-ptr) (gp-ax3-vydir-coord-y ax3-ptr)
		   (gp-pln-pos-vydir-coord-z pln-ptr) (gp-ax3-vydir-coord-z ax3-ptr)
		   
		   (gp-pln-pos-vxdir-coord-x pln-ptr) (gp-ax3-vxdir-coord-x ax3-ptr)
		   (gp-pln-pos-vxdir-coord-y pln-ptr) (gp-ax3-vxdir-coord-y ax3-ptr)
		   (gp-pln-pos-vxdir-coord-z pln-ptr) (gp-ax3-vxdir-coord-z ax3-ptr))))
  
    (cond ((and ax3 (not (or P V A B C D)))
	   (let ((ax3-ptr (ptr ax3)))
	     (copy-ax3-into-pln ax3-ptr pln-ptr)))
	
	  ((and P V (not (or ax3 A B C D)))
	   (let ((pos))
	     (setq A (x V)
		   B (y V)
		   C (z V))
	     (let ((A-abs (abs A))
		   (B-abs (abs B))
		   (C-abs (abs C)))
	       (if (and (<= B-abs A-abs) (<= B-abs C-abs))
		   (if (> A-abs C-abs)
		       (setq pos (ax3 :P P :N V :Vx (dir (- C) 0.0d0 A)))
		       (setq pos (ax3 :P P :N V :Vx (dir C 0.0d0 (- A)))))
		   (if (and (<= A-abs B-abs) (<= A-abs C-abs))
		       (if (> B-abs C-abs)
			   (setq pos (ax3 :P P :N V :Vx (dir 0.0d0 (- C) B)))
			   (setq pos (ax3 :P P :N V :Vx (dir 0.0d0 C (- B)))))
		       (if (> A-abs B-abs)
			   (setq pos (ax3 :P P :N V :Vx (dir (- B) A 0.0d0)))
			   (setq pos (ax3 :P P :N V :Vx (dir B (- A) 0.0d0))))))

	       (copy-ax3-into-pln (ptr pos) pln-ptr))))
	  ((and A B C D (not (or ax3 P V)))
	   (let ((A-abs (abs A))
		 (B-abs (abs B))
		 (C-abs (abs C))
		 (pos))
	     (if (and (<= B-abs A-abs) (<= B-abs C-abs))
		 (if (> A-abs C-abs)
		     (setq pos (ax3 :P (pnt (- (/ D A)) 0.0d0 0.0d0)
				    :N (dir A B C)
				    :Vx (dir (- C) 0.0d0 A)))
		     (setq pos (ax3 :P (pnt 0.0d0 0.0d0 (- (/ D C)))
				    :N (dir A B C)
				    :Vx (dir (- C) 0.0d0 A))))
		 (if (and (<= A-abs B-abs) (<= A-abs C-abs))
		     (if (> B-abs C-abs)
			 (setq pos (ax3 :P (pnt 0.0d0 (- (/ D B)) 0.0d0)
					:N (dir A B C)
					:Vx (dir 0.0d0 (- C) B)))
			 (setq pos (ax3 :P (pnt 0.0d0 0.0d0 (- (/ D C)))
					:N (dir A B C)
					:Vx (dir 0.0d0 C (- B)))))
		     (if (> A-abs B-abs)
			 (setq pos (ax3 :P (pnt (- (/ D A)) 0.0d0 0.0d0)
					:N (dir A B C)
					:Vx (dir (- B) A 0.0d0)))
			 (setq pos (ax3 :P (pnt 0.0d0 (- (/ D B)) 0.0d0)
					:N (dir A B C)
					:Vx (dir B (- A) 0.0d0))))))
	     (copy-ax3-into-pln (ptr pos) pln-ptr)))
	  (t "Invalid arguments to pln: ~S" args)))
    (let ((struct (make-pln :ptr pln-ptr)))
      (finalize struct (lambda () (print 'freeing-pln) (foreign-free pln-ptr)) :dont-save t)
      struct)))


(defmethod pos ((pln pln))
  (make-ax3 :ptr (ptr pln)))

(defmethod axis ((ax3 ax3))
  (make-ax1 :ptr (ptr ax3)))

(defmethod direction ((ax3 ax3))
  (let ((axis (axis ax3)))
    (vdir axis)))

(defmethod location ((ax3 ax3))
  (loc (axis ax3)))

(defmethod direct-p ((ax3 ax3))
  (> (dot (cross (vxdir ax3) (vydir ax3)) (direction (axis ax3))) 0.0d0))

(defun coefficients (pln)
  (let* ((pos (pos pln))
	 (dir (direction pos))
	 (a) (b) (c) (d))
    (if (direct-p pos)
	(setq a (x dir)
	      b (y dir)
	      c (z dir))
	(setq a (- (x dir))
	      b (- (y dir))
	      c (- (z dir))))
    (let ((p (location pos)))
      (setq d (- (+ (* a (x p)) (* b (y p)) (* c (z p))))))
    (values a b c d)))
      
