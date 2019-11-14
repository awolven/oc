(in-package :oc)

(defmethod get-value ((self tcol-gp-array1-of-pnt) (index integer))
  (gp::make-pnt :ptr (_wrap_TColgp_Array1OfPnt_value (ff-pointer self) index)))

(defmethod get-lower ((self tcol-gp-array1-of-pnt))
  (_wrap_TColgp_Array1OfPnt_Lower (ff-pointer self)))

(defmethod get-upper ((self tcol-gp-array1-of-pnt))
  (_wrap_TColgp_Array1OfPnt_Upper (ff-pointer self)))
