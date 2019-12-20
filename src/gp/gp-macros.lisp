(in-package :gp)

(defcstruct gp-xy
  (x :double)
  (y :double))

(defmacro gp-xy-x (gp-xy)
  `(mem-aref ,gp-xy :double 0))

(defmacro gp-xy-y (gp-xy)
  `(mem-aref ,gp-xy :double 1))

(defcstruct gp-vec2d
  (coord (:struct gp-xy)))

(defcstruct gp-pnt2d
  (coord (:struct gp-xy)))

(defcstruct gp-dir2d
  (coord (:struct gp-xy)))

(defcstruct gp-ax2d
  (loc (:struct gp-pnt2d))
  (vdir (:struct gp-dir2d)))

(defmacro gp-ax2d-loc-coord-x (gp-ax2d)
  `(mem-aref ,gp-ax2d :double 0))

(defmacro gp-ax2d-loc-coord-y (gp-ax2d)
  `(mem-aref ,gp-ax2d :double 1))

(defmacro gp-ax2d-vdir-coord-x (gp-ax2d)
  `(mem-aref ,gp-ax2d :double 2))

(defmacro gp-ax2d-vdir-coord-y (gp-ax2d)
  `(mem-aref ,gp-ax2d :double 3))

(defcstruct gp-lin2d
  (pos (:struct gp-ax2d)))

(defmacro gp-lin2d-pos-loc-coord-x (gp-lin2d)
  `(mem-aref ,gp-lin2d :double 0))

(defmacro gp-lin2d-pos-loc-coord-y (gp-lin2d)
  `(mem-aref ,gp-lin2d :double 1))

(defmacro gp-lin2d-pos-vdir-coord-x (gp-lin2d)
  `(mem-aref ,gp-lin2d :double 2))

(defmacro gp-lin2d-pos-vdir-coord-y (gp-lin2d)
  `(mem-aref ,gp-lin2d :double 3))

(defcstruct gp-ax22d
  (point (:struct gp-pnt2d))
  (vydir (:struct gp-dir2d))
  (vxdir (:struct gp-dir2d)))

(defmacro gp-ax22d-point-coord-x (gp-ax22d)
  `(mem-aref ,gp-ax22d :double 0))

(defmacro gp-ax22d-point-coord-y (gp-ax22d)
  `(mem-aref ,gp-ax22d :double 1))

(defmacro gp-ax22d-vydir-coord-x (gp-ax22d)
  `(mem-aref ,gp-ax22d :double 2))

(defmacro gp-ax22d-vydir-coord-y (gp-ax22d)
  `(mem-aref ,gp-ax22d :double 3))

(defmacro gp-ax22d-vxdir-coord-x (gp-ax22d)
  `(mem-aref ,gp-ax22d :double 4))

(defmacro gp-ax22d-vxdir-coord-y (gp-ax22d)
  `(mem-aref ,gp-ax22d :double 5))

(defcstruct gp-circ2d
  (pos (:struct gp-ax22d))
  (radius :double))

(defmacro gp-circ2d-pos-loc-coord-x (gp-circ2d)
  `(mem-aref ,gp-circ2d :double 0))

(defmacro gp-circ2d-pos-loc-coord-y (gp-circ2d)
  `(mem-aref ,gp-circ2d :double 1))

(defmacro gp-circ2d-pos-vdir-coord-x (gp-circ2d)
  `(mem-aref ,gp-circ2d :double 2))

(defmacro gp-circ2d-pos-vdir-coord-y (gp-circ2d)
  `(mem-aref ,gp-circ2d :double 3))

(defmacro gp-circ2d-radius (gp-circ2d)
  `(mem-aref ,gp-circ2d :double 4))

(defctype gp-trsf-form :int)
(defctype gp-mat2d (:array :double 2 2))

(defcstruct gp-trsf2d
  (scale :double)
  (shape gp-trsf-form)
  (matrix gp-mat2d)
  (loc (:struct gp-xy)))




(defcstruct gp-xyz
  (x :double)
  (y :double)
  (z :double))

(defmacro gp-xyz-z (gp-xyz)
  `(mem-aref ,gp-xyz :double 2))

(defcstruct gp-pnt
  (coord (:struct gp-xyz)))

(defcstruct gp-dir
  (coord (:struct gp-xyz)))

(defcstruct gp-vec
  (coord (:struct gp-xyz)))

(defcstruct gp-ax1
  (loc (:struct gp-pnt))
  (vdir (:struct gp-dir)))

(defmacro gp-ax1-loc-coord-x (gp-ax1)
  `(mem-aref ,gp-ax1 :double 0))

(defmacro gp-ax1-loc-coord-y (gp-ax1)
  `(mem-aref ,gp-ax1 :double 1))

(defmacro gp-ax1-loc-coord-z (gp-ax1)
  `(mem-aref ,gp-ax1 :double 2))

(defmacro gp-ax1-vdir-coord-x (gp-ax1)
  `(mem-aref ,gp-ax1 :double 3))

(defmacro gp-ax1-vdir-coord-y (gp-ax1)
  `(mem-aref ,gp-ax1 :double 4))

(defmacro gp-ax1-vdir-coord-z (gp-ax1)
  `(mem-aref ,gp-ax1 :double 5))

(defcstruct gp-lin
  (pos (:struct gp-ax1)))

(defmacro gp-lin-pos-loc-coord-x (gp-lin)
  `(mem-aref ,gp-lin :double 0))

(defmacro gp-lin-pos-loc-coord-y (gp-lin)
  `(mem-aref ,gp-lin :double 1))

(defmacro gp-lin-pos-loc-coord-z (gp-lin)
  `(mem-aref ,gp-lin :double 2))

(defmacro gp-lin-pos-vdir-coord-x (gp-lin)
  `(mem-aref ,gp-lin :double 3))

(defmacro gp-lin-pos-vdir-coord-y (gp-lin)
  `(mem-aref ,gp-lin :double 4))

(defmacro gp-lin-pos-vdir-coord-z (gp-lin)
  `(mem-aref ,gp-lin :double 5))

(defcstruct gp-ax2
  (axis (:struct gp-ax1))
  (vydir (:struct gp-dir))
  (vxdir (:struct gp-dir)))

(defmacro gp-ax2-axis-loc-coord-x (gp-ax2)
  `(mem-aref ,gp-ax2 :double 0))

(defmacro gp-ax2-axis-loc-coord-y (gp-ax2)
  `(mem-aref ,gp-ax2 :double 1))

(defmacro gp-ax2-axis-loc-coord-z (gp-ax2)
  `(mem-aref ,gp-ax2 :double 2))

(defmacro gp-ax2-axis-vdir-coord-x (gp-ax2)
  `(mem-aref ,gp-ax2 :double 3))

(defmacro gp-ax2-axis-vdir-coord-y (gp-ax2)
  `(mem-aref ,gp-ax2 :double 4))

(defmacro gp-ax2-axis-vdir-coord-z (gp-ax2)
  `(mem-aref ,gp-ax2 :double 5))

(defmacro gp-ax2-vydir-coord-x (gp-ax2)
  `(mem-aref ,gp-ax2 :double 6))

(defmacro gp-ax2-vydir-coord-y (gp-ax2)
  `(mem-aref ,gp-ax2 :double 7))

(defmacro gp-ax2-vydir-coord-z (gp-ax2)
  `(mem-aref ,gp-ax2 :double 8))

(defmacro gp-ax2-vxdir-coord-x (gp-ax2)
  `(mem-aref ,gp-ax2 :double 9))

(defmacro gp-ax2-vxdir-coord-y (gp-ax2)
  `(mem-aref ,gp-ax2 :double 10))

(defmacro gp-ax2-vxdir-coord-z (gp-ax2)
  `(mem-aref ,gp-ax2 :double 11))

(defcstruct gp-circ
  (pos (:struct gp-ax2))
  (radius :double))

(defmacro gp-circ-pos-axis-loc-coord-x (gp-circ)
  `(mem-aref ,gp-circ :double 0))

(defmacro gp-circ-pos-axis-loc-coord-y (gp-circ)
  `(mem-aref ,gp-circ :double 1))

(defmacro gp-circ-pos-axis-loc-coord-z (gp-circ)
  `(mem-aref ,gp-circ :double 2))

(defmacro gp-circ-pos-axis-vdir-coord-x (gp-circ)
  `(mem-aref ,gp-circ :double 3))

(defmacro gp-circ-pos-axis-vdir-coord-y (gp-circ)
  `(mem-aref ,gp-circ :double 4))

(defmacro gp-circ-pos-axis-vdir-coord-z (gp-circ)
  `(mem-aref ,gp-circ :double 5))

(defmacro gp-circ-pos-vydir-coord-x (gp-circ)
  `(mem-aref ,gp-circ :double 6))

(defmacro gp-circ-pos-vydir-coord-y (gp-circ)
  `(mem-aref ,gp-circ :double 7))

(defmacro gp-circ-pos-vydir-coord-z (gp-circ)
  `(mem-aref ,gp-circ :double 8))

(defmacro gp-circ-pos-vxdir-coord-x (gp-circ)
  `(mem-aref ,gp-circ :double 9))

(defmacro gp-circ-pos-vxdir-coord-y (gp-circ)
  `(mem-aref ,gp-circ :double 10))

(defmacro gp-circ-pos-vxdir-coord-z (gp-circ)
  `(mem-aref ,gp-circ :double 11))

(defmacro gp-circ-radius (gp-circ)
  `(mem-aref ,gp-circ :double 12))

(defcstruct gp-elips
  (pos (:struct gp-ax2))
  (major-radius :double)
  (minor-radius :double))

(defmacro gp-elips-pos-axis-loc-coord-x (gp-elips)
  `(mem-aref ,gp-elips :double 0))

(defmacro gp-elips-pos-axis-loc-coord-y (gp-elips)
  `(mem-aref ,gp-elips :double 1))

(defmacro gp-elips-pos-axis-loc-coord-z (gp-elips)
  `(mem-aref ,gp-elips :double 2))

(defmacro gp-elips-pos-axis-vdir-coord-x (gp-elips)
  `(mem-aref ,gp-elips :double 3))

(defmacro gp-elips-pos-axis-vdir-coord-y (gp-elips)
  `(mem-aref ,gp-elips :double 4))

(defmacro gp-elips-pos-axis-vdir-coord-z (gp-elips)
  `(mem-aref ,gp-elips :double 5))

(defmacro gp-elips-pos-vydir-coord-x (gp-elips)
  `(mem-aref ,gp-elips :double 6))

(defmacro gp-elips-pos-vydir-coord-y (gp-elips)
  `(mem-aref ,gp-elips :double 7))

(defmacro gp-elips-pos-vydir-coord-z (gp-elips)
  `(mem-aref ,gp-elips :double 8))

(defmacro gp-elips-pos-vxdir-coord-x (gp-elips)
  `(mem-aref ,gp-elips :double 9))

(defmacro gp-elips-pos-vxdir-coord-y (gp-elips)
  `(mem-aref ,gp-elips :double 10))

(defmacro gp-elips-pos-vxdir-coord-z (gp-elips)
  `(mem-aref ,gp-elips :double 11))

(defmacro gp-elips-major-radius (gp-elips)
  `(mem-aref ,gp-elips :double 12))

(defmacro gp-elips-minor-radius (gp-elips)
  `(mem-aref ,gp-elips :double 13))

(defcstruct gp-ax3
  (axis (:struct gp-ax1))
  (vydir (:struct gp-dir))
  (vxdir (:struct gp-dir)))

(defmacro gp-ax3-axis-loc-coord-x (gp-ax3)
  `(mem-aref ,gp-ax3 :double 0))

(defmacro gp-ax3-axis-loc-coord-y (gp-ax3)
  `(mem-aref ,gp-ax3 :double 1))

(defmacro gp-ax3-axis-loc-coord-z (gp-ax3)
  `(mem-aref ,gp-ax3 :double 2))

(defmacro gp-ax3-axis-vdir-coord-x (gp-ax3)
  `(mem-aref ,gp-ax3 :double 3))

(defmacro gp-ax3-axis-vdir-coord-y (gp-ax3)
  `(mem-aref ,gp-ax3 :double 4))

(defmacro gp-ax3-axis-vdir-coord-z (gp-ax3)
  `(mem-aref ,gp-ax3 :double 5))

(defmacro gp-ax3-vydir-coord-x (gp-ax3)
  `(mem-aref ,gp-ax3 :double 6))

(defmacro gp-ax3-vydir-coord-y (gp-ax3)
  `(mem-aref ,gp-ax3 :double 7))

(defmacro gp-ax3-vydir-coord-z (gp-ax3)
  `(mem-aref ,gp-ax3 :double 8))

(defmacro gp-ax3-vxdir-coord-x (gp-ax3)
  `(mem-aref ,gp-ax3 :double 9))

(defmacro gp-ax3-vxdir-coord-y (gp-ax3)
  `(mem-aref ,gp-ax3 :double 10))

(defmacro gp-ax3-vxdir-coord-z (gp-ax3)
  `(mem-aref ,gp-ax3 :double 11))

(defcstruct gp-pln
  (pos (:struct gp-ax3)))

(defmacro gp-pln-pos-axis-loc-coord-x (gp-pln)
  `(mem-aref ,gp-pln :double 0))

(defmacro gp-pln-pos-axis-loc-coord-y (gp-pln)
  `(mem-aref ,gp-pln :double 1))

(defmacro gp-pln-pos-axis-loc-coord-z (gp-pln)
  `(mem-aref ,gp-pln :double 2))

(defmacro gp-pln-pos-axis-vdir-coord-x (gp-pln)
  `(mem-aref ,gp-pln :double 3))

(defmacro gp-pln-pos-axis-vdir-coord-y (gp-pln)
  `(mem-aref ,gp-pln :double 4))

(defmacro gp-pln-pos-axis-vdir-coord-z (gp-pln)
  `(mem-aref ,gp-pln :double 5))

(defmacro gp-pln-pos-vydir-coord-x (gp-pln)
  `(mem-aref ,gp-pln :double 6))

(defmacro gp-pln-pos-vydir-coord-y (gp-pln)
  `(mem-aref ,gp-pln :double 7))

(defmacro gp-pln-pos-vydir-coord-z (gp-pln)
  `(mem-aref ,gp-pln :double 8))

(defmacro gp-pln-pos-vxdir-coord-x (gp-pln)
  `(mem-aref ,gp-pln :double 9))

(defmacro gp-pln-pos-vxdir-coord-y (gp-pln)
  `(mem-aref ,gp-pln :double 10))

(defmacro gp-pln-pos-vxdir-coord-z (gp-pln)
  `(mem-aref ,gp-pln :double 11))

(defcstruct gp-cone
  (pos (:struct gp-ax3))
  (radius :double)
  (semi-angle :double))

(defmacro gp-cone-pos-axis-loc-coord-x (gp-cone)
  `(mem-aref ,gp-cone :double 0))

(defmacro gp-cone-pos-axis-loc-coord-y (gp-cone)
  `(mem-aref ,gp-cone :double 1))

(defmacro gp-cone-pos-axis-loc-coord-z (gp-cone)
  `(mem-aref ,gp-cone :double 2))

(defmacro gp-cone-pos-axis-vdir-coord-x (gp-cone)
  `(mem-aref ,gp-cone :double 3))

(defmacro gp-cone-pos-axis-vdir-coord-y (gp-cone)
  `(mem-aref ,gp-cone :double 4))

(defmacro gp-cone-pos-axis-vdir-coord-z (gp-cone)
  `(mem-aref ,gp-cone :double 5))

(defmacro gp-cone-pos-vydir-coord-x (gp-cone)
  `(mem-aref ,gp-cone :double 6))

(defmacro gp-cone-pos-vydir-coord-y (gp-cone)
  `(mem-aref ,gp-cone :double 7))

(defmacro gp-cone-pos-vydir-coord-z (gp-cone)
  `(mem-aref ,gp-cone :double 8))

(defmacro gp-cone-pos-vxdir-coord-x (gp-cone)
  `(mem-aref ,gp-cone :double 9))

(defmacro gp-cone-pos-vxdir-coord-y (gp-cone)
  `(mem-aref ,gp-cone :double 10))

(defmacro gp-cone-pos-vxdir-coord-z (gp-cone)
  `(mem-aref ,gp-cone :double 11))

(defmacro gp-cone-radius (gp-cone)
  `(mem-aref ,gp-cone :double 12))

(defmacro gp-cone-semi-angle (gp-cone)
  `(mem-aref ,gp-cone :double 13))

(defcstruct gp-cylinder
  (pos (:struct gp-ax3))
  (radius :double))

(defmacro gp-cylinder-pos-axis-loc-coord-x (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 0))

(defmacro gp-cylinder-pos-axis-loc-coord-y (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 1))

(defmacro gp-cylinder-pos-axis-loc-coord-z (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 2))

(defmacro gp-cylinder-pos-axis-vdir-coord-x (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 3))

(defmacro gp-cylinder-pos-axis-vdir-coord-y (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 4))

(defmacro gp-cylinder-pos-axis-vdir-coord-z (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 5))

(defmacro gp-cylinder-pos-vydir-coord-x (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 6))

(defmacro gp-cylinder-pos-vydir-coord-y (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 7))

(defmacro gp-cylinder-pos-vydir-coord-z (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 8))

(defmacro gp-cylinder-pos-vxdir-coord-x (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 9))

(defmacro gp-cylinder-pos-vxdir-coord-y (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 10))

(defmacro gp-cylinder-pos-vxdir-coord-z (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 11))

(defmacro gp-cylinder-radius (gp-cylinder)
  `(mem-aref ,gp-cylinder :double 12))

(defctype gp-mat (:array :double 3 3))

(defmacro gp-mat-ref (gp-mat i j)
  `(mem-aref ,gp-mat :double (+ (* ,i 3) ,j)))

(defcstruct gp-trsf
  (scale :double)
  (shape :int)
  (matrix gp-mat)
  (loc (:struct gp-xyz)))

(defmacro gp-trsf-scale (gp-trsf)
  `(mem-aref ,gp-trsf :double 0))

(defmacro gp-trsf-shape (gp-trsf)
  `(mem-aref ,gp-trsf :int 2))

(defmacro gp-trsf-matrix-ref (gp-trsf i j)
  `(mem-aref ,gp-trsf :double (+ 2 (* ,i 3) ,j)))

(defmacro gp-trsf-loc-x (gp-trsf)
  `(mem-aref ,gp-trsf :double 11))

(defmacro gp-trsf-loc-y (gp-trsf)
  `(mem-aref ,gp-trsf :double 12))

(defmacro gp-trsf-loc-z (gp-trsf)
  `(mem-aref ,gp-trsf :double 13))
