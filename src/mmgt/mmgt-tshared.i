%{
#include <Standard_Transient.hxx>
#include <MMgt_TShared.hxx>
  %}

%nodefaultdtor MMgt_TShared;
class MMgt_TShared
{
  MMgt_TShared()=0;
};

%nodefaultdtor Handle_MMgt_TShared;
class Handle_MMgt_TShared
{
  Handle_MMgt_TShared()=0;
};

%extend Handle_MMgt_TShared
{
  Standard_Integer GetRefCount() {
    return (*self)->GetRefCount();
  }
  void IncrementRefCounter() {
    (*self)->IncrementRefCounter();
  }
  Standard_Integer DecrementRefCounter() {
    return (* self)->DecrementRefCounter();
  }
  MMgt_TShared *get() {
    return self->get();
  }
}


