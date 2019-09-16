(in-package :oc)

(defun make-bucket ()
  (let* ((bucket-location (pnt 0 0 0))
	 (bucket-axis (dir 0 0 1))
	 (bucket-ax2 (gp::make-ax2 :ptr (_wrap_new_gp_Ax2__SWIG_1 (ptr bucket-location) (ptr bucket-axis))))
	 (mk-cylinder
	  (make-instance 'BRepPrimAPI_MakeCylinder
			 :Axes bucket-ax2
			 :R 25.0d0
			 :H 50.0d0))
	 (s (shape mk-cylinder)))
    (let ((faces-to-remove  (make-instance 'TopTools_ListOfShape))
	  (a-face-explorer (make-instance 'TopExp_Explorer :S s :ToFind TopAbs_FACE))
	  (z-max -1.0d0)
	  (face-to-remove))
	    
      (loop while (more-p a-face-explorer)
	 do (let ((face (current a-face-explorer)))
	      (let ((surface (surface face)))
		(when (typep surface 'Geom_Plane)
		  (let ((a-pnt (get-location surface)))
		    (when (> (Z a-pnt) z-max)
		      (setq z-max (Z a-pnt)
			    face-to-remove face))))))
	   (next a-face-explorer))
      (list-append faces-to-remove face-to-remove)
      (let ((thick-solid (make-instance 'BRepOffsetAPI_MakeThickSolid
					:S s :ClosingFaces faces-to-remove
					:Offset -2.5d0
					:Tol 1.0d-3)))
	(setq s (shape thick-solid)))
      s)))
      
    

(defun make-bottle (&optional (my-width 50) (my-height 70) (my-thickness 30))
  (let* ((a-pnt1 (pnt (/ (- my-width) 2) 0 0))
	 (a-pnt2 (pnt (/ (- my-width) 2) (/ (- my-thickness) 4) 0))
	 (a-pnt3 (pnt 0 (/ (- my-thickness) 2) 0))
	 (a-pnt4 (pnt (/ my-width 2) (/ (- my-thickness) 4) 0))
	 (a-pnt5 (pnt (/ my-width 2) 0 0))
	 (a-arc-of-circle (value (make-instance 'GC_MakeArcOfCircle :P1 a-pnt2 :P2 a-pnt3 :P3 a-pnt4)))
	 (a-segment1 (value (make-instance 'GC_MakeSegment :P1 a-pnt1 :P2 a-pnt2)))
	 (a-segment2 (value (make-instance 'GC_MakeSegment :P1 a-pnt4 :P2 a-pnt5)))
	 (edge1 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L a-segment1)))
	 (edge2 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L a-arc-of-circle)))
	 (edge3 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L a-segment2)))
	 (a-wire (wire (make-instance 'BRepBuilderAPI_MakeWire :E1 edge1 :E2 edge2 :E3 edge3)))
	 (a-origin (pnt 0 0 0))
	 (x-dir (dir 1 0 0))
	 (x-axis (ax1 a-origin x-dir))
	 (a-trsf (gp::make-trsf :ptr (_wrap_new_gp_Trsf__SWIG_0))))
    (set-mirror a-trsf x-axis)
    (let ((a-mirrored-wire (shape (make-instance 'BRepBuilderAPI_Transform :S a-wire :Trsf a-trsf)))
	  (make-wire (make-instance 'BRepBuilderAPI_MakeWire)))
      (add make-wire a-wire)
      (add make-wire a-mirrored-wire)
      (let* ((my-body
	      (shape (make-instance 'BRepPrimAPI_MakePrism :baseShape
				    (face (make-instance 'BrepBuilderAPI_MakeFace :W (wire make-wire)))
				    :extrudeDirection (vec 0 0 my-height))))
	     (mk-fillet	(make-instance 'BRepFilletAPI_MakeFillet :shape my-body)))
	(let ((explorer (make-instance 'TopExp_Explorer :S my-body :ToFind TopAbs_EDGE))
	      (radius (coerce (/ my-thickness 12) 'double-float)))
	  
	  (loop while (more-p explorer)
	     do (let ((an-edge (current explorer)))
		  (add-shape mk-fillet radius an-edge)
		  (next explorer))))
		
	(setq my-body (shape mk-fillet))
		
	(let* ((neck-location (pnt 0 0 my-height))
	       (neck-axis (dir 0 0 1))
	       (neck-ax2 (gp::make-ax2 :ptr (_wrap_new_gp_Ax2__SWIG_1 (ptr neck-location) (ptr neck-axis))))
	       (my-neck-radius (coerce (/ my-thickness 4) 'double-float))
	       (my-neck-height (coerce (/ my-height 10) 'double-float))
	       (mk-cylinder (make-instance 'BRepPrimAPI_MakeCylinder
					   :Axes neck-ax2
					   :R my-neck-radius
					   :H my-neck-height))
	       (my-neck (shape mk-cylinder))
	       (fuse (make-instance 'BRepAlgoAPI_Fuse :S1 my-body :S2 my-neck)))
		  
	  (setq my-body (shape fuse))
		    
	  (let ((faces-to-remove  (make-instance 'TopTools_ListOfShape))
		(a-face-explorer (make-instance 'TopExp_Explorer :S my-body :ToFind TopAbs_FACE))
		(z-max -1.0d0)
		(face-to-remove))
	    
	    (loop while (more-p a-face-explorer)
	       do (let ((face (current a-face-explorer)))
		    (let ((surface (surface face)))
		      (when (typep surface 'Geom_Plane)
			(let ((a-pnt (get-location surface)))
			  (when (> (Z a-pnt) z-max)
			    (setq z-max (Z a-pnt)
				  face-to-remove face))))))
		 (next a-face-explorer))
	    (list-append faces-to-remove face-to-remove)
	    (let ((thick-solid (make-instance 'BRepOffsetAPI_MakeThickSolid
					      :S my-body :ClosingFaces faces-to-remove
					      :Offset (/ (- my-thickness) 50.0d0)
					      :Tol 1.0d-3)))
	      
	      (setq my-body (shape thick-solid))))
		  
	  (let* ((a-cyl1 (make-instance 'Geom_CylindricalSurface :A2 neck-ax2 :Radius (* my-neck-radius 0.99d0)))
		 (a-cyl2 (make-instance 'Geom_CylindricalSurface :A2 neck-ax2 :Radius (* my-neck-radius 1.05d0)))
		 (a-pnt (pnt2d (* 2 pi) (/ my-neck-height 2)))
		 (a-dir (dir2d (* 2 pi) (/ my-neck-height 4)))
		 (an-ax2d (ax2d a-pnt a-dir))
		 (a-major (* 2 pi))
		 (a-minor (/ my-neck-height 10.0d0))
		 (an-ellipse1 (make-instance 'Geom2d_Ellipse :MajorAxis an-ax2d :MajorRadius a-major :MinorRadius a-minor))
		 (an-ellipse2 (make-instance 'Geom2d_Ellipse :MajorAxis an-ax2d :MajorRadius a-major :MinorRadius (/ a-minor 4.0d0)))
		 (an-arc1 (make-instance 'Geom2d_TrimmedCurve :C an-ellipse1 :U1 0.0d0 :U2 pi))
		 (an-arc2 (make-instance 'Geom2d_TrimmedCurve :C an-ellipse2 :U1 0.0d0 :U2 pi))
		 (an-ellipse-pnt1 (get-value-at an-ellipse1 0.0d0))
		 (an-ellipse-pnt2 (get-value-at an-ellipse1 pi))
		 (a-segment (value (make-instance 'GCE2d_MakeSegment :P1 an-ellipse-pnt1 :P2 an-ellipse-pnt2)))
		 (an-edge1-on-surf1 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L an-arc1 :S a-cyl1)))
		 (an-edge2-on-surf1 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L a-segment :S a-cyl1)))
		 (an-edge1-on-surf2 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L an-arc2 :S a-cyl2)))
		 (an-edge2-on-surf2 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L a-segment :S a-cyl2)))
		 (threading-wire1 (wire (make-instance 'BRepBuilderAPI_MakeWire
						       :E1 an-edge1-on-surf1
						       :E2 an-edge2-on-surf1)))
		 (threading-wire2 (wire (make-instance 'BRepBuilderAPI_MakeWire
						       :E1 an-edge1-on-surf2
						       :E2 an-edge2-on-surf2))))

	    (build-curves-3d threading-wire1)
	    (build-curves-3d threading-wire2)
	    (let ((a-tool (make-instance 'BRepOffsetAPI_ThruSections :isSolid t ;;:ruled nil :pres3d 1.0d-6
					 )))
	      (_wrap_BRepOffsetAPI_ThruSections_AddWire (ff-pointer a-tool) (ff-pointer threading-wire1))
	      (_wrap_BRepOffsetAPI_ThruSections_AddWire (ff-pointer a-tool) (ff-pointer threading-wire2))
	      (_wrap_BRepOffsetAPI_ThruSections_CheckCompatibility__SWIG_0 (ff-pointer a-tool) 0)
	      (let ((my-threading (shape a-tool))
		    (a-res (make-instance 'TopoDS_Compound))
		    (a-builder (_wrap_new_BRep_Builder)))

		(_wrap_TopoDS_Builder_MakeCompound a-builder (ff-pointer a-res))
		(_wrap_topods_builder_add a-builder (ff-pointer a-res) (ff-pointer my-body))
		(_wrap_topods_builder_add a-builder (ff-pointer a-res) (ff-pointer my-threading))
		a-res))))))))
	  
