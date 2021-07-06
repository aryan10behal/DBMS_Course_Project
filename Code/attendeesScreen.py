from os import system,name
from DataBase import *
import datetime

def enterAttendeesScreen():
    print("WELCOME TO THE ATTENDEES PAGE")
    while True:
        print("THE LIST OF COMMANDS ARE : ")
        print("1)Get event details")
        print("2)Get fest details")
        
        userInput = int(input("Select a value : "))
        
        if(userInput == 1):
            event_choice =displayEventNamesAndTakeChoice()
            choice = event_choice
            displayEventDetails(choice)
            
        elif(userInput == 2):
            fest_choice = displayFestNamesAndTakeChoice()
            displayFestDetails(fest_choice)
        else:
            print("Invalid choice!")
            
        if(input("Do you want to logout?(Y?N)").lower() == 'y'):
            break
            
def displayFestNamesAndTakeChoice():
    try:
        query = "select fest_name from fest"
        cursor.execute(query) 
        fests = cursor.fetchall()
        fests = [list(i)[0] for i in fests]
        for j in range(len(fests)):
            print(str(j+1) +") "+fests[j])
        choice = int(input("Choose an fest : "))
        return fests[choice-1]    
    except:
        print("Some error occurred")


def displayFestDetails(choice):
    try:
        choice = "'"+choice+"'"
        attributes = "fest_name,start_date,end_date,fest_desc,venue,mainsponsor "
        attributes_arr = attributes.split(',')
        
        query = "select "+ attributes +"from fest where fest_name = " + choice
        cursor.execute(query)
        data = cursor.fetchall()
        data_list = [i for i in data[0]]
        for i in  range(len(data_list)):
            if(i == 1 or i==2):
                #for datetime.date
                t = data_list[i]
                data_list[i] = t.strftime('%m/%d/%y')    
    
            print("#"+attributes_arr[i]+" > "+data_list[i])
    except:
        print("Some error occurred")

    
def displayEventNamesAndTakeChoice():
    try:
        query = "select event_name from event"
        cursor.execute(query) 
        events = cursor.fetchall()
        events = [list(i)[0] for i in events]
        for j in range(len(events)):
            print(str(j+1) +") "+events[j])
        choice = int(input("Choose an event : "))
        return events[choice-1]
    except:
        print("Some error occurred")

def displayEventDetails(choice):
    try:
        choice = "'"+choice+"'"
        attributes = "event_name,club,event_head,event_date,start_time,end_time,venue,winner "
        attributes_arr = attributes.split(',')
        
        query = "select "+ attributes +"from event where event_name = " + choice
        cursor.execute(query)
        data = cursor.fetchall()
        data_list = [i for i in data[0]]
        for i in  range(len(data_list)):
            if(i == 3):
                #for datetime.date
                t = data_list[i]
                data_list[i] = t.strftime('%m/%d/%y')
            if(i == 4 or i == 5):
                data_list[i] = str(data_list[i])            
    
            print("#"+attributes_arr[i]+" > "+data_list[i])
        
    except:
        print("Some error occurred")
