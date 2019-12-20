
%{
#include <Geom_Curve.hxx>
#include <gp_GTrsf2d.hxx>
#include <Geom_Surface.hxx>
#include <Geom_Geometry.hxx>
#include <Geom_BoundedCurve.hxx>
#include <Geom_BoundedSurface.hxx>
#include <Geom_BezierCurve.hxx>
#include <Geom_BezierSurface.hxx>
#include <Geom_BSplineCurve.hxx>
#include <Geom_BSplineSurface.hxx>
#include <Geom_Circle.hxx>
#include <Geom_Conic.hxx>
#include <Geom_ConicalSurface.hxx>
#include <Geom_CylindricalSurface.hxx>
#include <Geom_Ellipse.hxx>
#include <Geom_ElementarySurface.hxx>
#include <Geom_Hyperbola.hxx>
#include <Geom_Line.hxx>
#include <Geom_OffsetCurve.hxx>
#include <Geom_OffsetSurface.hxx>
#include <Geom_Parabola.hxx>
#include <Geom_Plane.hxx>
#include <Geom_RectangularTrimmedSurface.hxx>
#include <Geom_SphericalSurface.hxx>
#include <Geom_SurfaceOfLinearExtrusion.hxx>
#include <Geom_SurfaceOfRevolution.hxx>
#include <Geom_SweptSurface.hxx>
#include <Geom_ToroidalSurface.hxx>
#include <Geom_TrimmedCurve.hxx>
#include <Geom2d_Geometry.hxx>
#include <Geom2d_Curve.hxx>
#include <Geom2d_Line.hxx>
#include <Geom2d_OffsetCurve.hxx>
#include <Geom2d_Conic.hxx>
#include <Geom2d_Circle.hxx>
#include <Geom2d_Ellipse.hxx>
#include <Geom2d_Hyperbola.hxx>
#include <Geom2d_Parabola.hxx>
#include <Geom2d_BoundedCurve.hxx>
#include <Geom2d_BezierCurve.hxx>
#include <Geom2d_BSplineCurve.hxx>
#include <Geom2d_TrimmedCurve.hxx>

%}

%rename(Geom_Geometry) Handle_Geom_Geometry;
%rename(Geom_Curve) Handle_Geom_Curve;
%rename(Geom_Surface) Handle_Geom_Surface;
%rename(Geom_Conic) Handle_Geom_Conic;
%rename(Geom_ElementarySurface) Handle_Geom_ElementarySurface;
%rename(Geom_SweptSurface) Handle_Geom_SweptSurface;
%rename(Geom_BoundedCurve) Handle_Geom_BoundedCurve;
%rename(Geom_BoundedSurface) Handle_Geom_BoundedSurface;
%rename(Geom_BezierCurve) Handle_Geom_BezierCurve;
%rename(Geom_BSplineCurve) Handle_Geom_BSplineCurve;
%rename(Geom_Circle) Handle_Geom_Circle;
%rename(Geom_Ellipse) Handle_Geom_Ellipse;
%rename(Geom_TrimmedCurve) Handle_Geom_TrimmedCurve;
%rename(Geom_OffsetCurve) Handle_Geom_OffsetCurve;
%rename(Geom_Hyperbola) Handle_Geom_Hyperbola;
%rename(Geom_Line) Handle_Geom_Line;
%rename(Geom_Parabola) Handle_Geom_Parabola;
%rename(Geom_BezierSurface) Handle_Geom_BezierSurface;
%rename(Geom_BSplineSurface) Handle_Geom_BSplineSurface;
%rename(Geom_RectangularTrimmedSurface) Handle_Geom_RectangularTrimmedSurface;
%rename(Geom_SphericalSurface) Handle_Geom_SphericalSurface;
%rename(Geom_ToroidalSurface) Handle_Geom_ToroidalSurface;
%rename(Geom_OffsetSurface) Handle_Geom_OffsetSurface;
%rename(Geom_SurfaceOfRevolution) Handle_Geom_SurfaceOfRevolution;
%rename(Geom_ConicalSurface) Handle_Geom_ConicalSurface;
%rename(Geom_CylindricalSurface) Handle_Geom_CylindricalSurface;
%rename(Geom_SurfaceOfLinearExtrusion) Handle_Geom_SurfaceOfLinearExtrusion;
%rename(Geom_Plane) Handle_Geom_Plane;


class Handle_Geom_Geometry : public Handle_MMgt_TShared
{
  Handle_Geom_Geometry()=0;
};

%extend Handle_Geom_Geometry
{
  void Mirror (const gp_Pnt& P) {
    (*self)->Mirror(P);
  }
  void Mirror (const gp_Ax1& A1) {
    (*self)->Mirror(A1);
  }
  void Mirror (const gp_Ax2& A2) {
    (*self)->Mirror(A2);
  }
  void Rotate (const gp_Ax1& A1, const Standard_Real Ang) {
    (*self)->Rotate(A1, Ang);
  }
  void Scale (const gp_Pnt& P, const Standard_Real S) {
    (*self)->Scale(P, S);
  }
  void Translate (const gp_Vec& V) {
    (*self)->Translate(V);
  }
  void Translate (const gp_Pnt& P1, const gp_Pnt& P2) {
    (*self)->Translate(P1, P2);
  }
  void Transform (const gp_Trsf& T) {
    (*self)->Transform(T);
  }
  Handle_Geom_Geometry Mirrored (const gp_Pnt& P) {
    return (*self)->Mirrored(P);
  }
  Handle_Geom_Geometry Mirrored (const gp_Ax1& A1) {
    return (*self)->Mirrored(A1);
  }
  Handle_Geom_Geometry Mirrored (const gp_Ax2& A2) {
    return (*self)->Mirrored(A2);
  }
  Handle_Geom_Geometry Rotated (const gp_Ax1& A1, const Standard_Real Ang) {
    return (*self)->Rotated(A1, Ang);
  }
  Handle_Geom_Geometry Scaled (const gp_Pnt& P, const Standard_Real S) {
    return (*self)->Scaled(P, S);
  }
  Handle_Geom_Geometry Transformed (const gp_Trsf& T) {
    return (*self)->Transformed(T);
  }
  Handle_Geom_Geometry Translated (const gp_Vec& V) {
    return (*self)->Translated(V);
  }
  Handle_Geom_Geometry Translated (const gp_Pnt& P1, const gp_Pnt& P2) {
    return (*self)->Translated(P1, P2);
  }
  Handle_Geom_Geometry Copy() {
    return (*self)->Copy();
  }
    
}

class Handle_Geom_Curve: public Handle_Geom_Geometry
{
  Handle_Geom_Curve()=0;	
};

%extend Handle_Geom_Curve
{
  void Reverse() {
    (*self)->Reverse();
  }
  Standard_Real ReversedParameter (const Standard_Real U) {
    return (*self)->ReversedParameter(U);
  }
  Standard_Real TransformedParameter (const Standard_Real U, const gp_Trsf& T) {
    return (*self)->TransformedParameter(U, T);
  }
  Standard_Real ParametricTransformation (const gp_Trsf& T) {
    return (*self)->ParametricTransformation(T);
  }
  Handle_Geom_Curve Reversed() {
    return (*self)->Reversed();
  }
  Standard_Real FirstParameter() {
    return (*self)->FirstParameter();
  }  
  Standard_Real LastParameter() {
    return (*self)->LastParameter();
  }  
  Standard_Boolean IsClosed() {
    return (*self)->IsClosed();
  }  
  Standard_Boolean IsPeriodic() {
    return (*self)->IsPeriodic();
  }  
  Standard_Real Period() {
    return (*self)->Period();
  }
  GeomAbs_Shape Continuity() {
    return (*self)->Continuity();
  }
  Standard_Boolean IsCN (const Standard_Integer N) {
    return (*self)->IsCN(N);
  }
  void D0 (const Standard_Real U, gp_Pnt& P) {
    (*self)->D0(U, P);
  }
  void D1 (const Standard_Real U, gp_Pnt& P, gp_Vec& V1) {
    (*self)->D1(U, P, V1);
  }
  void D2 (const Standard_Real U, gp_Pnt& P, gp_Vec& V1, gp_Vec& V2) {
    (*self)->D2(U, P, V1, V2);
  }
  void D3 (const Standard_Real U, gp_Pnt& P, gp_Vec& V1, gp_Vec& V2, gp_Vec& V3) {
    (*self)->D3(U, P, V1, V2, V3);
  }
  gp_Vec DN (const Standard_Real U, const Standard_Integer N) {
    return (*self)->DN(U, N);
  }
  gp_Pnt Value(const Standard_Real U) {
    return (*self)->Value(U);
  }
  Standard_Integer GeometryType()
  {
    if (STANDARD_TYPE(Geom_BezierCurve) == (*self)->DynamicType())
      {
	return 100;
      }
    else if (STANDARD_TYPE(Geom_BSplineCurve) == (*self)->DynamicType())
      {
	return 101;
      }
    else if (STANDARD_TYPE(Geom_Circle) == (*self)->DynamicType())
      {
	return 102;
      }
    else if (STANDARD_TYPE(Geom_Ellipse) == (*self)->DynamicType())
      {
	return 103;
      }
    else if (STANDARD_TYPE(Geom_TrimmedCurve) == (*self)->DynamicType())
      {
	return 104;
      }
    else if (STANDARD_TYPE(Geom_OffsetCurve) == (*self)->DynamicType())
      {
	return 105;
      }
    else if (STANDARD_TYPE(Geom_Hyperbola) == (*self)->DynamicType())
      {
	return 106;
      }
    else if (STANDARD_TYPE(Geom_Line) == (*self)->DynamicType())
      {
	return 107;
      }
    else if (STANDARD_TYPE(Geom_Parabola) == (*self)->DynamicType())
      {
	return 108;
      }
    
    return -1;
  }
  
}

class Handle_Geom_Surface: public Handle_Geom_Geometry
{
  Handle_Geom_Surface()=0;
};

%extend Handle_Geom_Surface
{
  void UReverse() {
    (*self)->UReverse();
  }
  Handle_Geom_Surface UReversed() {
    return (*self)->UReversed();
  }
  Standard_Real UReversedParameter(const Standard_Real U) {
    return (*self)->UReversedParameter(U);
  }
  void VReverse() {
    (*self)->VReverse();
  }
  Standard_Real VReversedParameter(const Standard_Real V) {
    return (*self)->VReversedParameter(V);
  }
  void TransformParameters (Standard_Real& U, Standard_Real& V, const gp_Trsf& T) {
    (*self)->TransformParameters(U, V, T);
  }
  gp_GTrsf2d ParametricTransformation (const gp_Trsf& T) {
    return (*self)->ParametricTransformation(T);
  }
  void Bounds (Standard_Real& U1, Standard_Real& U2, Standard_Real& V1, Standard_Real& V2) {
    (*self)->Bounds(U1, U2, V1, V2);
  }
  Standard_Boolean IsUClosed() {
    return (*self)->IsUClosed();
  }  
  Standard_Boolean IsVClosed() {
    return (*self)->IsVClosed();
  }
  Standard_Boolean IsUPeriodic() {
    return (*self)->IsUPeriodic();
  }  
  Standard_Real UPeriod() {
    return (*self)->UPeriod();
  }  
  Standard_Boolean IsVPeriodic() {
    return (*self)->IsVPeriodic();
  }  
  Standard_Real VPeriod() {
    return (*self)->VPeriod();
  }
  Handle_Geom_Curve UIso(const Standard_Real U) {
    return (*self)->UIso(U);
  }
  Handle_Geom_Curve VIso(const Standard_Real V) {
    return (*self)->VIso(V);
  }
  GeomAbs_Shape Continuity() {
    return (*self)->Continuity();
  }
  Standard_Boolean IsCNu (const Standard_Integer N) {
    return (*self)->IsCNu(N);
  }
  Standard_Boolean IsCNv (const Standard_Integer N) {
    return (*self)->IsCNv(N);
  }
  void D0 (const Standard_Real U, const Standard_Real V, gp_Pnt& P) {
    (*self)->D0(U, V, P);
  }
  void D1 (const Standard_Real U, const Standard_Real V, gp_Pnt& P, gp_Vec& D1U, gp_Vec& D1V) {
    (*self)->D1(U, V, P, D1U, D1V);
  }
  void D3 (const Standard_Real U, const Standard_Real V, gp_Pnt& P, gp_Vec& D1U, gp_Vec& D1V, gp_Vec& D2U, gp_Vec& D2V, gp_Vec& D2UV, gp_Vec& D3U, gp_Vec& D3V, gp_Vec& D3UUV, gp_Vec& D3UVV) {
    (*self)->D3(U, V, P, D1U, D1V, D2U, D2V, D2UV, D3U, D3V, D3UUV, D3UVV);
  }
  gp_Vec DN (const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv) {
    return (*self)->DN(U, V, Nu, Nv);
  }
  gp_Pnt Value(const Standard_Real U,const Standard_Real V) {
    return (*self)->Value(U, V);
  }  
  Standard_Integer GeometryType()
  {
    if (STANDARD_TYPE(Geom_BezierSurface) == (*self)->DynamicType())
      {
	return 200;
      }
    else if (STANDARD_TYPE(Geom_BSplineSurface) == (*self)->DynamicType())
      {
	return 201;
      }
    else if (STANDARD_TYPE(Geom_RectangularTrimmedSurface) == (*self)->DynamicType())
      {
	return 202;
      }
    else if (STANDARD_TYPE(Geom_SphericalSurface) == (*self)->DynamicType())
      {
	return 203;
      }
    else if (STANDARD_TYPE(Geom_ToroidalSurface) == (*self)->DynamicType())
      {
	return 204;
      }
    else if (STANDARD_TYPE(Geom_OffsetSurface) == (*self)->DynamicType())
      {
	return 205;
      }
    else if (STANDARD_TYPE(Geom_SurfaceOfRevolution) == (*self)->DynamicType())
      {
	return 206;
      }
    else if (STANDARD_TYPE(Geom_ConicalSurface) == (*self)->DynamicType())
      {
	return 207;
      }
    else if (STANDARD_TYPE(Geom_CylindricalSurface) == (*self)->DynamicType())
      {
	return 208;
      }
    else if (STANDARD_TYPE(Geom_SurfaceOfLinearExtrusion) == (*self)->DynamicType())
      {
	return 209;
      }
    else if (STANDARD_TYPE(Geom_Plane) == (*self)->DynamicType())
      {
	return 210;
      }
    
    return -1;
  }
}

class Handle_Geom_BoundedCurve : public Handle_Geom_Curve
{
	Handle_Geom_BoundedCurve()=0;
};

%extend Handle_Geom_BoundedCurve
{
	gp_Pnt EndPoint()	{
	  return (*self)->EndPoint();
	}	
	gp_Pnt StartPoint() {
	  return (*self)->StartPoint();
	}
}

class Handle_Geom_Conic : public Handle_Geom_Curve
{
	Handle_Geom_Conic()=0;
};

%extend Handle_Geom_Conic
{
  void SetAxis (const gp_Ax1& A1) {
    (*self)->SetAxis(A1);
  }
  void SetLocation (const gp_Pnt& P) {
    (*self)->SetLocation(P);
  }
  void SetPosition (const gp_Ax2& A2) {
    (*self)->SetPosition(A2);
  }
  gp_Ax1 Axis() {
    return (*self)->Axis();
  }
  Standard_Real Eccentricity() {
    return (*self)->Eccentricity();
  }
  gp_Pnt Location() {
    return (*self)->Location();
  }
  gp_Ax2 Position() {
    return (*self)->Position();
  }
  gp_Ax1 XAxis() {
    return (*self)->XAxis();
  }
  gp_Ax1 YAxis() {
    return (*self)->YAxis();
  }
}

class Handle_Geom_BoundedSurface : public Handle_Geom_Surface
{
	Handle_Geom_BoundedSurface()=0;
};

class Handle_Geom_ElementarySurface : public Handle_Geom_Surface
{
	Handle_Geom_ElementarySurface()=0;
};

%extend Handle_Geom_ElementarySurface
{

	gp_Ax1 Axis()
	{
		return (*self)->Axis();
	}
	
	gp_Pnt Location()
	{
		return (*self)->Location();
	}

	gp_Ax3 Position()
	{
		return (*self)->Position();
	}
	
}

class Handle_Geom_SweptSurface : public Handle_Geom_Surface
{
	Handle_Geom_SweptSurface()=0;
};

%extend Handle_Geom_SweptSurface
{

	gp_Dir Direction()
	{
		return (*self)->Direction();
	}

    Handle_Geom_Curve BasisCurve()
	{
		return (*self)->BasisCurve();
	}

}

class Handle_Geom_BezierCurve : public Handle_Geom_BoundedCurve {
    Handle_Geom_BezierCurve()=0;

};

%extend Handle_Geom_BezierCurve
{
  Handle_Geom_BezierCurve(const TColgp_Array1OfPnt& CurvePoles){
    return new Handle_Geom_BezierCurve(new Geom_BezierCurve(CurvePoles));
  }
  Handle_Geom_BezierCurve(const TColgp_Array1OfPnt& CurvePoles, const TColStd_Array1OfReal& PoleWeights){
    return new Handle_Geom_BezierCurve(new Geom_BezierCurve(CurvePoles, PoleWeights));
  }
  void Increase (const Standard_Integer Degree) {
    (*self)->Increase(Degree);
  }
  void InsertPoleAfter (const Standard_Integer Index, const gp_Pnt& P) {
    (*self)->InsertPoleAfter(Index, P);
  }
  void InsertPoleAfter (const Standard_Integer Index, const gp_Pnt& P, const Standard_Real Weight) {

    (*self)->InsertPoleAfter(Index, P, Weight);
  }
  void InsertPoleBefore (const Standard_Integer Index, const gp_Pnt& P) {
    (*self)->InsertPoleBefore(Index, P);
  }
  void InsertPoleBefore (const Standard_Integer Index, const gp_Pnt& P, const Standard_Real Weight) {
    (*self)->InsertPoleBefore(Index, P, Weight);
  }
  void RemovePole (const Standard_Integer Index) {
    (*self)->RemovePole(Index);
  }
  void Segment (const Standard_Real U1, const Standard_Real U2) {
    (*self)->Segment(U1, U2);
  }
  void SetPole (const Standard_Integer Index, const gp_Pnt& P) {
    (*self)->SetPole(Index, P);
  }
  void SetPole (const Standard_Integer Index, const gp_Pnt& P, const Standard_Real Weight) {
    (*self)->SetPole(Index, P, Weight);
  }
  void SetWeight (const Standard_Integer Index, const Standard_Real Weight) {
    (*self)->SetWeight(Index, Weight);
  }
  Standard_Boolean IsRational() {
    return (*self)->IsRational();
  }
  Standard_Integer Degree() {
    return (*self)->Degree();
  }
  Standard_Integer NbPoles() {
    return (*self)->NbPoles();
  }
  gp_Pnt Pole(const Standard_Integer Index) {
    return (*self)->Pole(Index);
  }
  const TColgp_Array1OfPnt& Poles () {
    return (*self)->Poles();
  }
  Standard_Real Weight(const Standard_Integer Index) {
    return (*self)->Weight(Index);
  }
  const TColStd_Array1OfReal* Weights() {
    return (*self)->Weights();
  }
  void Resolution(Standard_Real Tolerance3d, Standard_Real& UTolerance) {
    return (*self)->Resolution(Tolerance3d, UTolerance);
  }
  static Standard_Integer MaxDegree() {
    return Geom_BezierCurve::MaxDegree();
  }
}



class Handle_Geom_BSplineCurve : public Handle_Geom_BoundedCurve {
    Handle_Geom_BSplineCurve()=0;
};

%extend Handle_Geom_BSplineCurve
{
	//TODO check that this is not a big memory leak
	Handle_Geom_BSplineCurve(const TColgp_Array1OfPnt& Poles, const TColStd_Array1OfReal& Weights,
		    const TColStd_Array1OfReal& Knots, const TColStd_Array1OfInteger& Multiplicities,
		    const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False,
		    const Standard_Boolean CheckRational = Standard_True){
		return new Handle_Geom_BSplineCurve(new Geom_BSplineCurve(
			Poles, Weights, Knots, Multiplicities, Degree, Periodic, CheckRational));
	}

    //TODO check that this is not a big memory leak
    Handle_Geom_BSplineCurve(const TColgp_Array1OfPnt& Poles, const TColStd_Array1OfReal& Knots, 
            const TColStd_Array1OfInteger& Multiplicities, const Standard_Integer Degree, 
            const Standard_Boolean Periodic = Standard_False){
        return new Handle_Geom_BSplineCurve(new Geom_BSplineCurve(Poles, Knots, Multiplicities, 
            Degree, Periodic));
    }


  void SetKnot(const Standard_Integer Index,const Standard_Real K)
  {
    (*self)->SetKnot(Index,K);
  }
  
  void SetKnot(const Standard_Integer Index,const Standard_Real K,const Standard_Integer M)
  {
    (*self)->SetKnot(Index,K,M);
  }

  void SetPeriodic()
  {
    (*self)->SetPeriodic();
  }
  
  void SetNotPeriodic()
  {
    (*self)->SetNotPeriodic();
  }
  
  void SetOrigin(const Standard_Integer Index)
  {
     (*self)->SetOrigin(Index);
  }

  void SetOrigin(const Standard_Real U,const Standard_Real Tol)
  {
     (*self)->SetOrigin(U,Tol);
  }
  
  void SetPole(const Standard_Integer Index,const gp_Pnt& P)
  {
    (*self)->SetPole(Index,P);
  }
  
  void SetPole(const Standard_Integer Index,const gp_Pnt& P,const Standard_Real Weight)
  {
    (*self)->SetPole(Index,P,Weight);
  }
  
  void MovePoint(const Standard_Real U,const gp_Pnt& P,const Standard_Integer Index1,const Standard_Integer Index2,Standard_Integer& FirstModifiedPole,Standard_Integer& LastModifiedPole)
  {
    (*self)->MovePoint(U,P,Index1,Index2,FirstModifiedPole,LastModifiedPole);
  }

  void MovePointAndTangent(const Standard_Real U,const gp_Pnt& P,const gp_Vec& Tangent,const Standard_Real Tolerance,const Standard_Integer StartingCondition,const Standard_Integer EndingCondition)
  {
    Standard_Integer ErrorStatus =0;
	(*self)->MovePointAndTangent(U,P,Tangent,Tolerance,StartingCondition,EndingCondition,ErrorStatus);
  }
  
  Standard_Boolean IsRational() const
  {
    return (*self)->IsRational();
  }
  
  GeomAbs_Shape Continuity() const
  {
    return (*self)->Continuity();
  }
  
  Standard_Integer Degree() const
  {
    return (*self)->Degree();
  }
  
  /*
  gp_Vec dN(const Standard_Real U,const Standard_Integer N) const
  {
    return (*self)->DN(U,N);
  }
  */
  
  gp_Pnt LocalValue(const Standard_Real U,const Standard_Integer FromK1,const Standard_Integer ToK2) const
  {
    return (*self)->LocalValue(U,FromK1,ToK2);
  }
  
  gp_Pnt EndPoint() const
  {
    return (*self)->EndPoint();
  }
  
  gp_Pnt StartPoint() const
  {
    return (*self)->StartPoint();
  }
  
  Standard_Integer NbKnots() const
  {
    return (*self)->NbKnots();
  }
  
  Standard_Integer NbPoles() const
  {
    return (*self)->NbPoles();
  }
  
  gp_Pnt Pole(const Standard_Integer Index) const
  {
    return (*self)->Pole(Index);
  }

  void Poles(TColgp_Array1OfPnt& P)
  {
    (*self)->Poles(P);
  }

  Standard_Real Weight(const Standard_Integer Index) const
  {
    return (*self)->Weight(Index);
  }
  
  Standard_Real Knot(const Standard_Integer Index) const
  {
    return (*self)->Knot(Index);
  }

  void Knots(TColStd_Array1OfReal& K) 
  {
    (*self)->Knots(K);
  }

  
  Standard_Integer Multiplicity(const Standard_Integer Index) const
  {
    return (*self)->Multiplicity(Index);
  }
  
}

class Handle_Geom_Circle : public Handle_Geom_Conic {
    Handle_Geom_Circle()=0;
};
%extend Handle_Geom_Circle
{
	//TODO check that this is not a big memory leak
	Handle_Geom_Circle(const gp_Ax2& A2, const Standard_Real R){
		return new Handle_Geom_Circle(new Geom_Circle(A2, R));
	}

  Standard_Real Radius()
  {
    return (*self)->Radius();
  }

}

class Handle_Geom_Ellipse : public Handle_Geom_Conic {
    Handle_Geom_Ellipse()=0;
};

%extend Handle_Geom_Ellipse
{
	//TODO check that this is not a big memory leak
	Handle_Geom_Ellipse(const gp_Ax2& A2, const Standard_Real majorRadius, const Standard_Real minorRadius){
		return new Handle_Geom_Ellipse(new Geom_Ellipse(A2, majorRadius, minorRadius));
	}

    gp_Ax1 Directrix1()
	{
		return (*self)->Directrix1();
	}

    gp_Ax1 Directrix2()
	{
		return (*self)->Directrix2();
	}
    
    Standard_Real FocalDistance()
	{
		return (*self)->Focal();
	}
    
    gp_Pnt Focus1()
	{
		return (*self)->Focus1();
	}
    
    gp_Pnt Focus2()
	{
    	return (*self)->Focus2();
	}
    
    Standard_Real MajorRadius()
	{
		return (*self)->MajorRadius();
	}
  
    Standard_Real MinorRadius()
	{
		return (*self)->MinorRadius();
	}
    
    //parameter =  (1 - e * e) * MajorRadius
    
    Standard_Real Parameter()
	{
		return (*self)->Parameter();
	}

}

class Handle_Geom_TrimmedCurve : public Handle_Geom_BoundedCurve {
    Handle_Geom_TrimmedCurve()=0;
};

%extend Handle_Geom_TrimmedCurve
{

    Handle_Geom_TrimmedCurve(const Handle_Geom_Curve& C, const Standard_Real U1, const Standard_Real U2, 
        const Standard_Boolean Sense = Standard_True){
          return new Handle_Geom_TrimmedCurve(new Geom_TrimmedCurve(C, U1, U2, Sense));
    }

    Handle_Geom_Curve BasisCurve()
	{
		return (*self)->BasisCurve();
	}
}

class Handle_Geom_OffsetCurve : public Handle_Geom_Curve {
    Handle_Geom_OffsetCurve()=0;
};

%extend Handle_Geom_OffsetCurve
{

    Handle_Geom_OffsetCurve(const Handle_Geom_Curve& C, const Standard_Real Offset, const gp_Dir& V){
          return new Handle_Geom_OffsetCurve(new Geom_OffsetCurve(C, Offset, V));
    }

    gp_Dir Direction()
    {
    	return (*self)->Direction();
    }
    
    Standard_Real Offset()
    {
    	return (*self)->Offset();
    }
    /*
    void getValueAt(Standard_Real u, gp_Pnt &p, gp_Pnt &pBasis, gp_Vec &v1Basis)
    {
    	return (*self)->Value(u, p, pBasis, v1Basis);
    }
    */
    Handle_Geom_Curve BasisCurve()
    {
    	return (*self)->BasisCurve();
    }    

}

class Handle_Geom_Hyperbola : public Handle_Geom_Conic {
    Handle_Geom_Hyperbola()=0;
};

%extend Handle_Geom_Hyperbola
{

	//TODO check that this is not a big memory leak
	Handle_Geom_Hyperbola(const gp_Ax2& A2, const Standard_Real majorRadius, const Standard_Real minorRadius){
		return new Handle_Geom_Hyperbola(new Geom_Hyperbola(A2, majorRadius, minorRadius));
	}

    gp_Ax1 Asymptote1()
	{
		return (*self)->Asymptote1();
	}

    gp_Ax1 Asymptote2()
	{
		return (*self)->Asymptote2();
	}
    
    gp_Hypr ConjugateBranch1()
	{
		return (*self)->ConjugateBranch1();
	}
    
    gp_Hypr ConjugateBranch2()
	{
		return (*self)->ConjugateBranch2();
	}
    
    gp_Hypr OtherBranch()
	{
		return (*self)->OtherBranch();
	}
    
    gp_Ax1 Directrix1()
	{
		return (*self)->Directrix1();
	}
    
    gp_Ax1 Directrix2()
	{
		return (*self)->Directrix2();
	}
    
    Standard_Real FocalDistance()
	{
		return (*self)->Focal();
	}
    
    gp_Pnt Focus1()
	{
		return (*self)->Focus1();
	}
    
    gp_Pnt Focus2()
	{
		return (*self)->Focus2();
	}
    
    Standard_Real MajorRadius()
	{
		return (*self)->MajorRadius();
	}
  
	Standard_Real MinorRadius()
	{
		return (*self)->MinorRadius();
	}

    Standard_Real Parameter()
	{
		return (*self)->Parameter();
	}

    
}

class Handle_Geom_Line : public Handle_Geom_Curve {
    Handle_Geom_Line()=0;
};

%extend Handle_Geom_Line
{

	//TODO check that this is not a big memory leak
	Handle_Geom_Line(const gp_Ax1& A1){
		return new Handle_Geom_Line(new Geom_Line(A1));
	}

	//TODO check that this is not a big memory leak
	Handle_Geom_Line(const gp_Pnt& P, const gp_Dir& V){
		return new Handle_Geom_Line(new Geom_Line(P, V));
	}

	gp_Ax1 Position()
	{
		return (*self)->Position();
	}

	gp_Lin Lin()
	{
		return (*self)->Lin();
	}

}

class Handle_Geom_Parabola : public Handle_Geom_Conic {
	Handle_Geom_Parabola()=0;
};


%extend Handle_Geom_Parabola
{

	Handle_Geom_Parabola(const gp_Ax2& A2, const Standard_Real Focal){
		return new Handle_Geom_Parabola(new Geom_Parabola(A2, Focal));
	}

	gp_Ax1 Directrix()
	{
		return (*self)->Directrix();
	}
	
	Standard_Real FocalDistance()
	{
		return (*self)->Focal();
	}
	
	gp_Pnt Focus()
	{
		return (*self)->Focus();
	}

	Standard_Real Parameter()
	{
		return (*self)->Parameter();
	}

}
class Handle_Geom_BezierSurface : public Handle_Geom_BoundedSurface {
	Handle_Geom_BezierSurface()=0;
};

%extend Handle_Geom_BezierSurface
{

	Handle_Geom_BezierSurface(const TColgp_Array2OfPnt& SurfacePoles, const TColStd_Array2OfReal& PoleWeights){
		return new Handle_Geom_BezierSurface(new Geom_BezierSurface(SurfacePoles, PoleWeights));
	}

	Standard_Integer NbUPoles()
    {
        return (*self)->NbUPoles();
    }
   
    Standard_Integer NbVPoles()
    {
        return (*self)->NbVPoles();
    }
    
    Standard_Integer UDegree()
    {
        return (*self)->UDegree();
    }
    
    Standard_Integer VDegree()
    {
        return (*self)->VDegree();
    }
    
    gp_Pnt Pole(const Standard_Integer indexU, const Standard_Integer indexV)
    {
        return (*self)->Pole(indexU, indexV);
    }

    // TODO
    //void poles(TColgp_HArray2OfPnt& outArray)
    //{
    //    return (*self)->Poles(outArray);
    //}
    
      
    Standard_Real Weight(const Standard_Integer indexU, const Standard_Integer indexV)
    {
        return (*self)->Weight(indexU, indexV);
    }
    
    Standard_Boolean IsURational()
    {
        return (*self)->IsURational();
    }
    
    Standard_Boolean IsVRational()
    {
        return (*self)->IsVRational();
    }
    static Standard_Integer MaxDegree() {
      return Geom_BezierSurface::MaxDegree();
    }
    void Resolution(Standard_Real tolerance3d, Standard_Real& toleranceU, Standard_Real& toleranceV)
    {
        return (*self)->Resolution(tolerance3d, toleranceU, toleranceV);
    }

}

class Handle_Geom_BSplineSurface : public Handle_Geom_BoundedSurface  {
	Handle_Geom_BSplineSurface()=0;
};

%extend Handle_Geom_BSplineSurface
{

    Handle_Geom_BSplineSurface(const TColgp_Array2OfPnt& Poles, const TColStd_Array2OfReal& Weights, const TColStd_Array1OfReal& UKnots, 
            const TColStd_Array1OfReal& VKnots, const TColStd_Array1OfInteger& UMults, const TColStd_Array1OfInteger& VMults, 
            const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Boolean UPeriodic = Standard_False, 
            const Standard_Boolean VPeriodic = Standard_False) {
        return new Handle_Geom_BSplineSurface(new Geom_BSplineSurface(Poles, Weights, UKnots, VKnots, UMults, VMults,
            UDegree, VDegree, UPeriodic, VPeriodic));
    }

	Standard_Boolean IsURational()
    {
        return (*self)->IsURational();
    }
    
    Standard_Boolean IsVRational()
    {
        return (*self)->IsVRational();
    }
    
	Standard_Integer FirstUKnotIndex()
    {
        return (*self)->FirstUKnotIndex();
    }
    
	Standard_Integer FirstVKnotIndex()
    {
        return (*self)->FirstVKnotIndex();
    }
    
    Standard_Integer LastUKnotIndex()
    {
        return (*self)->LastUKnotIndex();
    }
    
    Standard_Integer LastVKnotIndex()
    {
        return (*self)->LastVKnotIndex();
    }
    
    Standard_Integer NbUPoles()
    {
        return (*self)->NbUPoles();
    }
   
    Standard_Integer NbVPoles()
    {
        return (*self)->NbVPoles();
    }
    
    Standard_Integer NbUKnots()
    {
        return (*self)->NbUKnots();
    }
   
    Standard_Integer NbVKnots()
    {
        return (*self)->NbVKnots();
    }
    
    gp_Pnt Pole(const Standard_Integer indexU, const Standard_Integer indexV)
    {
        return (*self)->Pole(indexU, indexV);
    }

    // TODO
    //void poles(TColgp_HArray2OfPnt& outArray)
    //{
    //    return (*self)->Poles(outArray);
    //}
    
     
    Standard_Integer UDegree()
    {
        return (*self)->UDegree();
    }
    
    Standard_Integer VDegree()
    {
        return (*self)->VDegree();
    }
     
    Standard_Real UKnot(const Standard_Integer indexUKnot)
    {
        return (*self)->UKnot(indexUKnot);
    }
    
    Standard_Real VKnot(const Standard_Integer indexVKnot)
    {
        return (*self)->VKnot(indexVKnot);
    }
    
    // TODO
    //void getKnotsU(TColStd_HArray1OfReal& outArray)
    //{
    //    return (*self)->UKnots(outArray);
    //}
    
    // TODO
    //void getKnotsV(TColStd_HArray1OfReal& outArray)
    //{
    //    return (*self)->VKnots(outArray);
    //}
    
    // TODO
    //void getKnotSequenceU(TColStd_HArray1OfReal& outArray)
    //{
    //    return (*self)->UKnotSequence(outArray);
    //}
    
    // TODO
    //void getKnotSequenceV(TColStd_HArray1OfReal& outArray)
    //{
    //    return (*self)->VKnotSequence(outArray);
    //}
    
    Standard_Integer UMultiplicity(const Standard_Integer indexUKnot)
    {
		return (*self)->UMultiplicity(indexUKnot);
    }
    
    Standard_Integer VMultiplicity(const Standard_Integer indexVKnot)
    {
		return (*self)->VMultiplicity(indexVKnot);
    }
    
    // TODO
    //void getMultiplicitiesU(TColStd_HArray1OfInteger& outArray)
    //{
    //    return (*self)->UMultiplicities(outArray);
    //}
    
    // TODO
    //void getMultiplicitiesV(TColStd_HArray1OfInteger& outArray)
    //{
    //    return (*self)->VMultiplicites(outArray);
    //}
    
    Standard_Real Weight(const Standard_Integer indexU, const Standard_Integer indexV)
    {
        return (*self)->Weight(indexU, indexV);
    }
    
    //TODO
    //void getWeights(TColStd_HArray1OfReal& outArray)
    //{
    //    return (*self)->Weights(outArray);
    //}
    static Standard_Integer MaxDegree() {
      return Geom_BSplineSurface::MaxDegree();
    }
    void Resolution(Standard_Real tolerance3d, Standard_Real& toleranceU, Standard_Real& toleranceV)
    {
      (*self)->Resolution(tolerance3d, toleranceU, toleranceV);
    }

}
class Handle_Geom_RectangularTrimmedSurface : public Handle_Geom_BoundedSurface  {
    Handle_Geom_RectangularTrimmedSurface()=0;
};


%extend Handle_Geom_RectangularTrimmedSurface
{

    Handle_Geom_RectangularTrimmedSurface(const Handle_Geom_Surface& S, const Standard_Real U1, const Standard_Real U2, 
            const Standard_Real V1, const Standard_Real V2, const Standard_Boolean USense = Standard_True, 
            const Standard_Boolean VSense = Standard_True){
        return new Handle_Geom_RectangularTrimmedSurface(new Geom_RectangularTrimmedSurface(S, U1, U2, V1, V2, USense, VSense));
     }

    Handle_Geom_Surface BasisSurface()
	{
        return (*self)->BasisSurface();	
	}

    void Bounds(Standard_Real& u1, Standard_Real& u2, Standard_Real& v1, Standard_Real& v2) 
    {
        (*self)->Bounds(u1, u2, v1, v2);
    } 


}

class Handle_Geom_SphericalSurface : public Handle_Geom_ElementarySurface {
    Handle_Geom_SphericalSurface()=0;
};

%extend Handle_Geom_SphericalSurface
{

    Handle_Geom_SphericalSurface(const gp_Ax3& A3, const Standard_Real Radius){
        return new Handle_Geom_SphericalSurface(new Geom_SphericalSurface(A3, Radius));
    }

    gp_Sphere Sphere()
	{
	    return (*self)->Sphere();	
	}

    Standard_Real Area()
	{
	    return (*self)->Area();	
	}
    
    void Coefficients(Standard_Real& outA1, Standard_Real& outA2, Standard_Real& outA3, Standard_Real& outB1, Standard_Real& outB2, Standard_Real& outB3, Standard_Real& outC1, Standard_Real& outC2, Standard_Real& outC3, Standard_Real& outD)
	{
		return (*self)->Coefficients(outA1, outA2, outA3, outB1, outB2, outB3, outC1, outC2, outC3, outD);
	}
    
    Standard_Real Radius()
	{   
		return (*self)->Radius();	
	}
    
    Standard_Real Volume()
	{   
		return (*self)->Volume();	
	}

}

class Handle_Geom_ToroidalSurface : public Handle_Geom_ElementarySurface {
    Handle_Geom_ToroidalSurface()=0;
};

%extend Handle_Geom_ToroidalSurface
{

    Handle_Geom_ToroidalSurface(const gp_Ax3& A3, const Standard_Real MajorRadius, const Standard_Real MinorRadius){
        return new Handle_Geom_ToroidalSurface(new Geom_ToroidalSurface(A3, MajorRadius, MinorRadius));
    }

    gp_Torus Torus()
	{
	    return (*self)->Torus();	
	}

    Standard_Real Area()
	{
	    return (*self)->Area();	
	}
    
    //TODO
    //void getCoefficients(TColStd_HArray1OfReal& outArray)
    //{
    //    return (*self)->Coefficients(outArray);
    //}
    
    Standard_Real MajorRadius()
	{
		return (*self)->MajorRadius();
	}
  
    Standard_Real MinorRadius()
	{
		return (*self)->MinorRadius();
	}
    
    Standard_Real Volume()
	{   
		return (*self)->Volume();	
	}
        
}

class Handle_Geom_OffsetSurface : public Handle_Geom_Surface {
	Handle_Geom_OffsetSurface()=0;
};

%extend Handle_Geom_OffsetSurface
{
    Handle_Geom_OffsetSurface(const Handle_Geom_Surface& S, const Standard_Real Offset){
        return new Handle_Geom_OffsetSurface(new Geom_OffsetSurface(S, Offset)); 
    }

    Standard_Real Offset()
	{
		return (*self)->Offset();	
	}
	
	Handle_Geom_Surface BasisSurface()
	{
        return (*self)->BasisSurface();	
	}
	
}

class Handle_Geom_SurfaceOfRevolution : public Handle_Geom_SweptSurface {
	Handle_Geom_SurfaceOfRevolution()=0;
};

%extend Handle_Geom_SurfaceOfRevolution
{

    Handle_Geom_SurfaceOfRevolution(const Handle_Geom_Curve& C, const gp_Ax1& A1){
        return new Handle_Geom_SurfaceOfRevolution(new Geom_SurfaceOfRevolution(C, A1));
    }

	gp_Ax1 Axis()
	{
		return (*self)->Axis();	
	}
	
	gp_Pnt Location()
	{
		return (*self)->Location();	
	}
	
	gp_Ax2 ReferencePlane()
	{
		return (*self)->ReferencePlane();	
	}

    /* FIXME TODO @fixme @todo missing base curve getter for constructor */

}

class Handle_Geom_ConicalSurface : public Handle_Geom_ElementarySurface {
	Handle_Geom_ConicalSurface()=0;
};

%extend Handle_Geom_ConicalSurface
{

	//TODO check that this is not a big memory leak
	Handle_Geom_ConicalSurface(const gp_Ax3& A3, const Standard_Real Ang, const Standard_Real Radius){
		return new Handle_Geom_ConicalSurface(new Geom_ConicalSurface(A3, Ang, Radius));
	}

    gp_Cone Cone()
	{
		return (*self)->Cone();	
	}

    gp_Pnt Apex()
	{
		return (*self)->Apex();	
	}

    void Coefficients(Standard_Real& outA1, Standard_Real& outA2, Standard_Real& outA3, Standard_Real& outB1, Standard_Real& outB2, Standard_Real& outB3, Standard_Real& outC1, Standard_Real& outC2, Standard_Real& outC3, Standard_Real& outD)
    {
    	(*self)->Coefficients(outA1, outA2, outA3, outB1, outB2, outB3, outC1, outC2, outC3, outD);
    }
    
    Standard_Real ReferenceRadius()
	{   
		return (*self)->RefRadius();	
	}
 
    Standard_Real SemiAngle()
	{   
		return (*self)->SemiAngle();	
	}

}

class Handle_Geom_CylindricalSurface : public Handle_Geom_ElementarySurface {
    Handle_Geom_CylindricalSurface()=0;
};

%extend Handle_Geom_CylindricalSurface
{

	//TODO check that this is not a big memory leak
	Handle_Geom_CylindricalSurface(const gp_Ax3& A3, const Standard_Real Radius){
		return new Handle_Geom_CylindricalSurface(new Geom_CylindricalSurface(A3, Radius));
	}
	Handle_Geom_CylindricalSurface(const gp_Ax2& A2, const Standard_Real Radius){
		return new Handle_Geom_CylindricalSurface(new Geom_CylindricalSurface(A2, Radius));
	}

    gp_Cylinder Cylinder()
	{
		return (*self)->Cylinder();	
	}
    
    void Coefficients(Standard_Real& outA1, Standard_Real& outA2, Standard_Real& outA3, Standard_Real& outB1, Standard_Real& outB2, Standard_Real& outB3, Standard_Real& outC1, Standard_Real& outC2, Standard_Real& outC3, Standard_Real& outD)
	{
		return (*self)->Coefficients(outA1, outA2, outA3, outB1, outB2, outB3, outC1, outC2, outC3, outD);
	}

    Standard_Real Radius()
	{   
		return (*self)->Radius();	
	}
}

class Handle_Geom_SurfaceOfLinearExtrusion : public Handle_Geom_SweptSurface {
    Handle_Geom_SurfaceOfLinearExtrusion()=0;
};

%extend Handle_Geom_SurfaceOfLinearExtrusion 
{
    Handle_Geom_SurfaceOfLinearExtrusion(const Handle_Geom_Curve& C, const gp_Dir& V){
        return new Handle_Geom_SurfaceOfLinearExtrusion(new Geom_SurfaceOfLinearExtrusion(C, V));
    }

    /* TODO FIXME @todo @fixme missing important getters for constructor */

}

class Handle_Geom_Plane : public Handle_Geom_ElementarySurface {
    Handle_Geom_Plane()=0;
};

%extend Handle_Geom_Plane
{

	//TODO check that this is not a big memory leak
	Handle_Geom_Plane(const gp_Ax3& A3){
		return new Handle_Geom_Plane(new Geom_Plane(A3));
	}

    gp_Pln Plane()
	{
		return (*self)->Pln();	
	}

    void Coefficients(Standard_Real& outA, Standard_Real& outB, Standard_Real& outC, Standard_Real& outD)
	{
		return (*self)->Coefficients(outA, outB, outC, outD);
	}

}

