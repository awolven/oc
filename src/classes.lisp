(in-package :oc)

;;

(defclass ff-pointer-mixin ()
  ((ff-pointer :initarg :ff-pointer :accessor ff-pointer)))

;;

(defclass topods-shape (ff-pointer-mixin) ())

(defclass topods-vertex (topods-shape) ())

(defclass topods-edge (topods-shape) ())

(defclass topods-wire (topods-shape) ())

(defclass topods-face (topods-shape) ())

(defclass topods-shell (topods-shape) ())

(defclass topods-solid (topods-shape) ())

(defclass topods-compound (topods-shape) ())

(defclass topods-compsolid (topods-shape) ())

;;

(defclass topods-builder (ff-pointer-mixin) ())

(defclass brep-builder (topods-builder) ())

;;

(defclass top-exp-explorer (ff-pointer-mixin) ())

(defclass topods-iterator (ff-pointer-mixin) ())

;;

(defclass tcol-std-array1-of-real (ff-pointer-mixin) ())

(defclass tcol-std-array1-of-integer (ff-pointer-mixin) ())

(defclass tcol-gp-array1-of-pnt2d (ff-pointer-mixin) ())

(defclass tcol-gp-array1-of-pnt (ff-pointer-mixin) ())

(defclass poly-array1-of-triangle (ff-pointer-mixin) ())

(defclass top-tools-list-of-shape (ff-pointer-mixin) ())

(defclass top-tools-map-of-shape (ff-pointer-mixin) ())

;;

(defclass tcollection-basic-map-iterator () ())

(defclass top-tools-map-iterator-of-map-of-shape (tcollection-basic-map-iterator ff-pointer-mixin) ())

;;

(defclass mmgt-tshared (ff-pointer-mixin) ())

;;

(defclass geom2d-transformation (mmgt-tshared) ())

(defclass geom2d-geometry (mmgt-tshared) ())

(defclass geom2d-point (geom2d-geometry) ())

(defclass geom2d-cartesian-point (geom2d-point) ())

(defclass geom2d-vector (geom2d-geometry) ())

(defclass geom2d-vector-with-magnitude (geom2d-vector) ())

(defclass geom2d-direction (geom2d-vector) ())

(defclass geom2d-axis-placement (geom2d-geometry) ())

(defclass geom2d-curve (geom2d-geometry) ())

(defclass geom2d-conic (geom2d-curve) ())

(defclass geom2d-circle (geom2d-conic) ())

(defclass geom2d-ellipse (geom2d-conic) ())

(defclass geom2d-parabola (geom2d-conic) ())

(defclass geom2d-hyperbola (geom2d-conic) ())

(defclass geom2d-line (geom2d-curve) ())

(defclass geom2d-bounded-curve (geom2d-curve) ())

(defclass geom2d-bezier-curve (geom2d-bounded-curve) ())

(defclass geom2d-bspline-curve (geom2d-bounded-curve) ())

(defclass geom2d-trimmed-curve (geom2d-bounded-curve) ())

(defclass geom2d-offset-curve (geom2d-curve) ())

(defclass bisector-bisecana () ())

(defclass bisector-biseccc () ())

(defclass bisector-bisecpc () ())
;;

(defclass geom-geometry (mmgt-tshared) ())

(defclass geom-curve (geom-geometry) ())

(defclass geom-line (geom-curve) ())

(defclass geom-conic (geom-curve) ())

(defclass geom-circle (geom-conic) ())

(defclass geom-ellipse (geom-conic) ())

(defclass geom-hyperbola (geom-conic) ())

(defclass geom-parabola (geom-conic) ())

(defclass geom-bounded-curve (geom-curve) ())

(defclass geom-bezier-curve (geom-curve) ())

(defclass geom-bspline-curve (geom-curve) ())

(defclass geom-trimmed-curve (geom-bounded-curve) ())

(defclass geom-offset-curve (geom-curve) ())

(defclass geom-surface (geom-geometry) ())

(defclass geom-elementary-surface (geom-surface) ())

(defclass geom-plane (geom-elementary-surface) ())

(defclass geom-cylindrical-surface (geom-elementary-surface) ())

(defclass geom-conical-surface (geom-elementary-surface) ())

(defclass geom-spherical-surface (geom-elementary-surface) ())

(defclass geom-toroidal-surface (geom-elementary-surface) ())

(defclass geom-bounded-surface (geom-surface) ())

(defclass geom-rectangular-trimmed-surface (geom-bounded-surface) ())

(defclass geom-bezier-surface (geom-bounded-surface) ())

(defclass geom-bspline-surface (geom-bounded-surface) ())

(defclass geom-offset-surface (geom-surface) ())

(defclass geom-swept-surface (geom-surface) ())

(defclass geom-surface-of-revolution (geom-swept-surface) ())

(defclass geom-surface-of-linear-extrusion (geom-swept-surface) ())

;;

(defclass gce2d-root (ff-pointer-mixin) ())

(defclass gce2d-make-segment (gce2d-root) ())

;;

(defclass gc-make-segment (ff-pointer-mixin) ())

(defclass gc-make-arc-of-circle (ff-pointer-mixin) ())

;;

(defclass brep-builder-api-command (ff-pointer-mixin) ())

(defclass brep-builder-api-make-shape (brep-builder-api-command) ())

(defclass brep-builder-api-make-vertex (brep-builder-api-make-shape) ())

(defclass brep-builder-api-make-edge (brep-builder-api-make-shape) ())

(defclass brep-builder-api-make-wire (brep-builder-api-make-shape) ())

(defclass brep-builder-api-make-face (brep-builder-api-make-shape) ())

(defclass brep-prim-api-make-cylinder (brep-builder-api-make-shape) ())

(defclass brep-prim-api-make-cone (brep-builder-api-make-shape) ())

(defclass brep-prim-api-make-sphere (brep-builder-api-make-shape) ())

(defclass brep-prim-api-make-sweep (brep-builder-api-make-shape) ())

(defclass brep-prim-api-make-prism (brep-prim-api-make-sweep) ())

(defclass brep-offset-api-normal-projection (brep-builder-api-make-shape) ())

(defclass brep-builder-api-modify-shape (brep-builder-api-make-shape) ())

(defclass brep-builder-api-transform (brep-builder-api-modify-shape) ())

(defclass brep-builder-api-make-offset (brep-builder-api-make-shape) ())

(defclass brep-offset-api-make-thick-solid (brep-builder-api-make-offset) ())

(defclass brep-offset-api-thru-sections (brep-builder-api-make-shape) ())

(defclass brep-fillet-api-local-operation (brep-builder-api-make-shape) ())

(defclass brep-fillet-api-make-fillet (brep-fillet-api-local-operation) ())

(defclass brep-algo (ff-pointer-mixin) ())

(defclass brep-algo-api (brep-builder-api-make-shape) ())

(defclass brep-algo-api-algo (brep-builder-api-make-shape) ())

(defclass brep-algo-api-builder-algo  (brep-algo-api-algo) ())

(defclass brep-algo-api-boolean-operation (brep-algo-api-builder-algo) ())

(defclass brep-algo-api-fuse (brep-algo-api-boolean-operation) ())

(defclass brep-algo-api-common (brep-algo-api-boolean-operation) ())

(defclass brep-algo-api-cut (brep-algo-api-boolean-operation) ())

(defclass brep-algo-api-section (brep-algo-api-boolean-operation) ())

;;

(defclass brep-mesh-discret-root (ff-pointer-mixin) ())

(defclass brep-mesh-incremental-mesh (brep-mesh-discret-root) ())

;;

(defclass poly-triangulation (ff-pointer-mixin) ())

(defclass poly-polygon-on-triangulation (ff-pointer-mixin) ())

(defclass poly-triangle (ff-pointer-mixin) ())

(defclass poly-polygon3d (ff-pointer-mixin) ())

;;

(defclass bnd-box (ff-pointer-mixin) ())

;;

(defclass adaptor2d-curve2d () ())

(defclass geom2d-adaptor-curve (adaptor2d-curve2d ff-pointer-mixin)
  ((curve)))

(defclass adaptor3d-curve () ())

(defclass geom-adaptor-curve (adaptor3d-curve ff-pointer-mixin) ())

(defclass cpnts-uniform-deflection (ff-pointer-mixin)
  ((curve)))

;;

(defclass xscontrol-reader (ff-pointer-mixin) ())

;;


