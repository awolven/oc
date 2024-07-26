(in-package :oc)

#+NIL
(defmethod initialize-instance :after ((obj poly-triangulation) &rest initargs
				       &key nbNodes nbTriangles
					 UVNodes
					 &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep nbNodes 'integer))
  (assert (typep nbTriangles 'integer))
  (setf (ff-pointer obj)
	(_wrap_new_Poly_Triangulation nbNodes nbTriangles UvNodes))
  ;;(oc:finalize obj)
  (values))

(defmethod number-of-triangles ((self poly-triangulation))
  (_wrap_Poly_Triangulation_NbTriangles (ff-pointer self)))

(defmethod get-triangles ((self poly-triangulation))
  (let ((array (allocate-instance (load-time-value (find-class 'poly-array1-of-triangle)))))
    (setf (ff-pointer array) (_wrap_Poly_Triangulation_Triangles (ff-pointer self)))
    ;;(oc:finalize array)
    array))

(defmethod number-of-nodes ((self poly-triangulation))
  (_wrap_Poly_Triangulation_NbNodes (ff-pointer self)))

(defmethod get-nodes ((self poly-triangulation))
  (let ((array (allocate-instance (load-time-value (find-class 'tcol-gp-array1-of-pnt)))))
    (setf (ff-pointer array) (_wrap_Poly_Triangulation_Nodes (ff-pointer self)))
    ;;(oc:finalize array)
    array))

(cffi:defcstruct ncollection
  (myLowerBound :int)
  (myUpperBound :int)
  (myDeletable :bool)
  (myData :pointer))

(cffi:defcstruct poly_triangulation
  (vtable :pointer)
  (count :int)
  (pad :int)
  (myDeflection :double)
  (myNbNodes :int)
  (myNbTriangles :int)
  (myNodes (:struct ncollection))
  (myUVNodes :pointer)
  (myTriangles (:struct ncollection))
  (myNormals :pointer))

(cffi::defcstruct h_array
  (vtable :pointer)
  (count :int)
  (pad :int)
  (myLowerBound :int)
  (myUpperBound :int)
  (myDeletable :bool)
  (myData :pointer))

(defun poly_triangulation_nb_nodes (poly_triangulation)
  (cffi:foreign-slot-value poly_triangulation '(:struct poly_triangulation) 'myNbNodes))

(defun poly_triangulation_nb_triangles (poly_triangulation)
  (cffi:foreign-slot-value poly_triangulation '(:struct poly_triangulation) 'myNbTriangles))

(defun poly_triangulation_node_array_lower (poly_triangulation)
  (cffi:mem-aref (cffi:foreign-slot-pointer poly_triangulation '(:struct poly_triangulation) 'myNodes)
		 :int 0))

(defun poly_triangulation_triangle_array_lower (poly_triangulation)
  (cffi:mem-aref (cffi:foreign-slot-pointer poly_triangulation '(:struct poly_triangulation) 'myTriangles)
		 :int 0))

(defun poly_triangulation_node_array_pointer (poly_triangulation)
  (cffi-sys:inc-pointer
   (cffi:foreign-slot-value
    (cffi:foreign-slot-pointer poly_triangulation '(:struct poly_triangulation) 'myNodes)
    '(:struct ncollection)
    'myData)
   (* (poly_triangulation_node_array_lower poly_triangulation)
      3 (load-time-value (cffi:foreign-type-size :double)))))

(defun poly_triangulation_triangles_array_pointer (poly_triangulation)
  (cffi-sys:inc-pointer
   (cffi:foreign-slot-value
    (cffi:foreign-slot-pointer poly_triangulation '(:struct poly_triangulation) 'myTriangles)
    '(:struct ncollection)
    'myData)
   (* (poly_triangulation_triangle_array_lower poly_triangulation)
      3 (load-time-value (cffi:foreign-type-size :int)))))

(defun poly_triangulation_normal_array_pointer (poly_triangulation)
  (let ((ptr (cffi:foreign-slot-value poly_triangulation '(:struct poly_triangulation) 'myNormals)))
    (if (= 0 (cffi-sys:pointer-address ptr))
	nil
	(let ((lower (cffi:foreign-slot-value ptr '(:struct h_array) 'myLowerBound)))
	  (cffi-sys:inc-pointer
	   (cffi:foreign-slot-value ptr '(:struct h_array) 'myData)
	   (* lower (load-time-value (cffi:foreign-type-size :float))))))))
  
      
   
  
