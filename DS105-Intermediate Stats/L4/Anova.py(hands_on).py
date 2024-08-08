#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import scipy
from scipy import stats
from statsmodels.stats.multicomp import pairwise_tukeyhsd
from statsmodels.stats.multicomp import MultiComparison
import seaborn as sns


# In[2]:


avocados = pd.read_csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/avocados.csv")


# In[17]:


avocados.head()


# # Remove missing data

# In[4]:


avocados.dropna(inplace=True)


# ## Recode

# In[24]:


def recode(series):
    if series == "Orlando":
        return 0
    if series == "PhoenixTucson":
        return 1
    if series == "Indianapolis":
        return 2
    
avocados['OPI'] = avocados['region'].apply(recode)


# In[25]:


sns.distplot(avocados['AveragePrice'])


# In[26]:


avocados['AveragePriceSQRT']=np.sqrt(avocados['AveragePrice'])


# In[29]:


sns.displot(avocados['AveragePriceSQRT'])


# ### Look about the same, keep it

# ## TEST FOR HOMOGENEITY OF VARIANCE

# In[35]:


scipy.stats.bartlett(avocados['AveragePriceSQRT'], avocados['OPI'])


# In[36]:


scipy.stats.fligner(avocados['AveragePriceSQRT'], avocados['OPI'])


# In[38]:


avocados.OPI.value_count()


# In[41]:


stats.f_oneway(avocados['AveragePriceSQRT'][avocados['OPI']=='Orlando'],
                    avocados['AveragePriceSQRT'][avocados['OPI']=='PhoenixTucson'],
                    avocados['AveragePriceSQRT'][avocados['OPI']=='Indianapolis'])


# In[44]:


postHoc = MultiComparison(avocados['AveragePriceSQRT'], avocados['OPI'])
postHocResults = postHoc.tukeyhsd()
print(postHocResults)


# In[45]:


avocados.groupby('OPI').mean()


# ## There is not a big diference in the price with in these three citites 

# In[ ]:




