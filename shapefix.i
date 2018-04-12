

%{
#include <ShapeFix_Wireframe.hxx>
#include <ShapeFix_Root.hxx>
#include <ShapeBuild_ReShape.hxx>
#include <Message_ProgressIndicator.hxx>
#include <ShapeFix_Shape.hxx>
#include <ShapeFix_Solid.hxx>
#include <ShapeFix_Shell.hxx>
#include <ShapeFix_Face.hxx>
#include <ShapeFix_Wire.hxx>
#include <ShapeFix_Edge.hxx>
%}

%rename(Message_ProgressIndicator) Handle_Message_ProgressIndicator;
%rename(ShapeFix_Solid) Handle_ShapeFix_Solid;
%rename(ShapeFix_Shell) Handle_ShapeFix_Shell;
%rename(ShapeFix_Face) Handle_ShapeFix_Face;
%rename(ShapeFix_Wire) Handle_ShapeFix_Wire;
%rename(ShapeFix_Edge) Handle_ShapeFix_Edge;

class ShapeFix_Root 
{
	ShapeFix_Root()=0;
	public:
	%rename(setPrecision) SetPrecision;
	%rename(getPrecision) Precision;
	%rename(setContext) SetContext;
	void SetPrecision(const Standard_Real preci) ;
	Standard_Real Precision() const;
	void SetContext(const ShapeBuild_ReShape * context) ;
};

%extend ShapeFix_Root
{
    Handle_ShapeBuild_ReShape getContext()
    {
        Handle_ShapeBuild_ReShape p = self->Context();
        return p;
    }
}

class ShapeFix_Wireframe: public ShapeFix_Root
{

	public:
	ShapeFix_Wireframe(const TopoDS_Shape& shape);
	%rename(fixWireGaps) FixWireGaps;
	%rename(fixSmallEdges) FixSmallEdges;
	%rename(setLimitAngle) SetLimitAngle;
	%rename(getLimitAngle) LimitAngle;
	%rename(shape) Shape;

	Standard_Boolean FixWireGaps();

	Standard_Boolean FixSmallEdges() ;

	void SetLimitAngle(const Standard_Real theLimitAngle) ;
	Standard_Real LimitAngle() const;
	TopoDS_Shape Shape() ;
};

%extend ShapeFix_Wireframe
{
	void setDropSmallEdges(bool b)
	{
		self->ModeDropSmallEdges()=b;
	}
	bool getDropSmallEdges()
	{
        return self->ModeDropSmallEdges()!=0;
	}
};

class ShapeFix_Shape 
{
	public:
	ShapeFix_Shape(const TopoDS_Shape& shape)=0;
	
	%rename(getShape) Shape;
	%rename(perform) Perform;
	%rename(getFixSolidTool) FixSolidTool;
	%rename(getFixShellTool) FixShellTool;
	%rename(getFixFaceTool) FixFaceTool;
	%rename(getFixWireTool) FixWireTool;
	%rename(getFixEdgeTool) FixEdgeTool;
	
	TopoDS_Shape Shape() const ;
	Standard_Boolean Perform (const Handle_Message_ProgressIndicator& theProgress=0) ;
    Handle_ShapeFix_Solid FixSolidTool() const ;
    Handle_ShapeFix_Shell FixShellTool() const ;
    Handle_ShapeFix_Face FixFaceTool() const ;
    Handle_ShapeFix_Wire FixWireTool() const ;
    Handle_ShapeFix_Edge FixEdgeTool() const ;

};

class Handle_Message_ProgressIndicator {
};
