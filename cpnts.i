%{
  #include <Adaptor3d_Curve.hxx>
  #include <Adaptor2d_Curve2d.hxx>
  #include <CPnts_UniformDeflection.hxx>
  %}
class CPnts_UniformDeflection 
{
public:
  CPnts_UniformDeflection();
  CPnts_UniformDeflection(const Adaptor3d_Curve& C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);
  CPnts_UniformDeflection(const Adaptor2d_Curve2d& C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);
  CPnts_UniformDeflection(const Adaptor3d_Curve& C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);
  CPnts_UniformDeflection(const Adaptor2d_Curve2d& C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);
  void Initialize (const Adaptor3d_Curve& C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);
  void Initialize (const Adaptor2d_Curve2d& C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);
  void Initialize (const Adaptor3d_Curve& C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);
  void Initialize (const Adaptor2d_Curve2d& C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);
  Standard_Boolean IsAllDone() const;
  void Next();
  Standard_Boolean More();
  Standard_Real Value() const;
  gp_Pnt Point() const;
};
