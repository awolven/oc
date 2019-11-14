(in-package :oc)

(defmethod get-length ((self poly-array1-of-triangle))
  (_wrap_Poly_Array1OfTriangle_Length (ff-pointer self)))

(defmethod get-lower ((self poly-array1-of-triangle))
  (_wrap_Poly_Array1OfTriangle_Lower (ff-pointer self)))

(defmethod get-upper ((self poly-array1-of-triangle))
  (_wrap_Poly_Array1OfTriangle_Upper (ff-pointer self)))

(defmethod get-value ((self poly-array1-of-triangle) (index integer))
  (let ((tri (allocate-instance (load-time-value (find-class 'poly-triangle)))))
    (setf (ff-pointer tri) (_wrap_Poly_Array1OfTriangle_Value (ff-pointer self) index))
    tri))
