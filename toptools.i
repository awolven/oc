
%{
#include <TopTools_HSequenceOfShape.hxx>
%}

class TopTools_HSequenceOfShape
{
	public:
	TopTools_HSequenceOfShape();
	Standard_Boolean IsEmpty () const;
	Standard_Integer Length () const;
	void Clear ();
	void Append (const TopoDS_Shape& anItem);
	void Prepend (const TopoDS_Shape& anItem);
	void Reverse ();
	void InsertBefore (const Standard_Integer anIndex, const TopoDS_Shape &anItem);
	void InsertAfter (const Standard_Integer anIndex, const TopoDS_Shape &anItem);
	void Exchange (const Standard_Integer anIndex, const Standard_Integer anOtherIndex);
	void SetValue (const Standard_Integer anIndex, const TopoDS_Shape& anItem);
	const TopoDS_Shape&	Value (const Standard_Integer anIndex) const;
	TopoDS_Shape& ChangeValue (const Standard_Integer anIndex);
	void Remove (const Standard_Integer anIndex);
	void Remove (const Standard_Integer fromIndex, const Standard_Integer toIndex);
	const TopTools_SequenceOfShape& Sequence () const ;
};
%{
#include <TopTools_ListOfShape.hxx>
%}
class TopTools_ListOfShape {
 public:
  TopTools_ListOfShape();
  TopoDS_Shape& Append(const TopoDS_Shape& item);
};
