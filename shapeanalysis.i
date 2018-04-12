
%{
#include <ShapeAnalysis_Edge.hxx>
#include <ShapeAnalysis_Surface.hxx>
%}

class ShapeAnalysis_Edge
{
	public:
	
	%rename(hasPCurve) HasPCurve;
	%rename(isClosed3d) IsClosed3d;
	%rename(IsSeam) IsSeam;

	ShapeAnalysis_Edge();

    Standard_Boolean IsClosed3d (const TopoDS_Edge &edge) const ;
    Standard_Boolean HasPCurve (const TopoDS_Edge &edge, const TopoDS_Face &face) const ;
    Standard_Boolean IsSeam (const TopoDS_Edge &edge, const TopoDS_Face &face) const ;
	
};

class ShapeAnalysis_Surface
{
	public:
	
	%rename(hasSingularities) HasSingularities;
	%rename(getNbSingularities) NbSingularities;
	%rename(isDegenerated) IsDegenerated;

	ShapeAnalysis_Surface (const Handle_Geom_Surface &S);

    Standard_Boolean HasSingularities (const Standard_Real preci) ;
    Standard_Integer NbSingularities (const Standard_Real preci) ;
    Standard_Boolean IsDegenerated (const gp_Pnt &P3d, const Standard_Real preci) ;

};
