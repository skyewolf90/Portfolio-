#!/usr/bin/env python
# coding: utf-8

# ## Transforming data in Python Hands on

# In[2]:


import pandas as pd
import numpy as np
import seaborn as sns
from scipy import stats
from scipy.stats import boxcox


# In[3]:


Seattle_ParksnRec = pd.read_csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/Seattle_ParksnRec.csv")


# In[4]:


Seattle_ParksnRec.head()


# In[6]:


pd.options.display.max_columns = None
Seattle_ParksnRec.head()


# In[19]:


Seattle_ParksnRec.dropna(inplace=True)


# ## Winter trips

# In[20]:


sns.displot(Seattle_ParksnRec['# of trips Winter'])


# In[21]:


Seattle_ParksnRec['tripsWinterSQRT'] = np.sqrt(Seattle_ParksnRec['# of trips Winter'])


# In[23]:


sns.displot(Seattle_ParksnRec['tripsWinterSQRT'], kde = True)

## looks positivley skewed


# ## participants Winter

# In[28]:


Seattle_ParksnRec.dropna(inplace=True)


# In[32]:


sns.displot(Seattle_ParksnRec['# of participants Winter'], kde=True)

##positivly skewed


# In[33]:


Seattle_ParksnRec['participantsWinterSQRT'] = np.sqrt(Seattle_ParksnRec['# of participants Winter'])


# In[35]:


sns.displot(Seattle_ParksnRec['participantsWinterSQRT'], kde = True)
## look more normally distribution with a few lumpies


# ## trips Spring

# In[37]:


sns.displot(Seattle_ParksnRec['# of trips Spring'], kde=True)
#looks positivley skewed


# In[38]:


Seattle_ParksnRec['tripsSpringSQRT'] = np.sqrt(Seattle_ParksnRec['# of trips Spring'])


# In[40]:


sns.displot(Seattle_ParksnRec['tripsSpringSQRT'], kde = True)
## better , a bit more normal


# ## Spring participants

# In[43]:


sns.displot(Seattle_ParksnRec['# of participants Spring'], kde=True)
## positive skew


# In[46]:


Seattle_ParksnRec['participantsSpringSQRT'] = np.sqrt(Seattle_ParksnRec['# of participants Spring'])


# In[49]:


sns.displot(Seattle_ParksnRec['participantsWinterSQRT'], kde = True)
## better, normal


# ## Summer Trips

# In[51]:


sns.displot(Seattle_ParksnRec['# of trips Summer'], kde = True)
## normal distribution leptokurtic


# In[52]:


Seattle_ParksnRec['tripsSummerSQRT'] = np.sqrt(Seattle_ParksnRec['# of trips Summer'])


# In[53]:


sns.displot(Seattle_ParksnRec['tripsSummerSQRT'], kde = True)


# ## Summer Participant

# In[57]:


sns.displot(Seattle_ParksnRec['# of participants Summer'], kde = True)
## positively skewed


# In[61]:


Seattle_ParksnRec['ParticipantsSummerSQRT']= np.sqrt(Seattle_ParksnRec['# of participants Summer'])


# In[63]:


sns.displot(Seattle_ParksnRec['ParticipantsSummerSQRT'], kde = True)
## more normal


# In[ ]:




