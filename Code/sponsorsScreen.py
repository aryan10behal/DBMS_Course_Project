from os import system, name

from tabulate import tabulate

from DataBase import *

#
# def clear():
#     if name == 'nt':
#         _ = system('cls')
#     else:
#         _ = system('clear')
#


def sponsorScreen():
    while True:
        choice = int(input("\nEnter the query:\n1) Sponsored amount to event\n2) Participation in event "))
        sponsor_name = input("Enter sponsor name: ")
        if choice == 1:
            query = "select event_name, revenue from event where sponsors = '"+sponsor_name+"';"
            print(query)
            try:
                cursor.execute(query)
                data = cursor.fetchall()
                print("\n--> Output: \n")
                print(tabulate(data, headers=['Event Name','Revenue'], tablefmt='psql'))
                print("--> Query implemented successfully\n")
            except Exception as e:
                print(e)
        elif choice == 2:
            query = "select participants.event_name, count(*) as no_of_participants  from participants, event where " \
                    "event.event_name = participants.event_name and event.sponsors='"+sponsor_name+"'group by event_name " \
                                                                                                   "order by " \
                                                                                                   "no_of_participants " \
                                                                                                   "asc ;"
            print(query)
            try:
                cursor.execute(query)
                data = cursor.fetchall()
                print("\n--> Output: \n")
                print(tabulate(data, headers=['Event Name','Count'], tablefmt='psql'))
                print("\n--> Query implemented successfully\n")
            except Exception as e:
                print(e)
        else:
            print("\n\nWrong Input....")
        
        if(input("DO YOU WANT TO EXIT? (Y/N): ").lower() == 'y'):
            break
        
        
        
        
        
         