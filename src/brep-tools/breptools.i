
%{
#include <BRepTools.hxx>
#include <BRepTools_ShapeSet.hxx>    
%}

%nodefaultdtor BRepTools;
%nodefaultctor BRepTools;
class BRepTools
{
 public:
  static Standard_Boolean Read(TopoDS_Shape& shape, const Standard_CString file, const BRep_Builder& builder);
  static Standard_Boolean Write(const TopoDS_Shape& shape, const Standard_CString file);
  static  void Write(const TopoDS_Shape& Sh,Standard_OStream& S);
  static  void Clean(const TopoDS_Shape& S);
  static  TopoDS_Wire OuterWire(const TopoDS_Face& F);
};

%{
#include <BRepTools_WireExplorer.hxx>
  %}
class BRepTools_WireExplorer
{
 public:
  BRepTools_WireExplorer();
  BRepTools_WireExplorer(const TopoDS_Wire& W);
  BRepTools_WireExplorer(const TopoDS_Wire& W,const TopoDS_Face& F);
  void Init(const TopoDS_Wire& W) ;
  void Init(const TopoDS_Wire& W,const TopoDS_Face& F) ;
  Standard_Boolean More() const;
  void Next() ;
  const TopoDS_Edge& Current() const;
  TopAbs_Orientation Orientation() const;
  const TopoDS_Vertex& CurrentVertex() const;
  void Clear() ;
};

%{
#include <BRepTools_Quilt.hxx>
  %}

class BRepTools_Quilt
{
 public:
  BRepTools_Quilt();
  void Bind(const TopoDS_Edge& Eold,const TopoDS_Edge& Enew) ;
  void Bind(const TopoDS_Vertex& Vold,const TopoDS_Vertex& Vnew) ;
  void Add(const TopoDS_Shape& S) ;
  Standard_Boolean IsCopied(const TopoDS_Shape& S) const;
  const TopoDS_Shape& Copy(const TopoDS_Shape& S) const;
  TopoDS_Shape Shells() const;
};
