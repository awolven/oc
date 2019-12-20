(in-package :cl-user)

(defpackage :gp-test
  (:use :cl :it.bese.FiveAM))

(in-package :gp-test)

(cffi:defcfun (memcmp "memcmp") :int
  (str1 :pointer)
  (str2 :pointer)
  (n :unsigned-long-long))

(test trsf-constructor
  (let* ((p1 (oc::_wrap_new_gp_Trsf__SWIG_0))
	 (t1 (gp::trsf))
	 (p2 (gp::ptr t1)))
    (is (zerop (memcmp p1 p2 (cffi:foreign-type-size '(:struct gp::gp-trsf)))))))

(test trsf-set-value
  (let* ((p1 (oc::_wrap_new_gp_Trsf__SWIG_0))
	 (t1 (gp::trsf))
	 (p2 (gp::ptr t1)))
    ;; todo: come up with more interesting matrix
    (gp::gp-trsf-set-values p2
			    1.0d0 0.0d0 0.0d0 0.50d0
			    0.0d0 1.0d0 0.0d0 0.25d0
			    0.0d0 0.0d0 1.0d0 -0.75d0)
    (oc::_wrap_gp_Trsf_SetValues p1
				 1.0d0 0.0d0 0.0d0 0.50d0
				 0.0d0 1.0d0 0.0d0 0.25d0
				 0.0d0 0.0d0 1.0d0 -0.75d0)
    #+NIL(is (zerop (memcmp p1 p2 (cffi:foreign-type-size '(:struct gp::gp-trsf)))))
    (is (= (gp::gp-trsf-scale p1) (gp::gp-trsf-scale p2)))
    (is (eq (gp::gp-trsf-shape p1) (gp::gp-trsf-shape p2)))
    (is (= (gp::gp-trsf-matrix-ref p1 0 0) (gp::gp-trsf-matrix-ref p2 0 0)))
    (is (= (gp::gp-trsf-matrix-ref p1 0 1) (gp::gp-trsf-matrix-ref p2 0 1)))
    (is (= (gp::gp-trsf-matrix-ref p1 0 2) (gp::gp-trsf-matrix-ref p2 0 2)))
    (is (= (gp::gp-trsf-matrix-ref p1 1 0) (gp::gp-trsf-matrix-ref p2 1 0)))
    (is (= (gp::gp-trsf-matrix-ref p1 1 1) (gp::gp-trsf-matrix-ref p2 1 1)))
    (is (= (gp::gp-trsf-matrix-ref p1 1 2) (gp::gp-trsf-matrix-ref p2 1 2)))
    (is (= (gp::gp-trsf-matrix-ref p1 2 0) (gp::gp-trsf-matrix-ref p2 2 0)))
    (is (= (gp::gp-trsf-matrix-ref p1 2 1) (gp::gp-trsf-matrix-ref p2 2 1)))
    (is (= (gp::gp-trsf-matrix-ref p1 2 2) (gp::gp-trsf-matrix-ref p2 2 2)))
    (is (= (gp::gp-trsf-loc-x p1) (gp::gp-trsf-loc-x p2)))
    (is (= (gp::gp-trsf-loc-y p1) (gp::gp-trsf-loc-y p2)))
    (is (= (gp::gp-trsf-loc-z p1) (gp::gp-trsf-loc-z p2)))))
		    
		   
