
%{#include <GC_Root.hxx>%}

class GC_Root {
 public:
  Standard_Boolean IsDone() const;
  int Status() const;
};

 %{#include <GC_MakeArcOfCircle.hxx>%}
 
class GC_MakeArcOfCircle: public GC_Root {
   public:
   GC_MakeArcOfCircle(const gp_Pnt& P1,const gp_Pnt& P2,const gp_Pnt& P3);
   GC_MakeArcOfCircle(const gp_Circ& Circ,const gp_Pnt& P1,const gp_Pnt& P2,const Standard_Boolean Sense);
   const Handle_Geom_TrimmedCurve& Value() const;
 };

%{#include <GC_MakeSegment.hxx>%}

class GC_MakeSegment: public GC_Root {
 public:
    GC_MakeSegment(const gp_Pnt& P1, const gp_Pnt& P2);
    GC_MakeSegment(const gp_Lin& Line, const Standard_Real U1, const Standard_Real U2);
    GC_MakeSegment(const gp_Lin& Line, const gp_Pnt& Point, const Standard_Real Ulast);
    GC_MakeSegment(const gp_Lin& Line, const gp_Pnt& P1, const gp_Pnt& P2);
    const Handle_Geom_TrimmedCurve& Value() const;
};
