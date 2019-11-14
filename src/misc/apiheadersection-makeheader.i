
%{
#include <APIHeaderSection_MakeHeader.hxx>
#include <StepData_StepModel.hxx>
%}

class APIHeaderSection_MakeHeader{
  public:
  APIHeaderSection_MakeHeader(const Handle_StepData_StepModel& model);
  void SetName(const Handle_TCollection_HAsciiString& aName);
  void SetAuthorValue (const Standard_Integer num,const Handle_TCollection_HAsciiString& aAuthor);
  void SetOrganizationValue (const Standard_Integer num,const Handle_TCollection_HAsciiString& aOrganization);
  void SetOriginatingSystem(const Handle_TCollection_HAsciiString& aOriginatingSystem);
  void SetDescriptionValue(const Standard_Integer num,const Handle_TCollection_HAsciiString& description);
};
