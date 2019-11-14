
%{
#include <BRepLib.hxx>
%}

class BRepLib
{
 public:
  static void Precision (const Standard_Real P);

  static Standard_Real Precision();
  
  static void Plane (const Handle_Geom_Plane& P);

  static const Handle_Geom_Plane& Plane();

  static Standard_Boolean CheckSameRange (const TopoDS_Edge& E, const Standard_Real Confusion = 1.0e-12);

  static void SameRange (const TopoDS_Edge& E, const Standard_Real Tolerance = 1.0e-5);

  static Standard_Boolean BuildCurve3d (const TopoDS_Edge& E, const Standard_Real Tolerance = 1.0e-5, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Integer MaxDegree = 14, const Standard_Integer MaxSegment = 0);

  static Standard_Boolean BuildCurves3d (const TopoDS_Shape& S, const Standard_Real Tolerance, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Integer MaxDegree = 14, const Standard_Integer MaxSegment = 0);

  static Standard_Boolean BuildCurves3d (const TopoDS_Shape& S);

  static Standard_Boolean UpdateEdgeTol (const TopoDS_Edge& E, const Standard_Real MinToleranceRequest, const Standard_Real MaxToleranceToCheck);

  static Standard_Boolean UpdateEdgeTolerance (const TopoDS_Shape& S, const Standard_Real MinToleranceRequest, const Standard_Real MaxToleranceToCheck);

  static void SameParameter (const TopoDS_Edge& E, const Standard_Real Tolerance = 1.0e-5);

  static void SameParameter (const TopoDS_Shape& S, const Standard_Real Tolerance = 1.0e-5, const Standard_Boolean forced = Standard_False);

  static void UpdateTolerances (const TopoDS_Shape& S, const Standard_Boolean verifyFaceTolerance = Standard_False);

  static void UpdateInnerTolerances (const TopoDS_Shape& S);

  static Standard_Boolean OrientClosedSolid (TopoDS_Solid& solid);

  static void EncodeRegularity (const TopoDS_Shape& S, const Standard_Real TolAng = 1.0e-10);

  static void EncodeRegularity (TopoDS_Edge& S, const TopoDS_Face& F1, const TopoDS_Face& F2, const Standard_Real TolAng = 1.0e-10);
  
  static void SortFaces (const TopoDS_Shape& S, TopTools_ListOfShape& LF);
  
  static void ReverseSortFaces (const TopoDS_Shape& S, TopTools_ListOfShape& LF);

  static Standard_Boolean EnsureNormalConsistency (const TopoDS_Shape& S, const Standard_Real theAngTol = 0.001, const Standard_Boolean ForceComputeNormals = Standard_False);

  static  void BoundingVertex(const NCollection_List<TopoDS_Shape>& theLV,
			      gp_Pnt& theNewCenter, Standard_Real& theNewTol);

};
