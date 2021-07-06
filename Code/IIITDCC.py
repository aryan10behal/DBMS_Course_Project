
from DataBase import cursor
from culturalCommitteeScreen import enterculturalcommitteescreen
from organisingTeamScreen import enterOrganisingTeamScreen
from volunteerScreen import enterVolunteerScreen
from sponsorsScreen import sponsorScreen
from collegeAdminScreen import enterCollegeAdminScreen
from participantScreen import enterParticpantsScreen
from attendeesScreen import enterAttendeesScreen

def authenticate(cursor,uname , pwd , utype):
    try:
        query = "select * from authentication where userName = '"+ uname+"' and  pwd = '"+pwd+"' and userType = '"+utype+"';"
    
        cursor.execute(query)
    
        data = cursor.fetchall()
        print(data)
        if len(data)== 0:
            print("here")
            return False
        
        return True
    except:
        print("Some error occurred")
        
def launchApplication():
    launchLogin()
        
def launchLogin():

    userTypes = ["cultural committee" , "Organising Team" , "Volunteers" , "Sponsors" , "College Admin" , "Participants" , "Attendees"]
    while True:
        print("User types")
        
        print("1) Cultural Committee Member")
        print("2) Organising Team")
        print("3) Volunteer")
        print("4) Sponsor")
        print("5) College Admin")
        print("6) Participants")
        print("7) Attendees")
        
        userType = int(input("Enter a user type : "))
        userName = input("Enter username (email/phone) : ")
        pwd = input("Enter your password : ")
        
        if authenticate(cursor,userName , pwd , userTypes[userType - 1]) == False:
            print("Wrong Credentials")
            continue
        
        #signed in
        if(userType == 1):
            enterculturalcommitteescreen()
        if(userType == 2):
            enterOrganisingTeamScreen()
        elif(userType == 3):
            enterVolunteerScreen(userName , "volunteer")
        elif(userType == 4):
            sponsorScreen()
        elif(userType == 5):
            enterCollegeAdminScreen()
        elif (userType == 6):
            enterParticpantsScreen()
        elif (userType == 7):
            enterAttendeesScreen() 
               

launchApplication()

