(in-package :oc)

(defmethod get-value ((self poly-triangle) (index integer))
  (assert (>= 3 index 1))
  (_wrap_Poly_Triangle_value (ff-pointer self) index))
