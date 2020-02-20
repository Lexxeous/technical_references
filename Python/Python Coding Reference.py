# Python Coding Reference.py

# Indentation in Python is paramount, there are no curly brackets to distinguish blocks of code like in C.
# You also cant mix tabs and spaces for indentation in a single file, you must choose one and be consistent.

/ # floating point division
// #integer division

def func_name(param1, param2):
	''' If you place on of these on the first line of a function definition, it will come up for the help documentation for the file '''
	return var


# While in a python environment, you can import modules and display its documentation with:
>>> import <module_name> as <MN>
>>> dir(<MN>) # documentation on module targets
>>> <MN>.__doc__ # general module documentation
>>> <MN>.<func_name>.__doc__ # documentation on a single function from the module
>>> help(<MN>) # displays full general documentation for module