
%{
#include <Poly_Triangulation.hxx>
  %}

class Poly_Triangulation
{
	%rename(deflection) Deflection;
	%rename(removeUVNodes) RemoveUVNodes;
	%rename(nbNodes) NbNodes;
	%rename(hasUVNodes) HasUVNodes;
	%rename(nbTriangles) NbTriangles;
	%rename(triangles) Triangles;
	%rename(nodes) Nodes;
	%rename(uvNodes) UVNodes;
	
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
