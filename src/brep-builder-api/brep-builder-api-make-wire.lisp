(in-package :oc)

#+NIL
(defmethod initialize-instance :after ((obj brep-builder-api-make-wire) &rest initargs
				&key E E1 E2 E3 E4 W)
  (let ((pointer
	 (cond ((and W E)
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_6 (ff-pointer W) (ff-pointer E)))
	       (W
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_5 (ff-pointer W)))
	       ((and E1 E2 E3 E4)
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_4 (ff-pointer E1) (ff-pointer E2) (ff-pointer E3) (ff-pointer E4)))
	       ((and E1 E2 E3)
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_3 (ff-pointer E1) (ff-pointer E2) (ff-pointer E3)))
	       ((and E1 E2)
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_2 (ff-pointer E1) (ff-pointer E2)))
		(E (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_1 (ff-pointer E)))
		((and (null E1) (null E2) (null E3) (null E4))
		 (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_0))
		(t (error "Invalid arguments to constructor: ~S" initargs)))))
    (setf (ff-pointer obj) pointer)
    (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_MakeWire)
    (values)))

(defmethod initialize-instance :after ((obj brep-builder-api-make-wire) &rest initargs
				       &key E E1 E2 E3 E4 W &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond ((and (null E) (null E1) (null E2) (null E3) (null E4) (null W))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_0))
	      ((and (typep E 'topods-edge) (null W) (null E1) (null E2) (null E3) (null E4))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_1 (ff-pointer E)))
	      ((and (typep E1 'topods-edge) (typep E2 'topods-edge) (null E3) (null E4))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_2 (ff-pointer E1) (ff-pointer E2)))
	      ((and (typep E1 'topods-edge) (typep E2 'topods-edge) (typep E3 'topods-edge) (null E4))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_3
		(ff-pointer E1) (ff-pointer E2) (ff-pointer E3)))
	      ((and (typep E1 'topods-edge) (typep E2 'topods-edge) (typep E3 'topods-edge) (typep E4 'topods-edge))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_4
		(ff-pointer E1) (ff-pointer E2) (ff-pointer E3) (ff-pointer E4)))
	      ((and (typep W 'topods-wire) (or (null E) (null E1) (null E2) (null E3) (null E4)))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_5 (ff-pointer W)))
	      ((and (typep W 'topods-wire) (typep E 'topods-edge))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_6 (ff-pointer W) (ff-pointer E)))))
  (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_MakeWire)
  (values))

(defmethod add ((self brep-builder-api-make-wire) (E topods-edge))
  (_wrap_BRepBuilderAPI_MakeWire_Add__SWIG_0 (ff-pointer self) (ff-pointer E)))

(defmethod add ((self brep-builder-api-make-wire) (W topods-wire))
  (_wrap_BRepBuilderAPI_MakeWire_Add__SWIG_1 (ff-pointer self) (ff-pointer W)))

(defmethod wire ((self brep-builder-api-make-wire))
  (let ((wire (allocate-instance (load-time-value (find-class 'topods-wire)))))
    (setf (ff-pointer wire) (_wrap_BrepBuilderAPI_MakeWire_Wire (ff-pointer self)))
    wire))
