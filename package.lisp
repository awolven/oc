(cl:in-package :cl-user)

(defpackage :oc
  (:use :cl :cffi)
  (:export #:gp_Pnt
	   #:gp_Pnt2d
	   #:gp_Dir2d
	   #:gp_Vec2d
	   #:gp_Ax2d
	   #:gp_Ax22d
	   #:gp_Pln
	   #:gp_Vec
	   #:gp_Dir
	   #:gp_Ax3
	   #:gp_Ax2
	   #:gp_Ax1
	   #:gp_Trsf
	   #:gp_Trsf2d
	   #:setRotation
	   #:setTranslation
	   #:setValues
	   #:gp_Circ
	   #:gp_Cone
	   #:gp_Cylinder
	   #:gp_Parab
	   #:gp_Hypr
	   #:gp_Torus
	   #:bounds
	   #:readFile
	   #:BRepPrimAPI_MakeCone))
