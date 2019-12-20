(in-package :oc)

(defmethod equal? (a b &key)
  (eq a b))

(defmethod equal? ((h1 mmgt-tshared) (h2 mmgt-tshared) &key)
  (eq (cffi-sys:pointer-address (oc::_wrap_Handle_MMgt_TShared_get (oc:ff-pointer h1)))
      (cffi-sys:pointer-address (oc::_wrap_Handle_MMgt_TShared_get (oc:ff-pointer h2)))))

(defmethod equal? ((object1 ff-pointer-mixin) (object2 ff-pointer-mixin) &key)
  (eq (cffi-sys:pointer-address (ff-pointer object1))
      (cffi-sys:pointer-address (ff-pointer object2))))



