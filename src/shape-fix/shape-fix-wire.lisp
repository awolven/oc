(in-package :oc)

(defmethod initialize-instance :after ((object shape-fix-wire) &rest initargs
				       &key wire face prec &allow-other-keys)
  (let ((pointer
	 (cond ((and (typep wire 'topods-wire)
		     (typep face 'topods-face)
		     (typep prec 'real))
		(_wrap_new_ShapeFix_Wire__SWIG_1 (ff-pointer wire) (ff-pointer face) (coerce prec 'double-float)))
	       ((and (null wire) (null face) (null prec))
		(_wrap_new_ShapeFix_Wire__SWIG_0))
	       (t (error "Invalid arguments to constructor: ~S" initargs)))))
    (setf (ff-pointer object) pointer) ;; 
    (oc:finalize object)
    (values)))

(defmethod clear-modes ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_ClearModes (ff-pointer object)))

(defmethod clear-statuses ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_ClearStatuses (ff-pointer object)))

(defmethod init-shape-fix ((object shape-fix-wire) (wire topods-wire) (face topods-face) (prec real))
  (_wrap_ShapeFix_Wire_Init__SWIG_0 (ff-pointer object)
				    (ff-pointer wire)
				    (ff-pointer face)
				    (coerce prec 'double-float)))

(defmethod load-shape-fix ((object shape-fix-wire) (wire topods-wire))
  (_wrap_ShapeFix_Wire_Load__SWIG_0 (ff-pointer object) (ff-pointer wire)))

(defmethod set-max-tail-angle ((object shape-fix-wire) (the-max-tail-angle real))
  (_wrap_ShapeFix_Wire_SetMaxTailAngle (ff-pointer object) (coerce the-max-tail-angle 'double-float)))

(defmethod set-max-tail-angle ((object shape-fix-wire) (the-max-tail-width real))
  (_wrap_ShapeFix_Wire_SetMaxTailWidth (ff-pointer object) (coerce the-max-tail-width 'double-float)))

(defmethod number-of-edges ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_NbEdges (ff-pointer object)))

(defmethod analyzer ((object shape-fix-wire))
  (let ((pointer (_wrap_ShapeFix_Wire_Analyzer (ff-pointer object))))
    ;;(make-instance 'shape-analysis-wire :ff-pointer pointer)
    pointer))

(defmethod perform ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_Perform (ff-pointer object)))

(defmethod fix-reorder ((object shape-fix-wire) &key wi)
  (if wi
      (_wrap_ShapeFix_Wire_FixReorder__SWIG_1 (ff-pointer object) (ff-pointer wi))
      (_wrap_ShapeFix_Wire_FixReorder__SWIG_0 (ff-pointer object))))

(defmethod fix-small ((object shape-fix-wire)&rest initargs
		      &key (precsmall nil precsmall-present-p)
			(lockvtx nil lockvtx-present-p)
			num)
  (cond ((and precsmall-present-p (realp precsmall) lockvtx-present-p (integerp num))
	 (_wrap_ShapeFix_Wire_FixSmall__SWIG_2 (ff-pointer object) num
					       (and lockvtx t) (coerce precsmall 'double-float)))
	((and precsmall-present-p (realp precsmall) lockvtx-present-p)
	 (_wrap_ShapeFix_Wire_FixSmall__SWIG_0 (ff-pointer object) (and lockvtx t) (coerce precsmall 'double-float)))
	(lockvtx-present-p (_wrap_ShapeFix_Wire_FixSmall__SWIG_1 (ff-pointer object) (and lockvtx t)))
	(t "Invalid arguments to fix-small: ~S" initargs)))

(defmethod fix-connected ((object shape-fix-wire) &key (prec nil prec-present-p) num)
  (cond ((and prec-present-p (realp prec) (integerp num))
	 (_wrap_ShapeFix_Wire_FixConnected__SWIG_2 (ff-pointer object) num (coerce prec 'double-float)))
	((and prec-present-p (realp prec))
	 (_wrap_ShapeFix_Wire_FixConnected__SWIG_0 (ff-pointer object) (coerce prec 'double-float)))
	(t (_wrap_ShapeFix_Wire_FixConnected__SWIG_1 (ff-pointer object)))))

(defmethod fix-edge-curves ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_FixEdgeCurves (ff-pointer object)))

(defmethod fix-degenerated ((object shape-fix-wire) &key (num nil num-present-p))
  (if (and num-present-p (integerp num))
      (_wrap_ShapeFix_Wire_FixDegenerated__SWIG_1 (ff-pointer object) num)
      (if (null num-present-p)
	  (_wrap_ShapeFix_Wire_FixDegenerated__SWIG_0 (ff-pointer object))
	  (error "`num' argument not an integer: ~S" num))))

(defmethod fix-self-intersection ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_FixSelfIntersection (ff-pointer object)))

(defmethod fix-lacking ((object shape-fix-wire) &rest initargs &key (force nil force-present-p) num)
  (cond ((and force-present-p (integerp num))
	 (_wrap_ShapeFix_Wire_FixLacking__SWIG_2 (ff-pointer object) num (and force t)))
	(force-present-p (_wrap_ShapeFix_Wire_FixLacking__SWIG_0 (ff-pointer object) (and force t)))
	((and (null force-present-p) (null num))
	 (_wrap_ShapeFix_Wire_FixLacking__SWIG_1 (ff-pointer object)))
	(t "Invalid arguments to fix-lacking: ~S" initargs)))

(defmethod fix-closed ((object shape-fix-wire) &key (prec nil prec-present-p))
  (cond ((and prec-present-p (realp prec))
	 (_wrap_ShapeFix_Wire_FixClosed__SWIG_0 (ff-pointer object) (coerce prec 'double-float)))
	(t (_wrap_ShapeFix_Wire_FixClosed__SWIG_1 (ff-pointer object)))))

(defmethod fix-gaps-3d ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_FixGaps3d (ff-pointer object)))

(defmethod fix-gaps-2d ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_FixGaps2d (ff-pointer object)))

(defmethod fix-seam ((object shape-fix-wire) (num integer))
  (_wrap_ShapeFix_Wire_FixSeam (ff-pointer object) num))

(defmethod fix-shifted ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_FixShifted (ff-pointer object)))

(defmethod fix-notched-edges ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_FixNotchedEdges (ff-pointer object)))

(defmethod fix-gap-3d ((object shape-fix-wire) (num integer) &key (convert nil convert-present-p))
  (if convert-present-p
      (_wrap_ShapeFix_Wire_FixGap3d__SWIG_0 (ff-pointer object) num (and convert t))
      (_wrap_ShapeFix_Wire_FixGap3d__SWIG_1 (ff-pointer object) num)))

(defmethod fix-gap-2d ((object shape-fix-wire) (num integer) &key (convert nil convert-present-p))
  (if convert-present-p
      (_wrap_ShapeFix_Wire_FixGap2d__SWIG_0 (ff-pointer object) num (and convert t))
      (_wrap_ShapeFix_Wire_FixGap2d__SWIG_1 (ff-pointer object) num)))

(defmethod fix-tails ((object shape-fix-wire))
  (_wrap_ShapeFix_Wire_FixTails (ff-pointer object)))

(defmethod wire-api-make ((object shape-fix-wire))
  (with-topods-shape (_wrap_ShapeFix_Wire_WireAPIMake (ff-pointer object))))

(defmethod wire ((object shape-fix-wire))
  (with-topods-shape (_wrap_ShapeFix_Wire_Wire (ff-pointer object))))
