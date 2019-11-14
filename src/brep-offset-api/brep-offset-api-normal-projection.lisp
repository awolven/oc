(in-package :oc)

(defmethod initialize-instance :after ((obj brep-offset-api-normal-projection) &rest initargs
				       &key S &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond (S (assert (typep S 'topods-shape))
		 (_wrap_new_BRepOffsetAPI_NormalProjection__SWIG_1 (ff-pointer S)))
	      (t (_wrap_new_BRepOffsetAPI_NormalProjection__SWIG_0))))
  (ff-pointer-finalize obj #'_wrap_delete_BRepOffsetAPI_NormalProjection)
  (values))

(defmethod init ((self brep-offset-api-normal-projection) (S topods-shape) &key &allow-other-keys)
  (_wrap_BRepOffsetAPI_NormalProjection_Init (ff-pointer self) (ff-pointer S)))

(defmethod add ((self brep-offset-api-normal-projection) (ToProj topods-shape))
  (_wrap_BRepOffsetAPI_NormalProjection_Add (ff-pointer self) (ff-pointer ToProj)))

(defmethod build ((self brep-offset-api-normal-projection))
  (_wrap_BRepOffsetAPI_NormalProjection_Build (ff-pointer self)))

(defmethod projection ((self brep-offset-api-normal-projection))
  (with-topods-shape (_wrap_BRepOffsetAPI_NormalProjection_Projection (ff-pointer self))))
