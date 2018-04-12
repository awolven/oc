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

(defun ff-pointer-finalize (object deleter)
  #+sbcl
  (let ((pointer (ff-pointer object)))
    (sb-ext:finalize object #'(lambda ()
				(funcall deleter pointer)
				(values))
		     :dont-save t)))

(defclass oc:gp_Pnt (ff-pointer-mixin) ())
(defclass gp_XYZ (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj gp_Pnt) &rest initargs
				       &key Coord Xp Yp Zp &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond ((and Xp Yp Zp Coord) (error "Ambiguous arguments to overloaded constructor."))
	      ((and Xp Yp Zp)
	       (assert (typep Xp 'double-float))
	       (assert (typep Yp 'double-float))
	       (assert (typep Zp 'double-float))
	       (_wrap_new_gp_Pnt__SWIG_2 Xp Yp Zp))
	      (Coord (assert (typep Coord 'gp_XYZ))
		     (_wrap_new_gp_Pnt__SWIG_1 (ff-pointer Coord)))
	      (t (_wrap_new_gp_Pnt__SWIG_0))))
  (ff-pointer-finalize obj #'_wrap_delete_gp_Pnt)
  (values))

(defclass oc:gp_Pnt2d (ff-pointer-mixin) ())

(defclass oc:gp_Dir2d (ff-pointer-mixin) ())

(defclass oc:gp_Vec2d (ff-pointer-mixin) ())

(defclass oc:gp_Ax2d (ff-pointer-mixin) ())

(defclass oc:gp_Ax22d (ff-pointer-mixin) ())

(defclass oc:gp_Pln (ff-pointer-mixin) ())

(defclass oc:gp_Vec (ff-pointer-mixin) ())

(defclass oc:gp_Dir (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj gp_Dir) &rest initargs
				       &key V Coord Xv Yv Zv &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond ((or (and V Coord)
		   (and V Xv Yv Zv)
		   (and Coord Xv Yv Zv))
	       (error "Ambiguous arguments to overloaded constructor."))
	      ((and Xv Yv Zv)
	       (assert (typep Xv 'double-float))
	       (assert (typep Yv 'double-float))
	       (assert (typep Zv 'double-float))
	       (_wrap_new_gp_Dir__SWIG_3 Xv Yv Zv))
	      (Coord (assert (typep Coord 'gp_XYZ))
		     (_wrap_new_gp_Dir__SWIG_2 (ff-pointer Coord)))
	      (V (assert (typep V 'gp_Vec))
		 (_wrap_new_gp_Dir__SWIG_1 (ff-pointer V)))
	      (t (_wrap_new_gp_Dir__SWIG_0))))
  (ff-pointer-finalize obj #'_wrap_delete_gp_Dir)
  (values))

(defclass oc:gp_Ax3 (ff-pointer-mixin) ())

(defclass oc:gp_Ax2 (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj gp_Ax2) &rest initargs &key P N Vx &allow-other-keys)
  (declare (ignore initargs))
  (setf (ff-pointer obj)
	(cond ((and P N Vx)
	       (assert (typep P 'gp_Pnt))
	       (assert (typep N 'gp_Dir))
	       (assert (typep Vx 'gp_Dir))
	       (_wrap_new_gp_Ax2__SWIG_1 (ff-pointer P) (ff-pointer N) (ff-pointer Vx)))
	      (t (_wrap_new_gp_Ax2__SWIG_0))))
  (ff-pointer-finalize obj #'_wrap_delete_gp_Ax2)
  (values))	 

(defclass oc:gp_Ax1 (ff-pointer-mixin) ())

(defclass oc:gp_Trsf (ff-pointer-mixin) ())

(defclass oc:gp_Trsf2d (ff-pointer-mixin) ())

(defmethod oc:setRotation ((self oc:gp_Trsf) &rest args)
  (destructuring-bind (A1 Ang) args
    (oc::_wrap_gp_Trsf_SetRotation (ff-pointer self) (ff-pointer A1) Ang)))

(defmethod oc:setTranslation ((self oc:gp_Trsf) &rest args)
  (destructuring-bind (V) args
    (oc::_wrap_gp_Trsf_SetTranslation (ff-pointer self) (ff-pointer V))))

(defmethod oc:setValues ((self oc:gp_Trsf) &rest args)
  (destructuring-bind (a11 a12 a13 a14 a21 a22 a23 a24 a31 a32 a33 a34) args
    (oc::_wrap_gp_Trsf_SetValues (ff-pointer self) a11 a12 a13 a14 a21 a22 a23 a24 a31 a32 a33 a34)))

(defclass oc:gp_Circ (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj oc:gp_Circ) &rest initargs &key axis radius &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep axis 'oc:gp_Ax2))
  (assert (typep radius 'double-float))
  (setf (ff-pointer obj) (oc::_wrap_new_gp_Circ (ff-pointer axis) radius))
  (ff-pointer-finalize obj #'oc::_wrap_delete_gp_Circ)
  (values))

(defclass oc:gp_Cone (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj oc:gp_Cone) &rest initargs &key A3 Angle Radius &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep A3 'oc:gp_Ax3))
  (assert (typep Angle 'double-float))
  (assert (typep Radius 'double-float))
  (setf (ff-pointer obj) (oc::_wrap_new_gp_Cone (ff-pointer A3) Angle Radius))
  (ff-pointer-finalize obj #'oc::_wrap_delete_gp_Cone)
  (values))

(defclass oc:gp_Cylinder (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj oc:gp_Cylinder) &rest initargs &key A3 Radius &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep A3 'oc:gp_Ax3))
  (assert (typep Radius 'double-float))
  (setf (ff-pointer obj) (oc::_wrap_new_gp_Cylinder (ff-pointer A3) Radius))
  (ff-pointer-finalize obj #'oc::_wrap_delete_gp_Cylinder)
  (values))

(defclass oc:gp_Parab (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj oc:gp_Parab) &rest initargs &key A2 Focal D F &allow-other-keys)
  (declare (ignore initargs))
  (cond ((and A2 Focal D F) (error "Ambiguous arguments to overloaded constructor."))
	 ((and A2 Focal)
	  (assert (typep A2 'oc:gp_Ax2))
	  (assert (typep Focal 'double-float))
	  (setf (ff-pointer obj)
		(oc::_wrap_new_gp_Parab__SWIG_0 (ff-pointer A2) Focal))
	  (ff-pointer-finalize obj #'oc::_wrap_delete_gp_Parab))
	 ((and D F)
	  (assert (typep D 'oc:gp_Ax1))
	  (assert (typep F 'oc:gp_Pnt))
	  (setf (ff-pointer obj)
		(oc::_wrap_new_gp_Parab__SWIG_1 (ff-pointer D) (ff-pointer F)))
	  (ff-pointer-finalize obj #'oc::_wrap_delete_gp_Parab))
	 ((or (null A2) (null D) (null Focal) (null F)) (error "Insufficient arguments to constructor.")))
  (values))

(defclass oc:gp_Hypr (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj oc:gp_Hypr) &rest initargs &key A2 MajorRadius MinorRadius
									 &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep A2 'oc:gp_Ax2))
  (assert (typep MajorRadius 'double-float))
  (assert (typep MinorRadius 'double-float))
  (setf (ff-pointer obj) (oc::_wrap_new_gp_Hypr A2 MajorRadius MinorRadius))
  (ff-pointer-finalize obj #'oc::_wrap_delete_gp_Hypr)
  (values))

(defclass oc:gp_Torus (ff-pointer-mixin) ())

(defmethod initialize-instance :after ((obj oc:gp_Torus) &rest initargs &key A3 MajorRadius MinorRadius
									  &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep A3 'oc:gp_Ax3))
  (assert (typep MajorRadius 'double-float))
  (assert (typep MinorRadius 'double-float))
  (setf (ff-pointer obj) (oc::_wrap_new_gp_Torus A3 MajorRadius MinorRadius))
  (ff-pointer-finalize obj #'oc::_wrap_delete_gp_Torus)
  (values))

(defclass Geom_Surface (ff-pointer-mixin) ())

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
  (if (zerop (_wrap_BRepBuilderAPI_Command_isDone (ff-pointer self)))
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

(defclass TopoDS_Compsolid (TopoDS_Shape) ())

(defmacro with-topods-shape (&body ff-call)
  `(let* ((ff-shape ,@ff-call)
	  (shape-class (case (_wrap_TopoDS_Shape_ShapeType ff-shape)
			 (:TopAbs_COMPOUND (load-time-value (find-class 'TopoDS_Compound)))
			 (:TopAbs_COMPSOLID (load-time-value (find-class 'TopoDS_Compsolid)))
			 (:TopAbs_SOLID (load-time-value (find-class 'TopoDS_Solid)))
			 (:TopAbs_SHELL (load-time-value (find-class 'TopoDS_Shell)))
			 (:TopAbs_FACE (load-time-value (find-class 'TopoDS_Face)))
			 (:TopAbs_WIRE (load-time-value (find-class 'TopoDS_Wire)))
			 (:TopAbs_EDGE (load-time-value (find-class 'TopoDS_Edge)))
			 (:TopAbs_VERTEX (load-time-value (find-class 'TopoDS_Vertex)))
			 (:TopAbs_SHAPE (load-time-value (find-class 'TopoDS_Shape)))))
	  (shape (allocate-instance shape-class)))
     (setf (ff-pointer shape) ff-shape)
     shape))

(defmethod shape-reversed ((self TopoDS_Shape))
  (with-topods-shape (_wrap_TopoDS_Shape_Reversed (ff-pointer self))))

(defmethod shape ((self BRepBuilderAPI_MakeShape))
  (with-topods-shape (_wrap_BRepBuilderAPI_MakeShape_shape (ff-pointer self))))

(defclass BRepPrimAPI_MakeCone (BRepBuilderAPI_MakeShape) ())

(defmethod initialize-instance :after ((obj BRepPrimAPI_MakeCone) &rest initargs
				       &key axes baseRadius topRadius height angle &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep axes 'oc:gp_Ax2))
  (assert (typep baseRadius 'double-float))
  (assert (typep topRadius 'double-float))
  (assert (typep height 'double-float))
  (assert (typep angle 'double-float))
  (setf (ff-pointer obj) (_wrap_new_BRepPrimAPI_MakeCone (ff-pointer axes) baseRadius topRadius height angle))
  (ff-pointer-finalize obj #'_wrap_delete_BRepPrimAPI_MakeCone)
  (values))

(defclass BRepPrimAPI_MakeSphere (BRepBuilderAPI_MakeShape) ())

(defmethod initialize-instance :after ((obj BRepPrimAPI_MakeSphere) &rest initargs
				       &key center radius axis R angle1 angle2 angle3 &allow-other-keys)
  (declare (ignore initargs))
  (cond ((and center radius axis R angle1 angle2 angle3)
	 (error "Ambiguous arguments to overloaded constructor."))
	((and center radius)
	 (assert (typep center 'gp_Pnt))
	 (assert (typep radius 'double-float))
	 (setf (ff-pointer obj)
	       (_wrap_new_BRepPrimAPI_MakeSphere__SWIG_0 (ff-pointer center) radius))
	 (ff-pointer-finalize obj #'_wrap_delete_BRepPrimAPI_MakeSphere)
	 (values))
	((and axis R angle1 angle2 angle3)
	 (assert (typep axis 'gp_Ax2))
	 (assert (typep R 'double-float))
	 (assert (typep angle1 'double-float))
	 (assert (typep angle2 'double-float))
	 (assert (typep angle3 'double-float))
	 (_wrap_new_BRepPrimAPI_MakeSphere__SWIG_1 (ff-pointer axis) R angle1 angle2 angle3)
	 (ff-pointer-finalize obj #'_wrap_delete_BRepPrimAPI_MakeSphere)
	 (values))
	(t (error "Insufficient arguments to constructor."))))

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
  (_wrap_TopoDS_Iterator_More (ff-pointer self)))

(defmethod next ((self TopoDS_Iterator))
  (_wrap_TopoDS_Iterator_Next (ff-pointer self)))

(defmethod value ((self TopoDS_Iterator))
  (with-topods-shape (_wrap_TopoDS_Iterator_value (ff-pointer self))))

(defclass BRepBuilderAPI_MakeVertex (BRepBuilderAPI_MakeShape) ())

(defmethod initialize-instance :after ((obj BRepBuilderAPI_MakeVertex) &rest initargs
				      &key P &allow-other-keys)
  (declare (ignore initargs))
  (assert (typep P 'gp_Pnt))
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

(defclass Geom_Geometry (ff-pointer-mixin) ())

(defclass Geom_Curve (Geom_Geometry) ())

(defclass Geom_Surface (Geom_Geometry) ())

(defclass Geom2d_Geometry (ff-pointer-mixin) ())

(defclass Geom2d_Curve (Geom2d_Geometry) ())

(defclass BRepBuilderAPI_MakeWire (BRepBuilderAPI_MakeShape) ())

(defmethod add ((self BRepBuilderAPI_MakeWire) (E TopoDS_Edge))
  (_wrap_BRepBuilderAPI_MakeWire_Add__SWIG_0 (ff-pointer self) (ff-pointer E)))

(defmethod add ((self BRepBuilderAPI_MakeWire) (W TopoDS_Wire))
  (_wrap_BRepBuilderAPI_MakeWire_Add__SWIG_1 (ff-pointer self) (ff-pointer W)))

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

	      ((typep L 'gp_Parab)
	       (cond ((and (typep V1 'TopoDS_Vertex) (typep V2 'TopoDS_Vertex))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_11 (ff-pointer L) (ff-pointer V1) (ff-pointer V2)))
		     ((and (typep POINT1 'gp_Pnt) (typep POINT2 'gp_Pnt))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_10
		       (ff-pointer L) (ff-pointer POINT1) (ff-pointer POINT2)))
		     ((and (typep param1 'double-float) (typep param2 'double-float))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_9 (ff-pointer L) param1 param2))
		     (t (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_8 (ff-pointer L)))))
	 
	      ((typep L 'gp_Circ)
	       (cond ((and (typep V1 'TopoDS_Vertex) (typep V2 'TopoDS_Vertex))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_7 (ff-pointer L) (ff-pointer V1) (ff-pointer V2)))
		     ((and (typep POINT1 'gp_Pnt) (typep POINT2 'gp_Pnt))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_6 (ff-pointer L) (ff-pointer POINT1) (ff-pointer POINT2)))
		     ((and (typep param1 'double-float) (typep param2 'double-float))
		      (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_5 (ff-pointer L) param1 param2))
		     (t (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_4 (ff-pointer L)))))
	 
	      ((and (typep POINT1 'gp_Pnt) (typep POINT2 'gp_Pnt))
	       (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_3 (ff-pointer POINT1) (ff-pointer POINT2)))
	
	      ((and (typep V1 'TopoDS_Vertex) (typep V2 'TopoDS_Vertex))
	       (_wrap_new_BRepBuilderAPI_MakeEdge__SWIG_2 (ff-pointer V1) (ff-pointer V2)))
  
	      (t (error "Invalid arguments to make-instance of BRepBuilderAPI_MakeEdge (2)."))))
  (ff-pointer-finalize obj #'_wrap_delete_BRepBuilderAPI_MakeEdge)
  (values))

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
  (_wrap_TopExp_Explorer_more (ff-pointer self)))

(defmethod current ((self TopExp_Explorer))
  (with-topods-shape (_wrap_TopExp_Explorer_Current (ff-pointer self))))

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
  (let ((p (allocate-instance (load-time-value (find-class 'gp_Pnt)))))
    (setf (ff-pointer p) (_wrap_TColgp_Array1OfPnt_value (ff-pointer self) index))
    p))

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


