%{#include <BRepMesh_DiscretRoot.hxx>%}
class BRepMesh_DiscretRoot
{
	protected:
	BRepMesh_DiscretRoot();
	public:
	/*	void SetDeflection(const Standard_Real D) ;
	void SetAngle(const Standard_Real Ang) ;
	Standard_Real Deflection() const;
	Standard_Real Angle() const; */
	virtual void Perform();
};

%{#include <BRepMesh_IncrementalMesh.hxx>%}
class BRepMesh_IncrementalMesh : public BRepMesh_DiscretRoot
{
	public:
	BRepMesh_IncrementalMesh();
        BRepMesh_IncrementalMesh(const TopoDS_Shape&    theShape,
                                 const Standard_Real    theLinDeflection,
                                 const Standard_Boolean isRelative = Standard_False,
                                 const Standard_Real    theAngDeflection = 0.5,
                                 const Standard_Boolean isInParallel = Standard_False,
                                 const Standard_Boolean adaptiveMin = Standard_False);
	/* BRepMesh_IncrementalMesh(const TopoDS_Shape& S,const Standard_Real D,
		const Standard_Boolean Relatif = Standard_False,
		const Standard_Real Ang = 0.5);
	*/	
	void Perform();
//	void Update(const TopoDS_Shape& S) ;
	Standard_Boolean IsModified() const;
};

%{#include <BRepMesh_FaceAttribute.hxx>%}
class BRepMesh_FaceAttribute
{
 public:
  BRepMesh_FaceAttribute(const BRepMesh::HDMapOfVertexInteger& theBoundaryVertices,
			 const BRepMesh::HDMapOfIntegerPnt&    theBoundaryPoints);
  BRepMesh_FaceAttribute(const TopoDS_Face&                    theFace,
			 const BRepMesh::HDMapOfVertexInteger& theBoundaryVertices,
			 const BRepMesh::HDMapOfIntegerPnt&    theBoundaryPoints,
			 const Standard_Boolean                theAdaptiveMin);
  virtual ~BRepMesh_FaceAttribute();
  const Handle_BRepAdaptor_HSurface& Surface();
  Standard_Boolean IsInitialized ();
  void SetFace (const TopoDS_Face&     theFace, 
		const Standard_Boolean theAdaptiveMin);
  const TopoDS_Face& Face();
  void SetBoundaryVertices(const BRepMesh::HDMapOfVertexInteger& theVertices);
  void SetBoundaryPoints(const BRepMesh::HDMapOfIntegerPnt& theBoundaryPoints);
  Standard_Real ToleranceU() const;
  Standard_Real ToleranceV() const;
  Standard_Real GetDefFace() const;
  void SetDefFace(const Standard_Real theDefFace);
  Standard_Real GetUMin() const;
  void SetUMin(const Standard_Real theUMin);
  Standard_Real GetVMin() const;
  Standard_Real GetUMax() const;
  void SetUMax(const Standard_Real theUMax);
  Standard_Real GetVMax() const;
  void SetVMax(const Standard_Real theVMax);
  Standard_Real GetDeltaX() const;
  void SetDeltaX(const Standard_Real theDeltaX);
  Standard_Real GetDeltaY() const;
  void SetDeltaY(const Standard_Real theDeltaY);
  Standard_Integer GetStatus() const;
  void SetStatus(const BRepMesh_Status theStatus);
  Standard_Boolean IsValid() const;
  void Clear();
  BRepMesh::HDMapOfIntegerListOfXY& ChangeLocation2D();
  BRepMesh::HDMapOfIntegerPnt& ChangeSurfacePoints();
  BRepMesh::HDMapOfVertexInteger& ChangeSurfaceVertices();
  BRepMesh::HIMapOfInteger& ChangeVertexEdgeMap();
  Handle_BRepMesh_DataStructureOfDelaun& ChangeStructure();
  BRepMesh::HClassifier& ChangeClassifier();
  BRepMesh::HVectorOfVertex& ChangeMeshNodes();
  Standard_Integer LastPointId() const;
  gp_Pnt& GetPoint(const BRepMesh_Vertex& theVertex) const;
  gp_Pnt& GetPoint(const Standard_Integer theIndex) const;
  void AddNode(const Standard_Integer         theIndex,
	       const gp_XY&                   theUV,
	       const BRepMesh_DegreeOfFreedom theMovability,
	       Standard_Integer&              theNodeIndex,
	       Standard_Integer&              theNodeOnEdgeIndex);
};
    
/*
%{#include <BRepMesh_FastDiscret.hxx>%}

struct Parameters {};

class BRepMesh_FastDiscret
{
 public:

  BRepMesh_FastDiscret (const Bnd_Box& B,
			const Parameters& theParams);
  void Perform(const TopoDS_Shape& shape);
  Standard_Integer Add(const TopoDS_Face& face);
  void Process(const TopoDS_Face& face) const;
  Parameters& ChangeMeshParameters();
  void InitSharedFaces(const TopoDS_Shape& theShape);
  Standard_Boolean GetFaceAttribute (const TopoDS_Face&              theFace, 
				     Handle_BRepMesh_FaceAttribute& theAttribute,
				     const Standard_Boolean          isForceCreate = Standard_False) const;
};
*/
