
%{
#include <BRep_Tool.hxx>
#include <Geom_Curve.hxx>
#include <BRep_Builder.hxx>
#include <TopoDS_Builder.hxx>
#include <TopLoc_Location.hxx>
#include <Poly_Triangulation.hxx>
%}
%nodefaultctor BRep_Tool;
%nodefaultdtor BRep_Tool;
class BRep_Tool
{
 public:
  static Standard_Boolean IsClosed(const TopoDS_Shape &S);
  static Handle_Geom_Surface Surface(const TopoDS_Face& F);
  static const gp_Pnt Pnt(const TopoDS_Vertex& V);
  static gp_Pnt2d Parameters(const TopoDS_Vertex& V,const TopoDS_Face& F);
  static Standard_Real Parameter(const TopoDS_Vertex& V,const TopoDS_Edge& E);
  static Standard_Boolean Degenerated(const TopoDS_Edge& E);
  static Standard_Boolean SameParameter(const TopoDS_Edge& E);
  static Standard_Boolean SameRange(const TopoDS_Edge& E);
  static Standard_Boolean HasContinuity(const TopoDS_Edge& E,const TopoDS_Face& F1,const TopoDS_Face& F2);
  static GeomAbs_Shape Continuity(const TopoDS_Edge& E,const TopoDS_Face& F1,const TopoDS_Face& F2);
  static Standard_Real Tolerance(const TopoDS_Face& F);
  static Standard_Real Tolerance(const TopoDS_Edge& E);
  static Standard_Real Tolerance(const TopoDS_Vertex& V);
  static const Handle_Poly_Triangulation& Triangulation (const TopoDS_Face& F, TopLoc_Location& L);

  static Handle_Geom_Curve Curve(const TopoDS_Edge& E, Standard_Real& First, Standard_Real& Last);

  static Handle_Geom2d_Curve CurveOnSurface(const TopoDS_Edge& E, const TopoDS_Face& F, Standard_Real& First, Standard_Real& Last);
  static void Range(const TopoDS_Edge& E, Standard_Real& First, Standard_Real& Last);
};

%extend BRep_Tool
{
  /*
  static Poly_Triangulation * Triangulation(const TopoDS_Face& F, TopLoc_Location& L) {
    Handle_Poly_Triangulation h = BRep_Tool::Triangulation(F, L);
    if(h.IsNull())
      return (Poly_Triangulation *) NULL;
    else
      return (Poly_Triangulation *)h.get();
  }
  */
  static Poly_Polygon3D *Polygon3D (const TopoDS_Edge &E, TopLoc_Location &L) {
    Handle_Poly_Polygon3D h = BRep_Tool::Polygon3D(E, L);
    if (h.IsNull())
      return (Poly_Polygon3D *) NULL;
    else
      return (Poly_Polygon3D *)h.get();
  }							 
  static Poly_PolygonOnTriangulation * PolygonOnTriangulation (const TopoDS_Edge &E, const Handle_Poly_Triangulation &T, const TopLoc_Location &L) {
    Handle_Poly_PolygonOnTriangulation h = BRep_Tool::PolygonOnTriangulation(E, T, L);
    if (h.IsNull())
      return (Poly_PolygonOnTriangulation *) NULL;
    else
      return (Poly_PolygonOnTriangulation *)h.get();
  }
};

class BRep_Builder: public TopoDS_Builder
{
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
