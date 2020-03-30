
%{
#include <TColStd_HArray1OfBoolean.hxx>
%}

%{
#include <TColgp_HArray1OfPnt.hxx>
%}
class TColgp_HArray1OfPnt {

  public:
  TColgp_HArray1OfPnt(const Standard_Integer Low,const Standard_Integer Up);
  void SetValue(const Standard_Integer Index,const gp_Pnt& Value);
};

/**
%rename(TColgp_HArray1OfPnt) Handle_TColgp_HArray1OfPnt;
 */
class Handle_TColgp_HArray1OfPnt
{
	Handle_TColgp_HArray1OfPnt()=0;
};

class Handle_TColStd_HArray1OfBoolean
{
	Handle_TColStd_HArray1OfBoolean()=0;
};

%{
#include <NCollection_Array1.hxx>
#include <TColgp_Array1OfVec.hxx>
  %}
%nodefaultdtor TColgp_Array1OfVec;
class TColgp_Array1OfVec {

  public:
  TColgp_Array1OfVec(const Standard_Integer Low,const Standard_Integer Up);
  void SetValue(const Standard_Integer Index,const gp_Vec& Value);
};
%extend TColgp_Array1OfVec
{
  void Delete() {
    self->~TColgp_Array1OfVec();
  }
}
%{
#include <TColgp_Array1OfPnt2d.hxx>
  %}
%nodefaultdtor TColgp_Array1OfPnt2d;
class TColgp_Array1OfPnt2d {
 public:
  TColgp_Array1OfPnt2d(const Standard_Integer theLower, const Standard_Integer theUpper);
  void SetValue(const Standard_Integer theIndex, const gp_Pnt2d& Value);
};
%extend TColgp_Array1OfPnt2d
{
  void Delete() {
    self->~TColgp_Array1OfPnt2d();
  }
}
%{
#include <TColStd_Array1OfReal.hxx>
  %}
%nodefaultdtor TColStd_Array1OfReal;
class TColStd_Array1OfReal {
 public:
  TColStd_Array1OfReal(const Standard_Integer theLower, const Standard_Integer theUpper);
  void SetValue(const Standard_Integer theIndex, const Standard_Real& Value);
};

%extend TColStd_Array1OfReal
{
  void Delete() {
    self->~TColStd_Array1OfReal();
  }
}
%{
#include <TColStd_Array1OfInteger.hxx>
  %}
%nodefaultdtor TColStd_Array1OfInteger;
class TColStd_Array1OfInteger {
 public:
  TColStd_Array1OfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
  void SetValue(const Standard_Integer theIndex, const Standard_Integer& Value);
    const Standard_Integer Value(const Standard_Integer Index);
    Standard_Integer Lower (void) const;
    Standard_Integer Upper (void) const;
};

%extend TColStd_Array1OfInteger
{
  void Delete() {
    self->~TColStd_Array1OfInteger();
  }
}
%{
#include <TColgp_Array1OfPnt.hxx>
  %}
%nodefaultdtor TColgp_Array1OfPnt;
class TColgp_Array1OfPnt {

  public:
  TColgp_Array1OfPnt(const Standard_Integer Low,const Standard_Integer Up);
  const gp_Pnt Value(const Standard_Integer Index);
  void SetValue(const Standard_Integer Index,const gp_Pnt& Value);
  Standard_Integer Lower (void) const;
  Standard_Integer Upper (void) const;
};
%extend TColgp_Array1OfPnt
{
  void Delete() {
    self->~TColgp_Array1OfPnt();
  }
}
%{
#include <TColgp_Array2OfPnt.hxx>
  %}
%nodefaultdtor TColgp_Array2OfPnt;
class TColgp_Array2OfPnt {
 public:
  TColgp_Array2OfPnt(const Standard_Integer theRowLower,
		     const Standard_Integer theRowUpper,
		     const Standard_Integer theColLower,
		     const Standard_Integer theColUpper);
  void SetValue(const Standard_Integer theRow,
		const Standard_Integer theCol,
		const gp_Pnt& Value);
};
%extend TColgp_Array2OfPnt
{
  void Delete() {
    self->~TColgp_Array2OfPnt();
  }
}
%{
#include <TColStd_Array2OfReal.hxx>
  %}
%nodefaultdtor TColStd_Array2OfReal;
class TColStd_Array2OfReal {
 public:
  TColStd_Array2OfReal(const Standard_Integer theRowLower,
		       const Standard_Integer theRowUpper,
		       const Standard_Integer theColLower,
		       const Standard_Integer theColUpper);
  void SetValue(const Standard_Integer theRow,
		const Standard_Integer theCol,
		const Standard_Real& Value);
};
%extend TColStd_Array2OfReal
{
  void Delete() {
    self->~TColStd_Array2OfReal();
  }
}
