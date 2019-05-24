
%{
#include <BRepOffsetAPI_NormalProjection.hxx>
%}

class BRepOffsetAPI_NormalProjection: public BRepBuilderAPI_MakeShape
{
	public:
	BRepOffsetAPI_NormalProjection();
	BRepOffsetAPI_NormalProjection(const TopoDS_Shape& S);
	void Init(const TopoDS_Shape& S) ;
	void Add(const TopoDS_Shape& ToProj) ;
	void SetParams(const Standard_Real Tol3D,const Standard_Real Tol2D,const GeomAbs_Shape InternalContinuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSeg) ;
	void SetMaxDistance(const Standard_Real MaxDist) ;
	void SetLimit(const Standard_Boolean FaceBoundaries = Standard_True) ;
	void Compute3d(const Standard_Boolean With3d = Standard_True) ;
	virtual  void Build() ;
	Standard_Boolean IsDone() const;
	const TopoDS_Shape& Projection() const;
	const TopoDS_Shape& Couple(const TopoDS_Edge& E) const;
	virtual const TopTools_ListOfShape& Generated(const TopoDS_Shape& S) ;
	const TopoDS_Shape& Ancestor(const TopoDS_Edge& E) const;
	Standard_Boolean BuildWire(TopTools_ListOfShape& Liste) const;
};

%{
#include <BRepOffsetAPI_MakeOffsetShape.hxx>
  %}

class BRepOffsetAPI_MakeOffsetShape  : public BRepBuilderAPI_MakeShape
{
public:

  BRepOffsetAPI_MakeOffsetShape();
  BRepOffsetAPI_MakeOffsetShape(const TopoDS_Shape& S, 
				const Standard_Real Offset, 
				const Standard_Real Tol, 
				const BRepOffset_Mode Mode = BRepOffset_Skin, 
				const Standard_Boolean Intersection = Standard_False, 
				const Standard_Boolean SelfInter = Standard_False, 
				const GeomAbs_JoinType Join = GeomAbs_Arc,
				const Standard_Boolean RemoveIntEdges = Standard_False);
};

%{
#include <BRepOffsetAPI_MakeThickSolid.hxx>
  %}

class BRepOffsetAPI_MakeThickSolid  : public BRepOffsetAPI_MakeOffsetShape
{
 public:
  BRepOffsetAPI_MakeThickSolid();
  BRepOffsetAPI_MakeThickSolid(const TopoDS_Shape& S, 
			       const TopTools_ListOfShape& ClosingFaces, 
			       const Standard_Real Offset, 
			       const Standard_Real Tol, 
			       const BRepOffset_Mode Mode = BRepOffset_Skin, 
			       const Standard_Boolean Intersection = Standard_False,
			       const Standard_Boolean SelfInter = Standard_False, 
			       const GeomAbs_JoinType Join = GeomAbs_Arc,
			       const Standard_Boolean RemoveIntEdges = Standard_False);
};
