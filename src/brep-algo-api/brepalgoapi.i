
%{
#include <BRepAlgoAPI_Algo.hxx>
#include <BRepAlgoAPI_BuilderAlgo.hxx>
#include <BRepAlgoAPI_BooleanOperation.hxx>
#include <BRepAlgoAPI_Fuse.hxx>
#include <BRepAlgoAPI_Common.hxx>
#include <BRepAlgoAPI_Cut.hxx>
#include <BRepAlgoAPI_Section.hxx>
     %}

%nodefaultdtor BRepAlgoAPI_Algo;
class BRepAlgoAPI_Algo  : public BRepBuilderAPI_MakeShape
{
 public:
  Standard_Integer ErrorStatus() const;
  Standard_Integer WarningStatus() const;
  const BOPCol_BaseAllocator& Allocator() const;
  void SetRunParallel (const Standard_Boolean theFlag);
  void SetProgressIndicator (const Handle_Message_ProgressIndicator& theObj);
  const TopoDS_Shape& Shape();
};

class BRepAlgoAPI_BuilderAlgo  : public BRepAlgoAPI_Algo
{
 public:
  BRepAlgoAPI_BuilderAlgo();
  BRepAlgoAPI_BuilderAlgo(const BOPAlgo_PaveFiller& thePF);
  ~BRepAlgoAPI_BuilderAlgo();
  void SetFuzzyValue (const Standard_Real theFuzz);
  void SetNonDestructive(const Standard_Boolean theFlag);
  Standard_Boolean NonDestructive() const;
  void SetArguments (const TopTools_ListOfShape& theLS);
  const TopTools_ListOfShape& Arguments() const;
  void Build();
  const TopTools_ListOfShape& Modified (const TopoDS_Shape& aS);
  Standard_Boolean IsDeleted (const TopoDS_Shape& aS);
  const TopTools_ListOfShape& Generated (const TopoDS_Shape& S);
  Standard_Boolean HasModified() const;
  Standard_Boolean HasGenerated() const;
  Standard_Boolean HasDeleted() const;
};  

class BRepAlgoAPI_BooleanOperation  : public BRepAlgoAPI_BuilderAlgo
{
 public:
  void SetTools (const TopTools_ListOfShape& theLS);
  const TopTools_ListOfShape& Tools() const;
  void SetOperation (const BOPAlgo_Operation anOp);
  BOPAlgo_Operation Operation() const;
  Standard_Boolean BuilderCanWork() const;
  Standard_Boolean FuseEdges() const;
  void RefineEdges();
  const TopTools_ListOfShape& SectionEdges();
};

class BRepAlgoAPI_Fuse: public BRepAlgoAPI_BooleanOperation
{
 public:
  BRepAlgoAPI_Fuse();
  BRepAlgoAPI_Fuse(const BOPAlgo_PaveFiller& PF);
};

class BRepAlgoAPI_Common: public BRepAlgoAPI_BooleanOperation
{
 public:
  BRepAlgoAPI_Common();
  BRepAlgoAPI_Common(const BOPAlgo_PaveFiller& PF);
};

class BRepAlgoAPI_Cut: public BRepAlgoAPI_BooleanOperation
{
 public:
  BRepAlgoAPI_Cut();
  BRepAlgoAPI_Cut(const BOPAlgo_PaveFiller& PF);
};

class BRepAlgoAPI_Section: public BRepAlgoAPI_BooleanOperation
{
 public:
  BRepAlgoAPI_Section();
  BRepAlgoAPI_Section(const BOPAlgo_PaveFiller& PF);
  void Approximation (const Standard_Boolean B);
};
