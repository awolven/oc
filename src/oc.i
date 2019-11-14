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

%insert(swiglisp) %{
(cl:in-package #:oc)
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
(cffi:defcvar "signal_lisp_error" :pointer)
  
(cffi:defcallback signal-lisp-error :void ((message :string))
    (cl:error "~S" message))

(cl:defun init-occ ()
  (cl:setf *signal-lisp-error* (cffi:get-callback 'signal-lisp-error)))
     %}

%include "standard/standard.i";
%include "mmgt/mmgt-tshared.i";
%include "gp/gp.i";
%include "collections/tcol.i";
%include "top-abs/topabs.i";
%include "topods/topods.i";
%include "geom-abs/geomabs.i";
%include "top-tools/toptools.i";
%include "brep-builder/brep.i";
%include "misc/geomlprop_slprops.i";
%include "brep-tools/breptools.i";
%include "brep-builder-api/brepbuilderapi.i";
%include "brep-offset-api/brepoffsetapi.i";
%include "brep-prim-api/brepprimapi.i";
%include "brep-algo-api/brepalgoapi.i";
%include "poly/poly.i";
%include "geom2d/geom2d.i";
%include "geom/geom.i";
%include "brep-lib/breplib.i";
%include "brep-fillet-api/brepfilletapi.i";
%include "brep-check/brepcheck.i";
%include "shape-build/shapebuild.i";
%include "xscontrol/xscontrol.i";
%include "shape-fix/shapefix.i";
%include "misc/shapeanalysis.i";
%include "misc/apiheadersection-makeheader.i";
%include "misc/shapeupgrade.i";
%include "geom-api/geomapi.i";
%include "gc/gc.i";
%include "gce2d/gce2d.i";
%include "cpnts/adaptor2d.i"
#include "cpnts/adaptor3d.i"
%include "cpnts/cpnts.i";

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

