(in-package :oc)

(defun make-bucket ()
  (let* ((bucket-location (gp:pnt 0 0 0))
	 (bucket-axis (gp:dir 0 0 1))
	 (bucket-ax2 (gp:make-ax2 :ptr (_wrap_new_gp_Ax2__SWIG_2 (ptr bucket-location) (ptr bucket-axis))))
	 (mk-cylinder
	  (make-instance 'BRep-Prim-API-Make-Cylinder
			 :Axes bucket-ax2
			 :R 25.0d0
			 :H 50.0d0))
	 (s (shape mk-cylinder)))
    (let ((faces-to-remove  (make-instance 'top-tools-list-of-shape))
	  (a-face-explorer (make-instance 'top-exp-explorer :S s :ToFind TopAbs_FACE))
	  (z-max -1.0d0)
	  (face-to-remove))
	    
      (loop while (more-p a-face-explorer)
	 do (let ((face (current a-face-explorer)))
	      (let ((surface (surface face)))
		(when (typep surface 'Geom-Plane)
		  (let ((a-pnt (get-location surface)))
		    (when (> (Z a-pnt) z-max)
		      (setq z-max (Z a-pnt)
			    face-to-remove face))))))
	   (next a-face-explorer))
      (list-append faces-to-remove face-to-remove)
      (let ((thick-solid (make-instance 'brep-offset-api-make-thick-solid
					:S s :ClosingFaces faces-to-remove
					:Offset -2.5d0
					:Tol 1.0d-3)))
	(setq s (shape thick-solid)))
      s)))
      
    

(defun make-bottle (&optional (my-width 50) (my-height 70) (my-thickness 30))
  (let* ((a-pnt1 (gp:pnt (/ (- my-width) 2) 0 0))
	 (a-pnt2 (gp:pnt (/ (- my-width) 2) (/ (- my-thickness) 4) 0))
	 (a-pnt3 (gp:pnt 0 (/ (- my-thickness) 2) 0))
	 (a-pnt4 (gp:pnt (/ my-width 2) (/ (- my-thickness) 4) 0))
	 (a-pnt5 (gp:pnt (/ my-width 2) 0 0))
	 (a-arc-of-circle (value (make-instance 'gc-make-arc-of-circle :P1 a-pnt2 :P2 a-pnt3 :P3 a-pnt4)))
	 (a-segment1 (value (make-instance 'gc-make-segment :P1 a-pnt1 :P2 a-pnt2)))
	 (a-segment2 (value (make-instance 'gc-make-segment :P1 a-pnt4 :P2 a-pnt5)))
	 (edge1 (edge (make-instance 'BRep-Builder-API-Make-Edge :L a-segment1)))
	 (edge2 (edge (make-instance 'BRep-Builder-API-Make-Edge :L a-arc-of-circle)))
	 (edge3 (edge (make-instance 'BRep-Builder-API-Make-Edge :L a-segment2)))
	 (a-wire (wire (make-instance 'BRep-Builder-API-Make-Wire :E1 edge1 :E2 edge2 :E3 edge3)))
	 (a-origin (gp:pnt 0 0 0))
	 (x-dir (gp:dir 1 0 0))
	 (x-axis (gp:ax1 a-origin x-dir))
	 (a-trsf (oc::trsf)))
    (setf (mirror a-trsf) x-axis)

    (let ((a-mirrored-wire (shape (make-instance 'BRep-Builder-API-Transform :S a-wire :Trsf a-trsf)))
	  (make-wire (make-instance 'BRep-Builder-API-Make-Wire)))
      (add make-wire a-wire)
      (add make-wire a-mirrored-wire)
      (let* ((my-body
	      (shape (make-instance 'BRep-Prim-API-Make-prism :baseShape
				    (face (make-instance 'Brep-Builder-API-Make-Face :W (wire make-wire)))
				    :extrudeDirection (gp:vec 0 0 my-height))))
	     (mk-fillet	(make-instance 'BRep-Fillet-API-Make-Fillet :shape my-body)))
	(let ((explorer (make-instance 'Top-Exp-Explorer :S my-body :ToFind TopAbs_EDGE))
	      (radius (coerce (/ my-thickness 12) 'double-float)))
	  
	  (loop while (more-p explorer)
	     do (let ((an-edge (current explorer)))
		  (add-shape mk-fillet radius an-edge)
		  (next explorer))))
		
	(setq my-body (shape mk-fillet))
		
	(let* ((neck-location (gp:pnt 0 0 my-height))
	       (neck-axis (gp:dir 0 0 1))
	       (neck-ax2 (oc::ax2 :P neck-location :Vx neck-axis))
	       (my-neck-radius (coerce (/ my-thickness 4) 'double-float))
	       (my-neck-height (coerce (/ my-height 10) 'double-float))
	       (mk-cylinder (make-instance 'BRep-Prim-API-Make-Cylinder
					   :Axes neck-ax2
					   :R my-neck-radius
					   :H my-neck-height))
	       (my-neck (shape mk-cylinder))
	       (fuse (make-instance 'BRep-Algo-API-Fuse :S1 my-body :S2 my-neck)))
		  
	  (setq my-body (shape fuse))
		    
	  (let ((faces-to-remove  (make-instance 'Top-Tools-List-Of-Shape))
		(a-face-explorer (make-instance 'Top-Exp-Explorer :S my-body :ToFind TopAbs_FACE))
		(z-max -1.0d0)
		(face-to-remove))
	    
	    (loop while (more-p a-face-explorer)
	       do (let ((face (current a-face-explorer)))
		    (let ((surface (surface face)))
		      (when (typep surface 'Geom-Plane)
			(let ((a-pnt (get-location surface)))
			  (when (> (Z a-pnt) z-max)
			    (setq z-max (Z a-pnt)
				  face-to-remove face))))))
		 (next a-face-explorer))
	    (list-append faces-to-remove face-to-remove)
	    (let ((thick-solid (make-instance 'BRep-Offset-API-Make-Thick-Solid
					      :S my-body :ClosingFaces faces-to-remove
					      :Offset (/ (- my-thickness) 50.0d0)
					      :Tol 1.0d-3)))
	      
	      (setq my-body (shape thick-solid))))
		  
	  (let* ((a-cyl1 (make-instance 'Geom-Cylindrical-Surface :A2 neck-ax2 :Radius (* my-neck-radius 0.99d0)))
		 (a-cyl2 (make-instance 'Geom-Cylindrical-Surface :A2 neck-ax2 :Radius (* my-neck-radius 1.05d0)))
		 (a-pnt (gp:pnt2d (* 2 pi) (/ my-neck-height 2)))
		 (a-dir (gp:dir2d (* 2 pi) (/ my-neck-height 4)))
		 (an-ax2d (gp:ax2d a-pnt a-dir))
		 (a-major (* 2 pi))
		 (a-minor (/ my-neck-height 10.0d0))
		 (an-ellipse1 (make-instance 'Geom2d-Ellipse :MajorAxis an-ax2d :MajorRadius a-major :MinorRadius a-minor))
		 (an-ellipse2 (make-instance 'Geom2d-Ellipse :MajorAxis an-ax2d :MajorRadius a-major :MinorRadius (/ a-minor 4.0d0)))
		 (an-arc1 (make-instance 'Geom2d-Trimmed-Curve :C an-ellipse1 :U1 0.0d0 :U2 pi))
		 (an-arc2 (make-instance 'Geom2d-Trimmed-Curve :C an-ellipse2 :U1 0.0d0 :U2 pi))
		 (an-ellipse-pnt1 (evaluate-curve an-ellipse1 0.0d0))
		 (an-ellipse-pnt2 (evaluate-curve an-ellipse1 pi))
		 (a-segment (value (make-instance 'GCE2d-Make-Segment :P1 an-ellipse-pnt1 :P2 an-ellipse-pnt2)))
		 (an-edge1-on-surf1 (edge (make-instance 'BRep-Builder-API-Make-Edge :L an-arc1 :S a-cyl1)))
		 (an-edge2-on-surf1 (edge (make-instance 'BRep-Builder-API-Make-Edge :L a-segment :S a-cyl1)))
		 (an-edge1-on-surf2 (edge (make-instance 'BRep-Builder-API-Make-Edge :L an-arc2 :S a-cyl2)))
		 (an-edge2-on-surf2 (edge (make-instance 'BRep-Builder-API-Make-Edge :L a-segment :S a-cyl2)))
		 (threading-wire1 (wire (make-instance 'BRep-Builder-API-Make-Wire
						       :E1 an-edge1-on-surf1
						       :E2 an-edge2-on-surf1)))
		 (threading-wire2 (wire (make-instance 'BRep-Builder-API-Make-Wire
						       :E1 an-edge1-on-surf2
						       :E2 an-edge2-on-surf2))))

	    (build-curves-3d threading-wire1)
	    (build-curves-3d threading-wire2)
	    (let ((a-tool
		   (make-instance 'BRep-Offset-API-Thru-Sections :isSolid t)))

	      (add-wire a-tool threading-wire1)
	      (add-wire a-tool threading-wire2)
	      (check-compatibility a-tool nil)
	      
	      (let ((my-threading (shape a-tool))
		    (a-res (make-instance 'TopoDS-Compound))
		    (a-builder (make-instance 'brep-builder)))

		(make-compound a-builder a-res)
		(topods-builder-add a-builder a-res my-body)
		(topods-builder-add a-builder a-res my-threading)

		a-res))))))))
	  
