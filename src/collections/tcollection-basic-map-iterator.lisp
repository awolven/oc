(in-package :oc)

(defmethod more-p ((collection tcollection-basic-map-iterator))
  (if (zerop (_wrap_TCollection_BasicMapIterator_More (ff-pointer collection)))
      nil t))

(defmethod next ((collection tcollection-basic-map-iterator))
  (_wrap_TCollection_BasicMapIterator_Next collection))
