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
	     (edge1 (shape (make-instance 'BRepBuilderAPI_MakeEdge :L a-segment1)))
	     (edge2 (shape (make-instance 'BRepBuilderAPI_MakeEdge :L a-arc-of-circle)))
	     (edge3 (shape (make-instance 'BRepBuilderAPI_MakeEdge :L a-segment2)))
	     (a-wire (shape (make-instance 'BRepBuilderAPI_MakeWire :E1 edge1 :E2 edge2 :E3 edge3))))
	(let* ((a-origin (pnt 0 0 0))
	       (x-dir (dir 1 0 0))
	       (x-axis (ax1 a-origin x-dir))
	       (trsf (gp::make-trsf :ptr (foreign-alloc '(:struct gp::gp-trsf)))))
	  (set-mirror trsf x-axis)
	  (let ((a-mirrored-wire (shape (make-instance 'BRepBuilderAPI_Transform :S a-wire :Trsf trsf))))
	    (let ((make-wire (make-instance 'BRepBuilderAPI_MakeWire)))
	      (add make-wire a-wire)
	      (add make-wire a-mirrored-wire)
	      (let* ((count 0)
		     (my-body
		      (shape (make-instance 'BRepPrimAPI_MakePrism :baseShape
					    (shape (make-instance 'BrepBuilderAPI_MakeFace :W (shape make-wire)))
					    :extrudeDirection (vec 0 0 1))))
		     )
		(let ((explorer (make-instance 'TopExp_Explorer :S my-body :ToFind TopAbs_EDGE))
		      )
		  (loop while (more-p explorer)
		     do 
		       (let ((an-edge (current explorer)))
			 (print (ff-pointer an-edge))
			 (print (_wrap_TopoDS_Shape_HashCode (ff-pointer an-edge) 1000))
			  ;(add-edge mk-fillet (/ my-thickness 12) an-edge)
			  (incf count)
			  (print an-edge)
			  (next explorer)
			  )))
		;(print (ff-pointer mk-fillet))
		;(shape mk-fillet)
		;(mk-fillet	(make-instance 'BRepFilletAPI_MakeFillet :shape my-body))
		count
			  
	      ))

	))))))


	  
