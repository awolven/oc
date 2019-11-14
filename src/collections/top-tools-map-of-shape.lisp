(in-package :oc)

(defmethod initialize-instance :after ((instance top-tools-map-of-shape) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer instance) (_wrap_new_TopTools_MapOfShape))
  (values))

(defmethod add ((map top-tools-map-of-shape) (akey topods-shape))
  (if (zerop (_wrap_TopTools_MapOfShape_Add (ff-pointer map) (ff-pointer akey)))
      nil t))

(defmethod contains ((map top-tools-map-of-shape) (akey topods-shape))
  (if (zerop (_wrap_TopTools_MapOfShape_Contains (ff-pointer map) (ff-pointer akey)))
      nil t))
