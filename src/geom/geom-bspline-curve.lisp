(in-package :oc)

(defmethod initialize-instance :after ((instance geom-bspline-curve)
                                       &rest initargs
                                       &key Poles Weights Knots Multiplicities Degree
                                       (Periodic nil Periodic-supplied-p)
                                         (CheckRational t)
                                       &allow-other-keys)
  (let ((ff-pointer
          (cond ((and (typep Poles 'TCol-gp-Array1-Of-Pnt)
                      (typep Weights 'TCol-Std-Array1-Of-Real)
                      (typep Knots 'TCol-std-Array1-Of-Real)
                      (typep Multiplicities 'TCol-std-Array1-Of-Integer)
                      (typep Degree 'integer)
                      Periodic-supplied-p)
                 (_wrap_new_Geom_BSplineCurve__SWIG_0
                  (ff-pointer Poles)
                  (ff-pointer Weights)
                  (ff-pointer Knots)
                  (ff-pointer Multiplicities)
                  Degree
                  (and Periodic t)
                  (and CheckRational t)))
                ((and (typep Poles 'TCol-gp-Array1-Of-Pnt)
                      (typep Weights 'TCol-Std-Array1-Of-Real)
                      (typep Knots 'TCol-std-Array1-Of-Real)
                      (typep Multiplicities 'TCol-std-Array1-Of-Integer)
                      (typep Degree 'integer))
                 (_wrap_new_Geom_BSplineCurve__SWIG_2
                  (ff-pointer Poles)
                  (ff-pointer Weights)
                  (ff-pointer Knots)
                  (ff-pointer Multiplicities)
                  Degree))
                (t (error "Invalid arguments to constructor: ~S" initargs)))))

    (setf (ff-pointer instance) ff-pointer)
    (oc:finalize instance)
    (values)))

(defmethod (setf knot) ((value real) (curve geom-bspline-curve) (index integer))
  (oc::_wrap_Geom_BSplineCurve_SetKnot__SWIG_0 (ff-pointer curve) value index))

(defmethod (setf periodic) (value (curve geom-bspline-curve))
  (if value
      (oc::_wrap_Geom_BSplineCurve_SetPeriodic (ff-pointer curve))
      (oc::_wrap_Geom_BSplineCurve_SetNotPeriodic (ff-pointer curve))))

#+NIL
(
(defmethod (setf origin) ((index integer) (curve geom-bspline-curve) &optional (tol 0))
  (declare (ignore tol))
  (oc::_wrap_Geom_BSplineCurve_SetOrigin__SWIG_0 (ff-pointer index) index))

(defmethod (setf origin) ((u real) (curve geom-bspline-curve) &optional (tol 1.0d-6))
  (oc::_wrap_geom_bsplinecurve_SetOrigin__SWIG_1 (ff-pointer curve) u tol))

(defmethod (setf pole) ((p gp:pnt) (curve geom-bspline-curve) (index integer) &optional (weight (oc::_wrap_geom_bsplinecurve_Weight (ff-pointer curve) index)))
  (oc::_wrap_geom_bsplinecurve_SetPole__SWIG_1 (ff-pointer curve) index (ptr p) weight))
)
(defmethod move-point ((curve geom-bspline-curve) (u real) (p gp:pnt) (index1 integer) (index2 integer))
  (with-foreign-objects ((&first-modified-pole :int)
                         (&last-modified-pole :int))
    (oc::_wrap_Geom_BSplineCurve_MovePoint (ff-pointer curve) u (ptr p) index1 index2 &first-modified-pole &last-modified-pole)
    (values (mem-aref &first-modified-pole :int)
            (mem-aref &last-modified-pole :int))))

(defmethod move-point-and-tangent ((curve geom-bspline-curve) (u real) (p gp:pnt) (tangent gp:vec) (tolerance real) (starting-condition integer) (ending-condition integer))
  (oc::_wrap_Geom_BSplineCurve_MovePointAndTangent (ff-pointer curve) u (ptr p) (ptr tangent) tolerance starting-condition ending-condition))

(defmethod is-rational ((curve geom-bspline-curve))
  (oc::_wrap_Geom_BSplineCurve_IsRational (ff-pointer curve)))

(defmethod continuity ((curve geom-bspline-curve))
  (oc::_wrap_Geom_BSplineCurve_Continuity (ff-pointer curve)))

(defmethod degree ((curve geom-bspline-curve))
  (oc::_wrap_Geom_BSplineCurve_Degree (ff-pointer curve)))

(defmethod local-value ((curve geom-bspline-curve) (u real) (from-k1 integer) (to-k1 integer))
  (oc::_wrap_Geom_BSplineCurve_LocalValue (ff-pointer curve) u from-k1 to-k1))

(defmethod end-point ((curve geom-bspline-curve))
  (let ((pnt (gp::make-pnt :ptr (oc::_wrap_Geom_BSplineCurve_EndPoint (ff-pointer curve)))))
    (oc::finalize pnt)
    pnt))

(defmethod start-point ((curve geom-bspline-curve))
  (let ((pnt (gp::make-pnt :ptr (oc::_wrap_Geom_BSplineCurve_StartPoint (ff-pointer curve)))))
    (oc::finalize pnt)
    pnt))

(defmethod nb-knots ((curve geom-bspline-curve))
  (oc::_wrap_Geom_BSplineCurve_NbKnots (ff-pointer curve)))

(defmethod nb-poles ((curve geom-bspline-curve))
  (oc::_wrap_Geom_BSplineCurve_NbPoles (ff-pointer curve)))

(defmethod get-pole ((curve geom-bspline-curve) (index integer))
  (let ((pnt (gp::make-pnt :ptr (oc::_wrap_Geom_BSplineCurve_Pole (ff-pointer curve) index))))
    (oc::finalize pnt)
    pnt))

(defmethod get-poles ((curve geom-bspline-curve))
  (with-foreign-object (pp :pointer)
    (oc::_wrap_Geom_BSplineCurve_Poles (ff-pointer curve) pp)
    (let ((array (allocate-instance 'oc::TColgp_Array1OfPnt)))
      (setf (ff-pointer array) (mem-aref pp :pointer))
      (oc::finalize array)
      array)))

(defmethod get-weight ((curve geom-bspline-curve) (index integer))
  (oc::_wrap_Geom_BSplineCurve_Weight (ff-pointer curve) index))

(defmethod get-knot ((curve geom-bspline-curve) (index integer))
  (oc::_wrap_Geom_BSplineCurve_Knot (ff-pointer curve) index))

(defmethod get-multiplicity ((curve geom-bspline-curve) (index integer))
  (oc::_wrap_Geom_BSplineCurve_Multiplicity (ff-pointer curve) index))
