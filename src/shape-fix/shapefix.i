

%{
#include <ShapeFix_Wireframe.hxx>
#include <ShapeFix_Root.hxx>
#include <ShapeBuild_ReShape.hxx>
#include <Message_ProgressIndicator.hxx>
#include <ShapeFix_Shape.hxx>
#include <ShapeFix_Solid.hxx>
#include <ShapeFix_Shell.hxx>
#include <ShapeFix_Face.hxx>
#include <ShapeFix_Wire.hxx>
#include <ShapeFix_Edge.hxx>
#include <ShapeFix_EdgeProjAux.hxx>
#include <ShapeConstruct_ProjectCurveOnSurface.hxx>
#include <ShapeAnalysis_Surface.hxx>
%}

%{
#include <ShapeFix.hxx>
  %}

%rename(Message_ProgressIndicator) Handle_Message_ProgressIndicator;
%rename(ShapeExtend_BasicMsgRegistrator) Handle_ShapeExtend_BasicMsgRegistrator;
%rename(ShapeBuild_ReShape) Handle_ShapeBuild_ReShape;

%nodefaultdtor Handle_Message_ProgressIndicator;
class Handle_Message_ProgressIndicator {};
%nodefaultdtor Handle_ShapeAnalysis_Surface;
class Handle_ShapeAnalysis_Surface {};

%nodefaultdtor ShapeFix;
class ShapeFix
{
 public:
  static Standard_Boolean SameParameter (const TopoDS_Shape& shape, const Standard_Boolean enforce);
  static Standard_Boolean SameParameter (const TopoDS_Shape& shape, const Standard_Boolean enforce, const Standard_Real preci);
  static Standard_Boolean SameParameter (const TopoDS_Shape& shape, const Standard_Boolean enforce, const Standard_Real preci, const Handle_Message_ProgressIndicator& theProgress);
  static Standard_Boolean SameParameter (const TopoDS_Shape& shape, const Standard_Boolean enforce, const Standard_Real preci, const Handle_Message_ProgressIndicator& theProgress, const Handle_ShapeExtend_BasicMsgRegistrator& theMsgReg);
  
  static void EncodeRegularity (const TopoDS_Shape& shape, const Standard_Real tolang = 1.0e-10);
  
  static TopoDS_Shape RemoveSmallEdges (TopoDS_Shape& shape, const Standard_Real Tolerance, Handle_ShapeBuild_ReShape& context);
  
  static Standard_Boolean FixVertexPosition (TopoDS_Shape& theshape, const Standard_Real theTolerance, const Handle_ShapeBuild_ReShape& thecontext);
  
  static Standard_Real LeastEdgeSize (TopoDS_Shape& theshape);
};

%rename(ShapeFix_Root) Handle_ShapeFix_Root;
%rename(ShapeFix_EdgeProjAux) Handle_ShapeFix_EdgeProjAux;
%rename(ShapeFix_Edge) Handle_ShapeFix_Edge;
%rename(ShapeFix_Wire) Handle_ShapeFix_Wire;
%rename(ShapeFix_Face) Handle_ShapeFix_Face;
%rename(ShapeFix_FixSmallFace) Handle_ShapeFix_FixSmallFace;
%rename(ShapeFix_FixSmallSolid) Handle_ShapeFix_FixSmallSolid;
%rename(ShapeFix_WireVertex) Handle_ShapeFix_WireVertex;
%rename(ShapeFix_Wireframe) Handle_ShapeFix_Wireframe;
%rename(ShapeFix_FreeBounds) Handle_ShapeFix_FreeBounds;
%rename(ShapeFix_FaceConnect) Handle_ShapeFix_FaceConnect;
%rename(ShapeFix_Shell) Handle_ShapeFix_Shell;
%rename(ShapeFix_Solid) Handle_ShapeFix_Solid;
%rename(ShapeFix_ShapeTolerance) Handle_ShapeFix_ShapeTolerance;
%rename(ShapeFix_Shape) Handle_ShapeFix_Shape;
%rename(ShapeFix_EdgeConnect) Handle_ShapeFix_EdgeConnect;
%rename(ShapeFix_ComposeShell) Handle_ShapeFix_ComposeShell;
%rename(ShapeFix_SplitCommonVertex) Handle_ShapeFix_SplitCommonVertex;
%rename(ShapeFix_WireSegment) Handle_ShapeFix_WireSegment;
%rename(ShapeFix_IntersectionTool) Handle_ShapeFix_IntersectionTool;
%rename(ShapeFix_SplitTool) Handle_ShapeFix_SplitTool;

%nodefaultdtor Handle_ShapeFix_Root;
class Handle_ShapeFix_Root  : public Handle_MMgt_TShared
{
	Handle_ShapeFix_Root()=0;
};

%extend Handle_ShapeFix_Root
{
  void Set (const Handle_ShapeFix_Root& Root) {
    (*self)->Set(Root);
  }
  void SetContext (const Handle_ShapeBuild_ReShape& context) {
    (*self)->SetContext(context);
  }
  Handle_ShapeBuild_ReShape Context() {
    return (*self)->Context();
  }
  void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator& msgreg) {
    (*self)->SetMsgRegistrator(msgreg);
  }
  Handle_ShapeExtend_BasicMsgRegistrator MsgRegistrator() {
    return (*self)->MsgRegistrator();
  }
  void SetPrecision (const Standard_Real preci) {
    (*self)->SetPrecision(preci);
  }
  Standard_Real Precision() {
    return (*self)->Precision();
  }
  void SetMinTolerance (const Standard_Real mintol) {
    (*self)->SetMinTolerance(mintol);
  }
  Standard_Real MaxTolerance() {
    return (*self)->MaxTolerance();
  }
  Standard_Real LimitTolerance (const Standard_Real toler) {
    return (*self)->LimitTolerance(toler);
  }
  void SendMsg (const TopoDS_Shape& shape, const Message_Msg& message, const Message_Gravity gravity = Message_Info) {
    (*self)->SendMsg(shape, message, gravity);
  }
  void SendMsg (const Message_Msg& message, const Message_Gravity gravity = Message_Info) {
    (*self)->SendMsg(message, gravity);
  }
  void SendWarning (const TopoDS_Shape& shape, const Message_Msg& message) {
    (*self)->SendWarning(shape, message);
  }
  void SendWarning (const Message_Msg& message) {
    (*self)->SendWarning(message);
  }
  void SendFail (const TopoDS_Shape& shape, const Message_Msg& message) {
    (*self)->SendFail(shape, message);
  }
  void SendFail (const Message_Msg& message) {
    (*self)->SendFail(message);
  }
}

%nodefaultdtor Handle_ShapeFix_Shape;
class Handle_ShapeFix_Shape  : public Handle_ShapeFix_Root
{
};
%extend Handle_ShapeFix_Shape
{
  Handle_ShapeFix_Shape() {
    return new Handle_ShapeFix_Shape(new ShapeFix_Shape());
  }
  Handle_ShapeFix_Shape(const TopoDS_Shape& shape) {
    return new Handle_ShapeFix_Shape(new ShapeFix_Shape(shape));
  }
  void Init(const TopoDS_Shape& shape) {
    (*self)->Init(shape);
  }
    Standard_Boolean Perform () {
    return (*self)->Perform();
  }    
  Standard_Boolean Perform (const Handle_Message_ProgressIndicator& theProgress) {
    return (*self)->Perform(theProgress);
  }    
  TopoDS_Shape Shape() {
    return (*self)->Shape();
  }
  Handle_ShapeFix_Solid FixSolidTool() {
    return (*self)->FixSolidTool();
  }
  Handle_ShapeFix_Shell FixShellTool() {
    return (*self)->FixShellTool();
  }
  Handle_ShapeFix_Face FixFaceTool() {
    return (*self)->FixFaceTool();
  }
  Handle_ShapeFix_Wire FixWireTool() {
    return (*self)->FixWireTool();
  }
  Handle_ShapeFix_Edge FixEdgeTool() {
    return (*self)->FixEdgeTool();
  }
  Standard_Boolean Status (const ShapeExtend_Status status) {
    return (*self)->Status(status);
  }
}
%nodefaultdtor Handle_ShapeFix_EdgeProjAux;
class Handle_ShapeFix_EdgeProjAux  : public Handle_MMgt_TShared
{
  /* Handle_ShapeFix_EdgeProjAux()=0; */
};
%extend Handle_ShapeFix_EdgeProjAux
{
  Handle_ShapeFix_EdgeProjAux() {
    return new Handle_ShapeFix_EdgeProjAux(new ShapeFix_EdgeProjAux());
  }
  Handle_ShapeFix_EdgeProjAux(const TopoDS_Face& F, const TopoDS_Edge& E) {
    return new Handle_ShapeFix_EdgeProjAux(new ShapeFix_EdgeProjAux(F, E));
  }
  void Delete() {
    self->~Handle_ShapeFix_EdgeProjAux();
  }  
  void Init (const TopoDS_Face& F, const TopoDS_Edge& E) {
    (*self)->Init(F, E);
  }
  void Compute (const Standard_Real preci) {
    (*self)->Compute(preci);
  }
  Standard_Boolean IsFirstDone() {
    return (*self)->IsFirstDone();
  }
  Standard_Boolean IsLastDone() {
    return (*self)->IsLastDone();
  }
  Standard_Real FirstParam() {
    return (*self)->FirstParam();
  }
  Standard_Real LastParam() {
    return (*self)->LastParam();
  }
  Standard_Boolean IsIso (const Handle_Geom2d_Curve& C) {
    return (*self)->IsIso(C);
  }
}
%nodefaultdtor Handle_ShapeConstruct_ProjectCurveOnSurface;
class Handle_ShapeConstruct_ProjectCurveOnSurface {};

%nodefaultdtor Handle_ShapeFix_Edge;
class Handle_ShapeFix_Edge  : public Handle_MMgt_TShared
{
  /* Handle_ShapeFix_Edge()=0; */
};
%extend Handle_ShapeFix_Edge {
  Handle_ShapeFix_Edge() {
    return new Handle_ShapeFix_Edge(new ShapeFix_Edge());
  }
  void Delete() {
    self->~Handle_ShapeFix_Edge();
  }  
  Handle_ShapeConstruct_ProjectCurveOnSurface Projector() {
    return (*self)->Projector();
  }
  Standard_Boolean FixRemovePCurve (const TopoDS_Edge& edge, const TopoDS_Face& face) {
    return (*self)->FixRemovePCurve(edge, face);
  }
  Standard_Boolean FixRemovePCurve (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location) {
    return (*self)->FixRemovePCurve(edge, surface, location);
  }
  Standard_Boolean FixRemoveCurve3d (const TopoDS_Edge& edge) {
    return (*self)->FixRemoveCurve3d(edge);
  }
  Standard_Boolean FixAddPCurve (const TopoDS_Edge& edge, const TopoDS_Face& face, const Standard_Boolean isSeam, const Standard_Real prec = 0.0) {
    return (*self)->FixAddPCurve(edge, face, isSeam, prec);
  }
  Standard_Boolean FixAddPCurve (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location, const Standard_Boolean isSeam, const Standard_Real prec = 0.0) {
    return (*self)->FixAddPCurve(edge, surface, location, isSeam, prec);
  }
  Standard_Boolean FixAddPCurve (const TopoDS_Edge& edge, const TopoDS_Face& face, const Standard_Boolean isSeam, const Handle_ShapeAnalysis_Surface& surfana, const Standard_Real prec = 0.0) {
    return (*self)->FixAddPCurve(edge, face, isSeam, surfana, prec);
  }
  Standard_Boolean FixAddPCurve (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location, const Standard_Boolean isSeam, const Handle_ShapeAnalysis_Surface& surfana, const Standard_Real prec = 0.0) {
    return (*self)->FixAddPCurve(edge, surface, location, isSeam, surfana, prec);
  }
  Standard_Boolean FixAddCurve3d (const TopoDS_Edge& edge) {
    return (*self)->FixAddCurve3d(edge);
  }
  Standard_Boolean FixVertexTolerance (const TopoDS_Edge& edge, const TopoDS_Face& face) {
    return (*self)->FixVertexTolerance(edge, face);
  }
  Standard_Boolean FixVertexTolerance (const TopoDS_Edge& edge) {
    return (*self)->FixVertexTolerance(edge);
  }
  Standard_Boolean FixReversed2d (const TopoDS_Edge& edge, const TopoDS_Face& face) {
    return (*self)->FixReversed2d(edge, face);
  }
  Standard_Boolean FixReversed2d (const TopoDS_Edge& edge, const Handle_Geom_Surface& surface, const TopLoc_Location& location) {
    return (*self)->FixReversed2d(edge, surface, location);
  }
  Standard_Boolean FixSameParameter (const TopoDS_Edge& edge, const Standard_Real tolerance = 0.0) {
    return (*self)->FixSameParameter(edge, tolerance);
  }
  Standard_Boolean FixSameParameter (const TopoDS_Edge& edge, const TopoDS_Face& face, const Standard_Real tolerance = 0.0) {
    return (*self)->FixSameParameter(edge, face, tolerance);
  }
  Standard_Boolean Status (const ShapeExtend_Status status) {
    return (*self)->Status(status);
  }
  void SetContext (const Handle_ShapeBuild_ReShape& context) {
    (*self)->SetContext(context);
  }
  Handle_ShapeBuild_ReShape Context() {
    return (*self)->Context();
  }
}
%nodefaultdtor Handle_ShapeFix_Wire;
class Handle_ShapeFix_Wire  : public Handle_ShapeFix_Root
{
};
%extend Handle_ShapeFix_Wire {
  Handle_ShapeFix_Wire() {
    return new Handle_ShapeFix_Wire(new ShapeFix_Wire());
  }
  Handle_ShapeFix_Wire(const TopoDS_Wire& wire, const TopoDS_Face& face, const Standard_Real prec) {
    return new Handle_ShapeFix_Wire(new ShapeFix_Wire(wire, face, prec));
  }
  void Delete() {
    self->~Handle_ShapeFix_Wire();
  }  
  void ClearModes() {
    (*self)->ClearModes();
  }
  void ClearStatuses() {
    (*self)->ClearStatuses();
  }
  void Init (const TopoDS_Wire& wire, const TopoDS_Face& face, const Standard_Real prec) {
    (*self)->Init(wire, face, prec);
  }
  void Init (const Handle_ShapeAnalysis_Wire& saw) {
    (*self)->Init(saw);
  }
  void Load (const TopoDS_Wire& wire) {
    (*self)->Load(wire);
  }
  void Load (const Handle_ShapeExtend_WireData& sbwd) {
    (*self)->Load(sbwd);
  }
  /*
  void SetFace (const TopoDS_Face& face) {
    (*self)->SetFace(face);
  }
  void SetSurface (const Handle_Geom_Surface& surf) {
    (*self)->SetSurface(surf);
  }
  void SetSurface (const Handle_Geom_Surface& surf, const TopLoc_Location& loc) {
    (*self)->SetSurface(surf, loc);
  }
  */
  void SetMaxTailAngle (const Standard_Real theMaxTailAngle) {
    (*self)->SetMaxTailAngle(theMaxTailAngle);
  }
  void SetMaxTailWidth (const Standard_Real theMaxTailWidth) {
    (*self)->SetMaxTailWidth(theMaxTailWidth);
  }
  /*
  Standard_Boolean IsLoaded() {
    return (*self)->IsLoaded();
  }
  Standard_Boolean IsReady() {
    return (*self)->IsReady();
    }
*/
  Standard_Integer NbEdges() {
    return (*self)->NbEdges();
  }

  TopoDS_Wire Wire() {
    return (*self)->Wire();
  }
  TopoDS_Wire WireAPIMake() {
    return (*self)->WireAPIMake();
  }

  Handle_ShapeAnalysis_Wire Analyzer() {
    return (*self)->Analyzer();
  }
  /*
  Handle_ShapeExtend_WireData& WireData() {
    return (*self)->WireData();
  }
  TopoDS_Face& Face() {
    return (*self)->Face();
  }
  Standard_Boolean GetTopologyMode() {
    return *((*self)->ModifyTopologyMode());
  }
  void SetTopologyMode(Standard_Boolean mode) {
    *((*self)->ModifyTopologyMode()) = mode;
  }
  Standard_Boolean GetGeometryMode() {
    return *((*self)->ModifyGeometryMode());
  }
  void SetGeometryMode(Standard_Boolean mode) {
    *((*self)->ModifyGeometryMode()) = mode;
  }
  Standard_Integer GetRemoveLoopMode() {
    return *((*self)->ModifyRemoveLoopMode());
  }
  void SetRemoveLoopMode(Standard_Integer mode) {
    *((*self)->ModifyRemoveLoopMode()) = mode;
  }
  Standard_Boolean GetClosedWireMode() {
    return *((*self)->ClosedWireMode());
  }
  void SetClosedWireMode(Standard_Boolean mode) {
    *((*self)->ClosedWireMode()) = mode;
  }
  Standard_Boolean GetPreferencePCurveMode() {
    return *((*self)->PreferencePCurveMode());
  }
  void SetPreferencePCurveMode(Standard_Boolean mode) {
    *((*self)->PreferencePCurveMode()) = mode;
  }
  Standard_Boolean GetFixGapsByRangesMode() {
    return *((*self)->FixGapsByRangesMode());
  }
  void SetFixGapsByRangesMode(Standard_Boolean mode) {
    *((*self)->FixGapsByRangesMode()) = mode;
  }
  Standard_Integer GetFixReorderMode() {
    return *((*self)->FixReorderMode());
  }
  void SetFixReorderMode(Standard_Integer mode) {
    *((*self)->FixReorderMode()) = mode;
  }
  Standard_Integer GetFixSmallMode() {
    return *((*self)->FixSmallMode());
  }
  void SetFixSmallMode(Standard_Integer mode) {
    *((*self)->FixSmallMode()) = mode;
  }  
  Standard_Integer GetFixConnectedMode() {
    return *((*self)->FixConnectedMode());
  }
  void SetFixConnectedMode(Standard_Integer mode) {
    *((*self)->FixConnectedMode()) = mode;
  }
  Standard_Integer GetFixEdgeCurvesMode() {
    return *((*self)->FixEdgeCurvesMode());
  }
  void SetFixEdgeCurvesMode(Standard_Integer mode) {
    *((*self)->FixEdgeCurvesMode()) = mode;
  }
  Standard_Integer GetFixDegeneratedMode() {
    return *((*self)->FixDegeneratedMode());
  }
  void SetFixDegeneratedMode(Standard_Integer mode) {
    *((*self)->FixDegeneratedMode()) = mode;
  }
  Standard_Integer GetFixSelfIntersectionMode() {
    return *((*self)->FixSelfIntersectionMode());
  }
  void SetFixSelfIntersectionMode(Standard_Integer mode) {
    *((*self)->FixSelfIntersectionMode()) = mode;
  }
  Standard_Integer GetFixLackingMode() {
    return *((*self)->FixLackingMode());
  }
  void SetFixLackingMode(Standard_Integer mode) {
    *((*self)->FixLackingMode()) = mode;
  }
  Standard_Integer GetFixGaps3dMode() {
    return *((*self)->FixGaps3dMode());
  }
  void SetFixGaps3dMode(Standard_Integer mode) {
    *((*self)->FixGaps3dMode()) = mode;
  }
  Standard_Integer GetFixGaps2dMode() {
    return *((*self)->FixGaps2dMode());
  }
  void SetFixGaps2dMode(Standard_Integer mode) {
    *((*self)->FixGaps2dMode()) = mode;
  }
  Standard_Integer GetFixReversed2dMode() {
    return *((*self)->FixReversed2dMode());
  }
  void SetFixReversed2dMode(Standard_Integer mode) {
    *((*self)->FixReversed2dMode()) = mode;
  }
  Standard_Integer GetFixRemovePCurveMode() {
    return *((*self)->FixRemovePCurveMode());
  }
  void SetFixRemovePCurveMode(Standard_Integer mode) {
    *((*self)->FixRemovePCurveMode()) = mode;
  }
  Standard_Integer GetFixAddPCurveMode() {
    return *((*self)->FixAddPCurveMode());
  }
  void SetFixAddPCurveMode(Standard_Integer mode) {
    *((*self)->FixAddPCurveMode()) = mode;
  }
  Standard_Integer GetFixRemoveCurve3dMode() {
    return *((*self)->FixRemoveCurve3dMode());
  }
  void SetFixRemoveCurve3dMode(Standard_Integer mode) {
    *((*self)->FixRemoveCurve3dMode()) = mode;
  }
  Standard_Integer GetFixAddCurve3dMode() {
    return *((*self)->FixAddCurve3dMode());
  }
  void SetFixAddCurve3dMode(Standard_Integer mode) {
    *((*self)->FixAddCurve3dMode()) = mode;
  }
  Standard_Integer GetFixSeamMode() {
    return *((*self)->FixSeamMode());
  }
  void SetFixSeamMode(Standard_Integer mode) {
    *((*self)->FixSeamMode()) = mode;
  }
  Standard_Integer GetFixShiftedMode() {
    return *((*self)->FixShiftedMode());
  }
  void SetFixShiftedMode(Standard_Integer mode) {
    *((*self)->FixShiftedMode()) = mode;
  }
  Standard_Integer GetFixSameParameterMode() {
    return *((*self)->FixSameParameterMode());
  }
  void SetFixSameParameterMode(Standard_Integer mode) {
    *((*self)->FixSameParameterMode()) = mode;
  }  
  Standard_Integer GetFixVertexToleranceMode() {
    return *((*self)->FixVertexToleranceMode());
  }
  void SetFixVertexToleranceMode(Standard_Integer mode) {
    *((*self)->FixVertexToleranceMode()) = mode;
  }
  Standard_Integer GetFixNotchedEdgesMode() {
    return *((*self)->FixNotchedEdgesMode());
  }
  void SetFixNotchedEdgesMode(Standard_Integer mode) {
    *((*self)->FixNotchedEdgesMode()) = mode;
  }
  Standard_Integer GetFixSelfIntersectingEdgeMode() {
    return *((*self)->FixSelfIntersectingEdgeMode());
  }
  void SetFixSelfIntersectingEdgeMode(Standard_Integer mode) {
    *((*self)->FixSelfIntersectingEdgeMode()) = mode;
  }  
  Standard_Integer GetFixIntersectingEdgesMode() {
    return *((*self)->FixIntersectingEdgesMode());
  }
  void SetFixIntersectingEdgesMode(Standard_Integer mode) {
    *((*self)->FixIntersectingEdgesMode()) = mode;
  }
  Standard_Integer GetFixNonAdjacentIntersectingEdgesMode() {
    return *((*self)->FixNonAdjacentIntersectingEdgesMode());
  }
  void SetFixNonAdjacentIntersectingEdgesMode(Standard_Integer mode) {
    *((*self)->FixNonAdjacentIntersectingEdgesMode()) = mode;
  }
  Standard_Integer GetFixTailMode() {
    return *((*self)->FixTailMode());
  }
  void SetFixTailMode(Standard_Integer mode) {
    *((*self)->FixTailMode()) = mode;
  }
  */
  Standard_Boolean Perform() {
    return (*self)->Perform();
  }
  Standard_Boolean FixReorder() {
    return (*self)->FixReorder();
  }
  Standard_Integer FixSmall (const Standard_Boolean lockvtx, const Standard_Real precsmall = 0.0) {
    return (*self)->FixSmall(lockvtx, precsmall);
  }
  Standard_Boolean FixConnected (const Standard_Real prec = -1.0) {
    return (*self)->FixConnected(prec);
  }
  Standard_Boolean FixEdgeCurves() {
    return (*self)->FixEdgeCurves();
  }
  Standard_Boolean FixDegenerated() {
    return (*self)->FixDegenerated();
  }
  Standard_Boolean FixSelfIntersection() {
    return (*self)->FixSelfIntersection();
  }
  Standard_Boolean FixLacking (const Standard_Boolean force = Standard_False) {
    return (*self)->FixLacking(force);
  }
  Standard_Boolean FixClosed (const Standard_Real prec = -1.0) {
    return (*self)->FixClosed(prec);
  }
  Standard_Boolean FixGaps3d() {
    return (*self)->FixGaps3d();
  }
  Standard_Boolean FixGaps2d() {
    return (*self)->FixGaps2d();
  }
  Standard_Boolean FixReorder (const ShapeAnalysis_WireOrder& wi) {
    return (*self)->FixReorder(wi);
  }
  Standard_Boolean FixSmall (const Standard_Integer num, const Standard_Boolean lockvtx, const Standard_Real precsmall) {
    return (*self)->FixSmall(num, lockvtx, precsmall);
  }
  Standard_Boolean FixConnected (const Standard_Integer num, const Standard_Real prec) {
    return (*self)->FixConnected(num, prec);
  }
  Standard_Boolean FixSeam (const Standard_Integer num) {
    return (*self)->FixSeam(num);
  }
  Standard_Boolean FixShifted() {
    return (*self)->FixShifted();
  }
  Standard_Boolean FixDegenerated (const Standard_Integer num) {
    return (*self)->FixDegenerated(num);
  }
  Standard_Boolean FixLacking (const Standard_Integer num, const Standard_Boolean force = Standard_False) {
    return (*self)->FixLacking(num, force);
  }
  Standard_Boolean FixNotchedEdges() {
    return (*self)->FixNotchedEdges();
  }
  Standard_Boolean FixGap3d (const Standard_Integer num, const Standard_Boolean convert = Standard_False) {
    return (*self)->FixGap3d(num, convert);
  }
  Standard_Boolean FixGap2d (const Standard_Integer num, const Standard_Boolean convert = Standard_False) {
    return (*self)->FixGap2d(num, convert);
  }
  Standard_Boolean FixTails() {
    return (*self)->FixTails();
  }
}

%nodefaultdtor Handle_ShapeFix_Wireframe;
class Handle_ShapeFix_Wireframe: public Handle_ShapeFix_Root {};

%extend Handle_ShapeFix_Wireframe
{
  Handle_ShapeFix_Wireframe(const TopoDS_Shape& shape) {
    return new Handle_ShapeFix_Wireframe(new ShapeFix_Wireframe);
  }
  void Delete() {
    self->~Handle_ShapeFix_Wireframe();
  }  
  Standard_Boolean FixWireGaps() {
    return (*self)->FixWireGaps();
  }
  Standard_Boolean FixSmallEdges() {
    return (*self)->FixSmallEdges();
  }
  void SetLimitAngle(const Standard_Real theLimitAngle) {
    (*self)->SetLimitAngle(theLimitAngle);
  }
  Standard_Real LimitAngle() {
    return (*self)->LimitAngle();
  }
  TopoDS_Shape Shape() {
    return (*self)->Shape();
  }
  /*
  void SetDropSmallEdges(Standard_Boolean b)
  {
    self->ModeDropSmallEdges()=b;
  }
  Standard_Boolean GetDropSmallEdges()
  {
    return (*self)->ModeDropSmallEdges()!=0;
  }
  */
}



