%{#include <ShapeAnalysis_Edge.hxx>%}

class ShapeAnalysis_Edge 
{
public:
  ShapeAnalysis_Edge();

  Standard_Boolean HasCurve3d (const TopoDS_Edge& edge) const;

  Standard_Boolean Curve3d (const TopoDS_Edge& edge, Handle_Geom_Curve& C3d, Standard_Real& cf, Standard_Real& cl, const Standard_Boolean orient = Standard_True) const;

  Standard_Boolean IsClosed3d (const TopoDS_Edge& edge) const;

  Standard_Boolean HasPCurve (const TopoDS_Edge& edge, const TopoDS_Face& face) const;

  Standard_Boolean HasPCurve (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location) const;

  Standard_Boolean PCurve (const TopoDS_Edge& edge, const TopoDS_Face& face, Handle_Geom2d_Curve& C2d, Standard_Real& cf, Standard_Real& cl, const Standard_Boolean orient = Standard_True) const;

  Standard_Boolean PCurve (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location, Handle_Geom2d_Curve& C2d, Standard_Real& cf, Standard_Real& cl, const Standard_Boolean orient = Standard_True) const;

  Standard_Boolean BoundUV (const TopoDS_Edge& edge, const TopoDS_Face& face, gp_Pnt2d& first, gp_Pnt2d& last) const;

  Standard_Boolean BoundUV (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location, gp_Pnt2d& first, gp_Pnt2d& last) const;

  Standard_Boolean IsSeam (const TopoDS_Edge& edge, const TopoDS_Face& face) const;

  TopoDS_Vertex FirstVertex (const TopoDS_Edge& edge) const;

  TopoDS_Vertex LastVertex (const TopoDS_Edge& edge) const;

  Standard_Boolean GetEndTangent2d (const TopoDS_Edge& edge, const TopoDS_Face& face, const Standard_Boolean atEnd, gp_Pnt2d& pos, gp_Vec2d& tang, const Standard_Real dparam = 0.0) const;

  Standard_Boolean GetEndTangent2d (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location, const Standard_Boolean atEnd, gp_Pnt2d& pos, gp_Vec2d& tang, const Standard_Real dparam = 0.0) const;

  Standard_Boolean CheckVerticesWithCurve3d (const TopoDS_Edge& edge, const Standard_Real preci = -1, const Standard_Integer vtx = 0);

  Standard_Boolean CheckVerticesWithPCurve (const TopoDS_Edge& edge, const TopoDS_Face& face, const Standard_Real preci = -1, const Standard_Integer vtx = 0);

  Standard_Boolean CheckVerticesWithPCurve (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location, const Standard_Real preci = -1, const Standard_Integer vtx = 0);

  Standard_Boolean CheckVertexTolerance (const TopoDS_Edge& edge, const TopoDS_Face& face, Standard_Real& toler1, Standard_Real& toler2);

  Standard_Boolean CheckVertexTolerance (const TopoDS_Edge& edge, Standard_Real& toler1, Standard_Real& toler2);

  Standard_Boolean CheckCurve3dWithPCurve (const TopoDS_Edge& edge, const TopoDS_Face& face);

  Standard_Boolean CheckCurve3dWithPCurve (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location);

  Standard_Boolean Status (const ShapeExtend_Status status) const;

  Standard_Boolean CheckSameParameter (const TopoDS_Edge& edge, Standard_Real& maxdev, const Standard_Integer NbControl = 23);

  Standard_Boolean CheckSameParameter (const TopoDS_Edge& theEdge, const TopoDS_Face& theFace, Standard_Real& theMaxdev, const Standard_Integer theNbControl = 23);

  static Standard_Boolean ComputeDeviation (const Adaptor3d_Curve& CRef, const Adaptor3d_Curve& Other, const Standard_Boolean SameParameter, Standard_Real& dev, const Standard_Integer NCONTROL);

  Standard_Boolean CheckOverlapping (const TopoDS_Edge& theEdge1, const TopoDS_Edge& theEdge2, Standard_Real& theTolOverlap, const Standard_Real theDomainDist = 0.0);
};
