
%{
#include <BRepLib.hxx>
%}

class BRepLib
{
    public:
    static void EncodeRegularity(const TopoDS_Shape& S,const Standard_Real TolAng = 1.0e-10) ;
};
