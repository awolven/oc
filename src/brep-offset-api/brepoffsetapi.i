
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
  virtual void Build();
  
  //! Returns the list  of shapes modified from the shape
  //! <S>.
  virtual const TopTools_ListOfShape& Modified (const TopoDS_Shape& S);
};

%{
#include <BRepOffsetAPI_ThruSections.hxx>
  %}

class BRepOffsetAPI_ThruSections  : public BRepBuilderAPI_MakeShape
{
 public:
  BRepOffsetAPI_ThruSections(const Standard_Boolean isSolid = Standard_False, const Standard_Boolean ruled = Standard_False, const Standard_Real pres3d = 1.0e-06);
  void Init (const Standard_Boolean isSolid = Standard_False, const Standard_Boolean ruled = Standard_False, const Standard_Real pres3d = 1.0e-06);
  void AddWire (const TopoDS_Wire& wire);
  void AddVertex (const TopoDS_Vertex& aVertex);
  void CheckCompatibility (const Standard_Boolean check = Standard_True);
  void SetSmoothing (const Standard_Boolean UseSmoothing);
  void SetParType (const Approx_ParametrizationType ParType);
  void SetContinuity (const GeomAbs_Shape C);
  void SetCriteriumWeight (const Standard_Real W1, const Standard_Real W2, const Standard_Real W3);
  void SetMaxDegree (const Standard_Integer MaxDeg);
  Approx_ParametrizationType ParType() const;
  GeomAbs_Shape Continuity() const;
  Standard_Integer MaxDegree() const;
  Standard_Boolean UseSmoothing() const;
  void CriteriumWeight (Standard_Real& W1, Standard_Real& W2, Standard_Real& W3) const;
  const TopoDS_Shape& FirstShape() const;
  const TopoDS_Shape& LastShape() const;
  TopoDS_Shape GeneratedFace (const TopoDS_Shape& Edge) const;
};
