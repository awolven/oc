%{
#include <Adaptor3d_Curve.hxx>
#include <Adaptor3d_HCurve.hxx>  
#include <GeomAdaptor_Curve.hxx>
#include <Adaptor3d_Surface.hxx>
#include <GeomAdaptor_Surface.hxx>  
  %}

class Adaptor3d_Curve
{		
  Adaptor3d_Curve()=0;
 public:
  const gp_Pnt Value(const Standard_Real U) const;
};

class GeomAdaptor_Curve  : public Adaptor3d_Curve
{
public:
  
    GeomAdaptor_Curve();
    GeomAdaptor_Curve(const Handle_Geom_Curve& C);
    GeomAdaptor_Curve(const Handle_Geom_Curve& C, const Standard_Real UFirst, const Standard_Real ULast);
    void Load (const Handle_Geom_Curve& C);
    void Load (const Handle_Geom_Curve& C, const Standard_Real UFirst, const Standard_Real ULast);
    const Handle_Geom_Curve& Curve() const;
    Standard_Real FirstParameter() const;
    Standard_Real LastParameter() const;
    GeomAbs_Shape Continuity() const;
    Standard_Integer NbIntervals (const GeomAbs_Shape S) const;
    void Intervals (TColStd_Array1OfReal& T, const GeomAbs_Shape S) const;
    Handle_Adaptor3d_HCurve Trim (const Standard_Real First, const Standard_Real Last, const Standard_Real Tol) const;
    Standard_Boolean IsClosed() const;
    Standard_Boolean IsPeriodic() const;
    Standard_Real Period() const;
    gp_Pnt Value (const Standard_Real U) const;
    void D0 (const Standard_Real U, gp_Pnt& P) const;
    void D1 (const Standard_Real U, gp_Pnt& P, gp_Vec& V) const;
    void D2 (const Standard_Real U, gp_Pnt& P, gp_Vec& V1, gp_Vec& V2) const;
    void D3 (const Standard_Real U, gp_Pnt& P, gp_Vec& V1, gp_Vec& V2, gp_Vec& V3) const;
    gp_Vec DN (const Standard_Real U, const Standard_Integer N) const;
    Standard_Real Resolution (const Standard_Real R3d) const;
    GeomAbs_CurveType GetType() const;
    gp_Lin Line() const;
    gp_Circ Circle() const;
    gp_Elips Ellipse() const;
    gp_Hypr Hyperbola() const;
    gp_Parab Parabola() const;
    Standard_Integer Degree() const;
    Standard_Boolean IsRational() const;
    Standard_Integer NbPoles() const;
    Standard_Integer NbKnots() const;
    Handle_Geom_BezierCurve Bezier() const;
    Handle_Geom_BSplineCurve BSpline() const;
    Handle_Geom_OffsetCurve OffsetCurve() const;
};

class Adaptor3d_Surface 
{
public:
  Adaptor3d_Surface()=0;
  
  Standard_Real FirstUParameter() const;
  
  Standard_Real LastUParameter() const;
  
  Standard_Real FirstVParameter() const;
  
  Standard_Real LastVParameter() const;
  
  GeomAbs_Shape UContinuity() const;
  
  GeomAbs_Shape VContinuity() const;
  
  Standard_Integer NbUIntervals (const GeomAbs_Shape S) const;

  Standard_Integer NbVIntervals (const GeomAbs_Shape S) const;

  void UIntervals (TColStd_Array1OfReal& T, const GeomAbs_Shape S) const;

  void VIntervals (TColStd_Array1OfReal& T, const GeomAbs_Shape S) const;

  Handle_Adaptor3d_HSurface UTrim (const Standard_Real First, const Standard_Real Last, const Standard_Real Tol) const;

  Handle_Adaptor3d_HSurface VTrim (const Standard_Real First, const Standard_Real Last, const Standard_Real Tol) const;
  
  Standard_Boolean IsUClosed() const;
  
  Standard_Boolean IsVClosed() const;
  
  Standard_Boolean IsUPeriodic() const;
  
  Standard_Real UPeriod() const;
  
  Standard_Boolean IsVPeriodic() const;
  
  Standard_Real VPeriod() const;
  
  gp_Pnt Value (const Standard_Real U, const Standard_Real V) const;
  
  void D0 (const Standard_Real U, const Standard_Real V, gp_Pnt& P) const;

  void D1 (const Standard_Real U, const Standard_Real V, gp_Pnt& P, gp_Vec& D1U, gp_Vec& D1V) const;

  void D2 (const Standard_Real U, const Standard_Real V, gp_Pnt& P, gp_Vec& D1U, gp_Vec& D1V, gp_Vec& D2U, gp_Vec& D2V, gp_Vec& D2UV) const;

  void D3 (const Standard_Real U, const Standard_Real V, gp_Pnt& P, gp_Vec& D1U, gp_Vec& D1V, gp_Vec& D2U, gp_Vec& D2V, gp_Vec& D2UV, gp_Vec& D3U, gp_Vec& D3V, gp_Vec& D3UUV, gp_Vec& D3UVV) const;

  gp_Vec DN (const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv) const;

  Standard_Real UResolution (const Standard_Real R3d) const;

  Standard_Real VResolution (const Standard_Real R3d) const;

  GeomAbs_SurfaceType GetType() const;

  gp_Pln Plane() const;

  gp_Cylinder Cylinder() const;

  gp_Cone Cone() const;

  gp_Sphere Sphere() const;

  gp_Torus Torus() const;

  Standard_Integer UDegree() const;

  Standard_Integer NbUPoles() const;

  Standard_Integer VDegree() const;

  Standard_Integer NbVPoles() const;

  Standard_Integer NbUKnots() const;

  Standard_Integer NbVKnots() const;

  Standard_Boolean IsURational() const;

  Standard_Boolean IsVRational() const;

  Handle_Geom_BezierSurface Bezier() const;

  Handle_Geom_BSplineSurface BSpline() const;

  gp_Ax1 AxeOfRevolution() const;

  gp_Dir Direction() const;

  Handle_Adaptor3d_HCurve BasisCurve() const;

  Handle_Adaptor3d_HSurface BasisSurface() const;

  Standard_Real OffsetValue() const;

  ~Adaptor3d_Surface();
};

class GeomAdaptor_Surface  : public Adaptor3d_Surface
{
 public:
  GeomAdaptor_Surface();
  
  GeomAdaptor_Surface(const Handle_Geom_Surface& S);

  GeomAdaptor_Surface(const Handle_Geom_Surface& S, const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real VFirst, const Standard_Real VLast, const Standard_Real TolU = 0.0, const Standard_Real TolV = 0.0);

  void Load (const Handle_Geom_Surface& S);

  void Load (const Handle_Geom_Surface& S, const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real VFirst, const Standard_Real VLast, const Standard_Real TolU = 0.0, const Standard_Real TolV = 0.0);

  Handle_Geom_Surface& Surface() const;
};

  
