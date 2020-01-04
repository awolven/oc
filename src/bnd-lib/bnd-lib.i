%{
#include <BndLib_Add3dCurve.hxx>
  %}

class BndLib_Add3dCurve
{
 public:
  static void Add (const Adaptor3d_Curve& C, const Standard_Real Tol, Bnd_Box& B);
  static void Add (const Adaptor3d_Curve& C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box& B);
  static void AddOptimal (const Adaptor3d_Curve& C, const Standard_Real Tol, Bnd_Box& B);
  static void AddOptimal (const Adaptor3d_Curve& C, 
			  const Standard_Real U1, const Standard_Real U2, 
			  const Standard_Real Tol, Bnd_Box& B);
  static void AddGenCurv(const Adaptor3d_Curve& C, 
			 const Standard_Real UMin,
			 const Standard_Real UMax,
			 const Standard_Real Tol,
			 Bnd_Box& B);
};
