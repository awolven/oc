(cl:in-package :cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (ql:quickload :cffi))

(defpackage :gp
  (:use :cl :cffi)
  (:import-from :sb-ext #:finalize)
  (:export #:ptr
	   #:xy
	   #:vec2d
	   #:pnt2d
	   #:dir2d-0
	   #:dir2d-1
	   #:dir2d-2
;;	   #:dir2d-3
	   #:dir2d
	   #:ax2d
	   #:xyz
	   #:pnt
	   #:dir
	   #:vec
	   #:ax1
	   #:ax2
	   #:ax3
	   #:lin
	   #:circ
	   #:elips
	   #:cone
	   #:cylinder
	   #:trsf
	   #:parab
	   #:hypr
	   #:mat

	   #:x #:y #:z
	   #:loc #:vdir #:pos))

(defpackage :oc
  (:use :cl :cffi :gp)
  (:export #:ff-pointer

	   #:setRotation
	   #:setTranslation
	   #:setValues

	   #:bounds
	   #:readFile
	   #:BRepPrimAPI_MakeCone))
