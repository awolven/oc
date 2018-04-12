
%{
#include <BRepFilletAPI_MakeFillet.hxx>
#include <BRepFilletAPI_MakeChamfer.hxx>
  %}

class BRepFilletAPI_LocalOperation: public BRepBuilderAPI_MakeShape
{
};

enum ChFi3d_FilletShape {
    ChFi3d_Rational,
    ChFi3d_QuasiAngular,
    ChFi3d_Polynomial
};

class BRepFilletAPI_MakeFillet: public BRepFilletAPI_LocalOperation
{
    %rename(add) Add; 
  public:
    BRepFilletAPI_MakeFillet(const TopoDS_Shape& shape, const ChFi3d_FilletShape type = ChFi3d_Rational);
    void Add(const Standard_Real radius, const TopoDS_Edge& edge) ;
};

class BRepFilletAPI_MakeChamfer: public BRepFilletAPI_LocalOperation
{
    %rename(add) Add; 
  public:
    BRepFilletAPI_MakeChamfer(const TopoDS_Shape& shape);
    void Add(const Standard_Real distance, const TopoDS_Edge& edge, const TopoDS_Face& face);
};
