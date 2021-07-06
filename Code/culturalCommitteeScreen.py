
from os import system, name

from tabulate import tabulate

from DataBase import *

# def clear():
#     if name == 'nt':
#         _ = system('cls')
#     else:
#         _ = system('clear')

def enterculturalcommitteescreen():
    print("ivbefdoibd")
    while True:
        choice = int(input("Enter the query:\n1) Update an event\n2) Check Participation in Events\n3) Total and average "
                           "sponsorship raised for Fest \n4) Ranking of sponsors--> "))
        if choice == 1:
            query = "update event set "
            event_id = int(input("\nEnter the event id: "))
            choice2 = int(input("Choose which column to update:\n1) Event Name\n2)Timings\n3)Venue\n4)Winners\n--> "))
            if choice2 == 1:
                query += "event_name ='"
                event_name = input("Enter new event name: ")
                query += event_name
                query += "' where event_id='" + str(event_id) + "';"
                try:
                    query_0 = "select event_name from event where event_id='"+str(event_id)+"';"
                    cursor.execute(query_0)
                    data = cursor.fetchall()
                    previous_name = data[0][0]
                    cursor.execute(query)
                    mydb.commit()
                    print("\n-->  Queries executed: \n")
                    print(query)
                    query_2_preprocessing = "select email from organisingteam where event_incharge ='"+previous_name+"';"
                    cursor.execute(query_2_preprocessing)
                    data_2_0 = cursor.fetchall()
                    for i in data_2_0:
                        query2 = "update organisingteam set event_incharge ='" + event_name + "'where email= '" + i[0] + "';"
                        print(query2)
                        cursor.execute(query2)
                        mydb.commit()
                    query_3_preprocessing = "select mobile_no from participants where event_name='"+previous_name+"';"
                    cursor.execute(query_3_preprocessing)
                    data_3_0 = cursor.fetchall()
                    for i in data_3_0:
                        query3 = "update participants set event_name ='" + event_name + "'where mobile_no= '" + i[0] + "';"
                        print(query3)
                        cursor.execute(query3)
                        mydb.commit()
                except Exception as e:
                    print(e)
            elif choice2 == 2:
                query += "start_time ='"
                start_time = input("Enter Start time(HH:MM:SS): ")
                query += start_time
                query += "', end_time= '"
                end_time = input("Enter End Time: ")
                query += end_time
                query += "' where event_id='" + str(event_id) + "';"
                if check_time(start_time) < check_time(end_time) < 3600 * 24 and check_time(start_time) < 3600 * 24:
                    try:
                        cursor.execute(query)
                        mydb.commit()
                        print(query)
                    except Exception as e:
                        print(e)
                else:
                    print("wrong time input")
            elif choice2 == 3:
                query += "venue ='"
                venue = input("Enter new Venue: ")
                query += venue
                query += "' where event_id='" + str(event_id) + "';"
                try:
                    cursor.execute(query)
                    mydb.commit()
                    print(query)
                except Exception as e:
                    print(e)
            elif choice2 == 4:
                query += "winner ='"
                winners = input("Enter all winners(comma separated): ")
                query += winners
                query += "' where event_id='" + str(event_id) + "';"
                try:
                    cursor.execute(query)
                    mydb.commit()
                    print(query)
                except Exception as e:
                    print(e)
            else:
                print("-->  Wrong Input")
        elif choice == 2:
            choice2 = int(input("\nPress:--> \n1) Check event with lowest participation\n2) Check colleges with "
                                "participation "
                                "more than a specific number to determine popularity of events--> "))
            if choice2 == 1:
                query = "select event_name, count(*) as no_of_participants from participants group by event_name order by " \
                        "no_of_participants asc limit 1; "
                cursor.execute(query)
                data = cursor.fetchall()
                print("\n--> Output: \n")
                print(tabulate(data, headers=['Event Name','No of Participants'], tablefmt='psql'))
                print("\n--> Query implemented successfully\n")
            elif choice2 == 2:
                query = "select event_name, institute_name,count(institute_name) from participants group by " \
                        "institute_name having count(institute_name)>= "
                val = int(input("Enter the threshold participants amount: "))
                query += str(val)
                query += " order by count(institute_name);"
                cursor.execute(query)
                data = cursor.fetchall()
                print("\n--> Output: \n")
                print(tabulate(data, headers=['Event Name','Institute Name','Count(institute name)'], tablefmt='psql'))
                print("\n--> Query implemented successfully\n")
            else:
                print("-->  Wrong input")
        elif choice == 3:
            query ="select sum(funds) from sponsors;"
            cursor.execute(query)
            data = cursor.fetchall()
            query2 = "select avg(funds) as \"Average Revenue generated from each sponsors\" from sponsors;"
            cursor.execute(query2)
            data2 = cursor.fetchall()
            print("\n--> Output: \n")
            print("Total revenue generated: Rs. "+str(data[0][0]))
            print("Average Revenue Generated: Rs. "+str(data2[0][0]))
            print("\n--> Query implemented successfully\n")
        elif choice == 4:
            query = "select name,organisation, funds from sponsors order by funds desc;"
            cursor.execute(query)
            data = cursor.fetchall()
            print("\n--> Output: \n")
            print(tabulate(data, headers=['Name','Organisation','Funds'], tablefmt='psql'))
            print("--> Query implemented successfully\n")
        else:
            print("Wrong Input..")
#         x = input("Press enter to continue.....")
        if(input("DO YOU WANT TO EXIT? (Y/N): ").lower() == 'y'):
            break
# helper functions.....

def check_time(date):
    hh = date.split(":")
    s = 0
    for i in range(0, len(hh)):
        s = s * 60 + int(hh[i])
    return s


