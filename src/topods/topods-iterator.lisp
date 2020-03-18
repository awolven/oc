(in-package :oc)

(defmethod initialize-instance :after ((obj topods-iterator) &rest initargs
				       &key (S nil shape-present-p)
					 (cumOri t cumOri-present-p) (cumLoc t cumLoc-present-p)
					 &allow-other-keys)
  (declare (ignore initargs))
  (when shape-present-p
    (assert (typep S 'topods-shape)))
  (when cumOri-present-p
    (assert (typep cumOri 'boolean)))
  (when cumLoc-present-p
    (assert (typep cumLoc 'boolean)))
  (setf (ff-pointer obj)
	(cond ((and S cumOri-present-p cumLoc-present-p)
	       (_wrap_new_TopoDS_Iterator__SWIG_1 (ff-pointer S) cumOri cumLoc))
	      ((and S cumOri-present-p)
	       (_wrap_new_TopoDS_Iterator__SWIG_2 (ff-pointer S) cumOri))
	      (S (_wrap_new_TopoDS_Iterator__SWIG_3 (ff-pointer S)))
	      (t (_wrap_new_TopoDS_Iterator__SWIG_0))))
  (oc:finalize obj)
  (values))

(defmethod more-p ((self topods-iterator))
  (_wrap_TopoDS_Iterator_More (ff-pointer self)))

(defmethod next ((self topods-iterator))
  (_wrap_TopoDS_Iterator_Next (ff-pointer self)))

(defmethod value ((self topods-iterator))
  (with-topods-shape (_wrap_TopoDS_Iterator_value (ff-pointer self))))
