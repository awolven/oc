
%{#include <GeomAPI_PointsToBSpline.hxx>%}
%{#include <GeomAPI_Interpolate.hxx>%}

class GeomAPI_PointsToBSpline  {
 public:
 GeomAPI_PointsToBSpline();
 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt& Points,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt& Points,const TColStd_Array1OfReal& Parameters,const Standard_Integer DegMin = 3,const Standard_Integer DegMax = 8,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Real Tol3D = 1.0e-3);
 const Handle_Geom_BSplineCurve& Curve() const;
};

class GeomAPI_Interpolate  {
 public:
 GeomAPI_Interpolate(const Handle_TColgp_HArray1OfPnt& Points,const Standard_Boolean PeriodicFlag,const Standard_Real Tolerance);
 void Load(const TColgp_Array1OfVec& Tangents,const Handle_TColStd_HArray1OfBoolean& TangentFlags,const Standard_Boolean Scale = Standard_True);
 void Perform();
 const Handle_Geom_BSplineCurve& Curve() const;
};
