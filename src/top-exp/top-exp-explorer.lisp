(in-package :oc)

(defmethod initialize-instance :after ((obj top-exp-explorer) &rest initargs &key S ToFind ToAvoid &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond ((and (null S) (null ToFind) (null ToAvoid))
	       (_wrap_new_TopExp_Explorer__SWIG_0))
	      ((and S ToFind (null ToAvoid))
	       (_wrap_new_TopExp_Explorer__SWIG_2 (ff-pointer S) ToFind))
	      ((and S ToFind ToAvoid)
	       (_wrap_new_TopExp_Explorer__SWIG_1 (ff-pointer S) ToFind ToAvoid))
	      (t (error "Invalid arguments for TopExp_Explorer constructor."))))
  (oc:finalize obj)
  (values))

(defmethod init ((self top-exp-explorer) (S topods-shape) &key ToFind ToAvoid &allow-other-keys)
  (if ToAvoid
      (_wrap_TopExp_Explorer_init__SWIG_0 (ff-pointer self) (ff-pointer S) ToFind ToAvoid)
      (_wrap_TopExp_Explorer_init__SWIG_1 (ff-pointer self) (ff-pointer S) ToFind)))

(defmethod more-p ((self top-exp-explorer))
  (_wrap_TopExp_Explorer_more (ff-pointer self)))

(defmethod current ((self top-exp-explorer))
  (let ((shape-copy
	 (with-topods-shape
	   (_wrap_TopoDS_Shape_copy_reference
	    (_wrap_TopExp_Explorer_Current (ff-pointer self))))))
    (oc:finalize shape-copy)
    shape-copy))

(defmethod next ((self top-exp-explorer))
  (_wrap_TopExp_Explorer_Next (ff-pointer self)))
