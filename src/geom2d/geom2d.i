%{
#include <MMgt_TShared.hxx>
#include <Geom2d_Geometry.hxx>
#include <Geom2d_Point.hxx>
#include <Geom2d_CartesianPoint.hxx>
#include <Geom2d_Vector.hxx>
#include <Geom2d_VectorWithMagnitude.hxx>
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
#include <Bisector_Curve.hxx>
#include <Bisector_BisecAna.hxx>
#include <Bisector_BisecCC.hxx>
#include <Bisector_BisecPC.hxx>
  %}

%rename(Geom2d_Geometry) Handle_Geom2d_Geometry;
%rename(Geom2d_Point) Handle_Geom2d_Point;
%rename(Geom2d_CartesianPoint) Handle_Geom2d_CartesianPoint;
%rename(Geom2d_Vector) Handle_Geom2d_Vector;
%rename(Geom2d_VectorWithMagnitude) Handle_Geom2d_VectorWithMagnitude;
%rename(Geom2d_Curve) Handle_Geom2d_Curve;
%rename(Geom2d_Line) Handle_Geom2d_Line;
%rename(Geom2d_OffsetCurve) Handle_Geom2d_OffsetCurve;
%rename(Geom2d_Conic) Handle_Geom2d_Conic;
%rename(Geom2d_Circle) Handle_Geom2d_Circle;
%rename(Geom2d_Ellipse) Handle_Geom2d_Ellipse;
%rename(Geom2d_Hyperbola) Handle_Geom2d_Hyperbola;
%rename(Geom2d_Parabola) Handle_Geom2d_Parabola;
%rename(Geom2d_BoundedCurve) Handle_Geom2d_BoundedCurve;
%rename(Geom2d_BezierCurve) Handle_Geom2d_BezierCurve;
%rename(Geom2d_BSplineCurve) Handle_Geom2d_BSplineCurve;
%rename(Geom2d_TrimmedCurve) Handle_Geom2d_TrimmedCurve;
%rename(Bisector_Curve) Handle_Bisector_Curve;
%rename(Bisector_BisecAna) Handle_Bisector_BisecAna;
%rename(Bisector_BisecCC) Handle_Bisector_BisecCC;
%rename(Bisector_BisecPC) Handle_Bisector_BisecPC;

class Handle_Geom2d_Geometry : public MMgt_TShared
{
  Handle_Geom_Geometry()=0;
};

%extend Handle_Geom2d_Geometry
{
  void Mirror (const gp_Pnt2d& P)
  {
    (*self)->Mirror(P);
  }
  void Mirror (const gp_Ax2d& A)
  {
    (*self)->Mirror(A);
  }
  void Rotate (const gp_Pnt2d& P, const Standard_Real Ang) {
    (*self)->Rotate(P, Ang);
  }
  void Scale (const gp_Pnt2d& P, const Standard_Real S) {
    (*self)->Scale(P, S);
  }
  void Translate (const gp_Vec2d& V) {
    (*self)->Translate(V);
  }
  void Translate (const gp_Pnt2d& P1, const gp_Pnt2d& P2) {
    (*self)->Translate(P1, P2);
  }
  Handle_Geom2d_Geometry Mirrored (const gp_Pnt2d& P) {
    return (*self)->Mirrored(P);
  }
  Handle_Geom2d_Geometry Mirrored (const gp_Ax2d& A) {
    return (*self)->Mirrored(A);
  }
  Handle_Geom2d_Geometry Rotated (const gp_Pnt2d& P, const Standard_Real Ang) {
    return (*self)->Rotated(P, Ang);
  }
  Handle_Geom2d_Geometry Scaled (const gp_Pnt2d& P, const Standard_Real S) {
    return (*self)->Scaled(P, S);
  }
  Handle_Geom2d_Geometry Transformed (const gp_Trsf2d& T) {
    return (*self)->Transformed(T);
  }
  Handle_Geom2d_Geometry Translated (const gp_Vec2d& V) {
    return (*self)->Translated(V);
  }
  Handle_Geom2d_Geometry Translated (const gp_Pnt2d& P1, const gp_Pnt2d& P2) {
    return (*self)->Translated(P1, P2);
  }
  void Transform (const gp_Trsf2d& T) {
    (*self)->Transform(T);
  }
  Handle_Geom2d_Geometry Copy() {
    return (*self)->Copy();
  }
}

class Handle_Geom2d_Point : public Handle_Geom2d_Geometry
{
  Handle_Geom2d_Point()=0;
};

%extend Handle_Geom2d_Point
{
  Standard_Real Distance (const Handle_Geom2d_Point& Other) {
    return (*self)->Distance(Other);
  }
  Standard_Real SquareDistance (const Handle_Geom2d_Point& Other) {
    return (*self)->SquareDistance(Other);
  }
  void Coord (Standard_Real& X, Standard_Real& Y) {
    (*self)->Coord(X, Y);
  }
  gp_Pnt2d Pnt2d() {
    return (*self)->Pnt2d();
  }
  Standard_Real X() {
    return (*self)->X();
  }
  Standard_Real Y() {
    return (*self)->Y();
  }
}

class Handle_Geom2d_CartesianPoint : public Handle_Geom2d_Point
{
  Handle_Geom2d_CartesianPoint()=0;
};

%extend Handle_Geom2d_CartesianPoint
{
  Handle_Geom2d_CartesianPoint(const gp_Pnt2d& P) {
    return new Handle_Geom2d_CartesianPoint(new Geom2d_CartesianPoint(P));
  }
  Handle_Geom2d_CartesianPoint(const Standard_Real X, const Standard_Real Y) {
    return new Handle_Geom2d_CartesianPoint(new Geom2d_CartesianPoint(X, Y));
  }
  void SetCoord (const Standard_Real X, const Standard_Real Y) {
    (*self)->SetCoord(X, Y);
  }
  void SetPnt2d (const gp_Pnt2d& P) {
    (*self)->SetPnt2d(P);
  }
  void SetX (const Standard_Real X) {
    (*self)->SetX(X);
  }
  void SetY (const Standard_Real Y) {
    (*self)->SetY(Y);
  }
}

class Handle_Geom2d_Vector : public Handle_Geom2d_Geometry
{
  Handle_Geom2d_Vector()=0;
};

%extend Handle_Geom2d_Vector
{
  void Reverse() {
    (*self)->Reverse();
  }
  Handle_Geom2d_Vector Reversed() {
    return (*self)->Reversed();
  }
  Standard_Real Angle (const Handle_Geom2d_Vector& Other) {
    return (*self)->Angle(Other);
  }
  void Coord (Standard_Real& X, Standard_Real& Y) {
    (*self)->Coord(X, Y);
  }
  Standard_Real X() {
    return (*self)->X();
  }
  Standard_Real Y() {
    return (*self)->Y();
  }
  Standard_Real Dot (const Handle_Geom2d_Vector& Other) {
    return (*self)->Dot(Other);
  }
  gp_Vec2d Vec2d() {
    return (*self)->Vec2d();
  }
}

class Handle_Geom2d_VectorWithMagnitude : public Handle_Geom2d_Vector
{
  Handle_Geom2d_VectorWithMagnitude()=0;
};

%extend Handle_Geom2d_VectorWithMagnitude
{
  Handle_Geom2d_VectorWithMagnitude(const gp_Vec2d& V) {
    return new Handle_Geom2d_VectorWithMagnitude(new Geom2d_VectorWithMagnitude(V));
  }
  Handle_Geom2d_VectorWithMagnitude(const Standard_Real X, const Standard_Real Y) {
    return new Handle_Geom2d_VectorWithMagnitude(new Geom2d_VectorWithMagnitude(X, Y));
  }
  Handle_Geom2d_VectorWithMagnitude(const gp_Pnt2d& P1, const gp_Pnt2d& P2) {
    return new Handle_Geom2d_VectorWithMagnitude(new Geom2d_VectorWithMagnitude(P1, P2));
  }
  void SetCoord (const Standard_Real X, const Standard_Real Y) {
    return (*self)->SetCoord(X, Y);
  }
  void SetVec2d (const gp_Vec2d& V) {
    return (*self)->SetVec2d(V);
  }
  void SetX (const Standard_Real X) {
    return (*self)->SetX(X);
  }
  void SetY (const Standard_Real Y) {
    return (*self)->SetY(Y);
  }
  Standard_Real Magnitude() {
    return (*self)->Magnitude();
  }
  Standard_Real SquareMagnitude() {
    return (*self)->SquareMagnitude();
  }
  void Add (const Handle_Geom2d_Vector& Other) {
    (*self)->Add(Other);
  }
  Handle_Geom2d_VectorWithMagnitude Added (const Handle_Geom2d_Vector& Other) {
    return (*self)->Added(Other);
  }
  // says in opencascade docs a new vector is returned. ??
  Standard_Real Crossed (const Handle_Geom2d_Vector& Other) {
    return (*self)->Crossed(Other);
  }
  void Divide (const Standard_Real Scalar) {
    return (*self)->Divide(Scalar);
  }
  Handle_Geom2d_VectorWithMagnitude Divided (const Standard_Real Scalar) {
    return (*self)->Divided(Scalar);
  }
  Handle_Geom2d_VectorWithMagnitude Multiplied (const Standard_Real Scalar) {
    return (*self)->Multiplied(Scalar);
  }
  void Multiply (const Standard_Real Scalar) {
    (*self)->Multiply(Scalar);
  }
  void Normalize() {
    (*self)->Normalize();
  }
  Handle_Geom2d_VectorWithMagnitude Normalized() {
    return (*self)->Normalized();
  }
  Handle_Geom2d_VectorWithMagnitude Subtracted (const Handle_Geom2d_Vector& Other) {
    return (*self)->Subtracted(Other);
  }
  void Transform (const gp_Trsf2d& T) {
    return (*self)->Transform(T);
  }
  Handle_Geom2d_Geometry Copy() {
    return (*self)->Copy();
  }
}

class Handle_Geom2d_Curve : public Handle_Geom2d_Geometry
{
	Handle_Geom2d_Curve()=0;
};

class Handle_Bisector_Curve : public Handle_Geom2d_Curve
{
	Handle_Bisector_Curve()=0;
};

%extend Handle_Bisector_Curve
{
	Standard_Real Parameter(const gp_Pnt2d &P)
	{
		return (*self)->Parameter(P);
	}
	
	Standard_Boolean IsExtendAtStart()
	{
		return (*self)->IsExtendAtStart();
	}
	
	Standard_Boolean IsExtendAtEnd()
	{
		return (*self)->IsExtendAtEnd();
	}
	
	Standard_Integer NbIntervals()
	{
		return (*self)->NbIntervals();
	}
	
	Standard_Real IntervalFirst(const Standard_Integer index)
	{
		return (*self)->IntervalFirst(index);
	}
	
	Standard_Real IntervalLast(const Standard_Integer index)
	{
		return (*self)->IntervalLast(index);
	}
}

class Handle_Bisector_BisecAna : public Handle_Bisector_Curve
{
	Handle_Bisector_BisecAna()=0;
};

%extend Handle_Bisector_BisecAna
{


}

class Handle_Bisector_BisecCC : public Handle_Bisector_Curve
{
	Handle_Bisector_BisecCC()=0;
};

%extend Handle_Bisector_BisecCC
{
    Handle_Bisector_BisecCC(const Handle_Geom2d_Curve& Cu1, const Handle_Geom2d_Curve& Cu2, const Standard_Real Side1, const Standard_Real Side2, 
            const gp_Pnt2d& Origin, const Standard_Real DistMax = 500){
    return new Handle_Bisector_BisecCC(new Bisector_BisecCC(Cu1, Cu2, Side1, Side2, Origin, DistMax));
    }

}

class Handle_Bisector_BisecPC : public Handle_Bisector_Curve
{
	Handle_Bisector_BisecPC()=0;
};

%extend Handle_Bisector_BisecPC
{

    Handle_Bisector_BisecPC(const Handle_Geom2d_Curve& Cu, const gp_Pnt2d& P, const Standard_Real Side, const Standard_Real DistMax = 500){
        return new Handle_Bisector_BisecPC(new Bisector_BisecPC(Cu, P, Side, DistMax));
    }

}

%extend Handle_Geom2d_Curve
{
  void Reverse() {
    (*self)->Reverse();
  }
  Standard_Real ReversedParameter (const Standard_Real U) {
    return (*self)->ReversedParameter(U);
  }
  Standard_Real TransformedParameter (const Standard_Real U, const gp_Trsf2d& T) {
    return (*self)->TransformedParameter(U, T);
  }
  Standard_Real ParametricTransformation (const gp_Trsf2d& T) {
    return (*self)->ParametricTransformation(T);
  }
  Handle_Geom2d_Curve Reversed() {
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
  Standard_Real Period()
  {
    return (*self)->Period();
  }
  GeomAbs_Shape Continuity() {
    return (*self)->Continuity();
  }
  Standard_Boolean IsCN(const Standard_Integer N) {
    return (*self)->IsCN(N);
  }
  void D0 (const Standard_Real U, gp_Pnt2d& P) {
    (*self)->D0(U, P);
  }
  void D1 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1) {
    (*self)->D1(U, P, V1);
  }
  void D2 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1, gp_Vec2d& V2) {
    (*self)->D2(U, P, V1, V2);
  }
  void D3 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1, gp_Vec2d& V2, gp_Vec2d& V3) {
    (*self)->D3(U, P, V1, V2, V3);
  }
  gp_Vec2d DN (const Standard_Real U, const Standard_Integer N) {
    return (*self)->DN(U, N);
  }	  
  gp_Pnt2d Value(const Standard_Real U)
  {
    return (*self)->Value(U);
  }
  Standard_Integer GeometryType()
  {
    if (STANDARD_TYPE(Geom2d_Line) == (*self)->DynamicType())
      {
	return 300;
      }
    else if (STANDARD_TYPE(Geom2d_Circle) == (*self)->DynamicType())
      {
	return 301;
      }
    else if (STANDARD_TYPE(Geom2d_Ellipse) == (*self)->DynamicType())
      {
	return 302;
      }
    else if (STANDARD_TYPE(Geom2d_Hyperbola) == (*self)->DynamicType())
      {
	return 303;
      }
    else if (STANDARD_TYPE(Geom2d_Parabola) == (*self)->DynamicType())
      {
	return 304;
      }
    else if (STANDARD_TYPE(Geom2d_OffsetCurve) == (*self)->DynamicType())
      {
	return 305;
      }
    else if (STANDARD_TYPE(Geom2d_BezierCurve) == (*self)->DynamicType())
      {
	return 306;
      }
    else if (STANDARD_TYPE(Geom2d_BSplineCurve) == (*self)->DynamicType())
      {
	return 307;
      }
    else if (STANDARD_TYPE(Geom2d_TrimmedCurve) == (*self)->DynamicType())
      {
	return 308;
      }
    else if (STANDARD_TYPE(Bisector_BisecAna) == (*self)->DynamicType())
      {
	return 309;
      }
    else if (STANDARD_TYPE(Bisector_BisecCC) == (*self)->DynamicType())
      {
	return 310;
      }
    else if (STANDARD_TYPE(Bisector_BisecPC) == (*self)->DynamicType())
      {
	return 311;
      }
		
    return -1;
  }
	
}

class Handle_Geom2d_Line : public Handle_Geom2d_Curve
{
	Handle_Geom2d_Line()=0;
};

%extend Handle_Geom2d_Line
{
	//TODO check that this is not a big memory leak
	Handle_Geom2d_Line(const gp_Ax2d& A){
		return new Handle_Geom2d_Line(new Geom2d_Line(A));
	}
	Handle_Geom2d_Line(const gp_Lin2d& L){
		return new Handle_Geom2d_Line(new Geom2d_Line(L));
	}
	Handle_Geom2d_Line(const gp_Pnt2d& P, const gp_Dir2d& V){
		return new Handle_Geom2d_Line(new Geom2d_Line(P, V));
	}

	void SetLin2d (const gp_Lin2d& L) {
	  (*self)->SetLin2d(L);
	}
	void SetDirection (const gp_Dir2d& V) {
	  (*self)->SetDirection(V);
	}
	const gp_Dir2d* Direction() {
	  return (gp_Dir2d *)&(*self)->Direction();
	}
	void SetLocation (const gp_Pnt2d& P) {
	  (*self)->SetLocation(P);
	}
	gp_Pnt2d* Location()
	{
	  return (gp_Pnt2d *)&(*self)->Location();
	}
	void SetPosition (const gp_Ax2d& A) {
	  (*self)->SetPosition(A);
	}
	gp_Ax2d* Position()
	{
	  return (gp_Ax2d *)&(*self)->Position();
	}
	void Reverse() {
	  (*self)->Reverse();
	}
	Standard_Real ReversedParameter (const Standard_Real U) {
	  return (*self)->ReversedParameter(U);
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
	GeomAbs_Shape Continuity() {
	  return (*self)->Continuity();
	}
	Standard_Real Distance (const gp_Pnt2d& P) {
	  return (*self)->Distance(P);
	}
	Standard_Boolean IsCN (const Standard_Integer N) {
	  return (*self)->IsCN(N);
	}
	void Transform (const gp_Trsf2d& T) {
	  (*self)->Transform(T);
	}
	Standard_Real TransformedParameter (const Standard_Real U, const gp_Trsf2d& T) {
	  return (*self)->TransformedParameter(U, T);
	}
	Standard_Real ParametricTransformation (const gp_Trsf2d& T) {
	  return (*self)->ParametricTransformation(T);
	}

}

class Handle_Geom2d_OffsetCurve : public Handle_Geom2d_Curve
{
	Handle_Geom2d_OffsetCurve()=0;
};

%extend Handle_Geom2d_OffsetCurve
{
	//TODO check that this is not a big memory leak
	Handle_Geom2d_OffsetCurve(const Handle_Geom2d_Curve& C, const Standard_Real Offset){
		return new Handle_Geom2d_OffsetCurve(new Geom2d_OffsetCurve(C, Offset));
	}
	
	Handle_Geom2d_Curve BasisCurve()
	{
		return (*self)->BasisCurve();
	}

	Standard_Real Offset()
	{
		return (*self)->Offset();
	}
	
}

class Handle_Geom2d_Conic : public Handle_Geom2d_Curve
{
	Handle_Geom2d_Conic()=0;
};

%extend Handle_Geom2d_Conic
{
	gp_Ax2d XAxis()
	{
		return (*self)->XAxis();
	}

	gp_Ax2d YAxis()
	{
		return (*self)->YAxis();
	}
	
	Standard_Real Eccentricity()
	{
		return (*self)->Eccentricity();
	}

	gp_Pnt2d Location()
	{
		return (*self)->Location();
	}

	gp_Ax22d Position()
	{
		return (*self)->Position();
	}

}

class Handle_Geom2d_Circle : public Handle_Geom2d_Conic
{
	Handle_Geom2d_Circle()=0;
};

%extend Handle_Geom2d_Circle
{
	//TODO check that this is not a big memory leak
	Handle_Geom2d_Circle(const gp_Ax22d& A, const Standard_Real R){
		return new Handle_Geom2d_Circle(new Geom2d_Circle(A, R));
	}

  Standard_Real Radius()
  {
    return (*self)->Radius();
  }

}

class Handle_Geom2d_Ellipse : public Handle_Geom2d_Conic
{
	Handle_Geom2d_Ellipse()=0;
};

%extend Handle_Geom2d_Ellipse
{
  Handle_Geom2d_Ellipse(const gp_Ax2d& MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True) {
    return new Handle_Geom2d_Ellipse(new Geom2d_Ellipse(MajorAxis, MajorRadius, MinorRadius, Sense));
  }

  Handle_Geom2d_Ellipse(const gp_Ax22d& Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius) {
    return new Handle_Geom2d_Ellipse(new Geom2d_Ellipse(Axis, MajorRadius, MinorRadius));
  }

    Standard_Real MajorRadius() 
    {
        return (*self)->MajorRadius();
    }

    Standard_Real MinorRadius() 
    {
        return (*self)->MinorRadius();
    }

	gp_Ax2d Directrix1()
	{
		return (*self)->Directrix1();
	}
	
	gp_Ax2d Directrix2()
	{
		return (*self)->Directrix2();
	}
	
	Standard_Real FocalDistance()
	{
		return (*self)->Focal();
	}
	
	gp_Pnt2d Focus1()
	{
		return (*self)->Focus1();
	}
	
	gp_Pnt2d Focus2()
	{
		return (*self)->Focus2();
	}
	
}

class Handle_Geom2d_Hyperbola : public Handle_Geom2d_Conic
{
	Handle_Geom2d_Hyperbola()=0;
};

%extend Handle_Geom2d_Hyperbola
{

//	Handle_Geom2d_Hyperbola(const gp_Ax2d& MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, 
//            const Standard_Boolean Sense = Standard_True){
//		return new Handle_Geom2d_Hyperbola(new Geom2d_Hyperbola(MajorAxis, MajorRadius, MinorRadius, Sense));
//	}

    Handle_Geom2d_Hyperbola(const gp_Ax22d& Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius){
        return new Handle_Geom2d_Hyperbola(new Geom2d_Hyperbola(Axis, MajorRadius, MinorRadius));
    }

    Standard_Real MajorRadius() 
    {
        return (*self)->MajorRadius();
    }

    Standard_Real MinorRadius() 
    {
        return (*self)->MinorRadius();
    }

    gp_Ax2d Directrix1()
    {
        return (*self)->Directrix1();
    }
  
    gp_Ax2d Directrix2()
    {
        return (*self)->Directrix2();
    }
    
    Standard_Real FocalDistance()
    {
        return (*self)->Focal();
    }
  
    gp_Pnt2d Focus1()  
    {
        return (*self)->Focus1();
    }

    gp_Pnt2d Focus2()  
    {
        return (*self)->Focus2();
    }
 
}

class Handle_Geom2d_Parabola : public Handle_Geom2d_Conic
{
	Handle_Geom2d_Parabola()=0;
};

%extend Handle_Geom2d_Parabola
{

    // constructor with large axis construct and focal distance
    Handle_Geom2d_Parabola(const gp_Ax22d& Axis, const Standard_Real Focal){
        return new Handle_Geom2d_Parabola(new Geom2d_Parabola(Axis, Focal));
    }
      
    // constructor with directrix and focus point
    Handle_Geom2d_Parabola(const gp_Ax2d& D, const gp_Pnt2d& F){
        return new Handle_Geom2d_Parabola(new Geom2d_Parabola(D, F));
    }
    

    Standard_Real FocalDistance()
    {
        return (*self)->Focal();
    }

    gp_Pnt2d Focus()
    {
        return (*self)->Focus();
    }

    gp_Ax2d Directrix() 
    {
        return (*self)->Directrix();
    }

}

class Handle_Geom2d_BoundedCurve : public Handle_Geom2d_Curve
{
	Handle_Geom2d_BoundedCurve()=0;
};

%extend Handle_Geom2d_BoundedCurve
{
	gp_Pnt2d EndPoint()
	{
		return (*self)->EndPoint();
	}
	
	gp_Pnt2d StartPoint()
	{
		return (*self)->StartPoint();
	}
}

class Handle_Geom2d_BezierCurve : public Handle_Geom2d_BoundedCurve
{
	Handle_Geom2d_BezierCurve()=0;
};

%extend Handle_Geom2d_BezierCurve
{

    Handle_Geom2d_BezierCurve(const TColgp_Array1OfPnt2d& CurvePoles, const TColStd_Array1OfReal& PoleWeights){
        return new Handle_Geom2d_BezierCurve(new Geom2d_BezierCurve(CurvePoles, PoleWeights));
    }

    Standard_Integer NbPoles()  
    {
        return (*self)->NbPoles();
    }

    gp_Pnt2d Pole(const Standard_Integer Index)
    {
        return (*self)->Pole(Index);
    }

    Standard_Real Weight(const Standard_Integer Index)
    {
        return (*self)->Weight(Index);
    }

}

class Handle_Geom2d_BSplineCurve : public Handle_Geom2d_BoundedCurve
{
	Handle_Geom2d_BSplineCurve()=0;
};

%extend Handle_Geom2d_BSplineCurve
{
	Handle_Geom2d_BSplineCurve(const TColgp_Array1OfPnt2d& Poles, const TColStd_Array1OfReal& Knots, 
            const TColStd_Array1OfInteger& Multiplicities, const Standard_Integer Degree, 
            const Standard_Boolean Periodic = Standard_False){
	    return new Handle_Geom2d_BSplineCurve(new Geom2d_BSplineCurve(Poles, Knots, Multiplicities,
            Degree, Periodic));
	}

    Handle_Geom2d_BSplineCurve(const TColgp_Array1OfPnt2d& Poles, const TColStd_Array1OfReal& Weights, 
            const TColStd_Array1OfReal& Knots, const TColStd_Array1OfInteger& Multiplicities, 
            const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False){
        return new Handle_Geom2d_BSplineCurve(new Geom2d_BSplineCurve(Poles, Weights, Knots, 
            Multiplicities, Degree, Periodic));
    }

    Standard_Integer Degree()
    {
        return (*self)->Degree();
    }

    gp_Pnt2d Pole(const Standard_Integer Index)
    {
        return (*self)->Pole(Index);
    }

    Standard_Real Weight(const Standard_Integer Index)
    {
        return (*self)->Weight(Index);
    }

    Standard_Real Knot(const Standard_Integer Index)
    {
        return (*self)->Knot(Index);
    }

    Standard_Integer Multiplicity(const Standard_Integer Index)
    {
        return (*self)->Multiplicity(Index);
    }

    void Knots(TColStd_Array1OfReal& K)
    {
        return (*self)->Knots(K);
    }

    Standard_Integer NbKnots()
    {
        return(*self)->NbKnots();
    }

    Standard_Integer NbPoles()
    {
        return(*self)->NbPoles();
    }

    gp_Pnt2d Pole(const Standard_Integer Index)
    {
        return (*self)->Pole(Index);
    }

    void Poles(TColgp_Array1OfPnt2d& P)
    {
      (*self)->Poles(P);
    }

}

class Handle_Geom2d_TrimmedCurve : public Handle_Geom2d_BoundedCurve
{
	Handle_Geom2d_TrimmedCurve()=0;
};

%extend Handle_Geom2d_TrimmedCurve
{
  Handle_Geom2d_TrimmedCurve(const Handle_Geom2d_Curve& C, const Standard_Real U1, const Standard_Real U2, const Standard_Boolean Sense = Standard_True)
    {
      return new Handle_Geom2d_TrimmedCurve(new Geom2d_TrimmedCurve(C, U1, U2, Sense));
    }

  Handle_Geom2d_Curve BasisCurve()
  {
    return (*self)->BasisCurve();
  }
  
  void Reverse()
  {
    (*self)->Reverse();
  }
  
  Standard_Real ReversedParameter (const Standard_Real U)
  {
    return (*self)->ReversedParameter(U);
  }
  
  void SetTrim (const Standard_Real U1, const Standard_Real U2, const Standard_Boolean Sense = Standard_True, const Standard_Boolean theAdjustPeriodic = Standard_True)
  {
    (*self)->SetTrim(U1, U2, Sense, theAdjustPeriodic);
  }
  
  GeomAbs_Shape Continuity()
  {
    return (*self)->Continuity();
  }
  
  Standard_Boolean IsCN (const Standard_Integer N)
  {
    return (*self)->IsCN(N);
  }
  
  gp_Pnt2d EndPoint()
  {
    return (*self)->EndPoint();
  }
  Standard_Real FirstParameter()
  {
    return (*self)->FirstParameter();
  }
  Standard_Boolean IsClosed()
  {
    return (*self)->IsClosed();
  }
  Standard_Boolean IsPeriodic()
  {
    return (*self)->IsPeriodic();
  }
  Standard_Real Period()
  {
    return (*self)->Period(); //virtual
  }
  Standard_Real LastParameter()
  {
    return (*self)->LastParameter();
  }
  void D0 (const Standard_Real U, gp_Pnt2d& P)
  {
    return (*self)->D0(U, P);
  }
  void D1 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1)
  {
    return (*self)->D1(U, P, V1);
  }
  void D2 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1, gp_Vec2d& V2)
  {
    return (*self)->D2(U, P, V1, V2);
  }
  void D3 (const Standard_Real U, gp_Pnt2d& P, gp_Vec2d& V1, gp_Vec2d& V2, gp_Vec2d& V3)
  {
    return (*self)->D3(U, P, V1, V2, V3);
  }
  gp_Vec2d DN (const Standard_Real U, const Standard_Integer N)
  {
    return (*self)->DN(U, N);
  }
  void Transform (const gp_Trsf2d& T)
  {
    (*self)->Transform(T);
  }
  Standard_Real TransformedParameter (const Standard_Real U, const gp_Trsf2d& T)
  {
    return (*self)->TransformedParameter(U, T);
  }
  Standard_Real ParametricTransformation (const gp_Trsf2d& T)
  {
    return (*self)->ParametricTransformation(T);
  }
  Handle_Geom2d_Geometry Copy()
  {
    return (*self)->Copy();
  }
}
   

