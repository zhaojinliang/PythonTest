import abc
from pickle import TRUE


array=['asd','dfdfdf','sdfdf','sdfsfs','sfsfs']
print(array)
bulai=array.pop(2)
print(bulai)
print(array)
array.insert(2,'asdbcn1')
print(array)
array.pop()
print(array)
array.pop()
print(array)
array.pop()
print(array)
array.insert(0,'b12j3hdh')
array.insert(-1,'d13hdh')
array.insert(2,'h12j3h')
print(array)
'''
del array[0]
print(array)
del array[0]
print(array)
del array[0]
print(array)
'''
array.reverse()
print(sorted(array))
print(sorted(array,reverse=True))
abc=sorted(array)
print(abc)
array.sort()
print(array)
array.sort(reverse=True)
print(array)

print(len(array))


