
%{#include "GeomLProp_SLProps.hxx"%}

class GeomLProp_SLProps
{

	GeomLProp_SLProps(const Standard_Integer degree, const Standard_Real resolution);
	void SetParameters(const Standard_Real u, const Standard_Real v) ;
	const gp_Pnt& Value() const;
	const gp_Vec& D1U() ;
	const gp_Vec& D1V() ;
	const gp_Vec& D2U() ;
	const gp_Vec& D2V() ;
	const gp_Vec& DUV() ;
	Standard_Boolean IsTangentUDefined() ;
	void TangentU(gp_Dir& D) ;
	Standard_Boolean IsTangentVDefined() ;
	void TangentV(gp_Dir& D) ;
	Standard_Boolean IsNormalDefined() ;
	Standard_Boolean IsCurvatureDefined() ;
	Standard_Boolean IsUmbilic() ;
	Standard_Real MeanCurvature() ;
	Standard_Real GaussianCurvature() ;
	void SetSurface(const Handle_Geom_Surface & S) ;
};

%extend GeomLProp_SLProps
{
	void normal(double normal[3])
	{
		if(!self->IsNormalDefined())
		{
			normal[0]=0;
			normal[1]=0;
			normal[2]=0;
		}
		else
		{
			const gp_Dir & d=self->Normal();
			normal[0]=d.X();
			normal[1]=d.Y();
			normal[2]=d.Z();
		}
	}
	
	void normalArray(double* uvNodes,double* normalArray,int numNodes)
	{
		for(int i=0;i<numNodes;i++)
		{
			self->SetParameters(uvNodes[2*i],uvNodes[2*i+1]);
			
			if(!self->IsNormalDefined())
			{
				normalArray[3*i]=0;
				normalArray[3*i+1]=0;
				normalArray[3*i+2]=0;
			}
			else
			{
				const gp_Dir & d=self->Normal();
				
				normalArray[3*i]=d.X();
				normalArray[3*i+1]=d.Y();
				normalArray[3*i+2]=d.Z();
			}
		}
	}

	Standard_Real minCurvature()
	{
		if (!self->IsCurvatureDefined())
			return sqrt(-1.0);
		else
			return self->MinCurvature ();
	}

	Standard_Real maxCurvature()
	{
		if (!self->IsCurvatureDefined())
			return sqrt(-1.0);
		else
			return self->MaxCurvature ();
	}
	
	void curvatureDirection(double jmax[3], double jmin[3])
	{
		gp_Dir max, min;
		self->CurvatureDirections(max, min);
		jmax[0]=max.X();
		jmax[1]=max.Y();
		jmax[2]=max.Z();
		jmin[0]=min.X();
		jmin[1]=min.Y();
		jmin[2]=min.Z();
	}
};
