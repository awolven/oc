(in-package :oc)

(defmethod reversed ((self topods-shape))
  (with-topods-shape (_wrap_TopoDS_Shape_Reversed (ff-pointer self))))

(defmethod build-curves-3d ((s topods-shape) &optional tolerance continuity max-degree max-segment)
  (cond ((and tolerance continuity max-degree max-segment)
	 (_wrap_BRepLib_BuildCurves3d__SWIG_0 (ff-pointer s) tolerance continuity max-degree max-segment))
	((and tolerance continuity max-degree)
	 (_wrap_BRepLib_BuildCurves3d__SWIG_1 (ff-pointer s) tolerance continuity max-degree))
	((and tolerance continuity)
	 (_wrap_BRepLib_BuildCurves3d__SWIG_2 (ff-pointer s) tolerance continuity))
	(tolerance
	 (_wrap_BRepLib_BuildCurves3d__SWIG_3 (ff-pointer s) tolerance))
	(t (_wrap_BRepLib_BuildCurves3d__SWIG_4 (ff-pointer s)))))
