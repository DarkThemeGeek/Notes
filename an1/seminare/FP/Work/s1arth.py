print("Hello group 911!")
"""
Basics of working with git:
    1. clone -> create a local (on your laptop) copy of the remote repository; this local copy is linked with its 
    remote version
    2. commit -> you record the changes on your laptop to the local copy of the git repository; (at this point, the
    changes do not show up on the remote repository
    3. push -> update the remote repository with the changes you made locally
"""

"""
1. Given 2 integers a and b, return True if one of them is 10 or if their sum is 10
"""
a = 5  # first, a receives the type from the right hand side expression, then it receives its value
b = 6


# print(str(a) + str(b))  # str() convert to string (str is the Python data type for string)
#
# a = "5"
# b = "911"
#
# print(type(a))
# print(type(b))
#
# print(int(a) + int(b))


def function_10(a: int, b: int) -> bool:
    if a == 10 or b == 10 or a + b == 10:
        return True
    else:
        return False


# print(function_10(a, b))
# print(function_10("1", "0"))

"""
2. Write a Python program which iterates the integers from 1 to 50. 
    - For multiples of three print "Fizz" instead of the number and for the multiples 
    of five print "Buzz". 
    - For numbers which are multiples of both three and five print "FizzBuzz".
"""


def fizz_buzz():
    for i in range(1, 51):  # the left argument (1) is included, the right one (51) is excluded
        if i % 3 == 0 and i % 5 == 0:
            print(i, "FizzBuzz")  # the print() function takes a variable number of arguments
        elif i % 3 == 0:  # like the switch statement in C
            print(i, "Fizz")
        elif i % 5 == 0:  # like the switch statement in C
            print(i, "Buzz")


"""
3. Write a program that reads temperatures in Celsius from the user (until they enter q), stores them in a list, 
and then prints:
    - all entered temperatures,
    - the average, minimum, maximum and median temperature,
    - a new list with the values converted to Fahrenheit.
"""


# temp = input("Enter temperatures in Celsius:")
# temp = int(temp)
# print(type(temp))

def temperatures():
    temps_list = []  # [] declares an empty Python list
    # temps_list = list() # call the list class constructor explicitely :)

    while True:
        value = input("Enter temperature in Celsius: ")
        if value == "q":
            break  # stops the innermost currently executing loop
        temp_value = int(value)
        temps_list.append(temp_value)

    if len(temps_list) == 0:
        print("No temperatures entered")
    else:
        print("All temperatures: ", temps_list)
        # / -> real number division (result is a floating point number)
        # // -> integer number division (result is an int)
        # sum() - built-in function that returns the sum of the elements
        # len() - length of its parameter (list, tuple, dict, string, etc.)
        print("The average: ", sum(temps_list) / len(temps_list))
        print("The minimum: ", min(temps_list))
        print("The maximum: ", max(temps_list))

        temps_list.sort()  # sort the list in place, in ascending order
        print("Median value: ", temps_list[len(temps_list) // 2])


"""
4. Given a non-empty string like "Code" return a string like "CCoCodCode"
    string_splosion('Code') → 'CCoCodCode'
    string_splosion('abc') → 'aababc'
    string_splosion('ab') → 'aab'
"""


def splosion(s: str) -> str:
    splosion = ""
    for i in range(1, len(s) + 1):
        splosion += s[0:i]
    return splosion

print(splosion("Code"))


"""
5. Word Frequency Counter
    - Given a sentence entered by the user, split it into words and count how many times each word occurs.
"""
def frequency(sentence: str) -> dict:
    var=sentence.split()
    counter={}
    for x in var:
        if not counter.__contains__(x) :
            counter.update({x:1})
        else :
            counter[x]+=1
    return counter
#print(frequency(input("Enter sentence: ")))

"""
6. Write a function that checks if two words are anagrams of each other by comparing letter frequencies using a dictionary.
"""
def check_anagrams(word1:str, word2:str)->bool :
    anagram_dict1 = {}
    for letter in word1:
        if  not anagram_dict1.__contains__(letter):
            anagram_dict1.update({letter: word1.count(letter)})
    for letter in word2:
        if  not anagram_dict1.__contains__(letter):
            return False
        if anagram_dict1[letter] != word2.count(letter):
            return False
    return True
#print(check_anagrams(input(), input()))
"""
7. Read pairs of student names and grades until the user enters "done". Store them in a dictionary with the student name 
    as key and a list of grades as value. Then compute:
    - average grade per student,
    - overall average,
    - the top student(s). To be in contention for "top student", students must have at least 3 grades
"""
"""
def read_students()->dict:
    students = {}
    while True:
        a=[]
        a=input().split()
        if students.__contains__(a[0]):
            students[a[0]].__add__((*float(a[1]),))
        else:
            students={a[0]:()}
            students[a[0]].__add__((float(a[1]),))
        if a == "done":
            return students



def average_grade_per_student(students:dict) -> dict:
    average_students={}
    for student in students:
        average_students[student] = sum(students[student]) / len(students[student])
    return average_students
def average_grade(students_average:dict) -> float:
    average=0

    for student in students_average:
       average+=students_average[student]

    average=average/len(students_average)

    return average

def top_student(students_average:dict,number_of_grades:dict) -> list:
    max=-1
    top_students=[]
    for student in students_average:
        if students_average[student] > max and number_of_grades[student] >= 3:
            max=students_average[student]
    for student in students_average:
        if students_average[student] == max and number_of_grades[student] >= 3:
            top_students.append(student)
    return top_students

def nr_grades(stud:dict)->dict:
    nr_grades={}
    for student in stud:
        nr_grades[student]=stud[student].count()
    return
def do_logic():
    students=read_students()
    avr=average_grade_per_student()

    print(avr)
    print(average_grade(avr))
    print(top_student(avr,nr_grades(students)))
    return
do_logic()
"""
