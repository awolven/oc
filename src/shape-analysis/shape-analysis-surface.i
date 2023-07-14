%{
#include <ShapeAnalysis_Surface.hxx>
%}

class ShapeAnalysis_Surface
{
	public:

	ShapeAnalysis_Surface (const Handle_Geom_Surface &S);

    Standard_Boolean HasSingularities (const Standard_Real preci) ;
    Standard_Integer NbSingularities (const Standard_Real preci) ;
    Standard_Boolean IsDegenerated (const gp_Pnt &P3d, const Standard_Real preci) ;

};
