
%{
#include <BRepPrimAPI_MakeBox.hxx>
#include <BRepPrimAPI_MakeCone.hxx>
#include <BRepPrimAPI_MakeBox.hxx>
#include <BRepPrimAPI_MakeTorus.hxx>
#include <BRepPrimAPI_MakeCylinder.hxx>
#include <BRepPrimAPI_MakeSphere.hxx>
#include <BRepPrimAPI_MakePrism.hxx>
#include <BRepPrimAPI_MakeRevol.hxx>
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
    BRepPrimAPI_MakePrism(const TopoDS_Shape& baseShape, const gp_Vec& extrudeDirection, const
        Standard_Boolean Copy = Standard_False,
        const Standard_Boolean Canonize = Standard_True);

    // gp_Vec and gp_Dir are both translated to double[] so this contructor
    // will conflict with the previous one
    // TODO: Change the signature to avoir conflict (easy but I have no time for now)
    // BRepPrimAPI_MakePrism(const TopoDS_Shape& S,const gp_Dir& D,const
    //      Standard_Boolean Inf = Standard_True,const Standard_Boolean Copy =
    //      Standard_False,const Standard_Boolean Canonize = Standard_True);
};

class BRepPrimAPI_MakeRevol  : public BRepPrimAPI_MakeSweep {
    public:
    BRepPrimAPI_MakeRevol(const TopoDS_Shape& shape, const gp_Ax1& axis, const Standard_Real angle, const Standard_Boolean copy = Standard_False);
    BRepPrimAPI_MakeRevol(const TopoDS_Shape& shape, const gp_Ax1& axis, const Standard_Boolean copy = Standard_False);
};

class BRepOffsetAPI_MakePipe  : public BRepPrimAPI_MakeSweep {
    public:
	BRepOffsetAPI_MakePipe(const TopoDS_Wire& Spine,const TopoDS_Shape& Profile);
};
