(in-package :oc)

(defconstant TopAbs_COMPOUND 0)
(defconstant TopAbs_COMPSOLID 1)
(defconstant TopAbs_SOLID 2)
(defconstant TopAbs_SHELL 3)
(defconstant TopAbs_FACE 4)
(defconstant TopAbs_WIRE 5)
(defconstant TopAbs_EDGE 6)
(defconstant TopAbs_VERTEX 7)
(defconstant TopAbs_SHAPE 8)

(defclass ff-pointer-mixin ()
  ((ff-pointer :initarg :ff-pointer :accessor ff-pointer)))

(defmethod oc::ff-pointer ((instance xy))
  (ptr instance))

(defmethod oc::ff-pointer ((instance vec2d))
  (ptr instance))

(defmethod oc::ff-pointer ((instance pnt2d))
  (ptr instance))

(defmethod oc::ff-pointer ((instance xyz))
  (ptr instance))

(defmethod oc::ff-pointer ((instance pnt))
  (ptr instance))

(defmethod oc::ff-pointer ((instance dir))
  (ptr instance))

(defmethod oc::ff-pointer ((instance vec))
  (ptr instance))

(defmethod oc::ff-pointer ((instance ax1))
  (ptr instance))

(defmethod oc::ff-pointer ((instance ax2))
  (ptr instance))

(defmethod oc::ff-pointer ((instance ax3))
  (ptr instance))

(defmethod oc::ff-pointer ((instance lin))
  (ptr instance))

(defmethod oc::ff-pointer ((instance circ))
  (ptr instance))

(defmethod oc::ff-pointer ((instance cone))
  (ptr instance))

(defmethod oc::ff-pointer ((instance cylinder))
  (ptr instance))

(defmethod oc::ff-pointer ((instance elips))
  (ptr instance))

(defmethod oc::ff-pointer ((instance mat))
  (ptr instance))

(defmethod oc::ff-pointer ((instance trsf))
  (ptr instance))

(defun ff-pointer-finalize (object deleter)
  #+sbcl
  (let ((pointer (ff-pointer object)))
    (sb-ext:finalize object #'(lambda ()
				(funcall deleter pointer)
				(values))
		     :dont-save t)))

#+NOTYET
(defmethod oc:setRotation ((self gp:trsf) &rest args)
  (destructuring-bind (A1 Ang) args
    (oc::_wrap_gp_Trsf_SetRotation (ff-pointer self) (ff-pointer A1) Ang)))
#+NOTYET
(defmethod oc:setTranslation ((self gp:trsf) &rest args)
  (destructuring-bind (V) args
    (oc::_wrap_gp_Trsf_SetTranslation (ff-pointer self) (ff-pointer V))))
#+NOTYET
(defmethod oc:setValues ((self gp:trsf) &rest args)
  (destructuring-bind (a11 a12 a13 a14 a21 a22 a23 a24 a31 a32 a33 a34) args
    (oc::_wrap_gp_Trsf_SetValues (ff-pointer self) a11 a12 a13 a14 a21 a22 a23 a24 a31 a32 a33 a34)))

(defclass Geom_Geometry (ff-pointer-mixin) ())

(defclass Geom_Surface (Geom_Geometry) ())

(defmethod oc:bounds ((self Geom_Surface) &rest args)
  (declare (ignore args))
  (with-foreign-objects ((&u1 :double)
			 (&u2 :double)
			 (&v1 :double)
			 (&v2 :double))
    (_wrap_Geom_Surface_bounds (ff-pointer self) &u1 &u2 &v1 &v2)

    (values (mem-aref &u1 :double)
	    (mem-aref &u2 :double)
	    (mem-aref &v1 :double)
	    (mem-aref &v2 :double))))

(defclass XSControl_Reader (ff-pointer-mixin) ())

(defmethod readFile ((self XSControl_Reader) &rest args)
  (let ((filename (first args)))
    (with-foreign-string (pfilename filename)
      (_wrap_XSControl_Reader_readFile__SWIG_1 (ff-pointer self) pFilename))))

(defclass BRepBuilderAPI_Command (ff-pointer-mixin) ())

(defmethod isDone ((self BRepBuilderAPI_Command))
  (if (zerop (_wrap_BRepBuilderAPI_Command_IsDone (ff-pointer self)))
      nil
      t))

(defclass BRepBuilderAPI_MakeShape (BRepBuilderAPI_Command) ())

(defclass TopoDS_Shape (ff-pointer-mixin) ())

(defclass TopoDS_Solid (TopoDS_Shape) ())

(defclass TopoDS_Shell (TopoDS_Shape) ())

(defclass TopoDS_Face (TopoDS_Shape) ())

(defclass TopoDS_Wire (TopoDS_Shape) ())

(defclass TopoDS_Edge (TopoDS_Shape) ())

(defclass TopoDS_Vertex (TopoDS_Shape) ())

(defclass TopoDS_Compound (TopoDS_Shape) ())

(defmethod initialize-instance :after ((object TopoDS_Compound) &rest initargs)
  (let ((pointer (_wrap_new_TopoDS_Compound)))
    (setf (ff-pointer object) pointer)
    (ff-pointer-finalize object #'_wrap_delete_TopoDS_Compound)
    (values)))

(defclass TopoDS_Compsolid (TopoDS_Shape) ())

(defmacro with-topods-shape (&body ff-call)
  `(let* ((ff-shape ,@ff-call)
	  (shape-class
	   (if (null-pointer-p ff-shape)
	       nil
	       (case (_wrap_TopoDS_Shape_ShapeType ff-shape)
		 (:TopAbs_COMPOUND (load-time-value (find-class 'TopoDS_Compound)))
		 (:TopAbs_COMPSOLID (load-time-value (find-class 'TopoDS_Compsolid)))
		 (:TopAbs_SOLID (load-time-value (find-class 'TopoDS_Solid)))
		 (:TopAbs_SHELL (load-time-value (find-class 'TopoDS_Shell)))
		 (:TopAbs_FACE (load-time-value (find-class 'TopoDS_Face)))
		 (:TopAbs_WIRE (load-time-value (find-class 'TopoDS_Wire)))
		 (:TopAbs_EDGE (load-time-value (find-class 'TopoDS_Edge)))
		 (:TopAbs_VERTEX (load-time-value (find-class 'TopoDS_Vertex)))
		 (:TopAbs_SHAPE (load-time-value (find-class 'TopoDS_Shape))))))
	  (shape (when shape-class (allocate-instance shape-class))))
     (when shape-class (setf (ff-pointer shape) ff-shape))
     shape))

(defclass Geom_BoundedSurface (Geom_Surface) ())

(defclass Geom_BezierSurface (Geom_BoundedSurface) ())

(defclass Geom_BsplineSurface (Geom_BoundedSurface) ())

(defclass Geom_RectangularTrimmedSurface (Geom_BoundedSurface) ())

(defclass Geom_ElementarySurface (Geom_Surface) ())

(defclass Geom_SphericalSurface (Geom_ElementarySurface) ())

(defclass Geom_ToroidalSurface (Geom_ElementarySurface) ())

(defclass Geom_OffsetSurface (Geom_Surface) ())

(defclass Geom_SweptSurface (Geom_Surface) ())

(defclass Geom_SurfaceOfRevolution (Geom_SweptSurface) ())

(defclass Geom_ConicalSurface (Geom_ElementarySurface) ())

(defclass Geom_CylindricalSurface (Geom_ElementarySurface) ())

(defmethod initialize-instance :after ((object Geom_CylindricalSurface) &rest initargs
				       &key A3 A2 Radius C &allow-other-keys)
  (let ((pointer
	 (cond ((and A3 Radius)
		(_wrap_new_Geom_CylindricalSurface__SWIG_0 (ptr A3) (coerce Radius 'double-float)))
	       ((and A2 Radius)
		(_wrap_new_Geom_CylindricalSurface__SWIG_1 (ptr A2) (coerce Radius 'double-float)))
	       (C (error "unimplemented constructor"))
	       (t (error "Invalid arguments to constructor: ~S" initargs)))))
    (setf (ff-pointer object) pointer) ;; do we need to finalize objects using handle?
    (values)))		

(defclass Geom_SurfaceOfLinearExtrusion (Geom_SweptSurface) ())

(defclass Geom_Plane (Geom_ElementarySurface) ())

(defmacro with-geom-surface (&body ff-call)
  `(let* ((ff-surface ,@ff-call)
	  (surface-class (case (_wrap_Geom_Surface_GetGeometryType ff-surface)
			   (200 'Geom_BezierSurface)
			   (201 'Geom_BSplineSurface)
			   (202 'Geom_RectangularTrimmedSurface)
			   (203 'Geom_SphericalSurface)
			   (204 'Geom_ToroidalSurface)
			   (205 'Geom_OffsetSurface)
			   (206 'Geom_SurfaceOfRevolution)
			   (207 'Geom_ConicalSurface)
			   (208 'Geom_CylindricalSurface)
			   (209 'Geom_SurfaceOfLinearExtrusion)
			   (210 'Geom_Plane)))
	  (surface (allocate-instance (find-class surface-class))))
     (setf (ff-pointer surface) ff-surface)
     surface))

(defmethod shape-reversed ((self TopoDS_Shape))
  (with-topods-shape (_wrap_TopoDS_Shape_Reversed (ff-pointer self))))

(defmethod shape ((self BRepBuilderAPI_MakeShape))
  (with-topods-shape (_wrap_BRepBuilderAPI_MakeShape_shape (ff-pointer self))))

(defclass BRepPrimAPI_MakeCone (BRepBuilderAPI_MakeShape) ())

(defmethod initialize-instance :after ((obj BRepPrimAPI_MakeCone) &rest initargs
				       &key axes baseRadius topRadius height angle &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep axes 'gp:ax2))
  (assert (typep baseRadius 'double-float))
  (assert (typep topRadius 'double-float))
  (assert (typep height 'double-float))
  (assert (typep angle 'double-float))
  (setf (ff-pointer obj) (_wrap_new_BRepPrimAPI_MakeCone (ff-pointer axes) baseRadius topRadius height angle))
  (ff-pointer-finalize obj #'_wrap_delete_BRepPrimAPI_MakeCone)
  (values))

(defclass BRepPrimAPI_MakeCylinder (BRepBuilderAPI_MakeShape) ())

(defmethod initialize-instance :after ((obj BRepPrimAPI_MakeCylinder) &rest initargs
				       &key Axes R H Angle &allow-other-keys)
  (let ((pointer
	 (cond ((and Axes R H Angle)
		(_wrap_new_BRepPrimAPI_MakeCylinder__SWIG_3 (ptr Axes) R H Angle))
	       ((and Axes R H)
		(_wrap_new_BRepPrimAPI_MakeCylinder__SWIG_2 (ptr Axes) R H))
	       ((and R H Angle)
		(_wrap_new_BRepPrimAPI_MakeCylinder__SWIG_1 R H Angle))
	       ((and R H)
		(_wrap_new_BRepPrimAPI_MakeCylinder__SWIG_0 R H))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer obj) pointer)
    (ff-pointer-finalize obj #'_wrap_delete_BRepPrimAPI_MakeCylinder)
    (values)))

(defclass BRepPrimAPI_MakeSphere (BRepBuilderAPI_MakeShape) ())

(defmethod initialize-instance :after ((obj BRepPrimAPI_MakeSphere) &rest initargs
				       &key center radius axis R angle1 angle2 angle3 &allow-other-keys)
  (declare (ignore initargs))
  (cond ((and center radius axis R angle1 angle2 angle3)
	 (error "Ambiguous arguments to overloaded constructor."))
	((and center radius)
	 (assert (typep center 'gp:pnt))
	 (assert (typep radius 'double-float))
	 (setf (ff-pointer obj)
	       (_wrap_new_BRepPrimAPI_MakeSphere__SWIG_0 (ff-pointer center) radius))
	 (ff-pointer-finalize obj #'_wrap_delete_BRepPrimAPI_MakeSphere)
	 (values))
	((and axis R angle1 angle2 angle3)
	 (assert (typep axis 'gp:ax2))
	 (assert (typep R 'double-float))
	 (assert (typep angle1 'double-float))
	 (assert (typep angle2 'double-float))
	 (assert (typep angle3 'double-float))
	 (_wrap_new_BRepPrimAPI_MakeSphere__SWIG_1 (ff-pointer axis) R angle1 angle2 angle3)
	 (ff-pointer-finalize obj #'_wrap_delete_BRepPrimAPI_MakeSphere)
	 (values))
	(t (error "Insufficient arguments to constructor."))))

(defclass BRepPrimAPI_MakeSweep (BRepBuilderAPI_MakeShape) ())

(defclass BRepPrimAPI_MakePrism (BRepPrimAPI_MakeSweep) ())

(defmethod initialize-instance :after ((object BRepPrimAPI_MakePrism) &rest initargs
				       &key baseShape extrudeDirection (Copy nil) (Canonize t) &allow-other-keys)
  (let ((pointer
	 (cond ((and Canonize Copy extrudeDirection baseShape)
		(_wrap_new_BRepPrimAPI_MakePrism__SWIG_0 (ff-pointer baseShape)
							 (ptr extrudeDirection)
							 (if Copy (if (eq Copy 0) 0 1)  0)
							 (if Canonize (if (eq Canonize 0) 0 1) 0)))
	       ((and Copy extrudeDirection baseShape)
		(_wrap_new_BRepPrimAPI_MakePrism__SWIG_1 (ff-pointer baseShape)
							 (ptr extrudeDirection)
							 (if Copy (if (eq Copy 0) 0 1)  0)))
	       ((and extrudeDirection baseShape)
		(_wrap_new_BRepPrimAPI_MakePrism__SWIG_2 (ff-pointer baseShape) (ptr extrudeDirection)))
	       (t (error "Invalid arguments for BRepPrimAPI_MakePrism constructor: ~S." initargs)))))
    (setf (ff-pointer object) pointer)
    (ff-pointer-finalize object #'_wrap_delete_BRepPrimAPI_MakePrism)
    (values)))
							 
							 
	   

(defclass TopoDS_Iterator (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj TopoDS_Iterator) &rest initargs
				       &key (S nil shape-present-p)
					 (cumOri t cumOri-present-p) (cumLoc t cumLoc-present-p)
					 &allow-other-keys)
  (declare (ignore initargs))
  (when shape-present-p
    (assert (typep S 'TopoDS_Shape)))
  (when cumOri-present-p
    (assert (typep cumOri 'boolean)))
  (when cumLoc-present-p
    (assert (typep cumLoc 'boolean)))
  (setf (ff-pointer obj)
	(cond ((and S cumOri-present-p cumLoc-present-p)
	       (_wrap_new_TopoDS_Iterator__SWIG_1 (ff-pointer S) (if cumOri 1 0) (if cumLoc 1 0)))
	      ((and S cumOri-present-p)
	       (_wrap_new_TopoDS_Iterator__SWIG_2 (ff-pointer S) (if cumOri 1 0)))
	      (S (_wrap_new_TopoDS_Iterator__SWIG_3 (ff-pointer S)))
	      (t (_wrap_new_TopoDS_Iterator__SWIG_0))))
  (ff-pointer-finalize obj #'_wrap_delete_TopoDS_Iterator)
  (values))

(defmethod more-p ((self TopoDS_Iterator))
  (if (zerop (_wrap_TopoDS_Iterator_More (ff-pointer self)))
      nil t))

(defmethod next ((self TopoDS_Iterator))
  (_wrap_TopoDS_Iterator_Next (ff-pointer self)))

(defmethod value ((self TopoDS_Iterator))
  (with-topods-shape (_wrap_TopoDS_Iterator_value (ff-pointer self))))

(defclass BRepBuilderAPI_MakeVertex (BRepBuilderAPI_MakeShape) ())

(defmethod initialize-instance :after ((obj BRepBuilderAPI_MakeVertex) &rest initargs
				      &key P &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep P 'gp:pnt))
  (setf (ff-pointer obj)
	(_wrap_new_BRepBuilderAPI_MakeVertex (ff-pointer P)))
  (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_MakeVertex)
  (values))
	      
(defclass BRepOffsetAPI_NormalProjection (BRepBuilderAPI_MakeShape)
  ())

(defmethod initialize-instance :after ((obj BRepOffsetAPI_NormalProjection) &rest initargs
				       &key S &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond (S (assert (typep S 'TopoDS_Shape))
		 (_wrap_new_BRepOffsetAPI_NormalProjection__SWIG_1 (ff-pointer S)))
	      (t (_wrap_new_BRepOffsetAPI_NormalProjection__SWIG_0))))
  (ff-pointer-finalize obj #'_wrap_delete_BRepOffsetAPI_NormalProjection)
  (values))

(defmethod init ((self BRepOffsetAPI_NormalProjection) (S TopoDS_Shape) &key &allow-other-keys)
  (_wrap_BRepOffsetAPI_NormalProjection_Init (ff-pointer self) (ff-pointer S)))

(defmethod add ((self BRepOffsetAPI_NormalProjection) (ToProj TopoDS_Shape))
  (_wrap_BRepOffsetAPI_NormalProjection_Add (ff-pointer self) (ff-pointer ToProj)))

(defmethod build ((self BRepOffsetAPI_NormalProjection))
  (_wrap_BRepOffsetAPI_NormalProjection_Build (ff-pointer self)))

(defmethod projection ((self BRepOffsetAPI_NormalProjection))
  (with-topods-shape (_wrap_BRepOffsetAPI_NormalProjection_Projection (ff-pointer self))))

(defclass BRepBuilderAPI_MakeEdge (BRepBuilderAPI_MakeShape) ())

(defmethod edge ((self BRepBuilderAPI_MakeEdge))
  (let ((edge (allocate-instance (load-time-value (find-class 'TopoDS_Edge)))))
    (setf (ff-pointer edge) (_wrap_BrepBuilderAPI_MakeEdge_Edge (ff-pointer self)))
    edge))



(defclass Geom_Curve (Geom_Geometry) ())



(defclass Geom2d_Geometry (ff-pointer-mixin) ())

(defclass Geom2d_Curve (Geom2d_Geometry) ())

(defclass Geom2d_Conic (Geom2d_Curve) ())

(defclass Geom2d_Ellipse (Geom2d_Conic) ())

(defmethod initialize-instance :after ((object Geom2d_Ellipse) &rest initargs
				       &key Axis MajorAxis MajorRadius MinorRadius Sense
					 &allow-other-keys)
  (let ((pointer
	 (cond ((and MajorAxis MajorRadius MinorRadius Sense)
		(_wrap_new_Geom2d_Ellipse__SWIG_0 (ptr MajorAxis)
						  (coerce MajorRadius 'double-float)
						  (coerce MinorRadius 'double-float)
						  (if Sense (if (eq Sense 0) 0 1) 0)))
	       ((and MajorAxis MajorRadius MinorRadius)
		(_wrap_new_Geom2d_Ellipse__SWIG_1 (ptr MajorAxis)
						  (coerce MajorRadius 'double-float)
						  (coerce MinorRadius 'double-float)))
	       ((and Axis MajorRadius MinorRadius)
		(_wrap_new_Geom2d_Ellipse__SWIG_2 (ptr Axis)
						  (coerce MajorRadius 'double-float)
						  (coerce MinorRadius 'double-float)))
	       (t "Invalid arguments to constructor: ~S" initargs))))
    (setf (ff-pointer object) pointer)
    (ff-pointer-finalize object #'_wrap_delete_Geom2d_Ellipse)
    (values)))

(defclass BRepBuilderAPI_ModifyShape (BRepBuilderAPI_MakeShape) ())

(defclass BRepBuilderAPI_MakeWire (BRepBuilderAPI_MakeShape) ())

(defmethod add ((self BRepBuilderAPI_MakeWire) (E TopoDS_Edge))
  (_wrap_BRepBuilderAPI_MakeWire_Add__SWIG_0 (ff-pointer self) (ff-pointer E)))

(defmethod add ((self BRepBuilderAPI_MakeWire) (W TopoDS_Wire))
  (_wrap_BRepBuilderAPI_MakeWire_Add__SWIG_1 (ff-pointer self) (ff-pointer W)))

(defmethod wire ((self BRepBuilderAPI_MakeWire))
  (let ((wire (allocate-instance (load-time-value (find-class 'TopoDS_Wire)))))
    (setf (ff-pointer wire) (_wrap_BrepBuilderAPI_MakeWire_Wire (ff-pointer self)))
    wire))

#+NIL
(defmethod initialize-instance :after ((obj BRepBuilderAPI_MakeEdge) &rest initargs
				       &key L S V1 V2 POINT1 POINT2 param1 param2 &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond ((and (null L)
		    (null S)
		    (null V1)
		    (null V2)
		    (null POINT1)
		    (null POINT2)
		    (null param1)
		    (null param2)) (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_0))
	      ((typep L 'Geom2d_Curve)
	       (cond ((and (typep S 'Geom_Surface) (typep param1 'double-float) (typep param2 'double-float))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_15 (ff-pointer L) (ff-pointer S) param1 param2))
		     (t (error "Invalid arguments to make-instance of BRepBuilderAPI_MakeEdge (1)."))))

	      ((typep L 'Geom_Curve)
	       (cond ((and (typep V1 'TopoDS_Vertex) (typep V2 'TopoDS_Vertex))
		      (cond ((and (typep param1 'double-float) (typep param2 'double-float))
			     (_wrap_new_BrepBuilderAPI_MakeEdge__SWIG_13
			      (ff-pointer L) (ff-pointer V1) (ff-pointer V2) param1 param2))
			    (t
			     (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_12
			      (ff-pointer L) (ff-pointer V1) (ff-pointer V2)))))
		     ((and (typep param1 'double-float) (typep param2 'double-float))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_14 (ff-pointer L) param1 param2))
		     (t (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_1 (ff-pointer L)))))

	      ((typep L 'gp:parab)
	       (cond ((and (typep V1 'TopoDS_Vertex) (typep V2 'TopoDS_Vertex))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_11 (ff-pointer L) (ff-pointer V1) (ff-pointer V2)))
		     ((and (typep POINT1 'gp:pnt) (typep POINT2 'gp:pnt))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_10
		       (ff-pointer L) (ff-pointer POINT1) (ff-pointer POINT2)))
		     ((and (typep param1 'double-float) (typep param2 'double-float))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_9 (ff-pointer L) param1 param2))
		     (t (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_8 (ff-pointer L)))))
	 
	      ((typep L 'gp:circ)
	       (cond ((and (typep V1 'TopoDS_Vertex) (typep V2 'TopoDS_Vertex))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_7 (ff-pointer L) (ff-pointer V1) (ff-pointer V2)))
		     ((and (typep POINT1 'gp:pnt) (typep POINT2 'gp:pnt))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_6 (ff-pointer L) (ff-pointer POINT1) (ff-pointer POINT2)))
		     ((and (typep param1 'double-float) (typep param2 'double-float))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_5 (ff-pointer L) param1 param2))
		     (t (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_4 (ff-pointer L)))))
	 
	      ((and (typep POINT1 'gp:pnt) (typep POINT2 'gp:pnt))
	       (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_3 (ff-pointer POINT1) (ff-pointer POINT2)))
	
	      ((and (typep V1 'TopoDS_Vertex) (typep V2 'TopoDS_Vertex))
	       (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_2 (ff-pointer V1) (ff-pointer V2)))
  
	      (t (error "Invalid arguments to make-instance of BRepBuilderAPI_MakeEdge (2)."))))
  (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_MakeEdge)
	       (values))


(defmethod initialize-instance :after ((obj BRepBuilderAPI_MakeEdge) &rest initargs
				       &key L S V1 V2 Pnt1 Pnt2 param1 param2 &allow-other-keys)
  (let ((pointer
	 (cond ((and L S V1 V2 param1 param2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_33 (ff-pointer L) (ff-pointer S) (ff-pointer V1) (ff-pointer V2) (coerce param1 'double-float) (coerce param2 'double-float)))
	       ((and L S Pnt1 Pnt2 param1 param2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_32 (ff-pointer L) (ff-pointer S) (ptr Pnt1) (ptr Pnt2) (coerce param1 'double-float) (coerce param2 'double-float)))
	       ((and L S V1 V2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_31 (ff-pointer L) (ff-pointer S) (ff-pointer V1) (ff-pointer V2)))
	       ((and L S param1 param2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_30 (ff-pointer L) (ff-pointer S) (coerce param1 'double-float) (coerce param2 'double-float)))
	       ((and L S)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_29 (ff-pointer L) (ff-pointer S)))
	       ((and L V1 V2 param1 param2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_28 (ff-pointer L) (ff-pointer V1) (ff-pointer V2) (coerce param1 'double-float) (coerce param2 'double-float)))
	       ((and L Pnt1 Pnt2 param1 param2)
		(typecase L
		  (Geom2d_Curve (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_27 (ff-pointer L) (ptr Pnt1) (ptr Pnt2) (coerce param1 'double-float) (coerce param2 'double-float)))
		  (t (error "Invalid arguments to make-instance of BRepBuilderAPI_MakeEdge (1): ~S." initargs))))
	       ((and L V1 V2)
		(typecase L
		  (Geom_Curve (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_26 (ff-pointer L) (ff-pointer V1) (ff-pointer V2)))
		  (gp:parab (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_22 (ptr L) (ff-pointer V1) (ff-pointer V2)))
		  (gp:hypr (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_18 (ptr L) (ff-pointer V1) (ff-pointer V2)))
		  (gp:elips (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_14 (ptr L) (ff-pointer V1) (ff-pointer V2)))
		  (gp:circ (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_10 (ptr L) (ff-pointer V1) (ff-pointer V2)))
		  (gp:lin (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_6 (ptr L) (ff-pointer V1) (ff-pointer V2)))
		  (t (error "Invalid arguments to make-instance of BRepBuilderAPI_MakeEdge (2): ~S." initargs))))			    
	       ((and L Pnt1 Pnt2)
		(typecase L
		  (Geom_Curve (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_25 (ff-pointer L) (ptr Pnt1) (ptr Pnt2)))
		  (gp:parab (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_21 (ptr L) (ptr Pnt1) (ptr Pnt2)))
		  (gp:hypr (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_17 (ptr L) (ptr Pnt1) (ptr Pnt2)))
		  (gp:elips (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_13 (ptr L) (ptr Pnt1) (ptr Pnt2)))
		  (gp:circ (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_9 (ptr L) (ptr Pnt1) (ptr Pnt2)))
		  (gp:lin (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_5 (ptr L) (ptr Pnt1) (ptr Pnt2)))
		  (t (error "Invalid arguments to make-instance of BRepBuilderAPI_MakeEdge (3): ~S." initargs))))
	       ((and L param1 param2)
		(typecase L
		  (Geom_Curve (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_24 (ff-pointer L) (coerce param1 'double-float) (coerce param2 'double-float)))
		  (gp:parab (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_20 (ptr L) (coerce param1 'double-float) (coerce param2 'double-float)))
		  (gp:hypr (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_16 (ptr L) (coerce param1 'double-float) (coerce param2 'double-float)))
		  (gp:elips (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_12 (ptr L) (coerce param1 'double-float) (coerce param2 'double-float)))
		  (gp:circ (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_8 (ptr L) (coerce param1 'double-float) (coerce param2 'double-float)))
		  (gp:lin (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_4 (ptr L) (coerce param1 'double-float) (coerce param2 'double-float)))
		  (t (error "Invalid arguments to make-instance of BRepBuilderAPI_MakeEdge (4): ~S." initargs))))
	       ((typep L 'Geom_Curve) (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_23 (ff-pointer L)))
	       ((typep L 'gp:parab) (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_19 (ptr L)))
	       ((typep L 'gp:hypr) (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_15 (ptr L)))
	       ((typep L 'gp:elips) (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_11 (ptr L)))
	       ((typep L 'gp:circ) (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_7 (ptr L)))
	       ((typep L 'gp:lin) (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_3 (ptr L)))
	       ((and V1 V2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_1 (ff-pointer V1) (ff-pointer V2)))
	       ((and Pnt1 Pnt2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_2 (ptr Pnt1) (ptr Pnt2)))
	       ((null (or L S V1 V2 param1 param2))
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_0))
	       (t (error "Invalid arguments to make-instance of BRepBuilderAPI_MakeEdge (5): ~S." initargs)))))
    (setf (ff-pointer obj) pointer)
    (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_MakeEdge)
    (values)))

(defmethod initialize-instance :after ((obj BRepBuilderAPI_MakeWire) &rest initargs
				       &key E E1 E2 E3 E4 W &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond ((and (null E) (null E1) (null E2) (null E3) (null E4) (null W))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_0))
	      ((and (typep E 'TopoDS_Edge) (null W) (null E1) (null E2) (null E3) (null E4))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_1 (ff-pointer E)))
	      ((and (typep E1 'TopoDS_Edge) (typep E2 'TopoDS_Edge) (null E3) (null E4))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_2 (ff-pointer E1) (ff-pointer E2)))
	      ((and (typep E1 'TopoDS_Edge) (typep E2 'TopoDS_Edge) (typep E3 'TopoDS_Edge) (null E4))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_3
		(ff-pointer E1) (ff-pointer E2) (ff-pointer E3)))
	      ((and (typep E1 'TopoDS_Edge) (typep E2 'TopoDS_Edge) (typep E3 'TopoDS_Edge) (typep E4 'TopoDS_Edge))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_4
		(ff-pointer E1) (ff-pointer E2) (ff-pointer E3) (ff-pointer E4)))
	      ((and (typep W 'TopoDS_Wire) (or (null E) (null E1) (null E2) (null E3) (null E4)))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_5 (ff-pointer W)))
	      ((and (typep W 'TopoDS_Wire) (typep E 'TopoDS_Edge))
	       (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_6 (ff-pointer W) (ff-pointer E)))))
  (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_MakeWire)
  (values))
	
(defmethod reversed ((self TopoDS_Shape))
  (with-topods-shape (_wrap_TopoDS_Shape_Reversed (ff-pointer self))))

(defclass TopExp_Explorer (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj TopExp_Explorer) &rest initargs &key S ToFind ToAvoid &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond ((and (null S) (null ToFind) (null ToAvoid))
	       (_wrap_new_TopExp_Explorer__SWIG_0))
	      ((and S ToFind (null ToAvoid))
	       (_wrap_new_TopExp_Explorer__SWIG_2 (ff-pointer S) ToFind))
	      ((and S ToFind ToAvoid)
	       (_wrap_new_TopExp_Explorer__SWIG_1 (ff-pointer S) ToFind ToAvoid))
	      (t (error "Invalid arguments for TopExp_Explorer constructor."))))
  (ff-pointer-finalize obj #'_wrap_delete_TopExp_Explorer)
  (values))

(defmethod init ((self TopExp_Explorer) (S TopoDS_Shape) &key ToFind ToAvoid &allow-other-keys)
  (if ToAvoid
      (_wrap_TopExp_Explorer_init__SWIG_0 (ff-pointer self) (ff-pointer S) ToFind ToAvoid)
      (_wrap_TopExp_Explorer_init__SWIG_1 (ff-pointer self) (ff-pointer S) ToFind)))

(defmethod more-p ((self TopExp_Explorer))
  (if (zerop (_wrap_TopExp_Explorer_more (ff-pointer self)))
      nil t))  

(cffi:defcfun ("_wrap_TopoDS_Shape_copy_reference" oc::_wrap_TopoDS_Shape_copy_reference) :pointer
  (ptr :pointer))

(defmethod current ((self TopExp_Explorer))
  (with-topods-shape (_wrap_TopoDS_Shape_copy_reference (_wrap_TopExp_Explorer_Current (ff-pointer self)))))

(defmethod next ((self TopExp_Explorer))
  (_wrap_TopExp_Explorer_Next (ff-pointer self)))

(defclass TopoDS_Builder (ff-pointer-mixin) ())

(defclass BRep_Builder (TopoDS_Builder) ())

(defmethod initialize-instance :after ((obj BRep_Builder) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj) (_wrap_new_BRep_Builder))
  (ff-pointer-finalize obj #'_wrap_delete_BRep_Builder)
  (values))

(defmethod topods-builder-add ((self TopoDS_Builder) (S TopoDS_Shape) (C TopoDS_Shape))
  (_wrap_TopoDS_Builder_Add (ff-pointer self) (ff-pointer S) (ff-pointer C)))
	    
(defclass BRepMesh_DiscretRoot (ff-pointer-mixin) ())

(defclass BRepMesh_IncrementalMesh (BRepMesh_DiscretRoot) ())

(defmethod initialize-instance :after ((obj BRepMesh_IncrementalMesh) &rest initargs
				       &key S D (Relative nil Relative-present-p) Ang &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond ((null S) (_wrap_new_BRepMesh_IncrementalMesh__SWIG_0))
	      ((and (typep S 'TopoDS_Shape)
		    (typep D 'double-float)
		    (null Relative-present-p)
		    (null Ang))
	       (_wrap_new_BRepMesh_IncrementalMesh__SWIG_3 (ff-pointer S) D))
	      
	      ((and (typep S 'TopoDS_Shape)
		    (typep D 'double-float)
		    (null Ang)
		    Relative-present-p)
	       (_wrap_new_BRepMesh_IncrementalMesh__SWIG_2 (ff-pointer S) D (if Relative 1 0)))
	      
	      ((and (typep S 'TopoDS_Shape)
		    (typep D 'double-float)
		    (typep Ang 'double-float)
		    relative-present-p)
	       (_wrap_new_BrepMesh_IncrementalMesh__SWIG_1 (ff-pointer S) D (if Relative 1 0) Ang))
	      
	      (t (error "Invalid arguments to initialize-instance of BRepMesh_IncrementalMesh."))))
  (ff-pointer-finalize obj #'_wrap_delete_BRepMesh_IncrementalMesh)
  (values))

(defmethod perform ((self BRepMesh_IncrementalMesh))
  (_wrap_BRepMesh_IncrementalMesh_Perform (ff-pointer self)))

(defclass Poly_Triangulation (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj Poly_Triangulation) &rest initargs
				       &key nbNodes nbTriangles UVNodes &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep nbNodes 'integer))
  (assert (typep nbTriangles 'integer))
  (setf (ff-pointer obj)
	(_wrap_new_Poly_Triangulation nbNodes nbTriangles (if UVNodes 1 0)))
  (ff-pointer-finalize obj #'_wrap_delete_Poly_Triangulation)
  (values))
  
(defclass Poly_Array1OfTriangle (ff-pointer-mixin) ())

(defmethod get-nb-triangles ((self Poly_Triangulation))
  (_wrap_Poly_Triangulation_nbTriangles (ff-pointer self)))

(defmethod get-triangles ((self Poly_Triangulation))
  (let ((array (allocate-instance (load-time-value (find-class 'Poly_Array1OfTriangle)))))
    (setf (ff-pointer array) (_wrap_Poly_Triangulation_Triangles (ff-pointer self)))
    array))

(defclass TColgp_Array1OfPnt (ff-pointer-mixin) ())


(defmethod get-nb-nodes ((self Poly_Triangulation))
  (_wrap_Poly_Triangulation_nbNodes (ff-pointer self)))

(defmethod get-nodes ((self Poly_Triangulation))
  (let ((array (allocate-instance (load-time-value (find-class 'TColgp_Array1OfPnt)))))
    (setf (ff-pointer array) (_wrap_Poly_Triangulation_Nodes (ff-pointer self)))
    array))

(defmethod get-value ((self TColgp_Array1OfPnt) (index integer))
  (gp::make-pnt :ptr (_wrap_TColgp_Array1OfPnt_value (ff-pointer self) index)))

(defmethod get-lower ((self TColgp_Array1OfPnt))
  (_wrap_TColgp_Array1OfPnt_Lower (ff-pointer self)))

(defmethod get-upper ((self TColgp_Array1OfPnt))
  (_wrap_TColgp_Array1OfPnt_Upper (ff-pointer self)))

(defmethod get-length ((self Poly_Array1OfTriangle))
  (_wrap_Poly_Array1OfTriangle_Length (ff-pointer self)))

(defmethod get-lower ((self Poly_Array1OfTriangle))
  (_wrap_Poly_Array1OfTriangle_Lower (ff-pointer self)))

(defmethod get-upper ((self Poly_Array1OfTriangle))
  (_wrap_Poly_Array1OfTriangle_Upper (ff-pointer self)))

(defclass Poly_Triangle (ff-pointer-mixin) ())

(defmethod get-value ((self Poly_Array1OfTriangle) (index integer))
  (let ((tri (allocate-instance (load-time-value (find-class 'Poly_Triangle)))))
    (setf (ff-pointer tri) (_wrap_Poly_Array1OfTriangle_Value (ff-pointer self) index))
    tri))

(defmethod get-value ((self Poly_Triangle) (index integer))
  (assert (>= 3 index 1))
  (_wrap_Poly_Triangle_value (ff-pointer self) index))

(defclass TopTools_ListOfShape (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((object TopTools_ListOfShape) &rest initargs
				       &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer object) (_wrap_new_TopTools_ListOfShape))
  (values))

(defmethod list-append ((self TopTools_ListOfShape) (item TopoDS_Shape))
  #+NIL
  (setf (ff-pointer self) (_wrap_TopTools_ListOfShape_Append (ff-pointer self) (ff-pointer item))
	)
  (_wrap_TopTools_ListOfShape_Append (ff-pointer self) (ff-pointer item))
  (values))

(defclass GC_MakeArcOfCircle (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj GC_MakeArcOfCircle) &rest initargs
				       &key P1 P2 Circ Sense P3 &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep P1 'pnt))
  (assert (typep P2 'pnt))
  (setf (ff-pointer obj)
	(cond ((and Circ Sense)
	       (assert (typep Circ 'circ))
	       (assert (typep Sense 'integer))
	       (_wrap_new_GC_MakeArcOfCircle__SWIG_1 Circ (ptr P1) (ptr P2) Sense))
	      (P3
	       (assert (typep P3 'pnt))
	       (_wrap_new_GC_MakeArcOfCircle__SWIG_0 (ptr P1) (ptr P2) (ptr P3)))
	      (t (error "Insufficient arguments to constructor."))))
  (ff-pointer-finalize obj #'_wrap_delete_GC_MakeArcOfCircle)
  (values))

(defclass Geom_Curve (ff-pointer-mixin) ())

(defclass Geom_TrimmedCurve (Geom_Curve) ())

(defmethod value ((self GC_MakeArcOfCircle))
  (let ((curve (allocate-instance (load-time-value (find-class 'Geom_TrimmedCurve)))))
    (setf (ff-pointer curve) (_wrap_GC_MakeArcOfCircle_Value (ff-pointer self)))
    curve))

(defclass GC_MakeSegment (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj GC_MakeSegment) &rest initargs
				       &key P1 P2 &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep P1 'pnt))
  (assert (typep P2 'pnt))
  (setf (ff-pointer obj) (_wrap_new_GC_MakeSegment__SWIG_0 (ptr p1) (ptr p2)))
  (ff-pointer-finalize obj #'_wrap_delete_GC_MakeSegment)
  (values))

(defmethod value ((self GC_MakeSegment))
  (let ((curve (allocate-instance (load-time-value (find-class 'Geom_TrimmedCurve)))))
    (setf (ff-pointer curve) (_wrap_GC_MakeSegment_Value (ff-pointer self)))
    curve))

#+NIL
(defmethod initialize-instance :after ((obj BRepBuilderAPI_MakeEdge) &rest initargs
				&key L V1 V2 p1 p2 POINT1 POINT2 S &allow-other-keys)
  (let ((pointer
	 (cond ((and L S p2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_15 (ff-pointer L)
							    (ff-pointer S )
							    p1 p2))
	       ((and L p1 p2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_14 (ff-pointer L) p1 p2))
	       ((and (typep L 'Geom_Curve) V1 V2 p1 p2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_13 (ff-pointer L)
							    (ff-pointer V1)
							    (ff-pointer V2)
							    p1 p2))
	       ((and (typep L 'Geom_Curve) V1 V2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_12 (ff-pointer L)
							    (ff-pointer V1)
							    (ff-pointer V2)))
	       ((and (typep L 'gp:parab) V1 V2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_11 (ptr L)
							    (ff-pointer V1)
							    (ff-pointer V2)))
	       ((and (typep L 'gp:parab) POINT1 POINT2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_10 (ptr L)
							    (ptr POINT1) (ptr POINT2)))
	       ((and (typep L 'gp:parab) p1 p2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_9 (ptr L) p1 p2))
	       ((typep L 'gp:parab)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_8 (ptr L)))
	       ((and (typep L 'gp:circ) V1 V2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_7 (ptr L) (ff-pointer V1) (ff-pointer V2)))
	       ((and (typep L 'gp:circ) POINT1 POINT2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_6 (ptr L) (ptr POINT1) (ptr POINT2)))
	       ((and (typep L 'gp:circ) p1 p2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_5 (ptr L) p1 p2))
	       ((typep L 'gp:circ)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_4 (ptr L)))
	       ((and POINT1 POINT2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_3 (ptr POINT1) (ptr POINT2)))
	       ((and V1 V2)
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_2 (ff-pointer V1) (ff-pointer V2)))
	       (L (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_1 (ff-pointer L)))
	       ((and (null L) (null p1) (null p2)
		     (null V1) (null V2)
		     (null POINT1) (null POINT2)
		     (null S))
		(_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_0))
	       (t (error "Invalid arguments to constructor: ~S" initargs)))))
    (setf (ff-pointer obj) pointer)
    (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_MakeEdge)
    (values)))

(defmethod shape ((self BRepBuilderAPI_MakeShape))
  (with-topods-shape (_wrap_BRepBuilderAPI_MakeShape_Shape (ff-pointer self))))

#+NIL
(defmethod initialize-instance :after ((obj BRepBuilderAPI_MakeWire) &rest initargs
				&key E E1 E2 E3 E4 W)
  (let ((pointer
	 (cond ((and W E)
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_6 (ff-pointer W) (ff-pointer E)))
	       (W
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_5 (ff-pointer W)))
	       ((and E1 E2 E3 E4)
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_4 (ff-pointer E1) (ff-pointer E2) (ff-pointer E3) (ff-pointer E4)))
	       ((and E1 E2 E3)
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_3 (ff-pointer E1) (ff-pointer E2) (ff-pointer E3)))
	       ((and E1 E2)
		(_wrap_new_BRepBuilderAPI_MakeWire__SWIG_2 (ff-pointer E1) (ff-pointer E2)))
		(E (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_1 (ff-pointer E)))
		((and (null E1) (null E2) (null E3) (null E4))
		 (_wrap_new_BRepBuilderAPI_MakeWire__SWIG_0))
		(t (error "Invalid arguments to constructor: ~S" initargs)))))
    (setf (ff-pointer obj) pointer)
    (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_MakeWire)
    (values)))

(defmethod set-mirror ((trsf gp:trsf) (axis gp:ax1))
  (_wrap_gp_Trsf_SetMirror__SWIG_0 (ptr trsf) (ptr axis))
  (values))

(defclass BRepBuilderAPI_Transform (BRepBuilderAPI_ModifyShape) ())

(defmethod initialize-instance :after ((obj BRepBuilderAPI_Transform) &rest initargs
				&key Trsf S Copy &allow-other-keys)
  (let ((pointer
	 (cond ((and S Trsf Copy)
		(_wrap_new_BRepBuilderAPI_Transform__SWIG_1 (ff-pointer S) (ptr Trsf) (if Copy (if (eq Copy 0) 0 1) 0)))
	       ((and S Trsf)
		(_wrap_new_BRepBuilderAPI_Transform__SWIG_2 (ff-pointer S) (ptr Trsf)))
	       (S (_wrap_new_BrepBuilderAPI_Transform__SWIG_0 (ptr Trsf)))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer obj) pointer)
    (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_Transform)
    (values)))

(defclass BRepBuilderAPI_MakeFace (BRepBuilderAPI_MakeShape) ())

(defmethod initialize-instance :after ((object BRepBuilderAPI_MakeFace) &rest initargs
				       &key W OnlyPlane F S Inside Umin Umax Vmin Vmax tolDegen)
  (let ((pointer
	 (cond ((and S Umin Umax Vmin Vmax tolDegen)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_5 (ff-pointer S) Umin Umax Vmin Vmax tolDegen))
	       ((and S W Inside)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_3 (ff-pointer S) (ff-pointer W) (if Inside (if (eq Inside 0) 1) 0)))
	       ((and S W)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_4 (ff-pointer S) (ff-pointer W)))
	       ((and F W)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_2 (ff-pointer F) (ff-pointer W)))
	       ((and W OnlyPlane)
		(_wrap_new_BRepBuilderAPI_MakeFace__SWIG_0 (ff-pointer W) (if OnlyPlane (if (eq OnlyPlane 0) 1) 0)))
	       (W (_wrap_new_BRepBuilderAPI_MakeFace__SWIG_1 (ff-pointer W)))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (ff-pointer-finalize object #'_wrap_delete_BRepBuilderAPI_MakeFace)
    (values)))

(defmethod face ((self BRepBuilderAPI_MakeFace))
  (let ((face (allocate-instance (load-time-value (find-class 'TopoDS_Face)))))
    (setf (ff-pointer face) (_wrap_BrepBuilderAPI_MakeFace_Face (ff-pointer self)))
    face))

(defclass BRepFilletAPI_LocalOperation (BRepBuilderAPI_MakeShape) ())

(defclass BRepFilletAPI_MakeFillet (BRepFilletAPI_LocalOperation) ())

(defmethod initialize-instance :after ((object BRepFilletAPI_MakeFillet) &rest initargs
				       &key shape type)
  (let ((pointer
	 (cond ((and shape type)
		(_wrap_new_BRepFilletAPI_MakeFillet__SWIG_0 (ff-pointer shape) type))
	       (shape
		(_wrap_new_BRepFilletAPI_MakeFillet__SWIG_1 (ff-pointer shape)))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (ff-pointer-finalize object #'_wrap_delete_BRepFilletAPI_MakeFillet)
    (values)))

(defmethod add-shape ((make-fillet BRepFilletAPI_MakeFillet) (radius number) (edge TopoDS_Edge))
  (_wrap_BRepFilletAPI_MakeFillet_Add (ff-pointer make-fillet) (coerce radius 'double-float) (ff-pointer edge)))

(defclass BRepAlgoAPI_Algo (BRepBuilderAPI_MakeShape) ())

(defmethod shape ((self BRepAlgoAPI_Algo))
  (with-topods-shape (_wrap_BRepAlgoAPI_Algo_shape (ff-pointer self))))

(defclass BRepAlgoAPI_BuilderAlgo  (BRepAlgoAPI_Algo) ())

(defclass BRepAlgoAPI_BooleanOperation (BRepAlgoAPI_BuilderAlgo) ())

(defclass BRepAlgoAPI_Fuse (BRepAlgoAPI_BooleanOperation) ())

(defmethod initialize-instance :after ((object BRepAlgoAPI_Fuse) &rest initargs
				       &key PF S1 S2 aDSF &allow-other-keys)
  (let ((pointer
	 (cond ((and S1 S2 (null PF) (null aDSF))
		(_wrap_new_BRepAlgoAPI_Fuse (ff-pointer S1) (ff-pointer S2)))
	       (t (error "Not fully implemented ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (ff-pointer-finalize object #'_wrap_delete_BRepAlgoAPI_Fuse)
    (values)))
		
(defmethod surface ((face TopoDS_Face))
  (with-geom-surface (_wrap_BRep_Tool_Surface (ff-pointer face))))

(defclass BRepBuilderAPI_MakeOffset (BRepBuilderAPI_MakeShape) ())

(defclass BRepOffsetAPI_MakeThickSolid (BRepBuilderAPI_MakeOffset) ())

(defmethod initialize-instance :after ((object BRepOffsetAPI_MakeThickSolid) &rest initargs
				       &key S ClosingFaces Offset Tol Mode Intersection
					 SelfInter Join RemoveIntEdges &allow-other-keys)
  (let ((pointer
	 (cond ((and S ClosingFaces Offset Tol Mode Intersection SelfInter Join RemoveIntEdges)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_1 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)
								Mode (if Intersection (if (eq Intersection 0) 0 1) 0)
								(if SelfInter (if (eq SelfInter 0) 0 1) 0) Join
								(if RemoveIntEdges (if (eq RemoveIntEdges 0) 0 1) 0)))
	       ((and S ClosingFaces Offset Tol Mode Intersection SelfInter Join)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_2 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)
								Mode (if Intersection (if (eq Intersection 0) 0 1) 0)
								(if SelfInter (if (eq SelfInter 0) 0 1) 0) Join))
	       ((and S ClosingFaces Offset Tol Mode Intersection SelfInter)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_3 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)
								Mode (if Intersection (if (eq Intersection 0) 0 1) 0)
								(if SelfInter (if (eq SelfInter 0) 0 1) 0)))
	       ((and S ClosingFaces Offset Tol Mode Intersection)
		(_wrap_new_BrepOffsetAPI_MakeThickSolid__SWIG_4 (ff-pointer S) (ff-pointer ClosingFaces)
								(coerce Offset 'double-float) (coerce Tol 'double-float)
								Mode (if Intersection (if (eq Intersection 0) 0 1) 0)))
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
    (values)))
		      
(defclass Poly_Polygon3D (ff-pointer-mixin) ())

(defmethod get-poly-polygon-3d ((edge TopoDS_EDGE) p-top-loc)
  (let ((pointer (_wrap_BRep_Tool_Polygon3D (ff-pointer edge) (_wrap_new_TopLoc_Location__SWIG_0))))
    (if (null-pointer-p pointer)
	nil
	(let ((poly-polygon-3d (allocate-instance (load-time-value (find-class 'Poly_Polygon3D)))))
	  (setf (ff-pointer poly-polygon-3d) pointer)
	  poly-polygon-3d))))

(defmethod get-nodes ((self Poly_Polygon3D))
  (let ((nodes (allocate-instance (load-time-value (find-class 'TColgp_Array1OfPnt)))))
    (setf (ff-pointer nodes) (_wrap_Poly_Polygon3D_Nodes (ff-pointer self)))
    nodes))

(defmethod get-nb-nodes ((self Poly_Polygon3D))
  (_wrap_Poly_Polygon3D_NbNodes (ff-pointer self)))

(defclass Poly_PolygonOnTriangulation (ff-pointer-mixin) ())

(defclass TColStd_Array1OfInteger (ff-pointer-mixin) ())

(defmethod get-value ((self TColStd_Array1OfInteger) (index integer))
  (_wrap_TColStd_Array1OfInteger_value (ff-pointer self) index))

(defmethod get-lower ((self TColStd_Array1OfInteger))
  (_wrap_TColStd_Array1OfInteger_Lower (ff-pointer self)))

(defmethod get-upper ((self TColStd_Array1OfInteger))
  (_wrap_TColStd_Array1OfInteger_Upper (ff-pointer self)))

(defmethod get-polygon-on-triangulation ((edge TopoDS_Edge) (triangulation Poly_Triangulation) p-top-loc)
  (let ((poly-polygon-on-triangulation (allocate-instance (find-class 'Poly_PolygonOnTriangulation))))
    (setf (ff-pointer poly-polygon-on-triangulation) (_wrap_BRep_Tool_PolygonOnTriangulation (ff-pointer edge) (ff-pointer triangulation) p-top-loc))
    poly-polygon-on-triangulation))

(defmethod get-nodes ((self Poly_PolygonOnTriangulation))
  (let ((nodes (allocate-instance (load-time-value (find-class 'TColStd_Array1OfInteger)))))
    (setf (ff-pointer nodes) (_wrap_Poly_PolygonOnTriangulation_Nodes (ff-pointer self)))
    nodes))

(defclass Geom2d_BoundedCurve (Geom2d_Curve) ())

(defclass Geom2d_TrimmedCurve (Geom2d_BoundedCurve) ())

(defmethod initialize-instance :after ((object Geom2d_TrimmedCurve) &rest initargs
				       &key C U1 U2 Sense &allow-other-keys)
  (let ((pointer
	 (cond ((and C U1 U2 Sense)
		(_wrap_new_Geom2d_TrimmedCurve__SWIG_0 (ff-pointer C) (coerce U1 'double-float)
						       (coerce U2 'double-float)
						       (if Sense (if (zerop Sense) 0 1) 0)))
	       ((and C U1 U2)
		(_wrap_new_Geom2d_TrimmedCurve__SWIG_1 (ff-pointer C) (coerce U1 'double-float)
						       (coerce U2 'double-float)))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (values)))

(defmethod get-value-at ((curve Geom2d_Curve) u)
  (gp::make-pnt2d :ptr (_wrap_Geom2d_Curve_getValueAt (ff-pointer curve) (coerce u 'double-float))))

(defclass GCE2d_Root (ff-pointer-mixin) ())
(defclass GCE2d_MakeSegment (GCE2d_Root) ())

(defmethod initialize-instance :after ((object GCE2d_MakeSegment) &rest initargs
				       &key P1 P2 V Line U1 U2 Point ULast &allow-other-keys)
  (let ((pointer
	 (cond ((and Line P1 P2)
		(_wrap_new_GCE2d_MakeSegment__SWIG_4 (ff-pointer Line) (ptr P1) (ptr P2)))
	       ((and Line Point ULast)
		(_wrap_new_GCE2d_MakeSegment__SWIG_3 (ff-pointer Line) (ptr Point) (coerce ULast 'double-float)))
	       ((and Line U1 U2)
		(_wrap_new_GCE2d_MakeSegment__SWIG_2 (ff-pointer Line) (coerce U1 'double-float) (coerce U2 'double-float)))
	       ((and P1 V P2)
		(_wrap_new_GCE2d_MakeSegment__SWIG_1 (ptr P1) (ptr V) (ptr P2)))
	       ((and P1 P2)
		(_wrap_new_GCE2d_MakeSegment__SWIG_0 (ptr P1) (ptr P2)))
	       (t (error "Invalid arguments to constructor ~S" initargs)))))
    (setf (ff-pointer object) pointer)
    (ff-pointer-finalize object #'_wrap_delete_GCE2d_MakeSegment)
    (values)))

(defmethod value ((self GCE2d_MakeSegment))
  (let ((trimmed-curve (allocate-instance (find-class 'Geom2d_TrimmedCurve))))
    (setf (ff-pointer trimmed-curve) (_wrap_GCE2d_MakeSegment_Value (ff-pointer self)))
    trimmed-curve))

(defmethod build-curves-3d ((s TopoDS_Shape) &optional tolerance continuity max-degree max-segment)
  (if (eq 0 (cond ((and tolerance continuity max-degree max-segment)
		   (_wrap_BRepLib_BuildCurves3d__SWIG_0 (ff-pointer s) tolerance continuity max-degree max-segment))
		  ((and tolerance continuity max-degree)
		   (_wrap_BRepLib_BuildCurves3d__SWIG_1 (ff-pointer s) tolerance continuity max-degree))
		  ((and tolerance continuity)
		   (_wrap_BRepLib_BuildCurves3d__SWIG_2 (ff-pointer s) tolerance continuity))
		  (tolerance
		   (_wrap_BRepLib_BuildCurves3d__SWIG_3 (ff-pointer s) tolerance))
		  (t (_wrap_BRepLib_BuildCurves3d__SWIG_4 (ff-pointer s)))))
      nil t))
					       
(defclass BRepOffsetAPI_ThruSections (BRepBuilderAPI_MakeShape) ())

(defmethod initialize-instance :after ((object BRepOffsetAPI_ThruSections) &rest initargs
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

(defmethod get-location ((self Geom_ElementarySurface))
  (gp::make-pnt :ptr (_wrap_Geom_ElementarySurface_getLocation (ff-pointer self))))

(defclass TopTools_MapOfShape (ff-pointer-mixin)
  ())

(defmethod initialize-instance :after ((instance TopTools_MapOfShape) &rest initargs &key &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer instance) (_wrap_new_TopTools_MapOfShape))
  (values))

(defmethod add ((map TopTools_MapOfShape) (akey TopoDS_Shape))
  (if (zerop (_wrap_TopTools_MapOfShape_Add (ff-pointer map) (ff-pointer akey)))
      nil t))

(defmethod contains ((map TopTools_MapOfShape) (akey TopoDS_Shape))
  (if (zerop (_wrap_TopTools_MapOfShape_Contains (ff-pointer map) (ff-pointer akey)))
      nil t))	     

(defclass TCollection_BasicMapIterator ()
  ())

(defmethod more-p ((collection TCollection_BasicMapIterator))
  (if (zerop (_wrap_TCollection_BasicMapIterator_More (ff-pointer collection)))
      nil t))

(defmethod next ((collection TCollection_BasicMapIterator))
  (_wrap_TCollection_BasicMapIterator_Next collection))

(defclass TopTools_MapIteratorOfMapOfShape (TCollection_BasicMapIterator ff-pointer-mixin)
  ())

(defmethod initialize-instance :after ((instance TopTools_MapIteratorOfMapOfShape) &rest initargs &key aMap &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer instance) (_wrap_new_TopTools_MapIteratorOfMapOfShape aMap))
  (values))

(defmethod map-of-shape-key ((map-iterator TopTools_MapIteratorOfMapOfShape))
  (with-topods-shape (_wrap_TopTools_MapIteratorOfMapOfShape_Key (ff-pointer map-iterator))))
