%{
#include <TopAbs_ShapeEnum.hxx>
#include <TopAbs_Orientation.hxx>
  %}

enum TopAbs_ShapeEnum 
{
	TopAbs_COMPOUND,
	TopAbs_COMPSOLID,
	TopAbs_SOLID,
	TopAbs_SHELL,
	TopAbs_FACE,
	TopAbs_WIRE,
	TopAbs_EDGE,
	TopAbs_VERTEX,
	TopAbs_SHAPE
};

enum TopAbs_Orientation
{
	TopAbs_FORWARD,
	TopAbs_REVERSED,
	TopAbs_INTERNAL,
	TopAbs_EXTERNAL
};
