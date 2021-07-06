from DataBase import cursor

from tabulate import tabulate

def enterCollegeAdminScreen():
    
    print("WELCOME TO THE COLLEGE ADMIN PAGE")
    while True:
        print("THE LIST OF COMMANDS ARE : ")
        print("1)Check Participations in Events")
        print("2)Details of Cultural Committee Members")
        print("3)Total and average sponsorship raised for fests")
        print("4)Ranking of the sponsors")
        
        userInput = int(input("Select a value : "))
        
        if(userInput == 1):
            participationsEvent()
        elif(userInput == 2):
            detailsOfCulturalCommittee()
        elif(userInput == 3):
            sponsorshipRaisedForFest()
        elif(userInput == 4):
            sponsorsRank()
            
        if(input("Do you want to logout?(Y/N)").lower() == 'y'):
            break 
        
def detailsOfCulturalCommittee():
    query = "select * from cultural_committee"
    try:
        cursor.execute(query)
        data = cursor.fetchall()
    
        for i in range(len(data)):
            festId = data[i][len(data[i])-1]
            fname = getFestName(festId)
            list_ = list(data[i])
            list_[len(list_)-1] = fname
            tuple_ = tuple(list_)
            data[i] = tuple_
        print(tabulate(data, headers=['Name','Email','Branch','Role','Fest'], tablefmt='psql'))

    except:
        print("Some error occurred")

def sponsorsRank():
    try:
        query = "select name,organisation, funds from sponsors order by funds desc;"
        cursor.execute(query)
        data = cursor.fetchall()
        print(tabulate(data, headers=['Name','Organisation','Funds'], tablefmt='psql'))
    except:
        print("Some error occurred")
        
def getFestName(fid):
    try:
        query = "select fest_name from fest where fest_id = " +str(fid)
        cursor.execute(query)
        data = cursor.fetchall()
        fname = data[0][0]
        return fname
    except:
        print("Some error occurred")

def sponsorshipRaisedForFest():
    try:
        query ="select sum(funds) from sponsors;"
        cursor.execute(query)
        data = cursor.fetchall()
        query2 = "select avg(funds) as \"Average Revenue generated from each sponsors\" from sponsors;"
        cursor.execute(query2)
        data2 = cursor.fetchall()
        print("Total revenue generated: Rs. "+str(data[0][0]))
        print("Average Revenue Generated: Rs. "+str(data2[0][0]))
    except:
        print("Some error occurred")

def participationsEvent():
    try:
        print("1)Check event with lowest participation")
        print("2)Check colleges with participation more than a specific number to determine popularity of events")    
        choice2 = int(input("Enter a value : "))
                            
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
    except:
        print("Some error occurred")
