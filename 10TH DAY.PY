import pandas as pd
import numpy as np

a=pd.Series([1,2,3,4,5,6,7,8,9,10])
print(a[a%2==0])
b=pd.Series(['MALE','FEMALE','MALE','MALE','MALE'])
df = pd.DataFrame(b)
print(df.mode())

n=np.arange(10,100)
p=pd.Series([n])
c=p+5
print(c)

print(np.mean(a))

print(np.average(a))
print(np.mean(a))
print(np.max(a))
print(np.min(a))

data = {
    'Name': ['Tom', 'Nick', 'Krish', 'Jack'],
    'Age': [20, 21, 19, 18],
    'City': ['London', 'New York', 'Tokyo', 'Paris']
}

df = pd.DataFrame(data)
print(df.iloc[2:4,2:4])

print("___________________________________")
print(df[df['Age']>19])
df['occupation']=pd.Series(['student','working_profestional',np.nan,'student'])

#add three coloumn into the data-frame->math,science,emglish->marks
#add more coloumn to total -> math + science + english

df['maths']=pd.Series([70,52,42])
df['science']=pd.Series([70,52,42])
df['english']=pd.Series([70,52,42])

