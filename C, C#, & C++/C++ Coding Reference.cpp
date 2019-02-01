// C++ Coding Reference

// -----------------------------------------------------------------------------
// LIBRARIES (in alphabetic order)

#include <iostream>
#include <vector> //allows the use of the vector library/class
#include <omp.h>


// -----------------------------------------------------------------------------
// NAMESPACES

using namespace std;


// -----------------------------------------------------------------------------
// STANDARD DATA IN, OUT, ETC...

cout << "output_string" << endl;
cerr << "output_error_string" << endl;
cin >> "input_string";


// -----------------------------------------------------------------------------
// ARRAYS
// Arrays, by default, are passed into functions by


// -----------------------------------------------------------------------------
// PARALLEL PROGRAMMING WITH OPENMP (Open Multi-Processing)
// OpenMP is a single process, mutli-thread, shared memory environment.
// OpenMP is NOT:
	// meant for distributed node parallelism
	// impemented identically across vendors
	// guaranteed to make the most effective use of shared memory resources
	// required to check for data dependencies, conflicts, race conditions, deadlocks, etc...

// Region (block) definitions:
#pragma <sentinal> <directive> [optional_clauses] // general format of an OpenMP region (block)
#pragma omp parallel // creates a parallel thread region
#pragma omp critical // creates a sequential thread region to avoid race conditions
#pragma omp atomic // applies and protects only a single, immetiately following statement
#pragma omp master // only executed by the master thread ; same as "if(omp_get_thread_num() == 0)"
#pragma omp parallel for (int i = 0; i < count; i++) //
#pragma omp parallel for schedule (<schedule_type> <chunk_size>) // <schedule_type> = "static", "dynamic", or "guided" ; <chunk_size> is iterations per thread
#pragma omp barrier // threads will not continue until they all reach the start of this barrier region
#pragma omp parallel nowait // falls through region without waiting for any other threads
#pragma omp single // only one thread (the first one to arrive) executes in this region
#pragma omp sections //split a parellel region into distinct sections
{
	#pragma omp section {<code1>} // only one thread executes the code in each section
	#pragma omp section {<code2>}
	#pragma omp section {<code3>}
}


// Functions:
double omp_get_wtime(); // returns current wall time in seconds
int omp_get_num_threads(); // get number of threads used in a parallel region
int omp_get_thread_num(); // get the thread rank (ID) in a parallel region ; the "master" thread is always thread '0'
int omp_set_num_threads(<num_threads>) // set the number of threads for use in a parallel region

// Clauses:
private(<list>){} // variables in <list> will be private amongst threads in a region
shared(<list>){} // variables in <list> will be shared amongst threads in a region
if(<scalar_expression>){}
default(<privacy>){} // set the default <privacy> of variables in a parallel region ; "shared" or "none"
firstprivate(){}
reduction(operator:<list>){}
copyin(<list>){}
num_threads(integer_expression){}


// -----------------------------------------------------------------------------
// PARALLEL PROGRAMMING WITH MPI




// -----------------------------------------------------------------------------
// VECTOR PROGAMMING
// Vectors, by default, are passed into funcitons by value, which makes a duplicate copy of the param(s)
// Vectors are large in terms of memory, so making duplicates while passing by value wastes resources
// Passing vectors by value allows the original data not to be tampered with when passing a duplicate
// If you want to ensure that the original data parameter isnt tampered with, put "const" before it in the function definition

void valueVectorFunc(vector<dataType>); //passes a vector as a param by value
void referenceVectorFunc(vector<data_type>&); // passes a vector as a param by with '&'
void constReferenceVectorFunc(const vector<data_type>&); // passes an unchangable constant vector as a param by with '&'

vector<data_type> myVector; // define a vector called "myVector"

myVector.push_back(<data>); // appends data to the end of the vector
myVector.size(); // returns an UNSIGNED integer value for the length of the vector
myVector.at(<index>); // returns the value at "index" within "myVector"
myVector[<index>]; // returns the value at "index" within "myVector"
myVector.begin(); // returns an iterator pointing to the first element in "myVector"
myVector.insert(myVector.begin() + <integer_value>, <data>); // inserts "data" to the "integer_value" index and shifts all other elements towards the tail
myVector.erase(myVector.begin() + <integer_value>, <data>); // erases "data" to the "integer_value" index and shifts all other elements towards the head
myVector.clear(); // clears "myVector" of all elements
myVector.empty(); // returns a boolean true if "myVector" is empty and false otherwise
