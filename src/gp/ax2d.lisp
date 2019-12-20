(in-package :gp)

(defun ax2d (&rest args)
  (let* ((pointer (foreign-alloc '(:struct gp-ax2d)))
	 (struct (make-ax2d :ptr pointer)))

    (cond ((and (rest args) (null (caddr args)) (pnt2d-p (car args)) (dir2d-p (cadr args)))

	   (setf (gp-ax2d-loc-coord-x pointer) (gp-xy-x (ptr (car args)))
		 (gp-ax2d-loc-coord-y pointer) (gp-xy-y (ptr (car args)))
		 
		 (gp-ax2d-vdir-coord-x pointer) (gp-xy-x (ptr (cadr args)))
		 (gp-ax2d-vdir-coord-y pointer) (gp-xy-y (ptr (cadr args)))))
	  
	  (t (destructuring-bind (&key (loc (pnt2d 0.0d0 0.0d0)) (vdir (dir2d 1.0d0 0.0d0))) args
	       (setf (gp-ax2d-loc-coord-x pointer) (gp-xy-x (ptr loc))
		     (gp-ax2d-loc-coord-y pointer) (gp-xy-y (ptr loc))
		     
		     (gp-ax2d-vdir-coord-x pointer) (gp-xy-x (ptr vdir))
		     (gp-ax2d-vdir-coord-y pointer) (gp-xy-y (ptr vdir))))))

    (finalize struct (lambda () (foreign-free pointer)) :dont-save t)
    struct))

(defmethod print-object ((object ax2d) stream)
  (format stream "(~S :loc ~S :vdir ~S)"
	  (type-of object) (oc:location object) (oc:direction object))
  object)

(defmethod oc:location ((ax2d ax2d))
  (let* ((p-result (oc::_wrap_gp_Ax2d_Location (ptr ax2d)))
	 (result (make-pnt2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Pnt2d p-result)) :dont-save t)
    result))

(defmethod gp:direction ((ax2d ax2d))
  (make-dir2d :ptr (mem-aptr (ptr ax2d) :double 2) :own ax2d))

(defmethod oc:direction ((ax2d ax2d))
  (let* ((p-result (oc::_wrap_gp_Ax2d_Direction (ptr ax2d)))
	 (result (make-dir2d :ptr p-result)))
    (finalize result (lambda () (oc::_wrap_delete_gp_Dir2d p-result)) :dont-save t)
    result))


