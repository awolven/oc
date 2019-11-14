%{#include <GCE2d_Root.hxx>%}

class GCE2d_Root 
{
public:
  Standard_Boolean IsDone() const;
  gce_ErrorType Status() const;
};

%{#include <GCE2d_MakeSegment.hxx>%}

class GCE2d_MakeSegment  : public GCE2d_Root
{
public:
  GCE2d_MakeSegment(const gp_Pnt2d& P1, const gp_Pnt2d& P2);
  GCE2d_MakeSegment(const gp_Pnt2d& P1, const gp_Dir2d& V, const gp_Pnt2d& P2);
  GCE2d_MakeSegment(const gp_Lin2d& Line, const Standard_Real U1, const Standard_Real U2);
  GCE2d_MakeSegment(const gp_Lin2d& Line, const gp_Pnt2d& Point, const Standard_Real Ulast);
  GCE2d_MakeSegment(const gp_Lin2d& Line, const gp_Pnt2d& P1, const gp_Pnt2d& P2);
  const Handle_Geom2d_TrimmedCurve& Value() const;
};
