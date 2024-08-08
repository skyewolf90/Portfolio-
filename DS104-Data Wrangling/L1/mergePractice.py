import pandas as pd
PlaneFeatures=pd.read_excel("C:/Users/Lenovo/Desktop/Data-Science-Program/DATASETS/PlaneFeatures.xlsx")
PlaneFeatures.head()
PlaneCandidate=pd.read_excel("C:/Users/Lenovo/Desktop/Data-Science-Program/DATASETS/PlaneCandidates.xlsx")
PlaneFeatures.head()
spyPlanes=pd.merge(PlaneFeatures,PlaneCandidate,on='adshex')
spyPlanes.head()