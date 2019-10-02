%{
  #include <Adaptor2d_Curve2d.hxx>
  #include <Geom2dAdaptor_Curve.hxx>
  #include <Adaptor2d_HCurve2d.hxx>
 %}

class Adaptor2d_Curve2d
{		
  Adaptor2d_Curve2d()=0;
 public:
  virtual gp_Pnt2d Value(const Standard_Real U) const;
};

class Geom2dAdaptor_Curve  : public Adaptor2d_Curve2d
{
public:
  Geom2dAdaptor_Curve();
  Geom2dAdaptor_Curve(const Handle_Geom2d_Curve& C);
  Geom2dAdaptor_Curve(const Handle_Geom2d_Curve& C, const Standard_Real UFirst, const Standard_Real ULast);
  void Load (const Handle_Geom2d_Curve& C);
  void Load (const Handle_Geom2d_Curve& C, const Standard_Real UFirst, const Standard_Real ULast);
  const Handle_Geom2d_Curve& Curve() const;
  Standard_Real FirstParameter() const;
  Standard_Real LastParameter() const;
  GeomAbs_Shape Continuity() const;
  Standard_Integer NbIntervals (const GeomAbs_Shape S) const;
  void Intervals (TColStd_Array1OfReal& T, const GeomAbs_Shape S) const;
  Handle_Adaptor2d_HCurve2d Trim (const Standard_Real First, const Standard_Real Last, const Standard_Real Tol) const;
  Standard_Boolean IsClosed() const;
  Standard_Boolean IsPeriodic() const;
  Standard_Real Period() const;
  gp_Pnt2d Value (const Standard_Real U) const;
  void D0 (const Standard_Real U, gp_Pnt2d& P) const;
  void D1 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V) const;
  void D2 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1, gp_Vec2d& V2) const;
  void D3 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1, gp_Vec2d& V2, gp_Vec2d& V3) const;
  gp_Vec2d DN (const Standard_Real U, const Standard_Integer N) const;
  Standard_Real Resolution (const Standard_Real Ruv) const;
  GeomAbs_CurveType GetType() const;
  gp_Lin2d Line() const;
  gp_Circ2d Circle() const;
  gp_Elips2d Ellipse() const;
  gp_Hypr2d Hyperbola() const;
  gp_Parab2d Parabola() const;
  Standard_Integer Degree() const;
  Standard_Boolean IsRational() const;
  Standard_Integer NbPoles() const;
  Standard_Integer NbKnots() const;
  virtual Standard_Integer NbSamples() const;
  Handle_Geom2d_BezierCurve Bezier() const;
  Handle_Geom2d_BSplineCurve BSpline() const;
};

class Adaptor2d_HCurve2d 
{

public:
  const Adaptor2d_Curve2d& Curve2d() const = 0;
    Standard_Real FirstParameter() const;
    Standard_Real LastParameter() const;
    GeomAbs_Shape Continuity() const;
    Standard_Integer NbIntervals (const GeomAbs_Shape S) const;
    void Intervals (TColStd_Array1OfReal& T, const GeomAbs_Shape S) const;
    Handle_Adaptor2d_HCurve2d Trim (const Standard_Real First, const Standard_Real Last, const Standard_Real Tol) const;
    Standard_Boolean IsClosed() const;
    Standard_Boolean IsPeriodic() const;
    Standard_Real Period() const;
    gp_Pnt2d Value (const Standard_Real U) const;
    void D0 (const Standard_Real U, gp_Pnt2d& P) const;
    void D1 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V) const;
    void D2 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1, gp_Vec2d& V2) const;
    void D3 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1, gp_Vec2d& V2, gp_Vec2d& V3) const;
    gp_Vec2d DN (const Standard_Real U, const Standard_Integer N) const;
    Standard_Real Resolution (const Standard_Real R3d) const;
    GeomAbs_CurveType GetType() const;
    gp_Lin2d Line() const;
    gp_Circ2d Circle() const;
    gp_Elips2d Ellipse() const;
    gp_Hypr2d Hyperbola() const;
    gp_Parab2d Parabola() const;
    Standard_Integer Degree() const;
    Standard_Boolean IsRational() const;
    Standard_Integer NbPoles() const;
    Standard_Integer NbKnots() const;
    Handle_Geom2d_BezierCurve Bezier() const;
};
