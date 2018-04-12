
%{
#include <BRep_Tool.hxx>
#include <Geom_Curve.hxx>
#include <BRep_Builder.hxx>
#include <TopoDS_Builder.hxx>
#include <TopLoc_Location.hxx>
#include <Poly_Triangulation.hxx>
%}

class BRep_Tool
{
	%rename(pnt) Pnt;
	%rename(parameters) Parameters;
	%rename(parameter) Parameter;
	%rename(degenerated) Degenerated;
	%rename(hasContinuity) HasContinuity;
	%rename(continuity) Continuity;
	%rename(tolerance) Tolerance;
	%rename(curve) Curve;
	%rename(surface) Surface;
	%rename(curveOnSurface) CurveOnSurface;
	public:
	static const gp_Pnt Pnt(const TopoDS_Vertex& V) ;
	static gp_Pnt2d Parameters(const TopoDS_Vertex& V,const TopoDS_Face& F) ;
	static Standard_Real Parameter(const TopoDS_Vertex& V,const TopoDS_Edge& E) ;
	static Standard_Boolean Degenerated(const TopoDS_Edge& E) ;
	static Standard_Boolean SameParameter(const TopoDS_Edge& E) ;
	static Standard_Boolean SameRange(const TopoDS_Edge& E) ;
	static Standard_Boolean HasContinuity(const TopoDS_Edge& E,const TopoDS_Face& F1,const TopoDS_Face& F2) ;
	static GeomAbs_Shape Continuity(const TopoDS_Edge& E,const TopoDS_Face& F1,const TopoDS_Face& F2) ;
	static Standard_Real Tolerance(const TopoDS_Face& F) ;
	static Standard_Real Tolerance(const TopoDS_Edge& E) ;
	static Standard_Real Tolerance(const TopoDS_Vertex& V) ;
	static Standard_Boolean IsClosed(const TopoDS_Shape &S) ;
	
/*	static Handle_Geom_Curve Curve(const TopoDS_Edge& E, Standard_Real& First,Standard_Real& Last) ;
	static Handle_Geom_Surface Surface(const TopoDS_Face& F) ;
	static Handle_Geom2d_Curve CurveOnSurface(const TopoDS_Edge& E, const TopoDS_Face& F,Standard_Real& First,Standard_Real& Last) ;
*/
};

// Publish methods which return pointer instead of Handle. We do not need
// Handle because Java do the memory managment for us.
%extend BRep_Tool
{
	static Poly_Triangulation * triangulation(const TopoDS_Face& F,TopLoc_Location& L)
	{
		Handle_Poly_Triangulation hgc=BRep_Tool::Triangulation(F,L);
		if(hgc.IsNull())
		  return NULL;
		else
		  return (Poly_Triangulation *)hgc.get();
	}

	static void range(const TopoDS_Edge& E, double range[2])
	{
		BRep_Tool::Range(E, range[0], range[1]);
	}
	
	// new Handle is a little memory leak as this handle is never deleted
	static Handle_Geom_Curve * curve(const TopoDS_Edge& E,
		Standard_Real& First,Standard_Real& Last)
	{
		Handle_Geom_Curve * hgc=new Handle_Geom_Curve(BRep_Tool::Curve(E, First, Last));
		if(hgc->IsNull())
			return NULL;
		else
			return hgc;
	}
	
	static Handle_Geom_Surface * surface(const TopoDS_Face& F)
	{
		Handle_Geom_Surface * hgc=new Handle_Geom_Surface(BRep_Tool::Surface(F));
		if(hgc->IsNull())
			return NULL;
		else
			return hgc;
	}
	
	static Handle_Geom2d_Curve * curveOnSurface(const TopoDS_Edge& E,
		const TopoDS_Face& F,Standard_Real& First,Standard_Real& Last)
	{
		Handle_Geom2d_Curve * hgc=new Handle_Geom2d_Curve(BRep_Tool::CurveOnSurface(E, F, First, Last));
		if(hgc->IsNull())
			return NULL;
		else
			return hgc;
	}
};

class BRep_Builder: public TopoDS_Builder
{
	%rename(updateVertex) UpdateVertex;
	public:
	BRep_Builder();
	void MakeFace(TopoDS_Face& F) const;
	void MakeFace(TopoDS_Face& F, const Handle_Geom_Surface& S, const Standard_Real tol) const;
	void MakeFace(TopoDS_Face& F, const Handle_Geom_Surface& S, const TopLoc_Location& L, const Standard_Real tol) const;
	
	void MakeEdge(TopoDS_Edge& E) const;
	void MakeEdge(TopoDS_Edge& E, const Handle_Geom_Curve& C, const Standard_Real tol) const;
	void MakeEdge(TopoDS_Edge& E, const Handle_Geom_Curve& C, const TopLoc_Location& L, const Standard_Real tol) const;
    void UpdateEdge(const TopoDS_Edge& edge, const Handle_Geom_Curve& C, const Standard_Real tolerance) const; 
	void UpdateEdge(const TopoDS_Edge& edge, const Handle_Geom2d_Curve& C, const TopoDS_Face& F, const Standard_Real tolerance) const;
	void UpdateEdge(const TopoDS_Edge& edge, const Handle_Geom2d_Curve& C1, const Handle_Geom2d_Curve& C2, const TopoDS_Face& F, const Standard_Real tolerance) const;
	
	void MakeVertex(TopoDS_Vertex& V) const;
	void MakeVertex(TopoDS_Vertex& V, const gp_Pnt& P, const Standard_Real tol) const;
	void UpdateVertex(const TopoDS_Vertex& vertex, const Standard_Real u, const Standard_Real v, const TopoDS_Face& face, const Standard_Real tolerance) const;
	void UpdateVertex(const TopoDS_Vertex& vertex, const Standard_Real tolerance) const;
	
	void Degenerated(const TopoDS_Edge& E, const Standard_Boolean D) const ;
};
