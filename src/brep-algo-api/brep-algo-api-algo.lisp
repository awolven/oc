(in-package :oc)

(defmethod shape ((self brep-algo-api-algo))
  (with-topods-shape (_wrap_BRepAlgoAPI_Algo_shape (ff-pointer self))))
