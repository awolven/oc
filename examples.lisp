(in-package :oc)

#+OLD
(defun make-cone ()
  (let* ((p (make-instance 'gp_Pnt :Xp 0.0d0 :Yp 0.0d0 :Zp 0.0d0))
	 (vx (make-instance 'gp_Dir :xv 1.0d0 :yv 0.0d0 :zv 0.0d0))
	 (n (make-instance 'gp_Dir :xv 0.0d0 :yv 0.0d0 :zv 1.0d0))
	 (axis (make-instance 'gp_Ax2 :vx vx :n n :p p))
	 (s (shape (make-instance 'BRepPrimAPI_MakeCone :angle (/ pi 4) :height 1.0d0 :baseradius 0.5d0 :topradius 0.1d0 :axes axis;;:center p :radius 1.0d0
				  )))
	 (l (_wrap_new_TopLoc_Location__SWIG_0))) 
    (let ((i (make-instance 'TopoDS_Iterator :s s)))
      (let ((i2 (make-instance 'TopoDS_Iterator :s (value i))))
	(make-instance 'BRepMesh_IncrementalMesh :S (value i2) :D 7.0d-3 :Relative t)
       	(let ((pt (allocate-instance (load-time-value (find-class 'Poly_Triangulation)))))
	  (setf (ff-pointer pt) (_wrap_Brep_Tool_triangulation (ff-pointer (value i2)) l))
	  (let* ((nodes (get-nodes pt))
		 (nodes-lower (get-lower nodes))		  
		 (nb-nodes (get-nb-nodes pt))
		 (triangles (get-triangles pt))
		 (nb-triangles (get-nb-triangles pt)))
	    (let ((vbo (foreign-alloc :float :count (* 2 3 nb-nodes)))
		  (ibo (foreign-alloc :unsigned-short :count (* 3 nb-triangles))))
	      (loop for i from nodes-lower to (get-upper nodes)
		 do (let ((ff-pnt (ff-pointer (get-value nodes i))))
		      ;; vertex
		      (loop for j from 0 below 3
			 do (setf (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) j))
				  (coerce (mem-aref ff-pnt :double j) 'single-float)))
		      ;; color
		      (setf (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) 3)) (* (/ i nb-nodes) 1.0f0)
			    (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) 4)) (* (1- (/ i nb-nodes)) 0.5f0)
			    (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) 5)) 0.2f0)))
	      (let ((lower (print (get-lower triangles))))
		(loop for i from lower to (print (get-upper triangles))
		   for ii from 0
		   do (let ((tri (get-value triangles i)))
			(loop for j from 1 to 3
			   do (setf (mem-aref ibo :unsigned-short (+ (* 3 ii) (1- j)))
				     (- (get-value tri j) nodes-lower))))))
	      (values vbo (* (foreign-type-size :float) 2 3 nb-nodes) ibo (* (foreign-type-size :unsigned-short) 3 nb-triangles)))))))))

(defun make-cone ()
  (let* ((p (gp:pnt 0.0d0 0.0d0 0.0d0))
	 (vx (gp:dir 1.0d0 0.0d0 0.0d0))
	 (n (gp:dir 0.0d0 0.0d0 1.0d0))
	 (axis (gp:ax2 :Vx vx :N n :P p))
	 (s (shape (make-instance 'BRepPrimAPI_MakeCone
				  :angle (/ pi 4)
				  :height 1.0d0
				  :baseradius 0.5d0
				  :topradius 0.1d0
				  :axes axis;;:center p :radius 1.0d0
				  )))
	 (l (_wrap_new_TopLoc_Location__SWIG_0)))
    (let ((i (make-instance 'TopoDS_Iterator :s s)))
      (let ((i2 (make-instance 'TopoDS_Iterator :s (value i))))
	(make-instance 'BRepMesh_IncrementalMesh :S (value i2) :D 7.0d-3 :Relative t)
       	(let ((pt (allocate-instance (load-time-value (find-class 'Poly_Triangulation)))))
	  (setf (ff-pointer pt) (_wrap_Brep_Tool_triangulation (ff-pointer (value i2)) l))
	  (let* ((nodes (get-nodes pt))
		 (nodes-lower (get-lower nodes))		  
		 (nb-nodes (get-nb-nodes pt))
		 (triangles (get-triangles pt))
		 (nb-triangles (get-nb-triangles pt)))
	    (let ((vbo (foreign-alloc :float :count (* 2 3 nb-nodes)))
		  (ibo (foreign-alloc :unsigned-short :count (* 3 nb-triangles))))
	      (loop for i from nodes-lower to (get-upper nodes)
		 do (let ((ff-pnt (ff-pointer (get-value nodes i))))

		      ;; vertex
		      (loop for j from 0 below 3
			 do (setf (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) j))
				  (coerce (mem-aref ff-pnt :double j) 'single-float)))
		      ;; color
		      (setf (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) 3)) (* (/ i nb-nodes) 1.0f0)
			    (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) 4)) (* (1- (/ i nb-nodes)) 0.5f0)
			    (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) 5)) 0.2f0)))
	      (let ((lower (print (get-lower triangles))))

		(loop for i from lower to (print (get-upper triangles))
		   for ii from 0
		   do (let ((tri (get-value triangles i)))
			(loop for j from 1 to 3
			   do (setf (mem-aref ibo :unsigned-short (+ (* 3 ii) (1- j)))
				     (- (get-value tri j) nodes-lower))))))
	      (values vbo (* (foreign-type-size :float) 2 3 nb-nodes) ibo (* (foreign-type-size :unsigned-short) 3 nb-triangles)))))))))

(defun make-vertex-arrays (body red green blue)
  (make-instance 'BRepMesh_IncrementalMesh :S body :D 7.0d-3 :Relative t)
  (let* ((float-total 0)
	 (index-total 0)
	 (tri-data '())
	 (red-float (coerce red 'single-float))
	 (green-float (coerce green 'single-float))
	 (blue-float (coerce blue 'single-float)))
    (let ((explorer (make-instance 'TopExp_Explorer :S body :ToFind TopAbs_FACE)))
      (loop repeat 1 ;;while (more-p explorer)
	 do (let* ((face (current explorer))
		   (triangulation (allocate-instance (find-class 'Poly_Triangulation))))
	      (setf (ff-pointer triangulation) (_wrap_BRep_Tool_Triangulation (ff-pointer face) (_wrap_new_TopLoc_Location__SWIG_0)))
	      (let* ((vertices (get-nodes triangulation))
		     (vertex-lower (get-lower vertices))
		     (vertex-upper (get-upper vertices))
		     (vertex-count (- vertex-upper vertex-lower))
		     (float-count (+ (* 3 vertex-count) (* 3 vertex-count))) ;; 3 floats position, 3 floats color
		     (triangles (get-triangles triangulation))
		     (triangles-lower (get-lower triangles))
		     (triangles-upper (get-upper triangles))
		     (triangle-count (- triangles-upper triangles-lower)))
		(push (list triangulation vertex-lower vertex-upper triangles-lower triangles-upper) tri-data)
		(incf float-total float-count)
		(incf index-total (* 3 triangle-count))))
	   (next explorer)))	   
    (when (> index-total 65535)
      (error "unsigned-short too short for indices: ~S" index-total))
    (let ((vertex-array (foreign-alloc :float :count (* float-total (foreign-type-size :float))))
	  (index-array (foreign-alloc :unsigned-short :count index-total))
	  (vertex-offset 0)
	  (float-offset 0)
	  (index-offset 0))
      (loop for td in tri-data
	 do
	   (print td)
	   (destructuring-bind (triangulation vertex-lower vertex-upper triangles-lower triangles-upper) td
	     (let ((nodes (get-nodes triangulation))
		   (triangles (get-triangles triangulation)))
	       (loop for i from 0 by 6
		  for fi from float-offset by 6
		  for vi from vertex-lower to vertex-upper
		  do (let ((node (get-value nodes vi)))
		       (print node)
		       (setf (mem-aref vertex-array :float (+ fi 0)) (coerce (x node) 'single-float)
			     (mem-aref vertex-array :float (+ fi 1)) (coerce (y node) 'single-float)
			     (mem-aref vertex-array :float (+ fi 2)) (coerce (z node) 'single-float)
			     (mem-aref vertex-array :float (+ fi 3)) red-float
			     (mem-aref vertex-array :float (+ fi 4)) green-float
			     (mem-aref vertex-array :float (+ fi 5)) blue-float))
		  finally (incf float-offset i))
	       (loop for i from 0 by 3
		  for usi from index-offset by 3
		  for ti from triangles-lower to triangles-upper
		  do (let ((triangle (get-value triangles ti)))
		       (setf (mem-aref index-array :unsigned-short (+ usi 0)) (print (- (+ vertex-offset (get-value triangle 1)) vertex-lower))
			     (mem-aref index-array :unsigned-short (+ usi 1)) (print (- (+ vertex-offset (get-value triangle 2)) vertex-lower))
			     (mem-aref index-array :unsigned-short (+ usi 2)) (print (- (+ vertex-offset (get-value triangle 3)) vertex-lower))))
		  finally (incf index-offset i)))
	     (incf vertex-offset (- vertex-upper vertex-lower))))
       (values vertex-array (* float-total (foreign-type-size :float)) index-array (* index-total (foreign-type-size :unsigned-short)) (make-array index-total)))))


(defun run-demo (&optional (debug t))
  (sb-thread:interrupt-thread
   (sb-thread:main-thread)
   (lambda ()
     (sb-int:with-float-traps-masked
	 (:invalid :inexact :overflow)
       (multiple-value-bind (vktk::*vertex-data* vktk::*vertex-data-size* vktk::*index-data* vktk::*index-data-size* vktk::*indices*)
	   (oc::make-bottle)
	 (let* ((vktk::*debug* debug)
		(app (make-instance 'vktk::application)))
	   (vktk::main app)))))))



  

(defun make-sphere ()
  (let* ((p (gp:pnt 0.0d0 0.0d0 0.0d0))
	 (vx (gp:dir 1.0d0 0.0d0 0.0d0))
	 (n (gp:dir 0.0d0 0.0d0 1.0d0))
	 (axis (gp:ax2 :vx vx :n n :p p))
	 (s (shape (make-instance 'BRepPrimAPI_MakeSphere :center p :radius 0.5d0 :axis axis;;:center p :radius 1.0d0
				  )))
	 (l (_wrap_new_TopLoc_Location__SWIG_0))) 
    (let ((i (make-instance 'TopoDS_Iterator :s s)))
      (let ((i2 (make-instance 'TopoDS_Iterator :s (value i))))
	(make-instance 'BRepMesh_IncrementalMesh :S (value i2) :D 7.0d-3 :Relative t)
       	(let ((pt (allocate-instance (load-time-value (find-class 'Poly_Triangulation)))))
	  (setf (ff-pointer pt) (_wrap_Brep_Tool_triangulation (ff-pointer (value i2)) l))
	  (let* ((nodes (get-nodes pt))
		 (nodes-lower (get-lower nodes))		  
		 (nb-nodes (get-nb-nodes pt))
		 (triangles (get-triangles pt))
		 (nb-triangles (get-nb-triangles pt)))
	    (let ((vbo (foreign-alloc :float :count (* 2 3 nb-nodes)))
		  (ibo (foreign-alloc :unsigned-short :count (* 3 nb-triangles))))
	      (loop for i from nodes-lower to (get-upper nodes)
		 do (let ((ff-pnt (ff-pointer (get-value nodes i))))
		      ;; vertex
		      (loop for j from 0 below 3
			 do (setf (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) j))
				  (coerce (mem-aref ff-pnt :double j) 'single-float)))
		      ;; color
		      (setf (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) 3)) (* (/ i nb-nodes) 1.0f0)
			    (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) 4)) (* (1- (/ i nb-nodes)) 0.5f0)
			    (mem-aref vbo :float (+ (* 2 3 (- i nodes-lower)) 5)) 0.2f0)))
	      (let ((lower (print (get-lower triangles))))
		(loop for i from lower to (print (get-upper triangles))
		   for ii from 0
		   do (let ((tri (get-value triangles i)))
			(loop for j from 1 to 3
			   do (setf (mem-aref ibo :unsigned-short (+ (* 3 ii) (1- j)))
				     (- (get-value tri j) nodes-lower))))))
	      (values vbo (* (foreign-type-size :float) 2 3 nb-nodes) ibo (* (foreign-type-size :unsigned-short) 3 nb-triangles)))))))))

(defun make-bottle ()
  (let ((my-width 50)
	(my-height 70)
	(my-thickness 30))
    (let ((a-pnt1 (pnt (/ (- my-width) 2) 0 0))
	  (a-pnt2 (pnt (/ (- my-width) 2) (/ (- my-thickness) 4) 0))
	  (a-pnt3 (pnt 0 (/ (- my-thickness) 2) 0))
	  (a-pnt4 (pnt (/ my-width 2) (/ (- my-thickness) 4) 0))
	  (a-pnt5 (pnt (/ my-width 2) 0 0)))
      (let* ((a-arc-of-circle (value (make-instance 'GC_MakeArcOfCircle :P1 a-pnt2 :P2 a-pnt3 :P3 a-pnt4)))
	     (a-segment1 (value (make-instance 'GC_MakeSegment :P1 a-pnt1 :P2 a-pnt2)))
	     (a-segment2 (value (make-instance 'GC_MakeSegment :P1 a-pnt4 :P2 a-pnt5)))
	     (edge1 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L a-segment1)))
	     (edge2 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L a-arc-of-circle)))
	     (edge3 (edge (make-instance 'BRepBuilderAPI_MakeEdge :L a-segment2)))
	     (a-wire (wire (make-instance 'BRepBuilderAPI_MakeWire :E1 edge1 :E2 edge2 :E3 edge3))))
	(let* ((a-origin (pnt 0 0 0))
	       (x-dir (dir 1 0 0))
	       (x-axis (ax1 a-origin x-dir))
	       (a-trsf (gp::make-trsf :ptr (_wrap_new_gp_Trsf__SWIG_0))))
	  (set-mirror a-trsf x-axis)
	  (let ((a-mirrored-wire (shape (make-instance 'BRepBuilderAPI_Transform :S a-wire :Trsf a-trsf))))
	    (let ((make-wire (make-instance 'BRepBuilderAPI_MakeWire)))
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
		       (neck-ax2 (gp::make-ax2 :ptr (_wrap_new_gp_Ax2__SWIG_1 (ptr neck-location) (ptr neck-axis)))))
		  (let* ((my-neck-radius (coerce (/ my-thickness 4) 'double-float))
			 (my-neck-height (coerce (/ my-height 10) 'double-float))
			 (mk-cylinder (make-instance 'BRepPrimAPI_MakeCylinder
						     :Axes neck-ax2
						     :R my-neck-radius
						     :H my-neck-height))
			 (my-neck (shape mk-cylinder))
			 (fuse (make-instance 'BRepAlgoAPI_Fuse :S1 my-body :S2 my-neck)))
		    (setq my-body (shape fuse))
		    (let ((a-face-explorer (make-instance 'TopExp_Explorer :S my-body :ToFind TopAbs_FACE))
			  (face-to-remove)
			  (z-max -1))
		      (loop while (more-p a-face-explorer)
			 do (let* ((a-face (current a-face-explorer))
				   (a-surface (surface a-face)))
			      (when (typep a-surface 'Geom_Plane)
				(let ((a-pnt (oc::_wrap_geom_elementarysurface_getlocation
					      (ff-pointer a-surface))))
				  (when (>  (gp::gp-xyz-z a-pnt) z-max)
				    (setq z-max (gp::gp-xyz-z a-pnt))
				    (setq face-to-remove a-face))))
			      (next a-face-explorer)))
		      (let ((faces-to-remove (make-instance 'TopTools_ListOfShape)))
			(list-append faces-to-remove face-to-remove)
			(setq my-body (shape (make-instance 'BRepOffsetAPI_MakeThickSolid
						     :S my-body :ClosingFaces faces-to-remove
						     :Offset (/ (- my-thickness) 50.0d0)
						     :Tol 1.0d-3)))
			(let* ((a-cyl1 (make-instance 'Geom_CylindricalSurface :A3 neck-ax2 :Radius (* my-neck-radius 0.99d0)))
			       (a-cyl2 (make-instance 'Geom_CylindricalSurface :A3 neck-ax2 :Radius (* my-neck-radius 1.05d0)))
			       (a-pnt (pnt2d (* 2 pi) (/ my-neck-height 2)))
			       (a-dir (dir2d-3 (* 2 pi) (/ my-neck-height 4)))
			       (an-ax2d (ax2d a-pnt a-dir))
			       (a-major (* 2 pi))
			       (a-minor (/ my-neck-height 10.0d0))
			       (an-ellipse1 (make-instance 'Geom2d_Ellipse :MajorAxis an-ax2d :MajorRadius a-major :MinorRadius a-minor))
			       (an-ellipse2 (make-instance 'Geom2d_Ellipse :MajorAxis an-ax2d :MajorRadius a-major :MinorRadius (/ a-minor 4.0d0))))
			  (values an-ellipse1 an-ellipse2)
			  (make-vertex-arrays my-body 1.0f0 0.0f0 0.0f0)

			  )))

		    ))))))))))
		    


	  
