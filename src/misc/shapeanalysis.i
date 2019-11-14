
%{
#include <ShapeAnalysis_Edge.hxx>
#include <ShapeAnalysis_Surface.hxx>
%}

class ShapeAnalysis_Edge
{
	public:

	ShapeAnalysis_Edge();

    Standard_Boolean IsClosed3d (const TopoDS_Edge &edge) const ;
    Standard_Boolean HasPCurve (const TopoDS_Edge &edge, const TopoDS_Face &face) const ;
    Standard_Boolean IsSeam (const TopoDS_Edge &edge, const TopoDS_Face &face) const ;
	
};

class ShapeAnalysis_Surface
{
	public:

	ShapeAnalysis_Surface (const Handle_Geom_Surface &S);

    Standard_Boolean HasSingularities (const Standard_Real preci) ;
    Standard_Integer NbSingularities (const Standard_Real preci) ;
    Standard_Boolean IsDegenerated (const gp_Pnt &P3d, const Standard_Real preci) ;

};
