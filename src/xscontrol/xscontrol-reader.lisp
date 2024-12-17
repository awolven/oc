(in-package :oc)

(defmethod readFile ((self xscontrol-reader) &rest args)
  (let ((filename (first args)))
    (with-foreign-string (pfilename filename)
      (_wrap_XSControl_Reader_ReadFile (ff-pointer self) pFilename))))
