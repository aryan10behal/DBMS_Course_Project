from os import system, name
from random import random, randint

from tabulate import tabulate

from DataBase import *

# def clear():
#     if name == 'nt':
#         _ = system('cls')
#     else:
#         _ = system('clear')


def enterVolunteerScreen(user_userName, user_userType):
    while True:
        choice = int(input("\nEnter the query:\n1) Register a new attendee/participant to the fest\n2) Check participants "
                           "with name "
                           "starting with some letter to decide sitting arrangement...:--> "))
        if choice == 1:
            name = input("Enter the name: ")
            mobile = input("Enter Mobile Number: ")
            while len(mobile) != 10:
                mobile = input("Wrong mobile entry... Enter Mobile Number again: ")
            institute = input("Enter institute (type '-' if no institute: ")
            event_no = int(input("Enter the event attendee participating in(enter the option number..)"
                                 ":\n1)prosort\n2)robowar\n3)digiwar\n4)treasure_hunt\n5)blind_coding\n6)code_in_less"
                                 "\n7)brain_fuzz\n8)segfault\n9)No Event \n--> "))
            event_name = ""
            if event_no == 1:
                event_name = "prosort"
            elif event_no == 2:
                event_name = "robowar"
            elif event_no == 3:
                event_name = "digiwar"
            elif event_no == 4:
                event_name = "treasure_hunt"
            elif event_no == 5:
                event_name = "blind_coding"
            elif event_no == 6:
                event_name = "code_in_less"
            elif event_no == 7:
                event_name = "brain_fuzz"
            elif event_no == 8:
                event_name = "segfault"
            else:
                event_name = ""
            err = False
            if institute == "-":
                query = "insert into attendees values('" + mobile + "','" + name + "','No',null);"
                try:
                    print(query)
                    cursor.execute(query)
                    mydb.commit()
                    print("--> Query implemented successfully\n")
                except Exception as e:
                    print(e)
                    err = True
                if event_name != "" and not err:
                    query2 = "insert into participants values('" + mobile + "','" + name + "','No',null,'" + event_name + "');"
                    query3 = "insert into authentication values('"+mobile +"','"+generate_password()+"','Participants');"
                    try:
                        print(query2)
                        cursor.execute(query2)
                        mydb.commit()
                        print(query3)
                        cursor.execute(query3)
                        mydb.commit()
                        print("--> Query implemented successfully\n")
                    except Exception as e:
                        print(e)
                else:
                    query3 = "insert into authentication values('" + mobile + "','" + generate_password() + "','Attendees');"
                    try:
                        print(query3)
                        cursor.execute(query3)
                        mydb.commit()
                        print("--> Query implemented successfully\n")
                    except Exception as e:
                        print(e)
            else:
                query = "insert into attendees values ('" + mobile + "','" + name + "','No','" + institute + "');"
                try:
                    print(query)
                    cursor.execute(query)
                    mydb.commit()
                    print("--> Query implemented successfully\n")
                except Exception as e:
                    print(e)
                    err = True
                if event_name != "" and not err:
                    try:
                        query2 = "insert into participants values ('" + mobile + "','" + name + "', 'No','" + institute + "','" + event_name + "');"
                        print(query2)
                        cursor.execute(query2)
                        mydb.commit()
                        query3 = "insert into authentication values('" + mobile + "','" + generate_password() + "','Participants');"
                        cursor.execute(query3)
                        mydb.commit()
                        print("--> Query implemented successfully\n")
                    except Exception as e:
                        print(e)
                else:
                    query3 = "insert into authentication values('" + mobile + "','" + generate_password() + "','Attendees');"
                    try:
                        print(query3)
                        cursor.execute(query3)
                        mydb.commit()
                        print("--> Query implemented successfully\n")
                    except Exception as e:
                        print(e)
        elif choice == 2:
            volunteer_email = user_userName
            query_0 = "select event_id from volunteer where email ='"+volunteer_email+"';"
            cursor.execute(query_0)
            event_id = (cursor.fetchall())[0][0]
            if event_id == 9:
                print("You are no event volunteer..")
            else:
                q = "select volunteers from event where event_id = " + str(event_id)
                cursor.execute(q)
                data = cursor.fetchall()
                val = False
                for i in data:
                    for j in i:
                        strings = j.split(", ")
                        for k in strings:
                            if k == volunteer_email:
                                val = True
                                break
                if not val:
                    print("You are not a volunteer for entered event.... Returning...")
                else:
                    event_name = ""
                    if event_id == 1:
                        event_name = "prosort"
                    elif event_id == 2:
                        event_name = "robowar"
                    elif event_id == 3:
                        event_name = "digiwar"
                    elif event_id == 4:
                        event_name = "treasure_hunt"
                    elif event_id == 5:
                        event_name = "blind_coding"
                    elif event_id == 6:
                        event_name = "code_in_less"
                    elif event_id == 7:
                        event_name = "brain_fuzz"
                    elif event_id == 8:
                        event_name = "segfault"
                    print("\n--> Welcome " + volunteer_email + " ... You are volunteering for " + event_name)
                    starting_alphabets = input("\nEnter the starting letters of name: ")
                    query = "Select * from participants where event_name ='" + event_name + "' and name LIKE '" + starting_alphabets + "%';"
                    try:
                        cursor.execute(query)
                        data_2 = cursor.fetchall()
                        print(tabulate(data_2, headers=['Mobile No','Name','Attendance','Insitute','Event Name'], tablefmt='psql'))
                    except Exception as e:
                        print(e)
        else:
            print("\n--->  Wrong Input....")
        
        if(input("DO YOU WANT TO EXIT? (Y/N): ").lower() == 'y'):
            break

# helper functions

def generate_password():
    s=""
    for i in range(0,7):
        j = randint(0,6)%3
        if j == 0:
            s = s + chr(randint(0,10)%10+48)
        elif j == 1:
            s = s + chr(randint(0,26)%26+65)
        else:
            s = s + chr(randint(0, 26) % 26 + 97)
    return s
