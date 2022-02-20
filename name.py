'''
#函数（方法）
#name.title()：对变量name执行title（）指定的操作
#title()的作用是将每个单词的首字母大写
#upper()的作用是将每个单词的字母转换为大写
#lower()的作用是将每个单词的字母转换为小写

name = "adA Lovelace"
print(name.title())
print(name.upper())
print(name.lower())



#合并（连接）字符串
first_name = "ada"
last_name = "lavelace"
full_name = first_name+ " " + last_name
print(full_name)

print("hello" + " " + full_name.title() + "!")

#制表符（tab键缩进）\t
#换行符\n
#换行后缩进\n\t
print("Languages:\nPython\n\tC\n\tjavaScript")

#删除末尾空白rstrip()
#删除开头空白rstrip()
#删除两端空白rstrip()
# 
favourite_language = " python "
print(favourite_language)
print(favourite_language.rstrip())
print(favourite_language.lstrip())
print(favourite_language.strip())
print(favourite_language)
favourite_language=favourite_language.strip()#永久删除空白需要存储变量
print(favourite_language)

#单引号和双引号的使用
#单引号中不能有撇


#数字运算
# +-*/表示加减乘除
#  **表示乘方
#空格不影响运算
#浮点数无需考虑，但是结果包含的小数位数可能是不确定的

#使用函数str()避免类型错误
age=23
message = "happy " + str(age) + "rd birthday!"
print(message)
message = "happy " + age + "rd birthday!"
print(message)
'''
message="happy"
print(message)






