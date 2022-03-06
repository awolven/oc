
%{
#include <BRepPrimAPI_MakeBox.hxx>
#include <BRepPrimAPI_MakeCone.hxx>
#include <BRepPrimAPI_MakeBox.hxx>
#include <BRepPrimAPI_MakeTorus.hxx>
#include <BRepPrimAPI_MakeCylinder.hxx>
#include <BRepPrimAPI_MakeSphere.hxx>
#include <BRepPrimAPI_MakePrism.hxx>
#include <BRepPrimAPI_MakeRevol.hxx>
#include <BRepPrimAPI_MakeOneAxis.hxx>
#include <BRepPrimAPI_MakeRevolution.hxx>
#include <BRepOffsetAPI_MakePipe.hxx>
%}

class BRepPrimAPI_MakeBox : public BRepBuilderAPI_MakeShape
{
	public:
	BRepPrimAPI_MakeBox(const gp_Pnt& P1,const gp_Pnt& P2);
};

class BRepPrimAPI_MakeCone : public BRepBuilderAPI_MakeShape
{
	public:
	BRepPrimAPI_MakeCone(const gp_Ax2& axes, const Standard_Real baseRadius,
		const Standard_Real topRadius,const Standard_Real height, const Standard_Real angle);
};


class BRepPrimAPI_MakeCylinder : public BRepBuilderAPI_MakeShape
{
	public:
  BRepPrimAPI_MakeCylinder(const Standard_Real R, const Standard_Real H);
  
  //! Make a cylinder   of  radius R  and  length H with
  //! angle  H.
  BRepPrimAPI_MakeCylinder(const Standard_Real R, const Standard_Real H, const Standard_Real Angle);
  
  //! Make a cylinder of radius R and length H.
  BRepPrimAPI_MakeCylinder(const gp_Ax2& Axes, const Standard_Real R, const Standard_Real H);
  BRepPrimAPI_MakeCylinder(const gp_Ax2& axes,const Standard_Real radius,
			   const Standard_Real height,const Standard_Real angle);
};

class BRepPrimAPI_MakeTorus : public BRepBuilderAPI_MakeShape
{
	public:
	BRepPrimAPI_MakeTorus(const gp_Ax2& Axes,const Standard_Real R1,
		const Standard_Real R2);
	BRepPrimAPI_MakeTorus(const gp_Ax2& Axes, const Standard_Real R1,
		const Standard_Real R2, const Standard_Real angle1,
		const Standard_Real angle2, const Standard_Real angle);
};

class BRepPrimAPI_MakeSphere : public BRepBuilderAPI_MakeShape
{
	public:
	BRepPrimAPI_MakeSphere(const gp_Pnt& center,const Standard_Real radius);
	BRepPrimAPI_MakeSphere(const gp_Ax2& axis,const Standard_Real R,const Standard_Real angle1,const Standard_Real angle2,const Standard_Real angle3);
};

class BRepPrimAPI_MakeSweep  : public BRepBuilderAPI_MakeShape
{
};

class BRepPrimAPI_MakePrism  : public BRepPrimAPI_MakeSweep
{
    public:
    BRepPrimAPI_MakePrism(const TopoDS_Shape& baseShape, const gp_Vec& extrudeDirection, const Standard_Boolean Copy = Standard_False, const Standard_Boolean Canonize = Standard_True);
    //BRepPrimAPI_MakePrism(const TopoDS_Shape& S,const gp_Dir& D, const Standard_Boolean Inf = Standard_True,const Standard_Boolean Copy = Standard_False,const Standard_Boolean Canonize = Standard_True);
    TopoDS_Shape FirstShape();
    TopoDS_Shape LastShape();
    const TopTools_ListOfShape& Generated (const TopoDS_Shape& S);
};

class BRepPrimAPI_MakeRevol  : public BRepPrimAPI_MakeSweep {
    public:
    BRepPrimAPI_MakeRevol(const TopoDS_Shape& shape, const gp_Ax1& axis, const Standard_Real angle, const Standard_Boolean copy = Standard_False);
    BRepPrimAPI_MakeRevol(const TopoDS_Shape& shape, const gp_Ax1& axis, const Standard_Boolean copy = Standard_False);
};

class BRepPrimAPI_MakeOneAxis  : public BRepBuilderAPI_MakeShape {
 public:
  Standard_Address OneAxis();
  TopoDS_Face& Face();
  TopoDS_Shell& Shell();
  TopoDS_Solid& Solid();
};

class BRepPrimAPI_MakeRevolution  : public BRepPrimAPI_MakeOneAxis {
 public:
  BRepPrimAPI_MakeRevolution(const Handle_Geom_Curve& Meridian);
  BRepPrimAPI_MakeRevolution(const Handle_Geom_Curve& Meridian, const Standard_Real angle);
  BRepPrimAPI_MakeRevolution(const Handle_Geom_Curve& Meridian, const Standard_Real VMin, const Standard_Real VMax);
  BRepPrimAPI_MakeRevolution(const Handle_Geom_Curve& Meridian, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real angle);
  BRepPrimAPI_MakeRevolution(const gp_Ax2& Axes, const Handle_Geom_Curve& Meridian);
  BRepPrimAPI_MakeRevolution(const gp_Ax2& Axes, const Handle_Geom_Curve& Meridian, const Standard_Real angle);
  BRepPrimAPI_MakeRevolution(const gp_Ax2& Axes, const Handle_Geom_Curve& Meridian, const Standard_Real VMin, const Standard_Real VMax);
  BRepPrimAPI_MakeRevolution(const gp_Ax2& Axes, const Handle_Geom_Curve& Meridian, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real angle);
  BRepPrim_Revolution& Revolution();
};

class BRepOffsetAPI_MakePipe  : public BRepPrimAPI_MakeSweep {
    public:
	BRepOffsetAPI_MakePipe(const TopoDS_Wire& Spine,const TopoDS_Shape& Profile);
};
