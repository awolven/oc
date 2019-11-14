(in-package :oc)

(defmethod get-nodes ((self poly-polygon-on-triangulation))
  (let ((nodes (allocate-instance (load-time-value (find-class 'tcol-std-array1-of-integer)))))
    (setf (ff-pointer nodes) (_wrap_Poly_PolygonOnTriangulation_Nodes (ff-pointer self)))
    nodes))
