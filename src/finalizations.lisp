(in-package :oc)

(defun finalize-gpthing (gpthing &key owner)
  (ecase owner
    (:native (finalize-gpthing-native gpthing))
    (:foreign (finalize-gpthing-foreign gpthing))))

(defun finalize-gpthing-native (gpthing)
  (declare (ignorable gpthing))
  #+native-finalizations
  (let ((type (type-of gpthing))
	(ptr (gp:ptr gpthing)))
    (declare (ignorable type ptr))
    #+SBCL
    (sb-ext:finalize gpthing
		     (lambda ()
		       #+debug
		       (format *debug-io* "~&Freeing native ~S: ~S" type ptr)
		       (cffi:foreign-free ptr))
		     :dont-save t)))

(defun finalize-gpthing-foreign (gpthing)
  (declare (ignorable gpthing))
  #+foreign-unmanaged-finalizations
  (let ((type (type-of gpthing))
	(ptr (gp:ptr gpthing))
	(free-fn (foreign-free-fn gpthing)))
    (declare (ignorable type ptr))
    #+SBCL
    (sb-ext:finalize gpthing
		     (lambda ()
		       #+debug
		       (format *debug-io* "~&Freeing foreign ~S: ~S" type ptr)
		       (funcall free-fn ptr))
		     :dont-save t)))


(defmethod finalize (object &optional (owner :foreign))
  (declare (ignorable owner))
  #+unmanaged-finalizations
  (let ((type (type-of object))
	(ptr (ff-pointer object))
	(free-fn (foreign-free-fn object)))
    (declare (ignorable type ptr))
      #+SBCL
      (sb-ext:finalize object
		       (lambda ()
			 #+debug
			 (format *debug-io* "~&freeing ~S ~S: ~S" owner type ptr)
			 (funcall free-fn ptr))
		       :dont-save t)))

(defmethod finalize ((object mmgt-tshared) &optional owner)
  (declare (ignore owner))
  #+foreign-managed-finalizations
  (let ((type (type-of object))
	(ptr (ff-pointer object))
	(free-fn (foreign-free-fn object)))
    (declare (ignorable type ptr))
    #+SBCL
    (sb-ext:finalize object
		     (lambda ()
		       #+debug
		       (format *debug-io* "~&Ending Scope of foreign ~S: ~S" type ptr)
		       (funcall free-fn ptr))
		     :dont-save t)))

(defmethod finalize ((object gp:xy) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:xy))
  #'_wrap_delete_gp_XY)

(defmethod finalize ((object gp:vec2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:vec2d))
  #'_wrap_delete_gp_Vec2d)

(defmethod finalize ((object gp:pnt2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:pnt2d))
  #'_wrap_delete_gp_Pnt2d)

(defmethod finalize ((object gp:dir2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:dir2d))
  #'_wrap_delete_gp_Dir2d)

(defmethod finalize ((object gp:ax2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:ax2d))
  #'_wrap_delete_gp_Ax2d)

(defmethod finalize ((object gp:lin2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:lin2d))
  #'_wrap_delete_gp_Lin2d)

(defmethod finalize ((object gp:circ2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:circ2d))
  #'_wrap_delete_gp_Circ2d)

(defmethod finalize ((object gp:elips2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:elips2d))
  #'_wrap_delete_gp_Elips2d)

(defmethod finalize ((object gp:hypr2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:hypr2d))
  #'_wrap_delete_gp_Hypr2d)

(defmethod finalize ((object gp:parab2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:parab2d))
  #'_wrap_delete_gp_Parab2d)

(defmethod finalize ((object gp:mat2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:mat2d))
  #'_wrap_delete_gp_Mat2d)

(defmethod finalize ((object gp:trsf2d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:trsf2d))
  #'_wrap_delete_gp_Trsf2d)

(defmethod finalize ((object gp:xyz) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:xyz))
  #'_wrap_delete_gp_XYZ)

(defmethod finalize ((object gp:vec) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:vec))
  #'_wrap_delete_gp_Vec)

(defmethod finalize ((object gp:pnt) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:pnt))
  #'_wrap_delete_gp_Pnt)

(defmethod finalize ((object gp:dir) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:dir))
  #'_wrap_delete_gp_Dir)

(defmethod finalize ((object gp:mat) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:mat))
  #'_wrap_delete_gp_Mat)

(defmethod finalize ((object gp:ax1) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:ax1))
  #'_wrap_delete_gp_Ax1)

(defmethod finalize ((object gp:ax2) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:ax2))
  #'_wrap_delete_gp_Ax2)

(defmethod finalize ((object gp:ax22d) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:ax22d))
  #'_wrap_delete_gp_Ax22d)

(defmethod finalize ((object gp:ax3) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:ax3))
  #'_wrap_delete_gp_Ax3)

(defmethod finalize ((object gp:lin) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:lin))
  #'_wrap_delete_gp_Lin)

(defmethod finalize ((object gp:circ) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:circ))
  #'_wrap_delete_gp_Circ)

(defmethod finalize ((object gp:elips) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:elips))
  #'_wrap_delete_gp_Elips)

(defmethod finalize ((object gp:parab) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:parab))
  #'_wrap_delete_gp_Parab)

(defmethod finalize ((object gp:hypr) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:hypr))
  #'_wrap_delete_gp_Hypr)

(defmethod finalize ((object gp:pln) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:pln))
  #'_wrap_delete_gp_Pln)

(defmethod finalize ((object gp:cone) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:cone))
  #'_wrap_delete_gp_Cone)

(defmethod finalize ((object gp:cylinder) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:cylinder))
  #'_wrap_delete_gp_Cylinder)

(defmethod finalize ((object gp:trsf) &optional (owner :foreign))
  (finalize-gpthing object :owner owner))

(defmethod foreign-free-fn ((object gp:trsf))
  #'_wrap_delete_gp_Trsf)




(defmethod foreign-free-fn ((object adaptor2d-curve2d))
  #'_wrap_delete_Adaptor2d_Curve2d)

#+NOTYET
(defmethod foreign-free-fn ((object adaptor2d-hcurve2d))
  #'_wrap_delete_Adaptor2d_HCurve2d)

(defmethod foreign-free-fn ((object adaptor3d-curve))
  #'_wrap_delete_Adaptor3d_Curve)

#+NOTYET
(defmethod foreign-free-fn ((object api-header-section-make-header))
  #'_wrap_delete_APIHeaderSection_MakeHeader)

(defmethod foreign-free-fn ((object bnd-box))
  #'_wrap_delete_Bnd_Box)

(defmethod foreign-free-fn ((object brep-builder))
  #'_wrap_delete_BRep_Builder)

(defmethod foreign-free-fn ((object brep-algo))
  #'_wrap_delete_BRepAlgo)

(defmethod foreign-free-fn ((object brep-algo-api-boolean-operation))
  #'_wrap_delete_BRepAlgoAPI_BooleanOperation)

(defmethod foreign-free-fn ((object brep-algo-api-common))
  #'_wrap_delete_BRepAlgoAPI_Common)

(defmethod foreign-free-fn ((object brep-algo-api-cut))
  #'_wrap_delete_BRepAlgoAPI_Cut)

(defmethod foreign-free-fn ((object brep-algo-api-fuse))
  #'_wrap_delete_BRepAlgoAPI_Fuse)

(defmethod foreign-free-fn ((object brep-algo-api-section))
  #'_wrap_delete_BRepAlgoAPI_Section)

(defmethod foreign-free-fn ((object brep-builder-api-command))
  #'_wrap_delete_BRepBuilderAPI_Command)

(defmethod foreign-free-fn ((object brep-builder-api-make-edge))
  #'_wrap_delete_BRepBuilderAPI_MakeEdge)

(defmethod foreign-free-fn ((object brep-builder-api-make-face))
  #'_wrap_delete_BRepBuilderAPI_MakeFace)

(defmethod foreign-free-fn ((object brep-builder-api-make-shape))
  #'_wrap_delete_BRepBuilderAPI_MakeShape)

#+NOTYET
(defmethod foreign-free-fn ((object brep-builder-api-make-shell))
  #'_wrap_delete_BRepBuilderAPI_MakeShell)

#+NOTYET
(defmethod foreign-free-fn ((object brep-builder-api-make-solid))
  #'_wrap_delete_BRepBuilderAPI_MakeSolid)

(defmethod foreign-free-fn ((object brep-builder-api-make-vertex))
  #'_wrap_delete_BRepBuilderAPI_MakeVertex)

(defmethod foreign-free-fn ((object brep-builder-api-make-wire))
  #'_wrap_delete_BRepBuilderAPI_MakeWire)

(defmethod foreign-free-fn ((object brep-builder-api-modify-shape))
  #'_wrap_delete_BRepBuilderAPI_ModifyShape)

#+NOTYET
(defmethod foreign-free-fn ((object brep-builder-api-nurbs-convert))
  #'_wrap_delete_BRepBuilderAPI_NurbsConvert)

#+NOTYET
(defmethod foreign-free-fn ((object brep-builder-api-sewing))
  #'_wrap_delete_BRepBuilderAPI_Sewing)

(defmethod foreign-free-fn ((object brep-builder-api-transform))
  #'_wrap_delete_BRepBuilderAPI_Transform)

#+NOTYET
(defmethod foreign-free-fn ((object brep-check-analyzer))
  #'_wrap_delete_BRepCheck_Analyzer)

(defmethod foreign-free-fn ((object brep-fillet-api-local-operation))
  #'_wrap_delete_BRepFilletAPI_LocalOperation)

#+NOTYET
(defmethod foreign-free-fn ((object brep-fillet-api-make-chamfer))
  #'_wrap_delete_BRepFilletAPI_MakeChamfer)

(defmethod foreign-free-fn ((object brep-fillet-api-make-fillet))
  #'_wrap_delete_BRepFilletAPI_MakeFillet)

#+NOTYET
(defmethod foreign-free-fn ((object brep-gprop))
  #'_wrap_delete_BRep_GProp)

(defmethod foreign-free-fn ((object brep-mesh-discret-root))
  #'_wrap_delete_BRepMesh_DiscretRoot)

(defmethod foreign-free-fn ((object brep-mesh-incremental-mesh))
  #'_wrap_delete_BRepMesh_IncrementalMesh)

#+NOTYET
(defmethod foreign-free-fn ((object brep-offset-api-make-offset-shape))
  #'_wrap_delete_BRepOffsetAPI_MakeOffsetShape)

#+NOTYET
(defmethod foreign-free-fn ((object brep-offset-api-make-pipe))
  #'_wrap_delete_BRepOffsetAPI_MakePipe)

(defmethod foreign-free-fn ((object brep-offset-api-make-thick-solid))
  #'_wrap_delete_BRepOffsetAPI_MakeThickSolid)

(defmethod foreign-free-fn ((object brep-offset-api-normal-projection))
  #'_wrap_delete_BRepOffsetAPI_NormalProjection)

(defmethod foreign-free-fn ((object brep-offset-api-thru-sections))
  #'_wrap_delete_BRepOffsetAPI_ThruSections)

#+NOTYET
(defmethod foreign-free-fn ((object brep-prim-api-make-box))
  #'_wrap_delete_BRepPrimAPI_MakeBox)

(defmethod foreign-free-fn ((object brep-prim-api-make-cone))
  #'_wrap_delete_BRepPrimAPI_MakeCone)

(defmethod foreign-free-fn ((object brep-prim-api-make-cylinder))
  #'_wrap_delete_BRepPrimAPI_MakeCylinder)

(defmethod foreign-free-fn ((object brep-prim-api-make-prism))
  #'_wrap_delete_BRepPrimAPI_MakePrism)

#+NOTYET
(defmethod foreign-free-fn ((object brep-prim-api-make-revol))
  #'_wrap_delete_BRepPrimAPI_MakeRevol)

(defmethod foreign-free-fn ((object brep-prim-api-make-sweep))
  #'_wrap_delete_BRepPrimAPI_MakeSweep)

#+NOTYET
(defmethod foreign-free-fn ((object brep-prim-api-make-torus))
  #'_wrap_delete_BRepPrimAPI_MakeTorus)



(defmethod foreign-free-fn ((object geom2d-axis-placement))
  #'_wrap_Geom2d_AxisPlacement_Delete)

(defmethod foreign-free-fn ((object geom2d-bezier-curve))
  #'_wrap_Geom2d_BezierCurve_Delete)

(defmethod foreign-free-fn ((object geom2d-bspline-curve))
  #'_wrap_Geom2d_BSplineCurve_Delete)

(defmethod foreign-free-fn ((object geom2d-cartesian-point))
  #'_wrap_Geom2d_CartesianPoint_Delete)

(defmethod foreign-free-fn ((object geom2d-circle))
  #'_wrap_Geom2d_Circle_Delete)

(defmethod foreign-free-fn ((object geom2d-direction))
  #'_wrap_Geom2d_Direction_Delete)

(defmethod foreign-free-fn ((object geom2d-ellipse))
  #'_wrap_Geom2d_Ellipse_Delete)

(defmethod foreign-free-fn ((object geom2d-hyperbola))
  #'_wrap_Geom2d_Hyperbola_Delete)

(defmethod foreign-free-fn ((object geom2d-line))
  #'_wrap_Geom2d_Line_Delete)

(defmethod foreign-free-fn ((object geom2d-offset-curve))
  #'_wrap_Geom2d_OffsetCurve_Delete)

(defmethod foreign-free-fn ((object geom2d-parabola))
  #'_wrap_Geom2d_Parabola_Delete)

(defmethod foreign-free-fn ((object geom2d-transformation))
  #'_wrap_Geom2d_Transformation_Delete)

(defmethod foreign-free-fn ((object geom2d-trimmed-curve))
  #'_wrap_Geom2d_TrimmedCurve_Delete)

(defmethod foreign-free-fn ((object geom2d-vector-with-magnitude))
  #'_wrap_Geom2d_VectorWithMagnitude_Delete)

(defmethod foreign-free-fn ((object geom-bezier-curve))
  #'_wrap_Geom_BezierCurve_Delete)

(defmethod foreign-free-fn ((object geom-bezier-surface))
  #'_wrap_Geom_BezierSurface_Delete)

(defmethod foreign-free-fn ((object geom-bspline-curve))
  #'_wrap_Geom_BSplineCurve_Delete)

(defmethod foreign-free-fn ((object geom-bspline-surface))
  #'_wrap_Geom_BSplineSurface_Delete)

(defmethod foreign-free-fn ((object geom-circle))
  #'_wrap_Geom_Circle_Delete)

(defmethod foreign-free-fn ((object geom-conical-surface))
  #'_wrap_Geom_ConicalSurface_Delete)

(defmethod foreign-free-fn ((object geom-cylindrical-surface))
  #'_wrap_Geom_CylindricalSurface_Delete)

(defmethod foreign-free-fn ((object geom-ellipse))
  #'_wrap_Geom_Ellipse_Delete)

(defmethod foreign-free-fn ((object geom-hyperbola))
  #'_wrap_Geom_Hyperbola_Delete)

(defmethod foreign-free-fn ((object geom-line))
  #'_wrap_Geom_Line_Delete)

(defmethod foreign-free-fn ((object geom-offset-curve))
  #'_wrap_Geom_OffsetCurve_Delete)

(defmethod foreign-free-fn ((object geom-offset-surface))
  #'_wrap_Geom_OffsetSurface_Delete)

(defmethod foreign-free-fn ((object geom-parabola))
  #'_wrap_Geom_Parabola_Delete)

(defmethod foreign-free-fn ((object geom-plane))
  #'_wrap_Geom_Plane_Delete)

(defmethod foreign-free-fn ((object geom-rectangular-trimmed-surface))
  #'_wrap_Geom_RectangularTrimmedSurface_Delete)

(defmethod foreign-free-fn ((object geom-spherical-surface))
  #'_wrap_Geom_SphericalSurface_Delete)

(defmethod foreign-free-fn ((object geom-surface-of-linear-extrusion))
  #'_wrap_Geom_SurfaceOfLinearExtrusion_Delete)

(defmethod foreign-free-fn ((object geom-surface-of-revolution))
  #'_wrap_Geom_SurfaceOfRevolution_Delete)

(defmethod foreign-free-fn ((object geom-toroidal-surface))
  #'_wrap_Geom_ToroidalSurface_Delete)

(defmethod foreign-free-fn ((object geom-trimmed-curve))
  #'_wrap_Geom_TrimmedCurve_Delete)

(defmethod foreign-free-fn ((object gc-make-arc-of-circle))
  #'_wrap_delete_GC_MakeArcOfCircle)

(defmethod foreign-free-fn ((object gc-make-segment))
  #'_wrap_delete_GC_MakeSegment)

(defmethod foreign-free-fn ((object top-exp-explorer))
  #'_wrap_delete_TopExp_Explorer)

(defmethod foreign-free-fn ((object gce2d-make-segment))
  #'_wrap_delete_GCe2d_MakeSegment)

(defmethod foreign-free-fn ((object topods-compound))
  #'_wrap_delete_TopoDS_Compound)

(defmethod foreign-free-fn ((object topods-iterator))
  #'_wrap_delete_TopoDS_Iterator)

(defmethod foreign-free-fn ((object cpnts-uniform-deflection))
  #'_wrap_delete_CPnts_UniformDeflection)
