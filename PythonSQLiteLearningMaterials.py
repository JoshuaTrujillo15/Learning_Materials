#python sqlite3 learning materials
#WARNING:
#DO NOT USE {} AND .FORMAT(x,y,z)!!! SQL INJECTION VULNERABILITY
#c.fetchone() returns first row, else none
#c.fetchmany(x) returns x rows as list
#c.fetchall() returns all as list

import sqlite3
from employees import Employee

conn = sqlite3.connect(':memory:') #db exists in ram, resets every time
#conn = sqlite3.connect('employee.db') #creates or connects to db
c = conn.cursor() #allows execute() commands

c.execute("""
    CREATE TABLE employees(
        first text,
        last text,
        pay integer
    """)

def insert_emp(emp):
    with conn:
        c.execute("INSERT INTO employees VALUES(:first, :last, :pay)", {'first': emp_2.first, 'last': emp_2.last, 'pay': emp_2.pay})

def get_emp_by_name(lastname):
    c.execute("SELECT * FROM employees WHERE last=:last", {'last': lastname})
    return c.fetchall()

def update_pay(emp, pay):
    with conn:
        c.execute("""
            UPDATE
                employees
            SET
                pay = :pay
            WHERE
                first = :first,
                last = :last,
        """, {'first': emp.first, 'last': emp.last, 'pay': emp.pay})

def remove_emp(emp):
    with conn:
        c.execute("""
        DELETE
            from employees
        WHERE
            first = :first AND last = :last
        """, {'first': emp.first, 'last': emp.last})

emp_1 = Employee('John', 'Doe', 80000)
emp_2 = Employee('Jane', 'Doe', 90000)

insert_emp(emp_1)
insert_emp(emp_2)

update_pay(emp_2, 95000)
remove_emp(emp_1)

emps = get_emp_by_name('Doe')
print(emps)


conn.close() #closes connection