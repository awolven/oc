(in-package :oc)

(defmethod initialize-instance :after ((object brep-offset-api-make-thick-solid) &rest initargs
				       &key S ClosingFaces Offset Tol Mode
					 (Intersection nil Intersection-supplied-p)
					 (SelfInter nil SelfInter-supplied-p)
					 (Join nil Join-supplied-p)
					 (RemoveIntEdges nil RemoveIntEdges-supplied-p)
					 &allow-other-keys)
  (let ((pointer
	 (cond ((and S ClosingFaces Offset Tol Mode Intersection-supplied-p
		     SelfInter-supplied-p Join-supplied-p RemoveIntEdges-supplied-p)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_1 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)
								Mode Intersection
								SelfInter Join
								RemoveIntEdges))
	       ((and S ClosingFaces Offset Tol Mode Intersection-supplied-p
		     SelfInter-supplied-p Join-supplied-p)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_2 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)
								Mode Intersection
								SelfInter Join))
	       ((and S ClosingFaces Offset Tol Mode Intersection-supplied-p SelfInter-supplied-p)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_3 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)
								Mode Intersection
								SelfInter))
	       ((and S ClosingFaces Offset Tol Mode Intersection-supplied-p)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_4 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)
								Mode Intersection))
	       ((and S ClosingFaces Offset Tol Mode)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_5 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)
								Mode))
	       ((and S ClosingFaces Offset Tol)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_6 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)))
	       ((null (or S ClosingFaces Offset Tol Mode Intersection SelfInter Join RemoveIntEdges))
		(_wrap_new_BRepOffsetAPI_MakeThickSolid__SWIG_0))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (oc:finalize object)
    (values)))
