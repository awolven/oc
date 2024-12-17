(in-package :oc)

(defmethod get-poly-polygon-3d ((edge topods-edge) p-top-loc)
  (let ((pointer (_wrap_BRep_Tool_Polygon3D (ff-pointer edge) p-top-loc #+NIL(_wrap_new_TopLoc_Location__SWIG_0))))
    (if (null-pointer-p pointer)
	nil
	(let ((poly-polygon-3d (allocate-instance (load-time-value (find-class 'poly-polygon3d)))))
	  (setf (ff-pointer poly-polygon-3d) pointer)
	  ;;(oc:finalize poly-polygon-3d)
	  poly-polygon-3d))))

(defmethod get-polygon-on-triangulation ((edge topods-edge) (triangulation poly-triangulation) p-top-loc)
  (let ((poly-polygon-on-triangulation (allocate-instance (find-class 'poly-polygon-on-triangulation))))
    (setf (ff-pointer poly-polygon-on-triangulation) (_wrap_BRep_Tool_PolygonOnTriangulation__SWIG_0 (ff-pointer edge) (ff-pointer triangulation) p-top-loc))
    ;;(oc:finalize poly-polygon-on-triangulation)
    poly-polygon-on-triangulation))
