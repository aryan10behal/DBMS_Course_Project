import mysql.connector
import sys
from pathlib import Path
from os import system,name


'''
    @enter your password in the file named pwd.txt

'''

mydb =''
cursor =''


def clear(): 
    if name == 'nt': 
        _ = system('cls') 
    else: 
        _ = system('clear')
        
def getPassword():    
    Path("pwd.txt").touch(exist_ok=True)
    pwd_file = open("pwd.txt",'r')
    pwd = pwd_file.read()
    pwd_file.close()
    return pwd

def ConnectToSQL():
    try:
        return mysql.connector.connect(host = "localhost",
                                       port="3306",
                                       user = "root",
                                       passwd = getPassword()
                                       )
        
    except:
        print("Wrong Password / Some error occurred")
        print("Exiting")
        sys.exit(1)


def connectToDataBase(cursor):
    dataBaseName = "dbms_project1"
    cursor.execute("USE " + dataBaseName)
        
                     
        
mydb = ConnectToSQL()
cursor = mydb.cursor()
connectToDataBase(cursor)


    
    
    