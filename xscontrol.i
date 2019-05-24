
/**
 * XSControl_Reader
 */
 %{
#include <STEPControl_Reader.hxx>
#include <IGESControl_Reader.hxx>
#include <XSControl_WorkSession.hxx>
#include <XSControl_TransferReader.hxx>
#include <StepRepr_RepresentationItem.hxx>
#include <TCollection_HAsciiString.hxx>
#include <IGESData_IGESEntity.hxx>
#include <TransferBRep.hxx>
#include <Transfer_Binder.hxx>
#include <Transfer_TransientProcess.hxx>
#include <Interface_InterfaceModel.hxx>
#include <iostream>
 %}
class XSControl_Reader
{
	XSControl_Reader()=0;
	public:
	IFSelect_ReturnStatus ReadFile(const Standard_CString filename);
	//IFSelect_ReturnStatus ReadFile(jbyte filename[]);
	Standard_Integer TransferRoots() ;
	void ClearShapes();
	Standard_Integer NbRootsForTransfer();
	TopoDS_Shape OneShape() const;
};

class STEPControl_Reader: public XSControl_Reader
{
	public:
	STEPControl_Reader();
};

%extend STEPControl_Reader
{
//dirty quick implementation of label step reading
//find how to generalize this to IGES
	const char * getLabel(TopoDS_Shape * theShape)
	{
		const Handle(XSControl_WorkSession)& theSession = self->WS();
		const Handle(XSControl_TransferReader)& aReader = theSession->TransferReader();
		Handle(Standard_Transient) anEntity = aReader->EntityFromShapeResult(*theShape, 1);
		if (anEntity.IsNull()) {
			// as just mapped
			anEntity = aReader->EntityFromShapeResult (*theShape,-1);
		}

		if (anEntity.IsNull()) {
			// as anything
			anEntity = aReader->EntityFromShapeResult (*theShape,4);
		}

		if (anEntity.IsNull()) {
			cout<<"Warning: XSInterface_STEPReader::ReadAttributes() entity not found"<<endl;
			return NULL;
		}
		else 
		{
			Handle(StepRepr_RepresentationItem) aReprItem;
			aReprItem = Handle(StepRepr_RepresentationItem)::DownCast(anEntity);

			if (aReprItem.IsNull()) {
				cout<<"Error: STEPReader::ReadAttributes(): StepRepr_RepresentationItem Is NULL"<<endl;
				return NULL;
			}
			else 
				return aReprItem->Name()->ToCString();
		}
	}
};

class IGESControl_Reader: public XSControl_Reader
{
	public:
	IGESControl_Reader();
};

%extend IGESControl_Reader 
{
	//dirty quick implementation of label iges reading 
	const char * getLabel(TopoDS_Shape theShape) 
	{
		const Handle(XSControl_WorkSession)& theSession = self->WS();
		const Handle(Interface_InterfaceModel)& theModel = theSession->Model();
		const Handle(XSControl_TransferReader)& aReader = theSession->TransferReader();
		const Handle(Transfer_TransientProcess)& tp = aReader->TransientProcess();
		Standard_Integer nb = theModel->NbEntities(); 
		for(Standard_Integer i=1; i<=nb; i++) 
		{
			Handle(IGESData_IGESEntity) ent = Handle(IGESData_IGESEntity)::DownCast(theModel->Value(i));

			if (ent.IsNull())
				continue;

			Handle(Transfer_Binder) binder = tp->Find(ent); 

			if (binder.IsNull())
				continue;
			TopoDS_Shape oneShape = TransferBRep::ShapeResult(binder);
			if (oneShape.IsNull())
				continue;
			if (oneShape.IsEqual(theShape))
			{
				if (ent->HasName())
					return ent->NameValue()->String().ToCString();
				else
					return NULL; 
			}
		}
		return NULL; 
	}

	//get shape for label 
	TopoDS_Shape getShape(char* shapeName)
	{
		const TCollection_AsciiString ascShapeName(shapeName);
		const Handle(XSControl_WorkSession)& theSession = self->WS();
		const Handle(Interface_InterfaceModel)& theModel = theSession->Model();
		const Handle(XSControl_TransferReader)& aReader = theSession->TransferReader();
		const Handle(Transfer_TransientProcess)& tp = aReader->TransientProcess();
		Standard_Integer nb = theModel->NbEntities();
		TopoDS_Shape retShape; 
		for(Standard_Integer i=1; i<=nb; i++)
		{
			Handle(IGESData_IGESEntity) ent = Handle(IGESData_IGESEntity)::DownCast(theModel->Value(i));

			if (ent.IsNull())
				continue;
			Handle(Transfer_Binder) binder = tp->Find(ent);

			if (binder.IsNull())
				continue;
			TopoDS_Shape oneShape = TransferBRep::ShapeResult(binder);

			if (oneShape.IsNull())
				continue;

			if (ent->HasName() && ent->NameValue()->String().IsEqual(ascShapeName))
				retShape = oneShape;
		}
		return retShape; 
	}

	//dump all labels 
	void dumpLabels()
	{
		const Handle(XSControl_WorkSession)& theSession = self->WS();
		const Handle(Interface_InterfaceModel)& theModel = theSession->Model();
		Standard_Integer nb = theModel->NbEntities();
		for(Standard_Integer i=1; i<=nb; i++)
		{
			Handle(IGESData_IGESEntity) ent = Handle(IGESData_IGESEntity)::DownCast(theModel->Value(i));
			if (ent.IsNull()) continue;
			if (ent->HasName())
			{
				std::cout << ent->NameValue()->String().ToCString() << std::endl;
			}
		}
	}
};

/**
 * STEPControl_Writer
 * Usage:
 *    STEPControl_Writer aWriter = new STEPControl_Writer()
 *    aWriter.transfer(shape, STEPControl_StepModelType.AsIs)
 *    aWriter.write("foo.stp")
 */
 %{
#include <STEPControl_Writer.hxx>
 %}
class STEPControl_Writer
{
	public:
	STEPControl_Writer();
	IFSelect_ReturnStatus Write(const Standard_CString filename);
	IFSelect_ReturnStatus Transfer(TopoDS_Shape theShape, STEPControl_StepModelType mode);
	/*	Handle_StepData_StepModel Model(const Standard_Boolean newone); */
};


%rename(AsIs) STEPControl_AsIs;
%rename(ManifoldSolidBrep) STEPControl_ManifoldSolidBrep;
%rename(BrepWithVoids) STEPControl_BrepWithVoids;
%rename(FacetedBrep) STEPControl_FacetedBrep;
%rename(FacetedBrepAndBrepWithVoids) STEPControl_FacetedBrepAndBrepWithVoids;
%rename(ShellBasedSurfaceModel) STEPControl_ShellBasedSurfaceModel;
%rename(GeometricCurveSet) STEPControl_GeometricCurveSet;
%rename(Hybrid) STEPControl_Hybrid;
enum STEPControl_StepModelType {
 STEPControl_AsIs,
 STEPControl_ManifoldSolidBrep,
 STEPControl_BrepWithVoids,
 STEPControl_FacetedBrep,
 STEPControl_FacetedBrepAndBrepWithVoids,
 STEPControl_ShellBasedSurfaceModel,
 STEPControl_GeometricCurveSet,
 STEPControl_Hybrid
};

/**
 * IGESControl_Writer
 * Usage:
 *   new IGESControl_Controller().init()
 *   IGESControl_Writer aWriter = new IGESControl_Writer("MM", 0)
 *   aWriter.addShape(shape)
 *   aWriter.computeModel()
 *   aWriter.write("foo.igs")
 */
 %{
#include <IGESControl_Writer.hxx>
 %}
class IGESControl_Writer
{
	public:
	IGESControl_Writer();
	IGESControl_Writer(const Standard_CString unit, const Standard_Integer modecr = 0);
	Standard_Boolean Write(const Standard_CString filename);
	Standard_Boolean AddShape(const TopoDS_Shape& sh);
	void ComputeModel();
};

 %{
#include <IGESControl_Controller.hxx>
 %}
class IGESControl_Controller
{
	public:
	IGESControl_Controller();
	void Init();
};


