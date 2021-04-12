# Python Coding Reference.py

# Indentation in Python is paramount, there are no curly brackets to distinguish blocks of code like in C.
# You also cant mix tabs and spaces for indentation in a single file, you must choose one and be consistent.

/ # floating point division
// #integer division

def func_name(param1, param2):
	''' If you place a triple quote comment on the first line of a function definition, it will come up for the help documentation for the file '''
	return var


def func(*args, **kwargs): 
	print(‘Inside func’) 
	print(‘args =‘, args) 
	print(‘kwargs =‘, kwargs) 
 
func(1,2,3, a=4, b=5, z=6) 
# Inside func  
# args = (1,2,3) 
# kwargs = {‘a’:4, ‘b’:5, ‘z’:6} 


# Defining default getters and setters for class year of student class
# So calling this:
# 	smith_j = Student(‘John Smith’) 
# 	smith_j.year = 7
# is equivalent to calling this:
# 	smith_j = Student(‘John Smith’) 
# 	smith_j._set_year = 7
class Student: 
	... 

	def _set_year(self, c): 
		if c.upper() in ['P','K','1','2','3','4','5','6','7','8','9','10','11','12','F','H','J','S','M','D']: 
			self._year = c.upper()
		else: 
			raise AttributeError 

	def _get_year(self): 
		return self._year 

	year = property(fset=_set_year, fget=_get_year)


# While in a python environment, you can import modules and display its documentation with:
>>> import <module_name> as <MN>
>>> dir(<MN>) # documentation on module targets
>>> <MN>.__doc__ # general module documentation
>>> <MN>.<func_name>.__doc__ # documentation on a single function from the module
>>> help(<MN>) # displays full general documentation for module