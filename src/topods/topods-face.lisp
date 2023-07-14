(in-package :oc)

(defmethod surface ((face topods-face))
  (with-geom-surface (_wrap_BRep_Tool_Surface__SWIG_1 (ff-pointer face))))
