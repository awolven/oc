%module "oc";

%nodefaultctor;

%typemap(cin) bool ":int";
%typemap(cout) bool ":int";
%typemap(ctype) bool "bool";
%typemap(out) bool "$result = (bool)$1;";
%typemap(lispclass) bool "cl:boolean";
%typemap(lispclass) float "cl:single-float";
%typemap(lispclass) double "cl:double-float";

%{
  EXPORT void (* signal_lisp_error) (const char* message) = 0;

  %}
%{
#include <Standard_Failure.hxx>
#include <Standard_ErrorHandler.hxx>
%}

%include exception.i

%exception {
  try
    {
      OCC_CATCH_SIGNALS
      $action
	}
  catch(Standard_Failure const& error)
    {
      char *error_name = (char*) error.DynamicType()->Name();
	    char *error_message = (char*) error.GetMessageString();
	    std::string message;
	    if (error_name) message += std::string(error_name) + "\n";
	    if (error_message) message += std::string(error_message);
	    // log SWIG specific debug information
	    message += "\nwrapper details:\n  * symname: $symname\n  * wrapname: $wrapname\n  * fulldecl: $fulldecl";
	    signal_lisp_error(message.c_str());
    }
 }

%insert(swiglisp) %{
(cl:in-package #:oc)
  
(cffi:defcvar "signal_lisp_error" :pointer)
  
(cffi:defcallback signal-lisp-error :void ((message :string))
    (cl:error "~S" message))

(cl:defun init-occ ()
  (cl:setf *signal-lisp-error* (cffi:get-callback 'signal-lisp-error)))
     %}

%include "standard.i";
%include "gp.i";
%include "tcol.i";
%include "topabs.i";
%include "topods.i";
%include "geomabs.i";
%include "toptools.i";
%include "brep.i";
%include "geomlprop_slprops.i";
%include "breptools.i";
%include "brepbuilderapi.i";
%include "brepoffsetapi.i";
%include "brepprimapi.i";
%include "brepalgoapi.i";
%include "poly.i";
%include "geom.i";
%include "breplib.i";
%include "brepfilletapi.i";
%include "brepcheck.i";
%include "shapebuild.i";
%include "xscontrol.i";
%include "shapefix.i";
%include "shapeanalysis.i";
%include "apiheadersection-makeheader.i";
%include "shapeupgrade.i";
%include "geomapi.i";
%include "gc.i";
%include "gce2d.i";

%{
#include <TopExp.hxx>
  %}


class TopLoc_Location
{
	public:
	TopLoc_Location ();
	TopLoc_Location (const gp_Trsf& T);
	Standard_Boolean IsIdentity();
	const gp_Trsf& Transformation();
};

class TopExp
{
	public:
	static void Vertices(const TopoDS_Edge& E,TopoDS_Vertex& Vfirst,TopoDS_Vertex& Vlast,const Standard_Boolean CumOri = Standard_False) ;
	static Standard_Boolean CommonVertex(const TopoDS_Edge& E1, const TopoDS_Edge& E2, TopoDS_Vertex& V) ;
};

/**
 * TopExp_Explorer
 */
%{#include "TopExp_Explorer.hxx"%}
class TopExp_Explorer
{
	public:
	TopExp_Explorer();
	TopExp_Explorer(const TopoDS_Shape& S,const TopAbs_ShapeEnum ToFind,
		const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);
	void Init(const TopoDS_Shape& S, const TopAbs_ShapeEnum ToFind, 
		const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE) ;
	Standard_Boolean More() const;
	void Next() ;
	const TopoDS_Shape& Current();
};

/**
 * Bnd_Box
 */
%{#include "Bnd_Box.hxx"%}

class Bnd_Box
{
	public:
	Bnd_Box();
	Standard_Boolean IsVoid() const;
};

%extend Bnd_Box
{
	void get(double box[6])
	{
		if(!self->IsVoid())
			self->Get(box[0], box[1], box[2], box[3], box[4], box[5]);
	}
};

/**
 * BRepBndLib
 */
%{#include "BRepBndLib.hxx"%}
class BRepBndLib
{
	public:
	static void Add(const TopoDS_Shape& shape,Bnd_Box& bndBox);
};

/**
 * Adaptor2d_Curve2d
 */
%{#include "Adaptor2d_Curve2d.hxx"%}

class Adaptor2d_Curve2d
{		
	Adaptor2d_Curve2d()=0;
	public:
	virtual gp_Pnt2d Value(const Standard_Real U) const;
};

/**
 * Geom2dAdaptor_Curve
 */
%{#include "Geom2dAdaptor_Curve.hxx"%}
class Geom2dAdaptor_Curve: public Adaptor2d_Curve2d
{
	public:
	Geom2dAdaptor_Curve();
	Geom2dAdaptor_Curve(const Handle_Geom2d_Curve & C);
	Geom2dAdaptor_Curve(const Handle_Geom2d_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
	void Load(const Handle_Geom2d_Curve & C) ;
	void Load(const Handle_Geom2d_Curve & C,const Standard_Real UFirst,const Standard_Real ULast) ;
};

/**
 * Adaptor3d_Curve
 */
%{#include "Adaptor3d_Curve.hxx"%}

class Adaptor3d_Curve
{		
	Adaptor3d_Curve()=0;
	public:
	const gp_Pnt Value(const Standard_Real U) const;
};

//extends the Adaptor3d_Curve class to reduce the JNI overhead when
//calling a lot of Adaptor3d_Curve.Value
%extend Adaptor3d_Curve
{
	public:
	void arrayValues(int size, double u[])
	{
		for (int i = 0; i < size; i++)
		{
			gp_Pnt gp=self->Value(u[3*i]);
			u[3*i]   = gp.X();
			u[3*i+1] = gp.Y();
			u[3*i+2] = gp.Z();
		}	
	}
};

/**
 * GeomAdaptor_Curve
 */
%{#include "GeomAdaptor_Curve.hxx"%}

class GeomAdaptor_Curve: public Adaptor3d_Curve
{
	public:
	GeomAdaptor_Curve();
	GeomAdaptor_Curve(const Handle_Geom_Curve & C);
	GeomAdaptor_Curve(const Handle_Geom_Curve & C,
		const Standard_Real UFirst,const Standard_Real ULast);
	void Load(const Handle_Geom_Curve & C) ;
	void Load(const Handle_Geom_Curve & C,
		const Standard_Real UFirst,const Standard_Real ULast) ;

};


/**
 * GProp_GProps
 */
 %{#include "GProp_GProps.hxx"%}
 class GProp_GProps
 {
	 public:
	 GProp_GProps();
	 Standard_Real Mass() const;
 };
 
/**
 * BRepGProp
 */
%{#include "BRepGProp.hxx"%}
class BRepGProp
{
	public:
	static void LinearProperties(const TopoDS_Shape& shape, GProp_GProps& properties);
        static void VolumeProperties(const TopoDS_Shape& shape, GProp_GProps& properties, const Standard_Boolean onlyClosed = Standard_False) ;
        static Standard_Real VolumeProperties(const TopoDS_Shape& shape, GProp_GProps& properties, const Standard_Real Eps, const Standard_Boolean onlyClosed = Standard_False) ;
        static void SurfaceProperties(const TopoDS_Shape& shape, GProp_GProps& properties) ;
        static Standard_Real SurfaceProperties(const TopoDS_Shape& shape, GProp_GProps& properties, const Standard_Real Eps) ;
};

/**
 *
 */
enum IFSelect_ReturnStatus {
 IFSelect_RetVoid,
 IFSelect_RetDone,
 IFSelect_RetError,
 IFSelect_RetFail,
 IFSelect_RetStop
};
 
%{#include <ShapeAnalysis_FreeBounds.hxx>%}
class ShapeAnalysis_FreeBounds
{
	public:
	ShapeAnalysis_FreeBounds(const TopoDS_Shape& shape,
		const Standard_Boolean splitclosed = Standard_False,
		const Standard_Boolean splitopen = Standard_True);
	const TopoDS_Compound& GetClosedWires() const;
	const TopoDS_Compound& GetOpenWires() const;
};

%{#include <GCPnts_UniformDeflection.hxx>%}
class GCPnts_UniformDeflection
{
	public:
	GCPnts_UniformDeflection();
	void Initialize(Adaptor3d_Curve& C,const Standard_Real Deflection,
		const Standard_Real U1,const Standard_Real U2,
		const Standard_Boolean WithControl = Standard_True) ;
	Standard_Integer NbPoints() const;
	Standard_Real Parameter(const Standard_Integer Index) const;
};

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
	BRepMesh_IncrementalMesh(const TopoDS_Shape& S,const Standard_Real D,
		const Standard_Boolean Relatif = Standard_False,
		const Standard_Real Ang = 0.5);
		
	void Perform();
//	void Update(const TopoDS_Shape& S) ;
	Standard_Boolean IsModified() const;
};

%{#include <GeomAPI_ProjectPointOnSurf.hxx>%}

class GeomAPI_ProjectPointOnSurf
{
	public:
	GeomAPI_ProjectPointOnSurf(const gp_Pnt& P,
		const Handle_Geom_Surface & Surface);
	void Init(const gp_Pnt& P,const Handle_Geom_Surface & surface);
	Standard_Integer NbPoints() const;	
	Quantity_Length LowerDistance() const;
	const gp_Pnt Point(const Standard_Integer Index) const;
	void LowerDistanceParameters(Quantity_Parameter& U,Quantity_Parameter& V) const;
	void Parameters(const Standard_Integer Index,Quantity_Parameter& U,Quantity_Parameter& V) const;
	gp_Pnt NearestPoint() const;
};

/**
 * BRepAlgo
 */
%{#include <BRepAlgo.hxx>%}
class BRepAlgo
{
	public:	
	static Standard_Boolean IsValid(const TopoDS_Shape& S);
	static Standard_Boolean IsTopologicallyValid(const TopoDS_Shape& S);
};

%insert(swiglisp)
%{
(cffi:defcfun ("_wrap_new_BRepOffsetAPI_MakeThickSolid__SWIG_7" _wrap_new_BRepOffsetAPI_MakeThickSolid__SWIG_7) :pointer
  (S :pointer)
  (ClosingFaces :pointer)
  (Offset :double)
  (Tol :double))
%}

%{
EXPORT TopoDS_Shape *_wrap_TopoDS_Shape_copy_reference(TopoDS_Shape *self){
	  TopoDS_Shape *copy = new TopoDS_Shape();
          *copy=*self;
	  return copy;
	}
#include <TopoDS.hxx>
#include <TopTools_ListOfShape.hxx>
#include <Standard_Handle.hxx>
#include <TopExp_Explorer.hxx>
#include <Geom_Surface.hxx>
#include <Geom_Plane.hxx>
#include <BRep_Tool.hxx>
EXPORT TopTools_ListOfShape * _wrap_get_face_to_remove(TopoDS_Shape *sPtr) {
	TopExp_Explorer explorer;
	TopoDS_Face face;
	Handle(Geom_Surface) surface;
	Standard_Real zMax = -1.0;
	TopoDS_Face *faceToRemove = new TopoDS_Face();

	for (TopExp_Explorer aFaceExplorer(*sPtr, TopAbs_FACE); aFaceExplorer.More(); aFaceExplorer.Next()) {
		TopoDS_Face face = TopoDS::Face(aFaceExplorer.Current());
		// Check if <aFace> is the top face of the bottle's neck 
		Handle(Geom_Surface) surface = BRep_Tool::Surface(face);
		if (surface->DynamicType() == STANDARD_TYPE(Geom_Plane)) {
			Handle(Geom_Plane) aPlane = Handle(Geom_Plane)::DownCast(surface);
			gp_Pnt aPnt = aPlane->Location();
			Standard_Real aZ = aPnt.Z();
			if (aZ > zMax) {
				zMax = aZ;
				*faceToRemove = face;
			}
		}
	}
	TopTools_ListOfShape * facesToRemovePtr = new TopTools_ListOfShape();
	facesToRemovePtr->Append(*faceToRemove);
	return facesToRemovePtr;
}

EXPORT TopoDS_Shape * _wrap_create_threads(TopoDS_Shape *myBody, gp_Ax2 *neckAx2, Standard_Real myNeckRadius, Standard_Real myNeckHeight) {
	// Threading : Create Surfaces
	Handle(Geom_CylindricalSurface) aCyl1 = new Geom_CylindricalSurface(*neckAx2, myNeckRadius * 0.99);
	Handle(Geom_CylindricalSurface) aCyl2 = new Geom_CylindricalSurface(*neckAx2, myNeckRadius * 1.05);

	// Threading : Define 2D Curves
	gp_Pnt2d aPnt(2. * M_PI, myNeckHeight / 2.);
	gp_Dir2d aDir(2. * M_PI, myNeckHeight / 4.);
	gp_Ax2d anAx2d(aPnt, aDir);

	Standard_Real aMajor = 2. * M_PI;
	Standard_Real aMinor = myNeckHeight / 10;

	Handle(Geom2d_Ellipse) anEllipse1 = new Geom2d_Ellipse(anAx2d, aMajor, aMinor);
	Handle(Geom2d_Ellipse) anEllipse2 = new Geom2d_Ellipse(anAx2d, aMajor, aMinor / 4);
	Handle(Geom2d_TrimmedCurve) anArc1 = new Geom2d_TrimmedCurve(anEllipse1, 0, M_PI);
	Handle(Geom2d_TrimmedCurve) anArc2 = new Geom2d_TrimmedCurve(anEllipse2, 0, M_PI);
	gp_Pnt2d anEllipsePnt1 = anEllipse1->Value(0);
	gp_Pnt2d anEllipsePnt2 = anEllipse1->Value(M_PI);

	Handle(Geom2d_TrimmedCurve) aSegment = GCE2d_MakeSegment(anEllipsePnt1, anEllipsePnt2);
	// Threading : Build Edges and Wires
	TopoDS_Edge anEdge1OnSurf1 = BRepBuilderAPI_MakeEdge(anArc1, aCyl1);
	TopoDS_Edge anEdge2OnSurf1 = BRepBuilderAPI_MakeEdge(aSegment, aCyl1);
	TopoDS_Edge anEdge1OnSurf2 = BRepBuilderAPI_MakeEdge(anArc2, aCyl2);
	TopoDS_Edge anEdge2OnSurf2 = BRepBuilderAPI_MakeEdge(aSegment, aCyl2);
	TopoDS_Wire threadingWire1 = BRepBuilderAPI_MakeWire(anEdge1OnSurf1, anEdge2OnSurf1);
	TopoDS_Wire threadingWire2 = BRepBuilderAPI_MakeWire(anEdge1OnSurf2, anEdge2OnSurf2);
	BRepLib::BuildCurves3d(threadingWire1);
	BRepLib::BuildCurves3d(threadingWire2);

	// Create Threading 
	BRepOffsetAPI_ThruSections aTool(Standard_True);
	aTool.AddWire(threadingWire1);
	aTool.AddWire(threadingWire2);
	aTool.CheckCompatibility(Standard_False);

	TopoDS_Shape myThreading = aTool.Shape();

	// Building the Resulting Compound 
	TopoDS_Compound *aRes = new TopoDS_Compound();
	BRep_Builder aBuilder;
	aBuilder.MakeCompound(*aRes);
	aBuilder.Add(*aRes, *myBody);
	aBuilder.Add(*aRes, myThreading);

	return aRes;
}
%}
