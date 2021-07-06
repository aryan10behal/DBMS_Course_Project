from os import system
from DataBase import *
from participantScreen import displayEventNamesAndTakeChoice,displayEventDetails,displayFestNamesAndTakeChoice,displayFestDetails

def clear(): 
    if name == 'nt': 
        _ = system('cls') 
    else: 
        _ = system('clear')

def enterOrganisingTeamScreen():
    print("WELCOME TO THE ORGANISING TEAM PAGE")
    while True:
        
        print("THE LIST OF COMMANDS ARE :")
        print("1) Remove some Volunteer")
        print("2) Get event details")
        print("3) Get fest details")
        
        userInput = int(input("Select a value : "))
        
        if(userInput == 1):
            #implement here
            deleteVolunteer(input("Enter the email of Volunteer"))
        
        elif(userInput == 2):
            #implement here
            event_choice =displayEventNamesAndTakeChoice()
            choice = event_choice
            displayEventDetails(choice)
        elif(userInput == 3):
            fest_choice = displayFestNamesAndTakeChoice()
            displayFestDetails(fest_choice)    
        else:
            print("Invalid command!")
            continue
        
        if(input("DO YOU WANT TO EXIT? (Y/N)").lower() == 'y'):
            break
        
        
def deleteVolunteer(email):
    try:
        nameCheck = "select email from Volunteer where email = '"+email+"'"
        cursor.execute(nameCheck)
        if(cursor.fetchall() == None):
            print("No such Volunteer exists!")
            return 
        
        deleteFromVolunteer(email)
        deleteFromEvent(email)
        deleteFromAuthentiation(email)
        mydb.commit()
        print(email + " Removed successfully")
    except:
        print("Some error occurred")

def deleteFromVolunteer(email):
    try:
        deleteFromVol = "delete from Volunteer where email = '"+email+"'"
        print(deleteFromVol)
        cursor.execute(deleteFromVol)
    except:
        print("Some error occurred")
            
def deleteFromEvent(email):
    try:
        e = "'"+email +"'"
        deleteFromEvents = "select volunteers from event where INSTR(volunteers , "+e+")>0 ;"
     
        cursor.execute(deleteFromEvents)
        
        data = cursor.fetchall()
        volunteers = list(data[0])
        volunteerString = volunteers[0]
        volunteers = volunteerString.split(',')
        volunteers.remove(email)
        newVolunteers = ",".join(volunteers)
        n = "'" + newVolunteers +"'"
        update= "update event set volunteers = "+ n +" where INSTR(volunteers , "+e+")>0 ;"
        cursor.execute(update)
    except:
        print("Some error occurred")
        
def deleteFromAuthentiation(email):
    try:
        uname = "'"+email.strip()+"'"
        query = "delete from Authentication where userName = "+ uname 
        cursor.execute(query)
    except:
        print("Some error occurred")
        