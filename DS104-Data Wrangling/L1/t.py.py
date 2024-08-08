import pandas as pd
energy=pd.read_excel("C:/Users/Lenovo/Desktop/Data-Science-Program/DATASETS/energy.xlsx")
energy2= energy.set_index().T