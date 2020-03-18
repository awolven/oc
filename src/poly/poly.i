
%{
#include <Poly_Triangulation.hxx>
  %}

%rename(Poly_Triangulation) Handle_Poly_Triangulation;

class Handle_Poly_Triangulation
{
  Handle_Poly_Triangulation()=0;
};

%extend Handle_Poly_Triangulation
{
  Standard_Real Deflection() const
  {
    return (*self)->Deflection();
  }
  void Deflection(const Standard_Real D)
  {
    return (*self)->Deflection(D);
  }
  void RemoveUVNodes()
  {
    return (*self)->RemoveUVNodes();
  }
  Standard_Integer NbNodes() const
  {
    return (*self)->NbNodes();
  }
  Standard_Integer NbTriangles() const
  {
    return (*self)->NbTriangles();
  }
  Standard_Boolean HasUVNodes() const
  {
    return (*self)->HasUVNodes();
  }
  const Poly_Array1OfTriangle& Triangles() const
  {
    return (*self)->Triangles();
  }
  const TColgp_Array1OfPnt& Nodes() const
  {
    return (*self)->Nodes();
  }
  const TColgp_Array1OfPnt2d& UVNodes() const
  {
    return (*self)->UVNodes();
  }
}

/*
class Poly_Triangulation
{
	public:
	Poly_Triangulation(const Standard_Integer nbNodes,
		const Standard_Integer nbTriangles,const Standard_Boolean UVNodes);
	Standard_Real Deflection() const;
	void Deflection(const Standard_Real D) ;
	void RemoveUVNodes() ;
	Standard_Integer NbNodes() const;
	Standard_Integer NbTriangles() const;
	Standard_Boolean HasUVNodes() const;
	const Poly_Array1OfTriangle& Triangles() const;
	const TColgp_Array1OfPnt& Nodes() const;
	const TColgp_Array1OfPnt2d& UVNodes() const;
};
*/
class Poly_Triangle {
 public:
  Poly_Triangle();
  Poly_Triangle(const Standard_Integer N1, const Standard_Integer N2, const Standard_Integer N3);
  Standard_Integer Value(const Standard_Integer Index) const;
};

class Poly_Array1OfTriangle {
 public:
  Poly_Array1OfTriangle(const Standard_Integer Low, const Standard_Integer Up);
  Poly_Array1OfTriangle(const Poly_Triangle &Item, const Standard_Integer Low, const Standard_Integer Up);
  Standard_Integer Length();
  Standard_Integer Lower();
  Standard_Integer Upper();
  const Poly_Triangle & Value(const Standard_Integer Index) const;
};

class Poly_Polygon3D
{
 public:
  Poly_Polygon3D (const TColgp_Array1OfPnt &Nodes);
  Poly_Polygon3D (const TColgp_Array1OfPnt &Nodes, const TColStd_Array1OfReal &Parameters);
  Standard_Real 	Deflection ();
  void 	Deflection (const Standard_Real D);
  Standard_Integer 	NbNodes () const;
  const TColgp_Array1OfPnt & 	Nodes () const;
  Standard_Boolean 	HasParameters () const;
  const TColStd_Array1OfReal & 	Parameters () const;
  TColStd_Array1OfReal & 	ChangeParameters () const;
};

%{
  #include <Poly_PolygonOnTriangulation.hxx>
  %}

class Poly_PolygonOnTriangulation
{
 public:
  Poly_PolygonOnTriangulation(const TColStd_Array1OfInteger& Nodes);
  Poly_PolygonOnTriangulation(const TColStd_Array1OfInteger& Nodes, const TColStd_Array1OfReal& Parameters);
  Handle_Poly_PolygonOnTriangulation Copy() const;
  Standard_Real Deflection() const;
  void Deflection (const Standard_Real D);
  Standard_Integer NbNodes() const;
  const TColStd_Array1OfInteger& Nodes() const;
  Standard_Boolean HasParameters() const;
  Handle_TColStd_HArray1OfReal Parameters() const;
};

