(in-package :gp)

#|
  Name                        defcstruct macro-accessors defstruct constructor accessors methods constructor-wrapped methods-wrapped
---------------------------------------------------------------------------------------------------------------------------------------
  gp_Ax1                      X          X               X         X
  gp_Ax22d                    X          X               X         X
  gp_Ax2d                     X          X               X         X
  gp_Ax2                      X          X               X         X
  gp_Ax3                      X          X               X         X
  gp_Circ2d                   X          X               X         X
  gp_Circ                     X          X               X         X
  gp_Cone                     X          X               X
  gp_Cylinder                 X          X               X
  gp_Dir2d                    X                          X         X
  gp_Dir                      X                          X
  gp_Elips2d
  gp_Elips                    X          X
  gp_EulerSequence
  gp_GTrsf2d
  gp_GTrsf
  gp
  gp_Hypr2d
  gp_Hypr
  gp_Lin2d                    X                          X
  gp_Lin                      X          X               X         X
  gp_Mat2d
  gp_Mat                      X          X               X
  gp_Parab2d
  gp_Parab
  gp_Pln                      X          X               X         X
  gp_Pnt2d                    X                          X         X
  gp_Pnt                      X                          X         X
  gp_Quaternion
  gp_QuaternionNLerp
  gp_QuaternionSLerp
  gp_Sphere
  gp_Torus
  gp_Trsf2d
  gp_TrsfForm
  gp_Trsf                     X                          X
  gp_TrsfNLerp
  gp_Vec2d                    X                          X         X
  gp_Vec                      X                          X         X
  gp_VectorWithNullMagnitude
  gp_XY                       X          X               X         X
  gp_XYZ                      X          X               X         X
|#

(defconstant +resolution+ 1.0d-37)
	   
(deftype pointer () #+SBCL 'sb-sys:system-area-pointer)

(defparameter +null-pointer+ (load-time-value (make-pointer 0)))

(defconstant +trsf-identity+ 0)
(defconstant +trsf-rotation+ 1)
(defconstant +trsf-translation+ 2)
(defconstant +trsf-pnt-mirror+ 3)
(defconstant +trsf-ax1-mirror+ 4)
(defconstant +trsf-ax2-mirror+ 5)
(defconstant +trsf-scale+ 6)
(defconstant +trsf-compound-trsf+ 7)
(defconstant +trsf-other+ 8)

(defstruct (gpthing (:conc-name ""))
  (ptr +null-pointer+ :type pointer)
  (own nil))

(defstruct (xy (:include gpthing)))
;; xy functions:
;; 1st constructor
;; 2nd constructor
;; (setf coord) - done
;; (setf x) - done
;; (setf y) - done
;; coord --> make return (xy X Y) instead of (values X Y), in this case, identity. - done
;; x - done
;; y - done
;; modulus - done
;; square-modulus - done
;; equal? - done
;; add! - done
;; added - done
;; crossed - done
;; cross-magnitude - done
;; cross-square-magnitude - done
;; divide! - done
;; divided - done
;; dot - done
;; multiply! w/ scalar - done
;; multiply! w/ xy - done
;; multiply! w/ matrix - done
;; multiplied w/ scalar - done
;; multiplied w/ xy - done
;; multiplied w/ matrix - done
;; normalize! - done
;; normalized - done
;; reverse! - done
;; reversed - done
;; SetLinearForm X4 methods - skipped for now.
;; subtract! - done
;; subtracted - done

(defstruct (vec2d (:include gpthing)))
;; vec2d functions:
;; 4 x constructors - done
;; (setf coord) - make defmethod (setf coord) ((coord xy) (object vec2d)) to have congruent lambda list with 3d - done
;; (setf x) - done
;; (setf y) - done
;; (setf xy) - omit
;; coord --> make return (make-xy :ptr (ptr vec) X Y) instead of (values X Y) - done
;; x - done
;; y - done
;; xy - omit
;; equal? - done
;; normal? - done
;; opposite? - done
;; parallel? - done
;; angle - done
;; magnitude - done
;; square-magnitude - done
;; add! - done
;; added - done
;; crossed - done
;; cross-magnitude - done
;; cross-square-magnitude - done
;; divide - done
;; divided - done
;; dot - done
;; get-normal - done (normal)
;; normalize! - done
;; normalized
;; reverse!
;; reversed
;; subtract!
;; subtracted
;; SetLinearForm x 4
;; mirror! x 2
;; mirrored x 2
;; rotate!
;; rotated
;; scale!
;; scaled
;; transform!
;; transformed

(defstruct (pnt2d (:include gpthing)))

;; constructor x 3
;; (setf coord)
;; (setf x)
;; (setf y)
;; (setf xy) - omit
;; coord --> make return (make-xy :ptr (ptr vec) X Y) instead of (values X Y)
;; x
;; y
;; xy - omit
;; coord
;; change-coord (isn't this the same as setf coord, or setf xy ??? which ones are copies and which ones are pointers?
;; equal?
;; distance
;; square-distance
;; mirror! x2
;; mirrored x2
;; rotate!
;; rotated
;; scale!
;; scaled
;; transform!
;; transformed
;; translate!
;; translated

(defstruct (dir2d (:include gpthing)))
;; constructor x4
;; (setf coord)
;; (setf x)
;; (setf y)
;; (setf xy) - omit ;; the difference between this and setf coord is that setf coord takes two arguments and this one
;; coord
;; x
;; y
;; xy - omit
;; equal?
;; normal?
;; opposite?
;; parallel?
;; angle
;; crossed
;; dot
;; reverse!
;; reversed
;; mirror! x2
;; mirrored x2
;; rotate!
;; rotated
;; transform!
;; transformed

;; In the xy, (setf xy) vs. coord, (setf coord) battle, coord is more generic
;; later when I reach the 3d gp structs, coord will return an xyz


(defstruct (ax2d (:include gpthing)))

(defstruct (lin2d (:include gpthing)))

(defstruct (circ2d (:include gpthing)))

(defstruct (elips2d (:include gpthing)))

(defstruct (hypr2d (:include gpthing)))

(defstruct (parab2d (:include gpthing)))

(defstruct (mat2d (:include gpthing)))
;; constructor
;; constructor column1 column2
;; (setf column)
;; (setf columns)
;; (setf diagonal)
;; set-identity!
;; (setf rotation)
;; (setf row)
;; (setf rows)
;; (setf scale)
;; (setf value)
;; column
;; determinant
;; diagonal
;; row
;; value
;; change-value
;; singular?
;; add!
;; added
;; divide!
;; divided
;; Invert!
;; Inverted
;; multiplied by matrix
;; multiply!
;; pre-multiply!
;; multiplied by scalar
;; power!
;; powered
;; subtract!
;; subtracted
;; transpose!
;; transposed






(defstruct (trsf2d (:include gpthing)))
;; constructor (identity)
;; constructor from 3d Trsf
;; SetMirror
;; SetRotation
;; SetScale
;; SetTransformation x 2
;; SetTranslation x 2
;; SetTranslationPart
;; SetScaleFactor
;; IsNegative
;; Form
;; TranslationPart
;; VectorialPart
;; HVectorialPart
;; RotationPart
;; Value
;; Invert
;; Inverted
;; Multiplied
;; Multiply
;; PreMultiply
;; Power
;; Powered
;; Transforms
;; SetValues
;; Orthogonalize

(defstruct (xyz (:include gpthing)))
;; constructor (two methods)
;; SetCoord
;; SetX
;; SetY
;; SetZ
;; Coord
;; X
;; Y
;; Z
;; Modulus
;; SquareModulus
;; IsEqual
;; Add
;; Added
;; Cross
;; Crossed
;; CrossMagnitude
;; CrossSquareMagnitude
;; CrossCross
;; CrossCrossed
;; Divide
;; Divided
;; Dot
;; DotCross
;; Multiply by scalar
;; Multiply by xyz
;; Multiply by Matrix
;; Multiplied by scalar
;; Multiplied by XYZ
;; Multiplied by matrix
;; Normalize
;; Normalized
;; Reverse
;; Reversed
;; Subtract
;; Subtracted

(defstruct (vec (:include gpthing)))

(defstruct (pnt (:include gpthing)))

(defstruct (dir (:include gpthing)))

(defstruct (mat (:include gpthing)))

(defstruct (ax1 (:include gpthing)))

(defstruct (ax2 (:include gpthing)))

(defstruct (ax22d (:include gpthing)))

(defstruct (ax3 (:include gpthing)))

(defstruct (lin (:include gpthing)))

(defstruct (circ (:include gpthing)))

(defstruct (elips (:include gpthing)))

(defstruct (parab (:include gpthing)))

(defstruct (hypr (:include gpthing)))

(defstruct (pln (:include gpthing)))

(defstruct (cone (:include gpthing)))

(defstruct (cylinder (:include gpthing)))

(defstruct (trsf (:include gpthing)))

