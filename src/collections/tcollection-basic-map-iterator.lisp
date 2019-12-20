(in-package :oc)

(defmethod more? ((collection tcollection-basic-map-iterator))
  (_wrap_TCollection_BasicMapIterator_More (ff-pointer collection)))

(defmethod next ((collection tcollection-basic-map-iterator))
  (_wrap_TCollection_BasicMapIterator_Next collection))
