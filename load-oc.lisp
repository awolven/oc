(in-package :cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (ql:quickload :cffi))

#+windows
(defparameter *foreign-libraries*
  (list
   "TKernel"
   "TKMath"
   "TKG2d"
   "TKG3d"
   "TKGeomBase"
   "TKBrep"
   "TKGeomAlgo"
   "TKTopAlgo"
   "TKShHealing"
   "TKXSBase"
   "TKPrim"
   "TkMesh"
   "TKBO"
   "TKSTEPBase"
   "TKSTEPAttr"
   "TKSTEP209"
   "TKSTEP"
   "TKBool"
   "TKOffset"
   "TKFillet"
   "TKIGES"
   ;; "TKV3d"
   ))

#+darwin
(defparameter *foreign-libraries*
  (list
   "libfreetype"
   "libTKernel.7.1.0"
   "libTKXmlXCAF.7.1.0"
   "libTKXmlTObj.7.1.0"
   "libTKXmlL.7.1.0"
   "libTKXml.7.1.0"
   "libTKXSDRAW.7.1.0"
   "libTKXSBase.7.1.0"
   "libTKXMesh.7.1.0"
   "libTKXDESTEP.7.1.0"
   "libTKXDEIGES.7.1.0"
   "libTKXDEDRAW.7.1.0"
   "libTKXCAF.7.1.0"
   "libTKViewerTest.7.1.0"
   "libTKVRML.7.1.0"
   "libTKVCAF.7.1.0"
   "libTKV3d.7.1.0"
   "libTKTopTest.7.1.0"
   "libTKTopAlgo.7.1.0"
   "libTKTObjDRAW.7.1.0"
   "libTKTObj.7.1.0"
   "libTKStdL.7.1.0"
   "libTKStd.7.1.0"
   "libTKShHealing.7.1.0"
   "libTKService.7.1.0"
   "libTKSTL.7.1.0"
   "libTKSTEPBase.7.1.0"
   "libTKSTEPAttr.7.1.0"
   "libTKSTEP209.7.1.0"
   "libTKSTEP.7.1.0"
   "libTKQADraw.7.1.0"
   "libTKPrim.7.1.0"
   "libTKOpenGl.7.1.0"
   "libTKOffset.7.1.0"
   "libTKMeshVS.7.1.0"
   "libTKMesh.7.1.0"
   "libTKMath.7.1.0"
   "libTKLCAF.7.1.0"
   "libTKIGES.7.1.0"
   "libTKHLR.7.1.0"
   "libTKGeomBase.7.1.0"
   "libTKGeomAlgo.7.1.0"
   "libTKG3d.7.1.0"
   "libTKG2d.7.1.0"
   "libTKFillet.7.1.0"
   "libTKFeat.7.1.0"
   "libTKDraw.7.1.0"
   "libTKDCAF.7.1.0"
   "libTKCDF.7.1.0"
   "libTKCAF.7.1.0"
   "libTKBool.7.1.0"
   "libTKBinXCAF.7.1.0"
   "libTKBinTObj.7.1.0"
   "libTKBinL.7.1.0"
   "libTKBin.7.1.0"
   "libTKBRep.7.1.0"
   "libTKBO.7.1.0"))

#+windows
(defparameter *lib-path*
  "C:/opencascade-7.1.0/win64/vc14/bind/")

#+darwin
(defparameter *lib-path*
  "~/occt-build/mac64/clang/libd/" #+ORIG"../Lib/")

(defparameter *lib-extension*
  #+windows ".dll"
  #+darwin ".dylib")

(defun load-oc-libraries ()
  (let ((lib-path *lib-path*))
    (loop for lib in *foreign-libraries*
       do (cffi:load-foreign-library (concatenate 'string lib-path lib *lib-extension*))
       finally (cffi:load-foreign-library (concatenate 'string "~/oc/oc" *lib-extension*))
	 (return t))))

(load-oc-libraries)
