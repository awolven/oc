(in-package :oc)

(defmethod get-nodes ((self poly-polygon3d))
  (let ((nodes (allocate-instance (load-time-value (find-class 'tcol-gp-array1-of-pnt)))))
    (setf (ff-pointer nodes) (_wrap_Poly_Polygon3D_Nodes (ff-pointer self)))
    ;;(oc:finalize nodes)
    nodes))

(defmethod get-nb-nodes ((self poly-polygon3d))
  (_wrap_Poly_Polygon3D_NbNodes (ff-pointer self)))
