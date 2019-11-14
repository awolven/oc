%{
  #include <Adaptor3d_Curve.hxx>
  #include <GeomAdaptor_Curve.hxx>
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
