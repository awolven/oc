(in-package :gp)
	   
(deftype pointer () #+SBCL 'sb-sys:system-area-pointer)

(defparameter +null-pointer+ (load-time-value (make-pointer 0)))

(defstruct (gpthing (:conc-name ""))
  (ptr +null-pointer+ :type pointer))

(defcstruct gp-xy
  (x :double)
  (y :double))

(defmacro gp-xy-x (gp-xy)
  `(mem-aref ,gp-xy :double 0))

(defmacro gp-xy-y (gp-xy)
  `(mem-aref ,gp-xy :double 1))

(defstruct (xy (:include gpthing)))

(defun x (xy)
  (gp-xy-x (ptr xy)))

(defun y (xy)
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
  (let* ((pointer (foreign-alloc '(:struct gp-dir2d)))
	 (struct (make-dir2d :ptr pointer)))
    (setf (gp-xy-x pointer) (x coord)
	  (gp-xy-y pointer) (y coord))
    (finalize struct (lambda () (print 'freeing-dir2d) (foreign-free pointer)) :dont-save t)
    struct))
    
(defun dir2d-3 (&optional (xv 0.0d0) (yv 0.0d0))
  (let* ((pointer (foreign-alloc '(:struct gp-dir2d)))
	 (struct (make-dir2d :ptr pointer)))
    (setf (gp-xy-x pointer) (coerce xv 'double-float)
	  (gp-xy-y pointer) (coerce yv 'double-float))
    (finalize struct (lambda () (print 'freeing-dir2d) (foreign-free pointer)) :dont-save t)
    struct))

(defcstruct gp-xyz
  (x :double)
  (y :double)
  (z :double))

(defmacro gp-xyz-z (gp-xyz)
  `(mem-aref ,gp-xyz :double 2))

(defstruct (xyz (:include gpthing)))

(defun z (xyz)
  (assert (or (typep xyz 'xyz)
	      (typep xyz 'pnt)
	      (typep xyz 'dir)
	      (typep xyz 'vec)))
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

(defmethod multiply ((v xy) scalar)
  (let ((new-x (* (x v) scalar))
	(new-y (* (y v) scalar)))
    (xy new-x new-y)))

(defmethod multiply ((v vec2d) scalar)
  (vec2d (* (x v) scalar) (* (y v) scalar)))

(defmethod multiply ((v xyz) scalar)
  (xyz (* (x v) scalar) (* (y v) scalar) (* (z v) scalar)))

(defmethod multiply ((v vec) scalar)
  (vec (* (x v) scalar) (* (y v) scalar) (* (z v) scalar)))

(defmethod multiply ((v dir) scalar)
  (dir (* (x v) scalar) (* (y v) scalar) (* (z v) scalar)))

(defmethod divide ((v xy) scalar)
  (xy (/ (x v) scalar) (/ (y v) scalar)))

(defmethod divide ((v vec2d) scalar)
  (vec2d (/ (x v) scalar) (/ (y v) scalar)))

(defmethod divide ((v xyz) scalar)
  (xyz (/ (x v) scalar) (/ (y v) scalar) (/ (z v) scalar)))

(defmethod divide ((v vec) scalar)
  (vec (/ (x v) scalar) (/ (y v) scalar) (/ (z v) scalar)))

(defmethod divide ((v dir) scalar)
  (dir (/ (x v) scalar) (/ (y v) scalar) (/ (z v) scalar)))

(defmethod print-object ((object xyz) stream)
  (format stream "(xyz ~A ~A ~A)" (x object) (y object) (z object)))

(defcstruct gp-pnt
  (coord (:struct gp-xyz)))

(defstruct (pnt (:include gpthing)))

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

(defcstruct gp-dir
  (coord (:struct gp-xyz)))

(defstruct (dir (:include gpthing)))

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

(defcstruct gp-ax1
  (loc (:struct gp-pnt))
  (vdir (:struct gp-dir)))

(defmacro gp-ax1-loc-coord-x (gp-ax1)
  `(mem-aref ,gp-ax1 :double 0))

(defmacro gp-ax1-loc-coord-y (gp-ax1)
  `(mem-aref ,gp-ax1 :double 1))

(defmacro gp-ax1-loc-coord-z (gp-ax1)
  `(mem-aref ,gp-ax1 :double 2))

(defmacro gp-ax1-vdir-coord-x (gp-ax1)
  `(mem-aref ,gp-ax1 :double 3))

(defmacro gp-ax1-vdir-coord-y (gp-ax1)
  `(mem-aref ,gp-ax1 :double 4))

(defmacro gp-ax1-vdir-coord-z (gp-ax1)
  `(mem-aref ,gp-ax1 :double 5))

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

(defmacro gp-ax2-axis-loc-coord-x (gp-ax2)
  `(mem-aref ,gp-ax2 :double 0))

(defmacro gp-ax2-axis-loc-coord-y (gp-ax2)
  `(mem-aref ,gp-ax2 :double 1))

(defmacro gp-ax2-axis-loc-coord-z (gp-ax2)
  `(mem-aref ,gp-ax2 :double 2))

(defmacro gp-ax2-axis-vdir-coord-x (gp-ax2)
  `(mem-aref ,gp-ax2 :double 3))

(defmacro gp-ax2-axis-vdir-coord-y (gp-ax2)
  `(mem-aref ,gp-ax2 :double 4))

(defmacro gp-ax2-axis-vdir-coord-z (gp-ax2)
  `(mem-aref ,gp-ax2 :double 5))

(defmacro gp-ax2-vydir-coord-x (gp-ax2)
  `(mem-aref ,gp-ax2 :double 6))

(defmacro gp-ax2-vydir-coord-y (gp-ax2)
  `(mem-aref ,gp-ax2 :double 7))

(defmacro gp-ax2-vydir-coord-z (gp-ax2)
  `(mem-aref ,gp-ax2 :double 8))

(defmacro gp-ax2-vxdir-coord-x (gp-ax2)
  `(mem-aref ,gp-ax2 :double 9))

(defmacro gp-ax2-vxdir-coord-y (gp-ax2)
  `(mem-aref ,gp-ax2 :double 10))

(defmacro gp-ax2-vxdir-coord-z (gp-ax2)
  `(mem-aref ,gp-ax2 :double 11))

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
	  
(defcstruct gp-ax3
  (axis (:struct gp-ax1))
  (vydir (:struct gp-dir))
  (vxdir (:struct gp-dir)))

(defmacro gp-ax3-axis-loc-coord-x (gp-ax3)
  `(mem-aref ,gp-ax3 :double 0))

(defmacro gp-ax3-axis-loc-coord-y (gp-ax3)
  `(mem-aref ,gp-ax3 :double 1))

(defmacro gp-ax3-axis-loc-coord-z (gp-ax3)
  `(mem-aref ,gp-ax3 :double 2))

(defmacro gp-ax3-axis-vdir-coord-x (gp-ax3)
  `(mem-aref ,gp-ax3 :double 3))

(defmacro gp-ax3-axis-vdir-coord-y (gp-ax3)
  `(mem-aref ,gp-ax3 :double 4))

(defmacro gp-ax3-axis-vdir-coord-z (gp-ax3)
  `(mem-aref ,gp-ax3 :double 5))

(defmacro gp-ax3-vydir-coord-x (gp-ax3)
  `(mem-aref ,gp-ax3 :double 6))

(defmacro gp-ax3-vydir-coord-y (gp-ax3)
  `(mem-aref ,gp-ax3 :double 7))

(defmacro gp-ax3-vydir-coord-z (gp-ax3)
  `(mem-aref ,gp-ax3 :double 8))

(defmacro gp-ax3-vxdir-coord-x (gp-ax3)
  `(mem-aref ,gp-ax3 :double 9))

(defmacro gp-ax3-vxdir-coord-y (gp-ax3)
  `(mem-aref ,gp-ax3 :double 10))

(defmacro gp-ax3-vxdir-coord-z (gp-ax3)
  `(mem-aref ,gp-ax3 :double 11))

(defstruct (ax3 (:include gpthing)))

(defcstruct gp-lin
  (pos (:struct gp-ax1)))

(defmacro gp-lin-pos-loc-coord-x (gp-lin-pos)
  `(mem-aref ,gp-lin-pos :double 0))

(defmacro gp-lin-pos-loc-coord-y (gp-lin-pos)
  `(mem-aref ,gp-lin-pos :double 1))

(defmacro gp-lin-pos-loc-coord-z (gp-lin-pos)
  `(mem-aref ,gp-lin-pos :double 2))

(defmacro gp-lin-pos-vdir-coord-x (gp-lin-pos)
  `(mem-aref ,gp-lin-pos :double 3))

(defmacro gp-lin-pos-vdir-coord-y (gp-lin-pos)
  `(mem-aref ,gp-lin-pos :double 4))

(defmacro gp-lin-pos-vdir-coord-z (gp-lin-pos)
  `(mem-aref ,gp-lin-pos :double 5))

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

(defmacro gp-circ-pos-axis-loc-coord-x (gp-circ)
  `(mem-aref ,gp-circ :double 0))

(defmacro gp-circ-pos-axis-loc-coord-y (gp-circ)
  `(mem-aref ,gp-circ :double 1))

(defmacro gp-circ-pos-axis-loc-coord-z (gp-circ)
  `(mem-aref ,gp-circ :double 2))

(defmacro gp-circ-pos-axis-vdir-coord-x (gp-circ)
  `(mem-aref ,gp-circ :double 3))

(defmacro gp-circ-pos-axis-vdir-coord-y (gp-circ)
  `(mem-aref ,gp-circ :double 4))

(defmacro gp-circ-pos-axis-vdir-coord-z (gp-circ)
  `(mem-aref ,gp-circ :double 5))

(defmacro gp-circ-pos-vydir-coord-x (gp-circ)
  `(mem-aref ,gp-circ :double 6))

(defmacro gp-circ-pos-vydir-coord-y (gp-circ)
  `(mem-aref ,gp-circ :double 7))

(defmacro gp-circ-pos-vydir-coord-z (gp-circ)
  `(mem-aref ,gp-circ :double 8))

(defmacro gp-circ-pos-vxdir-coord-x (gp-circ)
  `(mem-aref ,gp-circ :double 9))

(defmacro gp-circ-pos-vxdir-coord-y (gp-circ)
  `(mem-aref ,gp-circ :double 10))

(defmacro gp-circ-pos-vxdir-coord-z (gp-circ)
  `(mem-aref ,gp-circ :double 11))

(defmacro gp-circ-radius (gp-circ)
  `(mem-aref ,gp-circ :double 12))

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

(defcstruct gp-cone
  (pos (:struct gp-ax3))
  (radius :double)
  (semi-angle :double))

(defmacro gp-cone-pos-axis-loc-coord-x (gp-cone)
  `(mem-aref ,gp-cone :double 0))

(defmacro gp-cone-pos-axis-loc-coord-y (gp-cone)
  `(mem-aref ,gp-cone :double 1))

(defmacro gp-cone-pos-axis-loc-coord-z (gp-cone)
  `(mem-aref ,gp-cone :double 2))

(defmacro gp-cone-pos-axis-vdir-coord-x (gp-cone)
  `(mem-aref ,gp-cone :double 3))

(defmacro gp-cone-pos-axis-vdir-coord-y (gp-cone)
  `(mem-aref ,gp-cone :double 4))

(defmacro gp-cone-pos-axis-vdir-coord-z (gp-cone)
  `(mem-aref ,gp-cone :double 5))

(defmacro gp-cone-pos-vydir-coord-x (gp-cone)
  `(mem-aref ,gp-cone :double 6))

(defmacro gp-cone-pos-vydir-coord-y (gp-cone)
  `(mem-aref ,gp-cone :double 7))

(defmacro gp-cone-pos-vydir-coord-z (gp-cone)
  `(mem-aref ,gp-cone :double 8))

(defmacro gp-cone-pos-vxdir-coord-x (gp-cone)
  `(mem-aref ,gp-cone :double 9))

(defmacro gp-cone-pos-vxdir-coord-y (gp-cone)
  `(mem-aref ,gp-cone :double 10))

(defmacro gp-cone-pos-vxdir-coord-z (gp-cone)
  `(mem-aref ,gp-cone :double 11))

(defmacro gp-cone-radius (gp-cone)
  `(mem-aref ,gp-cone :double 12))

(defmacro gp-cone-semi-angle (gp-cone)
  `(mem-aref ,gp-cone :double 13))

(defstruct (cone (:include gpthing)))

(defcstruct gp-cylinder
  (pos (:struct gp-ax3))
  (radius :double))

(defmacro gp-cylinder-pos-axis-loc-coord-x (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 0))

(defmacro gp-cylinder-pos-axis-loc-coord-y (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 1))

(defmacro gp-cylinder-pos-axis-loc-coord-z (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 2))

(defmacro gp-cylinder-pos-axis-vdir-coord-x (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 3))

(defmacro gp-cylinder-pos-axis-vdir-coord-y (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 4))

(defmacro gp-cylinder-pos-axis-vdir-coord-z (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 5))

(defmacro gp-cylinder-pos-vydir-coord-x (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 6))

(defmacro gp-cylinder-pos-vydir-coord-y (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 7))

(defmacro gp-cylinder-pos-vydir-coord-z (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 8))

(defmacro gp-cylinder-pos-vxdir-coord-x (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 9))

(defmacro gp-cylinder-pos-vxdir-coord-y (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 10))

(defmacro gp-cylinder-pos-vxdir-coord-z (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 11))

(defmacro gp-cylinder-radius (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 12))

(defstruct (cylinder (:include gpthing)))

(defcstruct gp-elips
  (pos (:struct gp-ax2))
  (major-radius :double)
  (minor-radius :double))
  
(defmacro gp-elips-pos-axis-loc-coord-x (gp-elips)
  `(mem-aref ,gp-elips :double 0))

(defmacro gp-elips-pos-axis-loc-coord-y (gp-elips)
  `(mem-aref ,gp-elips :double 1))

(defmacro gp-elips-pos-axis-loc-coord-z (gp-elips)
  `(mem-aref ,gp-elips :double 2))

(defmacro gp-elips-pos-axis-vdir-coord-x (gp-elips)
  `(mem-aref ,gp-elips :double 3))

(defmacro gp-elips-pos-axis-vdir-coord-y (gp-elips)
  `(mem-aref ,gp-elips :double 4))

(defmacro gp-elips-pos-axis-vdir-coord-z (gp-elips)
  `(mem-aref ,gp-elips :double 5))

(defmacro gp-elips-pos-vydir-coord-x (gp-elips)
  `(mem-aref ,gp-elips :double 6))

(defmacro gp-elips-pos-vydir-coord-y (gp-elips)
  `(mem-aref ,gp-elips :double 7))

(defmacro gp-elips-pos-vydir-coord-z (gp-elips)
  `(mem-aref ,gp-elips :double 8))

(defmacro gp-elips-pos-vxdir-coord-x (gp-elips)
  `(mem-aref ,gp-elips :double 9))

(defmacro gp-elips-pos-vxdir-coord-y (gp-elips)
  `(mem-aref ,gp-elips :double 10))

(defmacro gp-elips-pos-vxdir-coord-z (gp-elips)
  `(mem-aref ,gp-elips :double 11))

(defmacro gp-elips-major-radius (gp-elips)
  `(mem-aref ,gp-elips :double 12))

(defmacro gp-elips-minor-radius (gp-elips)
  `(mem-aref ,gp-elips :double 13))

(defstruct (elips (:include gpthing)))

(defctype gp-mat (:array :double 3 3))

(defmacro gp-mat-ref (gp-mat i j)
  `(mem-aref ,gp-mat :double (+ (* ,i 3) ,j)))

(defstruct (mat (:include gpthing)))

(defcstruct gp-trsf
  (scale :double)
  (shape :int)
  (matrix gp-mat)
  (loc (:struct gp-xyz)))

(defmacro gp-trsf-scale (gp-trsf)
  `(mem-aref ,gp-trsf :double 0))

(defmacro gp-trsf-shape (gp-trsf)
  `(mem-aref ,gp-trsf :int 2))

(defmacro gp-trsf-matrix-ref (gp-trsf i j)
  `(mem-aref ,gp-trsf :double (+ 2 (* ,i 3) ,j)))

(defmacro gp-trsf-loc-x (gp-trsf)
  `(mem-aref ,gp-trsf :double 11))

(defmacro gp-trsf-loc-y (gp-trsf)
  `(mem-aref ,gp-trsf :double 12))

(defmacro gp-trsf-loc-z (gp-trsf)
  `(mem-aref ,gp-trsf :double 13))

(defstruct (trsf (:include gpthing)))

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

(defmacro gp-ax2d-loc-coord-x (gp-ax2d)
  `(mem-aref ,gp-ax2d :double 0))

(defmacro gp-ax2d-loc-coord-y (gp-ax2d)
  `(mem-aref ,gp-ax2d :double 1))

(defmacro gp-ax2d-vdir-coord-x (gp-ax2d)
  `(mem-aref ,gp-ax2d :double 2))

(defmacro gp-ax2d-vdir-coord-y (gp-ax2d)
  `(mem-aref ,gp-ax2d :double 3))

(defstruct (ax2d (:include gpthing)))

(defun ax2d (&optional (loc (pnt2d 0.0d0 0.0d0)) (vdir (dir2d-3 1.0d0 0.0d0)))
  (let* ((pointer (foreign-alloc '(:struct gp-ax2d)))
	 (struct (make-ax2d :ptr pointer)))
    (setf (gp-ax2d-loc-coord-x pointer) (x loc)
	  (gp-ax2d-loc-coord-y pointer) (y loc)

	  (gp-ax2d-vdir-coord-x pointer) (x vdir)
	  (gp-ax2d-vdir-coord-y pointer) (y vdir))
    (finalize struct (lambda () (print 'freeing-ax2d) (foreign-free pointer)) :dont-save t)
    struct))
