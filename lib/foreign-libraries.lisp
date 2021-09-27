(in-package :cl-user)

(defparameter *oc-swig-lib*
  #+windows "oc.dll"
  #+darwin "oc.dylib"
  #+linux "oc.so")

(defparameter *freetype-lib*
  #+windows nil
  #+darwin "libfreetype.dylib"
  #+linux "libfreetype.so.6.9.0")

#+windows
(defparameter *opencascade-libraries*
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
   "TKIGES"))

#+(or darwin linux)
(defparameter *opencascade-libraries*
  (list
   "libTKernel"
   ;;"libTKXmlXCAF"
   ;;"libTKXmlTObj"
   ;;"libTKXmlL"
   ;;"libTKXml"
   ;;"libTKXSDRAW"
   ;;"libTKXSBase"
   ;;"libTKXMesh"
   ;;"libTKXDESTEP"
   ;;"libTKXDEIGES"
   ;;"libTKXDEDRAW"
   ;;"libTKXCAF"
   ;;"libTKViewerTest"
   ;;"libTKVRML"
   ;;"libTKVCAF"
   ;;"libTKV3d"
   ;;"libTKTopTest"
   
   ;;"libTKTObjDRAW"
   ;;"libTKTObj"
   ;;"libTKStdL"
   ;;"libTKStd"
   
   ;;"libTKService"
   ;;"libTKSTL"

   ;;"libTKQADraw"

   ;;"libTKOpenGl"

   ;;"libTKMeshVS"
   
   "libTKMath"
   ;;"libTKLCAF"
   
   ;;"libTKHLR"
   "libTKG2d"
   "libTKG3d"
   "libTKGeomBase"
   "libTKBRep"
   "libTKGeomAlgo"
   "libTKTopAlgo"
   "libTKPrim"
   "libTKMesh"
   "libTKShHealing"
   "libTKBO"
   "libTKBool"
   "libTKFillet"
   "libTKOffset"
   ;;"libTKFeat"
   ;;"libTKDraw"
   ;;"libTKDCAF"
   ;;"libTKCDF"
   ;;"libTKCAF"

   ;;
   ;;"libTKBinXCAF"
   ;;"libTKBinTObj"
   ;;"libTKBinL"
   ;;"libTKBin"

   "libTKXSBase"
   "libTKSTEPBase"
   "libTKSTEPAttr"
   "libTKSTEP209"
   "libTKSTEP"
   "libTKIGES"
   ))


(defparameter *lib-path*
  (namestring (asdf/system:system-relative-pathname :oc #+windows "lib/Windows/debug/" #+darwin "lib/MacOSX/debug/" #+linux "lib/Linux/AMD64/debug/")))

(defparameter *opencascade-lib-extension*
  #+windows ".dll"
  #+darwin ".7.1.0.dylib"
  #+linux ".so.7.1.0")

(defun load-oc-libraries ()
  (let ((lib-path *lib-path*))
    (when *freetype-lib*
      (cffi:load-foreign-library (concatenate 'string lib-path *freetype-lib*)))
    (loop for lib in *opencascade-libraries*
       do (cffi:load-foreign-library (concatenate 'string lib-path lib *opencascade-lib-extension*))
       finally (cffi:load-foreign-library (concatenate 'string lib-path *oc-swig-lib*)))))

(load-oc-libraries)

;;(cffi:load-foreign-library "C:/Users/awolven/Documents/Visual Studio 2015/Projects/oc/x64/Debug/oc.dll")

