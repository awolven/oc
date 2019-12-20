(cl:in-package :cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (ql:quickload :cffi))

(defpackage :gp
  (:use :cl :cffi)
  (:shadow #:position)
  (:import-from :sb-ext #:finalize)
  (:export #:ptr
	   
	   #:xy
	   #:make-xy
	   #:xy-p
	   
	   #:vec2d
	   #:make-vec2d
	   #:vec2d-p
	   
	   #:pnt2d
	   #:make-pnt2d
	   #:pnt2d-p
	   
	   #:dir2d
	   #:make-dir2d
	   #:dir2d-p
	   
	   #:ax2d
	   #:make-ax2d
	   #:ax2d-p
	   
	   #:lin2d
	   #:make-lin2d
	   #:lin2d-p
	   
	   #:ax22d
	   #:make-ax22d
	   #:ax22d-p
	   
	   #:circ2d
	   #:make-circ2d
	   #:circ2d-p
	   
	   #:elips2d
	   #:make-elips2d
	   #:elips2d-p
	   
	   #:parab2d
	   #:make-parab2d
	   #:parab2d-p
	   
	   #:hypr2d
	   #:make-hypr2d
	   #:hyper2d-p
	   
	   #:mat2d
	   #:make-mat2d
	   #:mat2d-p
	   
	   #:trsf2d
	   #:make-trsf2d
	   #:trsf2d-p
	   
	   #:g-trsf2d
	   #:make-g-trsf2d
	   #:g-trsf2d-p
	   
	   #:xyz
	   #:make-xyz
	   #:xyz-p
	   
	   #:pnt
	   #:make-pnt
	   #:pnt-p
	   
	   #:dir
	   #:make-dir
	   #:dir-p
	   
	   #:vec
	   #:make-vec
	   #:vec-p
	   
	   #:ax1
	   #:make-ax1
	   #:ax1-p
	   
	   #:ax2
	   #:make-ax2
	   #:ax2-p
	   
	   #:ax3
	   #:make-ax3
	   #:ax3-p
	   
	   #:lin
	   #:make-lin
	   #:lin-p
	   
	   #:circ
	   #:make-circ
	   #:circ-p
	   
	   #:elips
	   #:make-elips
	   #:elips-p
	   
	   #:cone
	   #:make-cone
	   #:cone-p
	   
	   #:cylinder
	   #:make-cylinder
	   #:cylinder-p
	   
	   #:sphere
	   #:make-sphere
	   #:sphere-p
	   
	   #:trsf
	   #:make-trsf
	   #:trsf-p
	   
	   #:g-trsf
	   
	   #:parab
	   #:make-parab
	   #:parab-p
	   
	   #:hypr
	   #:make-hypr
	   #:hypr-p
	   
	   #:mat
	   #:make-mat
	   #:mat-p
	   
	   #:quaternion
	   #:make-quaternion
	   #:quaternion-p
	   
	   #:torus
	   #:make-torus
	   #:torus-p

	   #:pln
	   #:make-pln
	   #:pln-p
	   
	   #:trsf-form
	   
	   #:vector-with-null-magnitude
	   
	   #:trsf-n-lerp
	   
	   #:quaternion-n-lerp
	   #:quaternion-s-lerp
	   
	   #:euler-sequence

	   #:coord
	   #:modulus
	   #:square-modulus
	   #:equal?
	   #:add!
	   #:added
	   #:crossed
	   #:cross-magnitude
	   #:cross-square-magnitude
	   #:divide!
	   #:divided
	   #:dot
	   #:multiply!
	   #:pre-multiply!
	   #:multiplied
	   #:normalize!
	   #:normalized
	   #:reverse!
	   #:reversed
	   #:subtract!
	   #:subtracted
	   #:magnitude
	   #:square-magnitude
	   #:cross!
	   #:angle
	   #:normal
	   #:normal?
	   #:opposite?
	   #:parallel?
	   #:distance
	   #:square-distance
	   #:get-value2
	   #:set-value2
	   #:diagonal
	   #:identity!
	   #:rotate!
	   #:rotation
	   #:scale
	   #:determinant
	   #:column
	   #:row
	   #:diagonal
	   #:invert!
	   #:inverted
	   #:copy
	   #:exponentiate!
	   #:singular?
	   #:pre-multiply
	   #:exponentiated
	   #:transpose!
	   #:transposed
	   #:location
	   #:direction
	   #:mirror
	   #:rotation2
	   #:scale2
	   #:translation
	   #:translation2
	   #:negative?
	   #:translation-part
	   #:homogeneous-vectorial-part
	   #:scale-factor
	   #:cross-crossed
	   #:cross-cross!
	   #:dot-cross
	   #:position
	   #:direct?
	   #:set-values
	   #:coefficients
	   ;;

	   #:transformation
	   #:transformation2

	   #:axis
	   #:x-axis
	   #:y-axis
	   #:eccentricity

	   #:radius

	   #:major-radius
	   #:minor-radius
	   #:directrix1
	   #:directrix2
	   #:focal-length
	   #:focus1
	   #:focus2
	   #:parameter

	   #:asymptote1
	   #:asymptote2
	   #:conjugate-branch1
	   #:conjugate-branch2
	   #:other-branch
	   ))

(defpackage :oc
  (:use :cl :cffi)
  (:shadow #:position)
  (:import-from :gp #:ptr)
  (:export #:ff-pointer

	   #:mirror
	   #:rotation
	   #:rotation2
	   #:scale
	   #:scale2
	   #:transformation
	   #:transformation2
	   #:translation
	   #:translation2
	   #:negative?
	   #:transform-form
	   #:scale-factor
	   #:get-value2
	   #:invert!
	   #:inverted
	   #:multiplied
	   #:multiply!
	   #:power!
	   #:powered
	   #:pre-multiply!
	   #:transforms

	   #:mirror!
	   #:rotate!
	   #:scale!
	   #:translate!
	   #:translate2!
	   #:mirrored
	   #:rotated
	   #:scaled
	   #:transformed
	   #:translated
	   #:translated2
	   #:transform!
	   #:copy

	   #:reverse!
	   #:reversed
	   #:angle
	   #:coord
	   #:magnitude
	   #:square-magnitude
	   #:x
	   #:y
	   #:cross!
	   #:crossed
	   #:cross-cross!
	   #:cross-crossed
	   #:dot
	   #:processor

	   #:add!
	   #:added
	   #:divide!
	   #:divided
	   #:multiply!
	   #:mutiplied

	   #:subtract!
	   #:subtracted

	   #:distance
	   #:square-distance

	   #:reversed-parameter
	   #:transformed-parameter
	   #:parametric-transformation
	   #:first-parameter
	   #:last-parameter
	   #:closed?
	   #:periodic?
	   #:period
	   #:continuity
	   #:continuous-n?
	   #:zeroeth-derivative
	   #:first-derivative
	   #:second-derivative
	   #:thrid-derivative
	   #:nth-derivative
	   #:evaluate-curve

	   #:direction
	   #:location
	   #:position

	   #:axis
	   #:x-axis
	   #:y-axis
	   #:eccentricity

	   #:radius

	   #:major-radius
	   #:minor-radius
	   #:directrix1
	   #:directrix2
	   #:focal-length
	   #:focus1
	   #:focus2
	   #:parameter

	   #:asymptote1
	   #:asymptote2
	   #:conjugate-branch1
	   #:conjugate-branch2
	   #:other-branch

	   #:start-point
	   #:end-point

	   #:basis-curve

	   #:get-length
	   #:get-lower
	   #:get-upper
	   #:get-value

	   #:set-value
	   #:set-value2

	   #:more?
	   #:next

	   #:list-append

	   #:map-of-shape-key

	   #:add
	   #:contains

	   #:bounds

	   #:z

	   #:modulus
	   #:square-modulus
	   #:equal?

	   #:cross-magnitude
	   #:cross-square-magnitude

	   #:normal
	   #:normal?
	   #:opposite?
	   #:parallel?
	   #:diagonal
	   #:identity!
	   #:rotation
	   #:scale
	   #:determinant
	   #:column
	   #:row
	   #:invert!
	   #:exponentiate!
	   #:singular?
	   #:inverted
	   #:exponentiated
	   #:transpose!
	   #:transposed

	   #:translation-part
	   #:homogeneous-vectorial-part
	   #:trsf-form
	   #:scale-factor
	   #:coefficients
	   
	   #:dot-cross
	   #:cross
	   #:cross-cross
	   #:direct?

	   #:normalize!
	   #:normalized

))

(defpackage :gp
  (:use :cl :cffi)
  (:shadow #:position)
  (:import-from :sb-ext #:finalize)
  (:import-from :oc #:x #:y #:z)
  (:export #:ptr
	   
	   #:xy
	   #:make-xy
	   #:xy-p
	   
	   #:vec2d
	   #:make-vec2d
	   #:vec2d-p
	   
	   #:pnt2d
	   #:make-pnt2d
	   #:pnt2d-p
	   
	   #:dir2d
	   #:make-dir2d
	   #:dir2d-p
	   
	   #:ax2d
	   #:make-ax2d
	   #:ax2d-p
	   
	   #:lin2d
	   #:make-lin2d
	   #:lin2d-p
	   
	   #:ax22d
	   #:make-ax22d
	   #:ax22d-p
	   
	   #:circ2d
	   #:make-circ2d
	   #:circ2d-p
	   
	   #:elips2d
	   #:make-elips2d
	   #:elips2d-p
	   
	   #:parab2d
	   #:make-parab2d
	   #:parab2d-p
	   
	   #:hypr2d
	   #:make-hypr2d
	   #:hyper2d-p
	   
	   #:mat2d
	   #:make-mat2d
	   #:mat2d-p
	   
	   #:trsf2d
	   #:make-trsf2d
	   #:trsf2d-p
	   
	   #:g-trsf2d
	   #:make-g-trsf2d
	   #:g-trsf2d-p
	   
	   #:xyz
	   #:make-xyz
	   #:xyz-p
	   
	   #:pnt
	   #:make-pnt
	   #:pnt-p
	   
	   #:dir
	   #:make-dir
	   #:dir-p
	   
	   #:vec
	   #:make-vec
	   #:vec-p
	   
	   #:ax1
	   #:make-ax1
	   #:ax1-p
	   
	   #:ax2
	   #:make-ax2
	   #:ax2-p
	   
	   #:ax3
	   #:make-ax3
	   #:ax3-p
	   
	   #:lin
	   #:make-lin
	   #:lin-p
	   
	   #:circ
	   #:make-circ
	   #:circ-p
	   
	   #:elips
	   #:make-elips
	   #:elips-p
	   
	   #:cone
	   #:make-cone
	   #:cone-p
	   
	   #:cylinder
	   #:make-cylinder
	   #:cylinder-p
	   
	   #:sphere
	   #:make-sphere
	   #:sphere-p
	   
	   #:trsf
	   #:make-trsf
	   #:trsf-p
	   
	   #:g-trsf
	   
	   #:parab
	   #:make-parab
	   #:parab-p
	   
	   #:hypr
	   #:make-hypr
	   #:hypr-p
	   
	   #:mat
	   #:make-mat
	   #:mat-p
	   
	   #:quaternion
	   #:make-quaternion
	   #:quaternion-p
	   
	   #:torus
	   #:make-torus
	   #:torus-p

	   #:pln
	   #:make-pln
	   #:pln-p
	   
	   #:trsf-form
	   
	   #:vector-with-null-magnitude
	   
	   #:trsf-n-lerp
	   
	   #:quaternion-n-lerp
	   #:quaternion-s-lerp
	   
	   #:euler-sequence

	   #:coord
	   #:modulus
	   #:square-modulus
	   #:equal?
	   #:add!
	   #:added
	   #:crossed
	   #:cross-magnitude
	   #:cross-square-magnitude
	   #:divide!
	   #:divided
	   #:dot
	   #:multiply!
	   #:pre-multiply!
	   #:multiplied
	   #:normalize!
	   #:normalized
	   #:reverse!
	   #:reversed
	   #:subtract!
	   #:subtracted
	   #:magnitude
	   #:square-magnitude
	   #:cross!
	   #:angle
	   #:normal
	   #:normal?
	   #:opposite?
	   #:parallel?
	   #:distance
	   #:square-distance
	   #:get-value2
	   #:set-value2
	   #:diagonal
	   #:identity!
	   #:rotate!
	   #:rotation
	   #:scale
	   #:determinant
	   #:column
	   #:row
	   #:diagonal
	   #:invert!
	   #:inverted
	   #:copy
	   #:exponentiate!
	   #:singular?
	   #:pre-multiply
	   #:exponentiated
	   #:transpose!
	   #:transposed
	   #:location
	   #:direction
	   #:mirror
	   #:rotation2
	   #:scale2
	   #:translation
	   #:translation2
	   #:negative?
	   #:translation-part
	   #:homogeneous-vectorial-part
	   #:scale-factor
	   #:cross-crossed
	   #:cross-cross!
	   #:dot-cross
	   #:position
	   #:direct?
	   #:set-values
	   #:coefficients

	   ;;

	   #:transformation
	   #:transformation2

	   #:axis
	   #:x-axis
	   #:y-axis
	   #:eccentricity

	   #:radius

	   #:major-radius
	   #:minor-radius
	   #:directrix1
	   #:directrix2
	   #:focal-length
	   #:focus1
	   #:focus2
	   #:parameter

	   #:asymptote1
	   #:asymptote2
	   #:conjugate-branch1
	   #:conjugate-branch2
	   #:other-branch
	   ))
