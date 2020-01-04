%{
#include <Bnd_Box.hxx>
  %}

class Bnd_Box
{
	public:
	Bnd_Box();
	void SetWhole();
	void SetVoid();
	void Set (const gp_Pnt& P);
	void Set (const gp_Pnt& P, const gp_Dir& D);
	void Update (const Standard_Real aXmin, const Standard_Real aYmin, const Standard_Real aZmin, const Standard_Real aXmax, const Standard_Real aYmax, const Standard_Real aZmax);
	Standard_Real GetGap() const;
	void SetGap (const Standard_Real Tol);
	void Enlarge (const Standard_Real Tol);
	void Get (Standard_Real& theXmin, Standard_Real& theYmin, Standard_Real& theZmin, Standard_Real& theXmax, Standard_Real& theYmax, Standard_Real& theZmax) const;
	gp_Pnt CornerMin() const;
	gp_Pnt CornerMax() const;
	void OpenXmin();
	void OpenXmax();
	void OpenYmin();
	void OpenYmax();
	void OpenZmin();
	void OpenZmax();
	Standard_Boolean IsOpenXmin() const;
	Standard_Boolean IsOpenXmax() const;
	Standard_Boolean IsOpenYmin() const;
	Standard_Boolean IsOpenYmax() const;
	Standard_Boolean IsOpenZmin() const;
	Standard_Boolean IsOpenZmax() const;
	Standard_Boolean IsWhole()    const;	
	Standard_Boolean IsVoid() const;
	Standard_Boolean IsXThin (const Standard_Real tol) const;
	Standard_Boolean IsYThin (const Standard_Real tol) const;
	Standard_Boolean IsZThin (const Standard_Real tol) const;
	Standard_Boolean IsThin (const Standard_Real tol) const;
	Bnd_Box Transformed (const gp_Trsf& T) const;
	void Add (const Bnd_Box& Other);
	void Add (const gp_Pnt& P);
	void Add (const gp_Pnt& P, const gp_Dir& D);
	void Add (const gp_Dir& D);
	Standard_Boolean IsOut (const gp_Pnt& P) const;
	Standard_Boolean IsOut (const gp_Lin& L) const;
	Standard_Boolean IsOut (const gp_Pln& P) const;
	Standard_Boolean IsOut (const Bnd_Box& Other) const;
	Standard_Boolean IsOut (const Bnd_Box& Other, const gp_Trsf& T) const;
	Standard_Boolean IsOut (const gp_Trsf& T1, const Bnd_Box& Other, const gp_Trsf& T2) const;
	Standard_Boolean IsOut (const gp_Pnt& P1, const gp_Pnt& P2, const gp_Dir& D) const;
	Standard_Real Distance (const Bnd_Box& Other) const;
	void Dump() const;
	Standard_Real SquareExtent() const;
};

