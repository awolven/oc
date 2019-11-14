(in-package :oc)

(defmethod initialize-instance :after ((instance top-tools-map-iterator-of-map-of-shape) &rest initargs &key aMap &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer instance) (_wrap_new_TopTools_MapIteratorOfMapOfShape aMap))
  (values))

(defmethod map-of-shape-key ((map-iterator top-tools-map-iterator-of-map-of-shape))
  (with-topods-shape (_wrap_TopTools_MapIteratorOfMapOfShape_Key (ff-pointer map-iterator))))
