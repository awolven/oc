(defsystem oc
  :description "A wrapper library for using OpenCASCADE with Lisp."
  :depends-on (:cffi)
  :author "Andrew K Wolven <awolven@gmail.com>"
  :serial t
  :components
  ((:file "lib/foreign-libraries")
   
   (:file "src/package")
   
   (:file "src/oc")
   
   (:file "src/gp/gp-macros")
   (:file "src/gp/gp")
   
   (:file "src/classes")
   (:file "src/macros")
   (:file "src/functions")

   (:file "src/top-abs/top-abs")
   
   (:file "src/topods/topods-shape")
   (:file "src/topods/topods-vertex")
   (:file "src/topods/topods-edge")
   (:file "src/topods/topods-wire")
   (:file "src/topods/topods-face")
   (:file "src/topods/topods-shell")
   (:file "src/topods/topods-solid")
   (:file "src/topods/topods-compound")
   (:file "src/topods/topods-compsolid")
   (:file "src/topods/topods-iterator")
   (:file "src/topods-builder/topods-builder")
   (:file "src/brep-builder/brep-builder")
   (:file "src/top-exp/top-exp-explorer")
   
   (:file "src/collections/tcol-std-array1-of-real")
   (:file "src/collections/tcol-std-array1-of-integer")
   (:file "src/collections/tcol-gp-array1-of-pnt2d")
   (:file "src/collections/tcol-gp-array1-of-pnt")
   (:file "src/collections/poly-array1-of-triangle")
   (:file "src/collections/top-tools-list-of-shape")
   (:file "src/collections/top-tools-map-of-shape")
   (:file "src/collections/tcollection-basic-map-iterator")
   (:file "src/collections/top-tools-map-iterator-of-map-of-shape")
   
   (:file "src/mmgt/mmgt-tshared")
   
   (:file "src/geom2d/geom2d-geometry")
   (:file "src/geom2d/geom2d-point")
   (:file "src/geom2d/geom2d-cartesian-point")
   (:file "src/geom2d/geom2d-curve")
   (:file "src/geom2d/geom2d-conic")
   (:file "src/geom2d/geom2d-circle")
   (:file "src/geom2d/geom2d-ellipse")
   (:file "src/geom2d/geom2d-line")
   (:file "src/geom2d/geom2d-bounded-curve")
   (:file "src/geom2d/geom2d-bezier-curve")
   (:file "src/geom2d/geom2d-bspline-curve")
   (:file "src/geom2d/geom2d-trimmed-curve")

   (:file "src/geom/geom-geometry")
   (:file "src/geom/geom-curve")
   (:file "src/geom/geom-trimmed-curve")
   (:file "src/geom/geom-surface")
   (:file "src/geom/geom-elementary-surface")
   (:file "src/geom/geom-plane")
   (:file "src/geom/geom-cylindrical-surface")
   (:file "src/geom/geom-conical-surface")
   (:file "src/geom/geom-spherical-surface")
   (:file "src/geom/geom-toroidal-surface")
   (:file "src/geom/geom-bounded-surface")
   (:file "src/geom/geom-rectangular-trimmed-surface")
   (:file "src/geom/geom-bezier-surface")
   (:file "src/geom/geom-bspline-surface")
   (:file "src/geom/geom-offset-surface")
   (:file "src/geom/geom-swept-surface")
   (:file "src/geom/geom-surface-of-revolution")
   (:file "src/geom/geom-surface-of-linear-extrusion")

   (:file "src/gc/gc-make-arc-of-circle")
   (:file "src/gc/gc-make-segment")
   (:file "src/gce2d/gce2d-make-segment")
   
   (:file "src/brep-builder-api/brep-builder-api-command")
   (:file "src/brep-builder-api/brep-builder-api-make-shape")
   (:file "src/brep-builder-api/brep-builder-api-make-vertex")
   (:file "src/brep-builder-api/brep-builder-api-make-edge")
   (:file "src/brep-builder-api/brep-builder-api-make-wire")
   (:file "src/brep-builder-api/brep-builder-api-make-face")
   (:file "src/brep-builder-api/brep-builder-api-make-offset")
   (:file "src/brep-builder-api/brep-builder-api-modify-shape")
   (:file "src/brep-builder-api/brep-builder-api-transform")

   (:file "src/brep-prim-api/brep-prim-api-make-cylinder")
   (:file "src/brep-prim-api/brep-prim-api-make-cone")
   (:file "src/brep-prim-api/brep-prim-api-make-sphere")
   (:file "src/brep-prim-api/brep-prim-api-make-sweep")
   (:file "src/brep-prim-api/brep-prim-api-make-prism")

   (:file "src/brep-offset-api/brep-offset-api-normal-projection")
   (:file "src/brep-offset-api/brep-offset-api-make-thick-solid")
   (:file "src/brep-offset-api/brep-offset-api-thru-sections")

   (:file "src/brep-fillet-api/brep-fillet-api-local-operation")
   (:file "src/brep-fillet-api/brep-fillet-api-make-fillet")

   (:file "src/brep-algo-api/brep-algo-api-algo")
   (:file "src/brep-algo-api/brep-algo-api-builder-algo")
   (:file "src/brep-algo-api/brep-algo-api-boolean-operation")
   (:file "src/brep-algo-api/brep-algo-api-fuse")

   (:file "src/brep-mesh/brep-mesh-discret-root")
   (:file "src/brep-mesh/brep-mesh-incremental-mesh")

   (:file "src/poly/poly-triangulation")
   (:file "src/poly/poly-triangle")
   (:file "src/poly/poly-polygon3d")

   (:file "src/cpnts/adaptor2d-curve2d")
   (:file "src/cpnts/geom2d-adaptor-curve")
   (:file "src/cpnts/adaptor3d-curve")
   (:file "src/cpnts/geom-adaptor-curve")
   (:file "src/cpnts/cpnts-uniform-deflection")

   (:file "src/xscontrol/xscontrol-reader")
   
   (:file "src/init")
   (:file "src/examples/examples")))
