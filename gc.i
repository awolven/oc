

 %{#include <GC_MakeArcOfCircle.hxx>%}
 
 class GC_MakeArcOfCircle {
   public:
   GC_MakeArcOfCircle(const gp_Pnt& P1,const gp_Pnt& P2,const gp_Pnt& P3);
   GC_MakeArcOfCircle(const gp_Circ& Circ,const gp_Pnt& P1,const gp_Pnt& P2,const Standard_Boolean Sense);
   const Handle_Geom_TrimmedCurve& Value() const;
 };
