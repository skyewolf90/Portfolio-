import pandas as pd
PlaneFeatures2=pd.read_excel("C:/Users/Lenovo/Desktop/Data-Science-Program/DATASETS/PlaneFeatures.xlsx")
PlaneCandidate2=pd.read_excel("C:/Users/Lenovo/Desktop/Data-Science-Program/DATASETS/PlaneCandidates.xlsx")
spyPlanes=pd.merge(PlaneFeatures,PlaneCandidate)