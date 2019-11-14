(in-package :oc)

(defmethod initialize-instance :after ((object brep-offset-api-thru-sections) &rest initargs
				       &key (isSolid nil isSolid-present-p) (ruled nil ruled-present-p) pres3d &allow-other-keys)
  (let ((pointer
	 (cond ((and isSolid-present-p ruled-present-p pres3d)
		(_wrap_new_BRepOffsetAPI_ThruSections__SWIG_0 (if isSolid (if (eq 0 isSolid) 0 1) 0) (if ruled (if (eq 0 ruled) 0 1) 0) pres3d))
	       ((and isSolid-present-p ruled-present-p)
		(_wrap_new_BRepOffsetAPI_ThruSections__SWIG_1 (if isSolid (if (eq 0 isSolid) 0 1) 0) (if ruled (if (eq 0 ruled) 0 1) 0)))
	       ((and isSolid-present-p)
		(_wrap_new_BRepOffsetAPI_ThruSections__SWIG_2 (if isSolid (if (eq 0 isSolid) 0 1) 0)))
	       ((and (not isSolid-present-p) (not ruled-present-p) (not pres3d))
		(_wrap_new_BRepOffsetAPI_ThruSections__SWIG_3))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (ff-pointer-finalize object #'_wrap_delete_BRepOffsetAPI_ThruSections)
    (values)))
