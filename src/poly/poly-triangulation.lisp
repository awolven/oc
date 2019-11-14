(in-package :oc)

(defmethod initialize-instance :after ((obj poly-triangulation) &rest initargs
				       &key nbNodes nbTriangles UVNodes &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep nbNodes 'integer))
  (assert (typep nbTriangles 'integer))
  (setf (ff-pointer obj)
	(_wrap_new_Poly_Triangulation nbNodes nbTriangles (if UVNodes 1 0)))
  (ff-pointer-finalize obj #'_wrap_delete_Poly_Triangulation)
  (values))

(defmethod number-of-triangles ((self poly-triangulation))
  (_wrap_Poly_Triangulation_nbTriangles (ff-pointer self)))

(defmethod get-triangles ((self poly-triangulation))
  (let ((array (allocate-instance (load-time-value (find-class 'poly-array1-of-triangle)))))
    (setf (ff-pointer array) (_wrap_Poly_Triangulation_Triangles (ff-pointer self)))
    array))

(defmethod number-of-nodes ((self poly-triangulation))
  (_wrap_Poly_Triangulation_nbNodes (ff-pointer self)))

(defmethod get-nodes ((self poly-triangulation))
  (let ((array (allocate-instance (load-time-value (find-class 'tcol-gp-array1-of-pnt)))))
    (setf (ff-pointer array) (_wrap_Poly_Triangulation_Nodes (ff-pointer self)))
    array))
