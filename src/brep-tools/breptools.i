
%{
#include <BRepTools.hxx>
#include <BRepTools_ShapeSet.hxx>    
%}

class BRepTools
{
	//Hide the constructor to make this class entirely static.
	BRepTools()=0;
	public:
	
	%rename(read) Read;
	static Standard_Boolean Read(TopoDS_Shape& shape,
		const Standard_CString file, const BRep_Builder& builder) ;

	%rename(write) Write;
	static Standard_Boolean Write(const TopoDS_Shape& shape,
		const Standard_CString file);

	static  void Write(const TopoDS_Shape& Sh,Standard_OStream& S) ;
	%rename(clean) Clean;
	static  void Clean(const TopoDS_Shape& S) ;
	
	%rename(getOuterWire) OuterWire;
	static  TopoDS_Wire OuterWire(const TopoDS_Face& F) ;
};

%extend BRepTools
{
	//in the original version of this method opencascade suppose that the format of the stream is
	//correct and don't do any verification. It cause segfault when the stream is wrong.
	static Standard_Boolean read(TopoDS_Shape& shape, Standard_IStream& input, const BRep_Builder& builder)
	{
		BRepTools_ShapeSet SS(builder);
		SS.Read(input);
		if(!SS.NbShapes()) return Standard_False;
		SS.Read(shape,input);
		return Standard_True;
	}
}


/**
 * BRepTools_WireExplorer
 */
%{
#include <BRepTools_WireExplorer.hxx>
  %}
class BRepTools_WireExplorer
{
	%rename(init) Init;
	%rename(more) More;
	%rename(next) Next;
	%rename(current) Current;
	%rename(orientation) Orientation;
	%rename(currentVertex) CurrentVertex;
	%rename(clear) Clear;
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
	%rename(bind) Bind;
	%rename(add) Add;
	%rename(isCopied) IsCopied;
	%rename(copy) Copy;
	%rename(shells) Shells;
	public:
	BRepTools_Quilt();
	void Bind(const TopoDS_Edge& Eold,const TopoDS_Edge& Enew) ;
	void Bind(const TopoDS_Vertex& Vold,const TopoDS_Vertex& Vnew) ;
	void Add(const TopoDS_Shape& S) ;
	Standard_Boolean IsCopied(const TopoDS_Shape& S) const;
	const TopoDS_Shape& Copy(const TopoDS_Shape& S) const;
	TopoDS_Shape Shells() const;
};
