
%{
#include <gp_Pnt.hxx>
#include <gp_Pnt2d.hxx>
#include <gp_Dir2d.hxx>
#include <gp_Vec2d.hxx>
#include <gp_Ax2d.hxx>
#include <gp_Ax22d.hxx>
#include <gp_Pln.hxx>
#include <gp_Vec.hxx>
#include <gp_Dir.hxx>
#include <gp_Ax3.hxx>
#include <gp_Ax2.hxx>
#include <gp_Ax1.hxx>
#include <gp_Trsf2d.hxx>
#include <gp_Trsf.hxx>
#include <gp_Circ.hxx>
#include <gp_Cone.hxx>
#include <gp_Cylinder.hxx>
#include <gp_Parab.hxx>
#include <gp_Hypr.hxx>
#include <gp_Torus.hxx>
#include <gp_Sphere.hxx>
#include <gp_XYZ.hxx>
#include <gp_XY.hxx>
#include <gp_Lin2d.hxx>
%}
/*
%{
#include <gp.hxx>
#include <gp_GTrsf.hxx>
#include <gp_Mat2d.hxx>
#include <gp_QuaternionNLerp.hxx>
#include <gp_TrsfNLerp.hxx>
#include <gp_GTrsf2d.hxx>
#include <gp_QuaternionSLerp.hxx>

#include <gp_Parab2d.hxx>
#include <gp_Hypr2d.hxx>
#include <gp_VectorWithNullMagnitude.hxx>
#include <gp_Elips.hxx>
#include <gp_Lin.hxx>
#include <gp_XY.hxx>
#include <gp_Elips2d.hxx>
#include <gp_Lin2d.hxx>

#include <gp_Circ2d.hxx>
#include <gp_EulerSequence.hxx>
#include <gp_Mat.hxx>
#include <gp_Quaternion.hxx>
#include <gp_TrsfForm.hxx>
  %}
*/

class gp_Pnt
{
 public:
  gp_Pnt();
  gp_Pnt(const gp_XYZ& Coord);
  gp_Pnt(const Standard_Real Xp, const Standard_Real Yp, const Standard_Real Zp);

  Standard_Real X() const;
  Standard_Real Y() const;
  Standard_Real Z() const;

};

class gp_Pnt2d
{
 public:
  gp_Pnt2d();
  gp_Pnt2d(const gp_XY& Coord);
  gp_Pnt2d(const Standard_Real Xp, const Standard_Real Yp);
  
};

class gp_Dir2d
{
 public:
  gp_Dir2d();
  gp_Dir2d(const gp_Vec2d& V);
  gp_Dir2d(const gp_XY& Coord);
  gp_Dir2d(const Standard_Real Xv, const Standard_Real Yv);

};

class gp_Vec2d
{
 public:
  gp_Vec2d();
  gp_Vec2d(const gp_Dir2d& V);
  gp_Vec2d(const gp_XY& Coord);
  gp_Vec2d(const Standard_Real Xv, const Standard_Real Yv);
  gp_Vec2d(const gp_Pnt2d& P1, const gp_Pnt2d& P2);

};

class gp_Ax2d
{
 public:
  gp_Ax2d();
  gp_Ax2d(const gp_Pnt2d& P, const gp_Dir2d& V);

};

class gp_Ax22d
{
 public:
  gp_Ax22d();
  gp_Ax22d(const gp_Pnt2d& P, const gp_Dir2d& Vx, const gp_Dir2d& Vy);
  gp_Ax22d(const gp_Pnt2d& P, const gp_Dir2d& V, const Standard_Boolean Sense = Standard_True);
  gp_Ax22d(const gp_Ax2d& A, const Standard_Boolean Sense = Standard_True);

};

class gp_Pln
{
 public:
  gp_Pln(const gp_Ax3& A3);
  gp_Pln(const gp_Pnt& P, const gp_Dir& V);
  gp_Pln(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);
};

class gp_Vec
{
 public:
  gp_Vec();
  gp_Vec(const gp_Dir& V);
  gp_Vec(const gp_XYZ& Coord);
  gp_Vec(const Standard_Real Xv, const Standard_Real Yv, const Standard_Real Zv);
  gp_Vec(const gp_Pnt& P1, const gp_Pnt& P2);
};

class gp_Dir
{
 public:
  gp_Dir();
  gp_Dir(const gp_Vec& V);
  gp_Dir(const gp_XYZ& Coord);
  gp_Dir(const Standard_Real Xv, const Standard_Real Yv, const Standard_Real Zv);

};

class gp_Ax3
{
 public:
  gp_Ax3();
  gp_Ax3(const gp_Ax2& A);
  gp_Ax3(const gp_Pnt& P, const gp_Dir& N, const gp_Dir& Vx);
  gp_Ax3(const gp_Pnt& P, const gp_Dir& V);
};

class gp_Ax2
{
 public:
  gp_Ax2();
  gp_Ax2(const gp_Pnt& P, const gp_Dir& V);
  gp_Ax2(const gp_Pnt& P, const gp_Dir& N, const gp_Dir& Vx);

};

class gp_Ax1
{
 public:
  gp_Ax1();
  gp_Ax1(const gp_Pnt& P, const gp_Dir& V);

};

class gp_Trsf2d
{
 public:
  gp_Trsf2d();
  gp_Trsf2d(const gp_Trsf& T);
};

class gp_Trsf
{
 public:
  gp_Trsf();
  gp_Trsf(const gp_Trsf2d& T);
  void SetMirror (const gp_Ax1& A1);
  void SetMirror (const gp_Ax2& A2);
  void SetRotation(const gp_Ax1& A1,const Standard_Real Ang) ;
  void SetTranslation(const gp_Vec& V) ;
  void SetValues(const Standard_Real a11,const Standard_Real a12,
		 const Standard_Real a13,const Standard_Real a14,const Standard_Real a21,
		 const Standard_Real a22,const Standard_Real a23,const Standard_Real a24,
		 const Standard_Real a31,const Standard_Real a32,const Standard_Real a33,
		 const Standard_Real a34);
};

class gp_Circ
{
 public:
  gp_Circ(const gp_Ax2& axis, const Standard_Real radius);
};

class gp_Cone
{
 public:
  gp_Cone(const gp_Ax3& A3, const Standard_Real Angle, const Standard_Real Radius);
};

class gp_Cylinder
{
 public:
  gp_Cylinder(const gp_Ax3& A3, const Standard_Real Radius);
};

class gp_Parab
{
 public:
  gp_Parab(const gp_Ax2& A2,const Standard_Real Focal);
  gp_Parab(const gp_Ax1& D,const gp_Pnt& F);
};

class gp_Hypr
{
 public:
  gp_Hypr(const gp_Ax2& A2,const Standard_Real MajorRadius,const Standard_Real MinorRadius);
};

class gp_Torus
{
 public:
  gp_Torus(const gp_Ax3& A3, Standard_Real& MajorRadius, Standard_Real& MinorRadius);
};

class gp_Sphere
{
 public:
  gp_Sphere(const gp_Ax3& A3, Standard_Real& radius);
};

class gp_XYZ
{
 public:
  gp_XYZ();
  gp_XYZ(const Standard_Real X, const Standard_Real Y, const Standard_Real Z);
};

class gp_XY
{
 public:
  gp_XY();
  gp_XY(const Standard_Real X, const Standard_Real Y);
};

class gp_Lin2d
{
 public:
  gp_Lin2d();
  gp_Lin2d(const gp_Ax2d& A);
  gp_Lin2d(const gp_Pnt2d& P, const gp_Dir2d& V);
  gp_Lin2d(const Standard_Real A, const Standard_Real B, const Standard_Real C);
};
