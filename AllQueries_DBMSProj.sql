create database dbms_project1;
use dbms_project1;

create table FEST(
	 fest_id int auto_increment primary key not null,
	  fest_name varchar(50) not null,
      start_date date not null,
      end_date date not null,
      fest_desc varchar(100) ,
      venue varchar(100) not null,
      mainsponsor varchar(100) not null,
      no_of_attendees int not null,
      no_of_participants int not null
);

create table cultural_committee(
name varchar(50) not null,
email varchar(50) primary key not null,
branch varchar(50) not null,
role varchar(50) not null,
fest_id int not null,
foreign key(fest_id)  references FEST(fest_id) on delete cascade on update cascade
);


create table organisingTeam(
name  varchar(50) not null,
email varchar(50) primary key not null,
event_incharge varchar(50) ,
role varchar(50) not null
);

create table EVENT(
event_id int auto_increment primary key not null,
event_name varchar(50) not null,
club varchar(50) ,
event_head varchar(200) not null,
volunteers varchar(500) not null,
event_date date not null,
start_time time not null,
end_time time not null,
venue varchar(50) not null,
sponsors varchar(200) not null,
revenue int not null,
winner varchar(100) 
);


create table volunteer(
name varchar(50) not null,
email varchar(50) primary key not null, 
event_lead varchar(50),
event_id int,
foreign key(event_id) references event(event_id) on delete cascade on update cascade
);


create table sponsors(
name varchar(50) not null,
sponsor_id int auto_increment primary key not null,
email varchar(50) not null,
mobile_no varchar(10) not null,
funds int not null,
expectations varchar(500),
stalls varchar(250),
organinsation varchar(50) not null
);



create table attendees(
mobile_no varchar(15) primary key not null,
name varchar(50) not null,
attendence varchar(3) not null,
institute varchar(50) 
);

create table attend(
fest_id int not null,
mobile_no varchar(15) not null,
foreign key(fest_id) references fest(fest_id) on delete cascade on update cascade,
foreign key(mobile_no) references attendees(mobile_no) on delete cascade on update cascade
);

create table stalls(
stall_id int primary key not null,
name varchar(50) not null,
owner varchar(50) not null,
type varchar(50) not null,
venue varchar(50) not null,
start_time time not null,  
end_time time not null,
mobile_no varchar(15) not null,
email varchar(50) not null,
revenue_generated int
);


create table exhibits(
fest_id int not null,
stall_id int not null,

foreign key(fest_id) references fest(fest_id) on delete cascade on update cascade,
foreign key(stall_id) references stalls(stall_id) on delete cascade on update cascade 
);

create table participants(
mobile_no varchar(15) primary key not null,
name varchar(50) not null,
attendence varchar(3) not null,
institute_name varchar(50) ,
event_name varchar(50) not null 
);

create table participate(
event_id int not null,
mobile_no varchar(15) not null,
primary key(event_id, mobile_no) ,
foreign key(event_id) references event(event_id),
foreign key(mobile_no) references participants(mobile_no)
);

create table incharge(
email_cc varchar(50) not null,
email_ot varchar(50) primary key not null,
foreign key(email_cc) references cultural_committee(email) on delete cascade on update cascade,
foreign key(email_ot) references organisingTeam(email) on delete cascade on update cascade
);


create table authentication(
	username varchar(100),
    pwd varchar(20),
    userType varchar(50)
);

INSERT INTO `attendees` VALUES ('8005631031','Tony','Yes','NSIT'),('8015090694','Gerald','No','ISM'),('8021236123','Jan','No','BITS'),('8032594303','Clyde','No','ISM'),('8039351783','Mckenna','Yes','IIT-D'),('8040806612','Danial','Yes','IP'),('8045420548','Nikolas','No','ISM'),('8052154349','Gustave','No','BITS'),('8066401624','Cedrick','Yes','IP'),('8075045386','Rocky','Yes','NSIT'),('8084438810','Ewald','No','DTU'),('8084919431','Rashad','Yes','NIT'),('8109584906','Jonas','No','NSIT'),('8114090533','Alexys','No','NIT'),('8137381942','Arnold','Yes','BITS'),('8149369489','Hailey','Yes','IIIT-D'),('8167126188','Orion','Yes','DTU'),('8182586641','Dagmar','No','ISM'),('8191229664','Rickie','Yes','DTU'),('8244878049','Brendon','Yes','ISM'),('8247081762','Parker','No','NIT'),('8252149908','Franz','Yes','DTU'),('8268055399','Cicero','Yes','IIIT-D'),('8275261374','Gay','No','NSIT'),('8287377630','Griffin','No','IP'),('8297363602','Joan','Yes','NSIT'),('8306884956','Kirk','No','DTU'),('8316860239','Elmo','No','NIT'),('8321110572','Rodolfo','Yes','BITS'),('8322440478','Camden','No','ISM'),('8343158456','Chadd','Yes','IIIT-D'),('8352119874','Sammie','Yes','IP'),('8359283264','Royce','No','IIIT-D'),('8376697130','Westley','No','DTU'),('8378389017','Juston','No','IIIT-D'),('8383117298','Dorthy','No','DTU'),('8396588326','Gaetano','Yes','DTU'),('8420593584','Forrest','No','DTU'),('8435028309','Fern','No','ISM'),('8435532082','Josh','Yes','NSIT'),('8457802306','Jerrod','No','NIT'),('8466506497','Lula','Yes','BITS'),('8466977590','Fred','No','IP'),('8467039359','Jesse','Yes','DTU'),('8468088030','Santino','No','IP'),('8494924183','Freddie','Yes','IP'),('8501036548','Kory','No','NIT'),('8510933836','Tatum','No','IIT-D'),('8514539465','Kip','Yes','IIT-D'),('8518132333','Ahmed','Yes','BITS'),('8521032859','Chase','Yes','NIT'),('8549016660','Adrien','Yes','IIIT-D'),('8555775788','Elijah','No','BITS'),('8602185696','Devonte','Yes','IIIT-D'),('8613505056','Jamison','Yes','IP'),('8625042185','Saul','Yes','NSIT'),('8628794939','Kaleigh','No','DTU'),('8642341371','German','No','IIIT-D'),('8651603646','Aurelio','Yes','IIT-D'),('8652782941','Garrison','No','IIIT-D'),('8654723546','Ephraim','Yes','DTU'),('8655509836','Jeffery','Yes','NSIT'),('8670214169','Dominic','No','NSIT'),('8670884232','Kyleigh','Yes','IP'),('8675957567','Casimir','No','NSIT'),('8678575085','Theodore','No','ISM'),('8688588669','Ismael','No','NSIT'),('8692617822','Sydney','No','DTU'),('8692947180','Orrin','Yes','DTU'),('8706663466','Lorenza','No','ISM'),('8715972930','Arely','No','NSIT'),('8737633824','Granville','No','IIT-D'),('8763831662','Joaquin','No','NIT'),('8793019870','Kim','No','BITS'),('8793036110','Jameson','No','IP'),('8797247665','Fred','No','NSIT'),('8799015738','Gus','Yes','IP'),('8804047065','Howard','Yes','IIT-D'),('8812988484','Hayden','No','NSIT'),('8822517297','Leonard','Yes','DTU'),('8827583760','Milford','No','NSIT'),('8828653142','Hazel','Yes','NSIT'),('8833646395','Enos','Yes','NIT'),('8851393613','Cristobal','No','DTU'),('8861373730','Francis','No','NIT'),('8866365836','Emmitt','Yes','NIT'),('8873928264','Liam','Yes','IIIT-D'),('8881516274','Johnathon','No','IIT-D'),('8886539211','Christian','No','IP'),('8894430948','Floy','Yes','DTU'),('8926411061','Brown','No','DTU'),('8967208099','Francisco','Yes','IIT-D'),('8983541778','Barton','No','DTU'),('8990485325','Edmund','Yes','IP'),('9004750449','Porter','No','BITS'),('9007312956','Jocelyn','Yes','NSIT'),('9020003771','Lazaro','No','DTU'),('9038468185','Ethan','No','NIT'),('9041354746','Hudson','Yes','ISM'),('9045716138','Kip','Yes','NSIT'),('9048520829','Jordon','Yes','ISM'),('9059364517','Wilbert','No','IIIT-D'),('9061173457','Westley','Yes','NSIT'),('9064468593','Giles','No','IP'),('9073213521','Zachary','No','NIT'),('9096594449','Francis','Yes','NSIT'),('9181922689','Elmo','No','NIT'),('9192892662','Kendall','Yes','NSIT'),('9199970448','Juwan','No','NSIT'),('9217887696','Zack','No','BITS'),('9219971785','Lourdes','No','DTU'),('9220427787','Luciano','Yes','IP'),('9223388453','Lamar','Yes','IP'),('9226194613','Ed','Yes','IP'),('9228467804','Wayne','No','IIIT-D'),('9230301241','Mariano','No','IP'),('9231764002','Eusebio','Yes','IIIT-D'),('9237808333','Nicola','Yes','NSIT'),('9257716376','Bertrand','Yes','BITS'),('9264048858','Ahmed','No','BITS'),('9269861802','Alfonzo','Yes','ISM'),('9277929557','Josh','No','BITS'),('9301524886','Hobart','No','ISM'),('9322801343','Geovany','Yes','ISM'),('9347339824','Junius','No','ISM'),('9355762973','Rodrigo','Yes','IP'),('9366526838','Magnus','No','IIT-D'),('9380749999','Furman','Yes','DTU'),('9392102554','Leif','Yes','BITS'),('9395931707','Nils','Yes','BITS'),('9407364259','Jovanny','Yes','NSIT'),('9437647102','Jesus','No','NSIT'),('9439115413','Eldon','Yes','IIIT-D'),('9450790958','Hazle','No','NIT'),('9457546082','Pete','No','IIT-D'),('9458774297','Cyrus','No','NSIT'),('9459897381','Nikko','No','IIIT-D'),('9466286069','Junior','No','NIT'),('9485180784','Stanton','Yes','ISM'),('9489507295','Jalen','No','NSIT'),('9510017739','Newton','Yes','IIT-D'),('9527840477','Colt','No','IIIT-D'),('9528660740','Keenan','Yes','NSIT'),('9534819380','Josue','No','IP'),('9538801103','Nolan','Yes','DTU'),('9546216675','Pete','No','ISM'),('9547261088','Ramiro','No','IIIT-D'),('9550708334','Jakob','Yes','BITS'),('9550946570','Geoffrey','No','IIIT-D'),('9562544909','Jasen','No','BITS'),('9563072041','Efrain','Yes','IP'),('9563834923','Elliot','Yes','IP'),('9579524214','Erik','No','DTU'),('9581361345','Alexander','Yes','IP'),('9587500342','Devon','Yes','ISM'),('9602011404','Tommie','No','NSIT'),('9605960235','Shad','No','ISM'),('9610123582','Jack','No','NSIT'),('9615178567','Logan','Yes','ISM'),('9624251773','Samir','Yes','ISM'),('9633413838','Terry','No','BITS'),('9636813449','Finn','No','IIIT-D'),('9641200587','Chandler','Yes','NIT'),('9661057917','Jonathon','Yes','IIT-D'),('9663024876','Curtis','Yes','BITS'),('9681488866','Jamar','No','IP'),('9690150214','Chelsey','Yes','NIT'),('9725793906','Juston','No','ISM'),('9727567550','Jayde','Yes','ISM'),('9740879097','Arch','Yes','NIT'),('9740893033','Caden','Yes','NSIT'),('9741228627','Delmer','Yes','NSIT'),('9745037114','John','Yes','NIT'),('9747248001','Michael','Yes','ISM'),('9778108392','Milford','Yes','BITS'),('9785550843','Hyman','No','DTU'),('9789170501','Coby','Yes','IIIT-D'),('9792636074','Jaiden','No','IIT-D'),('9804352811','Ken','No','IIIT-D'),('9823584122','Jovan','No','BITS'),('9829192693','Camren','No','IP'),('9832844560','Claud','No','IIIT-D'),('9840240075','Frederick','Yes','IP'),('9864419603','Jarrell','No','IIT-D'),('9870290234','Garry','Yes','DTU'),('9893692097','Raven','Yes','IIIT-D'),('9894751956','Richmond','Yes','IIT-D'),('9906440394','Al','Yes','NIT'),('9918288169','Aurelio','No','IIIT-D'),('9923252622','Jose','No','BITS'),('9935423847','Santos','No','NIT'),('9936892554','Connor','Yes','IIT-D'),('9943090843','Johnnie','No','NSIT'),('9948871650','Morton','No','IIIT-D'),('9954479723','Jaydon','Yes','ISM'),('9959746713','Jeff','Yes','BITS'),('9966716389','Patrick','Yes','ISM'),('9984010101','Elijah','No','NIT'),('9984627855','Willard','Yes','IP'),('9995530140','Torrance','Yes','DTU');
INSERT INTO `attendees` VALUES ('8021923027','Mekhi','No','IIT-D'),('8025438734','Bridgette','No','IIT-R'),('8041580055','Rhett','Yes','IIIT-D'),('8052410432','Eulah','Yes','BITS'),('8056787494','Tomasa','No','IIT-R'),('8060414416','Elian','No','DTU'),('8063505609','Roslyn','No','IIT-D'),('8085237305','Osborne','No','NSUT'),('8100321792','Katrina','No','IIT-D'),('8131713679','Lisette','Yes','IIT-R'),('8177563681','Kristian','Yes','BITS'),('8199081746','Brook','No','NSUT'),('8227164774','Tatyana','No','NSUT'),('8236283971','Verda','Yes','IIIT-D'),('8247349245','Gerard','No','DTU'),('8262064726','Verla','No','IP'),('8277591642','Lee','No','IIT-D'),('8302612219','Bulah','No','DTU'),('8315140939','Viola','No','IP'),('8329619347','Jaren','Yes','NSUT'),('8344274864','Karen','Yes','IIT-R'),('8415923771','Herta','No','IP'),('8441118060','Mikel','Yes','IIIT-D'),('8445336545','Eduardo','No','IIIT-D'),('8450047626','Pablo','Yes','BITS'),('8457884840','Meda','No','IIIT-D'),('8482347596','Mike','No','IIT-D'),('8482758650','Khalil','Yes','NSUT'),('8488137984','Jettie','No','BITS'),('8542670041','Jerome','No','NSUT'),('8563655890','Alessandra','Yes','IIIT-D'),('8605479130','Buddy','No','BITS'),('8605731436','Gerson','Yes','IIT-D'),('8648074956','Trever','Yes','IP'),('8691601558','Rozella','No','IIT-D'),('8763637088','Catherine','No','NSUT'),('8770416242','Sallie','Yes','IIT-R'),('8771421003','Marcella','No','IP'),('8773820585','Alaina','No','IIT-D'),('8780517445','Heath','No','IP'),('8811941759','Greta','Yes','DTU'),('8829499566','Reginald','No','DTU'),('8866176084','Syble','Yes','IP'),('8890080750','Britney','No','IIT-D'),('8892150192','Vena','No','BITS'),('8908716867','Bessie','Yes','IIT-D'),('8971798049','Rozella','No','BITS'),('8987527827','Terrence','No','IIT-R'),('9036299663','Matilde','Yes','IP'),('9036769856','Laurine','Yes','IIIT-D'),('9065740457','Carolanne','No','NSUT'),('9153286894','Yoshiko','Yes','IP'),('9189388728','Layla','No','BITS'),('9198861319','Eveline','Yes','IIT-R'),('9218693683','Dillon','Yes','IIIT-D'),('9224362701','Eleonore','No','DTU'),('9227189122','Leilani','Yes','BITS'),('9243476384','Rosetta','No','IIT-R'),('9245632832','Everette','No','DTU'),('9262374768','Dianna','Yes','IIT-R'),('9265252481','Trent','Yes','NSUT'),('9271269310','Bo','No','NSUT'),('9280460562','Ruthe','No','DTU'),('9284026161','Dixie','No','IP'),('9313667054','Albert','Yes','IIIT-D'),('9319357651','Maye','Yes','IP'),('9399330868','Demarcus','No','IP'),('9403171551','Caterina','Yes','NSUT'),('9404808767','Amanda','No','IIT-D'),('9428489089','Norberto','Yes','IIT-R'),('9478516282','Alvina','Yes','IP'),('9485381663','Alphonso','Yes','IIIT-D'),('9487193976','Eliane','No','IP'),('9497006230','Dtinee','No','IP'),('9503535901','Terrell','Yes','IP'),('9526912880','Newell','Yes','NSUT'),('9532747237','Kyla','No','DTU'),('9543106116','Marion','Yes','IIT-D'),('9549317832','Lorna','No','NSUT'),('9567010088','Frieda','No','IIIT-D'),('9578061376','Demario','Yes','BITS'),('9635716211','Letitia','No','IP'),('9648124994','Dashawn','No','IIT-D'),('9682395610','Rasheed','No','IIT-D'),('9689531370','Deonte','No','IIIT-D'),('9727059643','Alysha','No','IIIT-D'),('9740829600','Jessyca','No','IIT-R'),('9747194784','Davon','Yes','IIIT-D'),('9749585257','Sheila','No','IP'),('9775918959','Zander','Yes','IIT-R'),('9790507140','Kelley','No','NSUT'),('9838251342','Sincere','No','IIIT-D'),('9843666378','Ewell','Yes','IIT-D'),('9854938557','Joanie','Yes','BITS'),('9874504419','Icie','No','DTU'),('9882179468','Iva','Yes','IP'),('9899691358','Caterina','No','IIIT-D'),('9921318393','Cade','Yes','BITS'),('9923250555','Mellie','No','BITS'),('9993687543','Bernardo','Yes','IIIT-D');


-- Participants

INSERT INTO `participants` VALUES ('8021923027','Mekhi','No','IIT-D','digiwar'),('8025438734','Bridgette','No','IIT-R','brain_fuzz'),('8041580055','Rhett','Yes','IIIT-D','brain_fuzz'),('8052410432','Eulah','Yes','BITS','brain_fuzz'),('8056787494','Tomasa','No','IIT-R','treasure_hunt'),('8060414416','Elian','No','DTU','segfault'),('8063505609','Roslyn','No','IIT-D','brain_fuzz'),('8085237305','Osborne','No','NSUT','code_in_less'),('8100321792','Katrina','No','IIT-D','treasure_hunt'),('8131713679','Lisette','Yes','IIT-R','prosort'),('8177563681','Kristian','Yes','BITS','segfault'),('8199081746','Brook','No','NSUT','segfault'),('8227164774','Tatyana','No','NSUT','treasure_hunt'),('8236283971','Verda','Yes','IIIT-D','blind_coding'),('8247349245','Gerard','No','DTU','robowar'),('8262064726','Verla','No','IP','segfault'),('8277591642','Lee','No','IIT-D','segfault'),('8302612219','Bulah','No','DTU','treasure_hunt'),('8315140939','Viola','No','IP','robowar'),('8329619347','Jaren','Yes','NSUT','brain_fuzz'),('8344274864','Karen','Yes','IIT-R','blind_coding'),('8415923771','Herta','No','IP','brain_fuzz'),('8441118060','Mikel','Yes','IIIT-D','brain_fuzz'),('8445336545','Eduardo','No','IIIT-D','code_in_less'),('8450047626','Pablo','Yes','BITS','robowar'),('8457884840','Meda','No','IIIT-D','brain_fuzz'),('8482347596','Mike','No','IIT-D','blind_coding'),('8482758650','Khalil','Yes','NSUT','blind_coding'),('8488137984','Jettie','No','BITS','treasure_hunt'),('8542670041','Jerome','No','NSUT','brain_fuzz'),('8563655890','Alessandra','Yes','IIIT-D','robowar'),('8605479130','Buddy','No','BITS','treasure_hunt'),('8605731436','Gerson','Yes','IIT-D','treasure_hunt'),('8648074956','Trever','Yes','IP','code_in_less'),('8691601558','Rozella','No','IIT-D','treasure_hunt'),('8763637088','Catherine','No','NSUT','robowar'),('8770416242','Sallie','Yes','IIT-R','treasure_hunt'),('8771421003','Marcella','No','IP','robowar'),('8773820585','Alaina','No','IIT-D','digiwar'),('8780517445','Heath','No','IP','digiwar'),('8811941759','Greta','Yes','DTU','blind_coding'),('8829499566','Reginald','No','DTU','treasure_hunt'),('8866176084','Syble','Yes','IP','prosort'),('8890080750','Britney','No','IIT-D','digiwar'),('8892150192','Vena','No','BITS','blind_coding'),('8908716867','Bessie','Yes','IIT-D','robowar'),('8971798049','Rozella','No','BITS','segfault'),('8987527827','Terrence','No','IIT-R','segfault'),('9036299663','Matilde','Yes','IP','digiwar'),('9036769856','Laurine','Yes','IIIT-D','robowar'),('9065740457','Carolanne','No','NSUT','brain_fuzz'),('9153286894','Yoshiko','Yes','IP','brain_fuzz'),('9189388728','Layla','No','BITS','brain_fuzz'),('9198861319','Eveline','Yes','IIT-R','code_in_less'),('9218693683','Dillon','Yes','IIIT-D','prosort'),('9224362701','Eleonore','No','DTU','code_in_less'),('9227189122','Leilani','Yes','BITS','digiwar'),('9243476384','Rosetta','No','IIT-R','prosort'),('9245632832','Everette','No','DTU','digiwar'),('9262374768','Dianna','Yes','IIT-R','brain_fuzz'),('9265252481','Trent','Yes','NSUT','digiwar'),('9271269310','Bo','No','NSUT','code_in_less'),('9280460562','Ruthe','No','DTU','treasure_hunt'),('9284026161','Dixie','No','IP','code_in_less'),('9313667054','Albert','Yes','IIIT-D','code_in_less'),('9319357651','Maye','Yes','IP','prosort'),('9399330868','Demarcus','No','IP','code_in_less'),('9403171551','Caterina','Yes','NSUT','blind_coding'),('9404808767','Amanda','No','IIT-D','brain_fuzz'),('9428489089','Norberto','Yes','IIT-R','treasure_hunt'),('9478516282','Alvina','Yes','IP','robowar'),('9485381663','Alphonso','Yes','IIIT-D','code_in_less'),('9487193976','Eliane','No','IP','prosort'),('9497006230','Destinee','No','IP','treasure_hunt'),('9503535901','Terrell','Yes','IP','prosort'),('9526912880','Newell','Yes','NSUT','segfault'),('9532747237','Kyla','No','DTU','brain_fuzz'),('9543106116','Marion','Yes','IIT-D','code_in_less'),('9549317832','Lorna','No','NSUT','blind_coding'),('9567010088','Frieda','No','IIIT-D','robowar'),('9578061376','Demario','Yes','BITS','brain_fuzz'),('9635716211','Letitia','No','IP','digiwar'),('9648124994','Dashawn','No','IIT-D','brain_fuzz'),('9682395610','Rasheed','No','IIT-D','prosort'),('9689531370','Deonte','No','IIIT-D','blind_coding'),('9727059643','Alysha','No','IIIT-D','robowar'),('9740829600','Jessyca','No','IIT-R','treasure_hunt'),('9747194784','Davon','Yes','IIIT-D','code_in_less'),('9749585257','Sheila','No','IP','blind_coding'),('9775918959','Zander','Yes','IIT-R','brain_fuzz'),('9790507140','Kelley','No','NSUT','brain_fuzz'),('9838251342','Sincere','No','IIIT-D','code_in_less'),('9843666378','Ewell','Yes','IIT-D','code_in_less'),('9854938557','Joanie','Yes','BITS','digiwar'),('9874504419','Icie','No','DTU','segfault'),('9882179468','Iva','Yes','IP','code_in_less'),('9899691358','Caterina','No','IIIT-D','segfault'),('9921318393','Cade','Yes','BITS','prosort'),('9923250555','Mellie','No','BITS','digiwar'),('9993687543','Bernardo','Yes','IIIT-D','segfault');

-- Stalls

INSERT INTO `stalls` VALUES (1001,'bittu_tikki','Gregorio','entertainment','seminar block','02:07:58','02:11:35','8189348631','izieme@example.net',19678),(1004,'FoodSPice','Angelo','entertainment',' parking','19:15:24','09:11:51','9706238797','annette44@example.com',13283),(1026,'X-gaming','Matt','entertainment',' parking','07:39:22','15:41:01','8096209812','elda.sporer@example.net',11033),(1049,'haldiram','Emerald','art','old acad','14:05:23','15:13:58','9317132680','brandon09@example.org',19382),(1053,'FoodDepot','Edyth','art','seminar block','15:17:56','03:11:01','9651055436','reilly.ophelia@example.org',17364),(1065,'pepperSmith','Oliver','art','old acad','13:32:27','19:10:56','9036220201','nbarton@example.org',19320),(1067,'RockinYou','Talia','entertainment',' parking','12:25:57','11:08:17','8028842248','jkirlin@example.net',13236),(1076,'KFC','Etha','food','seminar block','01:31:04','08:14:39','8032456690','ricky.reichel@example.com',17897),(1080,'SpringMart','Lauryn','entertainment','seminar block','21:22:21','19:40:54','9791102472','fweissnat@example.com',10098),(1093,'Subway','Tevin','food','seminar block','06:06:20','05:20:34','9842429009','xgoyette@example.com',11045);

-- Sponsors

INSERT INTO `sponsors` VALUES ('Lorenz',5003,'ufarrell@example.org','8396118656',22578,'Showcase products and services','No','Ferry, Waters and Okuneva'),('Enrique',5023,'estel.purdy@example.org','9526142313',9397,'Showcase products and services','Yes','Harris Inc'),('Cyrus',5029,'bailey.triston@example.org','9583079557',4879,'Showcase products and services','Yes','Flatley, Paucek and Witting'),('Jermain',5042,'althea34@example.com','8097646174',30393,'Create awareness of the brand','No','Corkery, Blick and Rutherford'),('Florencio',5064,'bill.waelchi@example.org','9640462684',42405,'Create awareness of the brand','No','Lakin, Feest and Carroll'),('Mac',5070,'kihn.dustin@example.net','8690221524',8714,'Increase sales','Yes','Lebsack LLC'),('Prince',5076,'bryce.collier@example.org','9793121649',9977,'Create awareness of the brand','No','Tremblay, Nienow and Ritchie'),('Amparo',5078,'champlin.reyes@example.net','8352190541',8874,'Increase brand loyalty','Yes','Langworth, Lindgren and Parker'),('Moises',5086,'otto21@example.net','9780097393',23048,'Highlight community responsibility','Yes','Bartoletti-Stark'),('Sylvester',5095,'trenton.nienow@example.com','8025524426',28869,'Create awareness of the brand','Yes','Pollich LLC');

insert into sponsors value('Allu Arjun',5002,'allu123@iocl.com','9899999999',20000,'Create awareness of the brand','No','IOCL');
insert into sponsors value('Amy Jackson',5004,'amy1222@infosys.com','9812345999',10000,'Create technological awareness','No','Infosys');
insert into sponsors value('Mohini appam',5024,'mohiniappam@ibm.com','8890678810',15000,'Take knowlegde to grassroot level','No','IBM technologies');
insert into sponsors value('Rajan raghav',5001,'raghavr1992@delltechnology.com','9899123456',30000,'Spread knowledge','No','Dell');
INSERT INTO `sponsors` (`name`, `sponsor_id`, `email`, `mobile_no`, `funds`, `expectations`, `stalls`, `organinsation`) VALUES ('Jack Ma', '5050', 'jackma@gmail.com', '7776663332', '300000', 'Advertisement of brand', 'No', 'Flipkart');
INSERT INTO `sponsors` (`name`, `sponsor_id`, `email`, `mobile_no`, `funds`, `expectations`, `stalls`, `organinsation`) VALUES ('Sundar Pichai', '5052', 'sundarwashi@gmail.com', '7775555332', '500000', 'Spreading Knowledge', 'No', 'Google');
INSERT INTO `sponsors` (`name`, `sponsor_id`, `email`, `mobile_no`, `funds`, `expectations`, `stalls`, `organinsation`) VALUES ('Jeff bezos', '5053', 'jeffrybezos@gmail.com', '7776663399', '400000', 'Advertisement of brand', 'No', 'Amazon');





-- Fest

insert into fest (Fest_name,start_date,end_date,fest_desc,venue,mainsponsor,no_of_attendees,no_of_participants) values ('Odyssey','26-01-21','29-01-21','IIITD''s cultural fest','IIIT-D','Amazon',1000,200);
insert into fest (Fest_name,start_date,end_date,fest_desc,venue,mainsponsor,no_of_attendees,no_of_participants) values ('Esya','26-09-21','29-09-21','IIITD''s cultural fest','IIIT-D','Amazon',500,200);
insert into fest (Fest_name,start_date,end_date,fest_desc,venue,mainsponsor,no_of_attendees,no_of_participants) values ('Elysium','26-03-21','29-03-21','IIITD''s  tech week','IIIT-D','Google',300,150);


-- Cultural Committee

insert into cultural_committee(name,email,branch,role, fest_id) value('Dishani Apte','dishaniapte658@gmail.com','CSE','vice president',1);
insert into cultural_committee(name,email,branch,role, fest_id) value('Farhaan Sinha','farhansin228@gmail.com','CSE','treasurer',1);
insert into cultural_committee(name,email,branch,role, fest_id) value('Himmat Lad','himmatl111@gmail.com','CSAM','convener',1);
insert into cultural_committee(name,email,branch,role, fest_id) value('keya Dutt','keyadutt999@gmail.com','CSD','sponser',1);
insert into cultural_committee(name,email,branch,role, fest_id) value('Lohan Das','lohandas118@gmail.com','CSSS','operations',1);
insert into cultural_committee(name,email,branch,role, fest_id) value('Mudit Aggarwal','muditagg007@gmail.com','CSE','mentor',2);
insert into cultural_committee(name,email,branch,role, fest_id) value('Tarun khanna','tarunkhanna100@gmail.com','CSD','convener',2);
insert into cultural_committee(name,email,branch,role, fest_id) value('Agamdeep Bains','agambains198@gmail.com','CSB','publicity',2);
insert into cultural_committee(name,email,branch,role, fest_id) value('Samyak Jain','sammyjain218@gmail.com','CSE','sponsor',2);
insert into cultural_committee(name,email,branch,role, fest_id) value('Sarthak Johari','sarthokjo999@gmail.com','ECE','Nirvana',2);
insert into cultural_committee(name,email,branch,role, fest_id) value('Varun Chaturvedi','varunchat008@gmail.com','ECE','Mentor',3);
insert into cultural_committee(name,email,branch,role, fest_id) value('Saajan Mohan','saajanl111@gmail.com','CSAM','event',1);
insert into cultural_committee(name,email,branch,role, fest_id) value('Harry Sanghvi', 'harryhard929@gmail.com', 'CSAI', 'Publicity', 1);


-- OrganisingTeam

insert into organisingTeam(name,email,event_incharge,role) value('Nischay Sandhu','nischays009@gmail.com','prosort','event head');
insert into organisingTeam(name,email,event_incharge,role) value('Parth Mittal','parthm095@gmail.com','robowar','event head');
insert into organisingTeam(name,email,event_incharge,role) value('Kesar Haroon','kesarhar022@gmail.com','digiwar','event head');
insert into organisingTeam(name,email,event_incharge,role) value('Ayushi Jain','ayushijain709@gmail.com','treasure hunt','event head');
insert into organisingTeam(name,email,event_incharge,role) value('Hitesha chandrani','hiteshachand509@gmail.com','blind_coding','event head');
insert into organisingTeam(name,email,event_incharge,role) value('Mukesh Kamra','mukeshkamra@gmail.com','code_in_less','event head');
insert into organisingTeam(name,email,event_incharge,role) value('Manmohan Singh','manmohansingh099@gmail.com','brain_fuzz','event head');
insert into organisingTeam(name,email,event_incharge,role) value('Mudra Bhandari','mudrabhand009@gmail.com','segfault','event head');
insert into organisingTeam(name,email,event_incharge,role) value('Manmoksh','manny111@gmail.com',null,'publicity head');
insert into organisingTeam(name,email,event_incharge,role) value('Jasleen Kaur','jasleen101@gmail.com',null,'treasurer');
insert into organisingTeam(name,email,event_incharge,role) value('Mitra Singhal','mitrasinghal911@gmail.com',null,'sponsorship');
insert into organisingTeam(name,email,event_incharge,role) value('Hanit Banga','hanitb264@gmail.com',null,'operations');
insert into organisingTeam(name,email,event_incharge,role) value('Utsav Rohilla','utsavr007@gmail.com',null,'nirvana');

-- Event

insert into event(event_name,club,event_head,volunteers,event_date,start_time,end_time,venue,sponsors,revenue,winner) value('prosort','foobar','Nischay Sandhu','arushchanda813@gmail.com, adiraluthra777@gmail.com, advikadani111@gmail.com','2021-10-21','16:00:00','18:00:00','C-302','Lakin, Feest and Carroll',42405,'Gautam Adani, Aryan Behal');
insert into event(event_name,club,event_head,volunteers,event_date,start_time,end_time,venue,sponsors,revenue,winner) value('robowar','electroholics','Parth Mittal','advikhari456@gmail.com, alishachadha101@gmail.com, anviseth944@gmail.com','2021-10-21','16:30:00','18:00:00','C-22','Corkery, Blick and Rutherford',30393,'Meetakshi, Mrigankshi');
insert into event(event_name,club,event_head,volunteers,event_date,start_time,end_time,venue,sponsors,revenue,winner) value('digiwar','UAV','Kesar Haroon','harshitak122@gmail.com, divitshree677@gmail.com, yashbhargava334@gmail.com','2021-10-21','15:00:00','16:30:00','C-102','Ferry, Waters and Okuneva',22578,'Gaurav Kapur, Ishan mehta');
insert into event(event_name,club,event_head,volunteers,event_date,start_time,end_time,venue,sponsors,revenue,winner) value('treasure_hunt',null,'Ayushi Jain','binodkumar555@gmail.com, heersandhu433@gmail.com, raniraj666@gmail.com','2021-10-22','17:00:00','18:00:00','C-12','Tremblay, Nienow and Ritchie',9977,'Jagaval, Sreenath');
insert into event(event_name,club,event_head,volunteers,event_date,start_time,end_time,venue,sponsors,revenue,winner) value('blind_coding','foobar','Hitesha Chandrani','hiranbabu766@gmail.com, gyanhardik888@gmail.com, hardikpandya009@gmail.com','2021-10-22','18:00:00','19:00:00','C-201','Infosys',10000,'Rushil, Krishna');
insert into event(event_name,club,event_head,volunteers,event_date,start_time,end_time,venue,sponsors,revenue,winner) value('code_in_less','foobar','Mukesh Kamra','jasminekaur223@gmail.com, manjarikaur555@gmail.com, divinfernando231@gmail.com','2021-10-23','16:00:00','17:00:00','C-101','IBM',15000,'Mohaniya, Soniya');
insert into event(event_name,club,event_head,volunteers,event_date,start_time,end_time,venue,sponsors,revenue,winner) value('brain_fuzz','darkcode','Manmohan Singh','deepankarjiwanu912@gmail.com, freemanpaul444@gmail.com, johnsnow666@gmail.com','2021-10-24','17:00:00','18:00:00','C-102','IOCL',20000,'Geetanjali, Mitanjali');
insert into event(event_name,club,event_head,volunteers,event_date,start_time,end_time,venue,sponsors,revenue,winner) value('segfault','byld','Mudra Bhandari','chrisgayle010@gmail.com, samreshchatterjee999@gmail.com, ashishpandey626@gmail.com','2021-10-24','13:00:00','14:00:00','C-21','Dell',30000,'Meenal, Sheetal');

-- Volunteer

insert into volunteer(name,email,event_lead,event_id) value('Arush Chanda','arushchanda813@gmail.com','Nischay Sandhu',1);
insert into volunteer(name,email,event_lead,event_id) value('Adira Luthra','adiraluthra777@gmail.com','Nischay Sandhu',1);
insert into volunteer(name,email,event_lead,event_id) value('Advika Dani',' advikadani111@gmail.com','Nischay Sandhu',1);
insert into volunteer(name,email,event_lead,event_id) value('Advik hari','advikhari456@gmail.com,','Parth Mittal',2);
insert into volunteer(name,email,event_lead,event_id) value('Alisha Chadha','alishachadha101@gmail.com','Parth Mittal',2);
insert into volunteer(name,email,event_lead,event_id) value('Anvi Sethi','anviseth944@gmail.com','Parth Mittal',2);
insert into volunteer(name,email,event_lead,event_id) value('Harshita Kumar','harshitak122@gmail.com,','Kesar Haroon',3);
insert into volunteer(name,email,event_lead,event_id) value('Divit Shree','divitshree677@gmail.com','Kesar Haroon',3);
insert into volunteer(name,email,event_lead,event_id) value('Yash Bhargava','yashbhargava334@gmail.com','Kesar Haroon',3);
insert into volunteer(name,email,event_lead,event_id) value('Binod Kumar','binodkumar555@gmail.com','Ayushi Jain',4);
insert into volunteer(name,email,event_lead,event_id) value('Heer Sandhu','heersandhu433@gmail.com','Ayushi Jain',4);
insert into volunteer(name,email,event_lead,event_id) value('Rani Raj','raniraj666@gmail.com','Ayushi Jain',4);
insert into volunteer(name,email,event_lead,event_id) value('Hiran babu','hiranbabu766@gmail.com','Hitesha Chandrani',5);
insert into volunteer(name,email,event_lead,event_id) value('Gyan Hardik','gyanhardik888@gmail.com','Hitesha Chandrani',5);
insert into volunteer(name,email,event_lead,event_id) value('Hardik Pandya','hardikpandya009@gmail.com','Hitesha Chandrani',5);
insert into volunteer(name,email,event_lead,event_id) value('Jasmine Kaur','jasminekaur223@gmail.com','Mukesh Kamra',6);
insert into volunteer(name,email,event_lead,event_id) value('Manjari kaur','manjarikaur555@gmail.com','Mukesh Kamra',6);
insert into volunteer(name,email,event_lead,event_id) value('Divin Fernando','divinfernando231@gmail.com','Mukesh Kamra',6);
insert into volunteer(name,email,event_lead,event_id) value('Deepankar Jiwanu','deepankarjiwanu912@gmail.com','Manmohan Singh',7);
insert into volunteer(name,email,event_lead,event_id) value('Freeman Paul','freemanpaul444@gmail.com, ','Manmohan Singh',7);
insert into volunteer(name,email,event_lead,event_id) value('John Snow','johnsnow666@gmail.com','Manmohan Singh',7);
insert into volunteer(name,email,event_lead,event_id) value('Chris Gayle','chrisgayle010@gmail.com','Mudra Bhandari',8);
insert into volunteer(name,email,event_lead,event_id) value('Samresh Chatterjee','samreshchatterjee999@gmail.com','Mudra Bhandari',8);
insert into volunteer(name,email,event_lead,event_id) value('Ashish Pandey','ashishpandey626@gmail.com','Mudra Bhandari',8);

-- incharge

INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('saajanl111@gmail.com', 'ayushijain709@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('lohandas118@gmail.com', 'hanitb264@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('saajanl111@gmail.com', 'hiteshachand509@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('farhansin228@gmail.com', 'jasleen101@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('saajanl111@gmail.com', 'kesarhar022@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('saajanl111@gmail.com', 'manmohansingh099@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('saajanl111@gmail.com', 'mudrabhand009@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('saajanl111@gmail.com', 'mukeshkamra@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('saajanl111@gmail.com', 'nischays009@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('saajanl111@gmail.com', 'parthm095@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('harryhard929@gmail.com', 'manny111@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('keyadutt999@gmail.com', 'mitrasinghal911@gmail.com');
INSERT INTO `incharge` (`email_cc`, `email_ot`) VALUES ('sarthokjo999@gmail.com', 'utsavr007@gmail.com');

-- attend

insert into attend(mobile_no,fest_id) value('8005631031',2);
insert into attend(mobile_no,fest_id) value('8015090694',3);
insert into attend(mobile_no,fest_id) value('8021236123',1);
insert into attend(mobile_no,fest_id) value('8021923027',2);
insert into attend(mobile_no,fest_id) value('8025438734',3);
insert into attend(mobile_no,fest_id) value('8032594303',2);
insert into attend(mobile_no,fest_id) value('8039351783',3);
insert into attend(mobile_no,fest_id) value('8040806612',2);
insert into attend(mobile_no,fest_id) value('8041580055',3);
insert into attend(mobile_no,fest_id) value('8045420548',3);
insert into attend(mobile_no,fest_id) value('8052154349',3);
insert into attend(mobile_no,fest_id) value('8052410432',1);
insert into attend(mobile_no,fest_id) value('8056787494',2);
insert into attend(mobile_no,fest_id) value('8060414416',2);
insert into attend(mobile_no,fest_id) value('8063505609',1);
insert into attend(mobile_no,fest_id) value('8066401624',3);
insert into attend(mobile_no,fest_id) value('8075045386',3);
insert into attend(mobile_no,fest_id) value('8084438810',3);
insert into attend(mobile_no,fest_id) value('8084919431',2);
insert into attend(mobile_no,fest_id) value('8085237305',1);
insert into attend(mobile_no,fest_id) value('8100321792',1);
insert into attend(mobile_no,fest_id) value('8109584906',1);
insert into attend(mobile_no,fest_id) value('8114090533',3);
insert into attend(mobile_no,fest_id) value('8131713679',3);
insert into attend(mobile_no,fest_id) value('8137381942',3);
insert into attend(mobile_no,fest_id) value('8149369489',1);
insert into attend(mobile_no,fest_id) value('8167126188',2);
insert into attend(mobile_no,fest_id) value('8177563681',2);
insert into attend(mobile_no,fest_id) value('8182586641',2);
insert into attend(mobile_no,fest_id) value('8191229664',2);
insert into attend(mobile_no,fest_id) value('8199081746',3);
insert into attend(mobile_no,fest_id) value('8227164774',2);
insert into attend(mobile_no,fest_id) value('8236283971',1);
insert into attend(mobile_no,fest_id) value('8244878049',1);
insert into attend(mobile_no,fest_id) value('8247081762',2);
insert into attend(mobile_no,fest_id) value('8247349245',2);
insert into attend(mobile_no,fest_id) value('8252149908',3);
insert into attend(mobile_no,fest_id) value('8262064726',1);
insert into attend(mobile_no,fest_id) value('8268055399',2);
insert into attend(mobile_no,fest_id) value('8275261374',1);
insert into attend(mobile_no,fest_id) value('8277591642',2);
insert into attend(mobile_no,fest_id) value('8287377630',3);
insert into attend(mobile_no,fest_id) value('8297363602',2);
insert into attend(mobile_no,fest_id) value('8302612219',3);
insert into attend(mobile_no,fest_id) value('8306884956',2);
insert into attend(mobile_no,fest_id) value('8315140939',2);
insert into attend(mobile_no,fest_id) value('8316860239',3);
insert into attend(mobile_no,fest_id) value('8321110572',3);
insert into attend(mobile_no,fest_id) value('8322440478',1);
insert into attend(mobile_no,fest_id) value('8329619347',1);
insert into attend(mobile_no,fest_id) value('8343158456',1);
insert into attend(mobile_no,fest_id) value('8344274864',1);
insert into attend(mobile_no,fest_id) value('8352119874',3);
insert into attend(mobile_no,fest_id) value('8359283264',3);
insert into attend(mobile_no,fest_id) value('8376697130',3);
insert into attend(mobile_no,fest_id) value('8378389017',1);
insert into attend(mobile_no,fest_id) value('8383117298',3);
insert into attend(mobile_no,fest_id) value('8396588326',1);
insert into attend(mobile_no,fest_id) value('8415923771',3);
insert into attend(mobile_no,fest_id) value('8420593584',1);
insert into attend(mobile_no,fest_id) value('8435028309',1);
insert into attend(mobile_no,fest_id) value('8435532082',3);
insert into attend(mobile_no,fest_id) value('8441118060',2);
insert into attend(mobile_no,fest_id) value('8445336545',3);
insert into attend(mobile_no,fest_id) value('8450047626',1);
insert into attend(mobile_no,fest_id) value('8457802306',1);
insert into attend(mobile_no,fest_id) value('8457884840',1);
insert into attend(mobile_no,fest_id) value('8466506497',2);
insert into attend(mobile_no,fest_id) value('8466977590',1);
insert into attend(mobile_no,fest_id) value('8467039359',1);
insert into attend(mobile_no,fest_id) value('8468088030',3);
insert into attend(mobile_no,fest_id) value('8482347596',1);
insert into attend(mobile_no,fest_id) value('8482758650',3);
insert into attend(mobile_no,fest_id) value('8488137984',2);
insert into attend(mobile_no,fest_id) value('8494924183',3);
insert into attend(mobile_no,fest_id) value('8501036548',3);
insert into attend(mobile_no,fest_id) value('8510933836',3);
insert into attend(mobile_no,fest_id) value('8514539465',1);
insert into attend(mobile_no,fest_id) value('8518132333',3);
insert into attend(mobile_no,fest_id) value('8521032859',2);
insert into attend(mobile_no,fest_id) value('8542670041',1);
insert into attend(mobile_no,fest_id) value('8549016660',1);
insert into attend(mobile_no,fest_id) value('8555775788',3);
insert into attend(mobile_no,fest_id) value('8563655890',2);
insert into attend(mobile_no,fest_id) value('8602185696',1);
insert into attend(mobile_no,fest_id) value('8605479130',2);
insert into attend(mobile_no,fest_id) value('8605731436',2);
insert into attend(mobile_no,fest_id) value('8613505056',1);
insert into attend(mobile_no,fest_id) value('8625042185',1);
insert into attend(mobile_no,fest_id) value('8628794939',3);
insert into attend(mobile_no,fest_id) value('8642341371',1);
insert into attend(mobile_no,fest_id) value('8648074956',1);
insert into attend(mobile_no,fest_id) value('8651603646',3);
insert into attend(mobile_no,fest_id) value('8652782941',3);
insert into attend(mobile_no,fest_id) value('8654723546',3);
insert into attend(mobile_no,fest_id) value('8655509836',1);
insert into attend(mobile_no,fest_id) value('8670214169',1);
insert into attend(mobile_no,fest_id) value('8670884232',1);
insert into attend(mobile_no,fest_id) value('8675957567',3);
insert into attend(mobile_no,fest_id) value('8678575085',2);
insert into attend(mobile_no,fest_id) value('8688588669',2);
insert into attend(mobile_no,fest_id) value('8691601558',2);
insert into attend(mobile_no,fest_id) value('8692617822',3);
insert into attend(mobile_no,fest_id) value('8692947180',2);
insert into attend(mobile_no,fest_id) value('8706663466',2);
insert into attend(mobile_no,fest_id) value('8715972930',3);
insert into attend(mobile_no,fest_id) value('8737633824',2);
insert into attend(mobile_no,fest_id) value('8763637088',2);
insert into attend(mobile_no,fest_id) value('8763831662',3);
insert into attend(mobile_no,fest_id) value('8770416242',1);
insert into attend(mobile_no,fest_id) value('8771421003',3);
insert into attend(mobile_no,fest_id) value('8773820585',2);
insert into attend(mobile_no,fest_id) value('8780517445',3);
insert into attend(mobile_no,fest_id) value('8793019870',2);
insert into attend(mobile_no,fest_id) value('8793036110',3);
insert into attend(mobile_no,fest_id) value('8797247665',1);
insert into attend(mobile_no,fest_id) value('8799015738',2);
insert into attend(mobile_no,fest_id) value('8804047065',1);
insert into attend(mobile_no,fest_id) value('8811941759',2);
insert into attend(mobile_no,fest_id) value('8812988484',2);
insert into attend(mobile_no,fest_id) value('8822517297',1);
insert into attend(mobile_no,fest_id) value('8827583760',3);
insert into attend(mobile_no,fest_id) value('8828653142',1);
insert into attend(mobile_no,fest_id) value('8829499566',3);
insert into attend(mobile_no,fest_id) value('8833646395',2);
insert into attend(mobile_no,fest_id) value('8851393613',3);
insert into attend(mobile_no,fest_id) value('8861373730',2);
insert into attend(mobile_no,fest_id) value('8866176084',1);
insert into attend(mobile_no,fest_id) value('8866365836',3);
insert into attend(mobile_no,fest_id) value('8873928264',2);
insert into attend(mobile_no,fest_id) value('8881516274',3);
insert into attend(mobile_no,fest_id) value('8886539211',1);
insert into attend(mobile_no,fest_id) value('8890080750',1);
insert into attend(mobile_no,fest_id) value('8892150192',1);
insert into attend(mobile_no,fest_id) value('8894430948',2);
insert into attend(mobile_no,fest_id) value('8908716867',1);
insert into attend(mobile_no,fest_id) value('8926411061',3);
insert into attend(mobile_no,fest_id) value('8967208099',1);
insert into attend(mobile_no,fest_id) value('8971798049',2);
insert into attend(mobile_no,fest_id) value('8983541778',3);
insert into attend(mobile_no,fest_id) value('8987527827',3);
insert into attend(mobile_no,fest_id) value('8990485325',2);
insert into attend(mobile_no,fest_id) value('9004750449',2);
insert into attend(mobile_no,fest_id) value('9007312956',1);
insert into attend(mobile_no,fest_id) value('9020003771',2);
insert into attend(mobile_no,fest_id) value('9036299663',1);
insert into attend(mobile_no,fest_id) value('9036769856',2);
insert into attend(mobile_no,fest_id) value('9038468185',2);
insert into attend(mobile_no,fest_id) value('9041354746',1);
insert into attend(mobile_no,fest_id) value('9045716138',1);
insert into attend(mobile_no,fest_id) value('9048520829',1);
insert into attend(mobile_no,fest_id) value('9059364517',1);
insert into attend(mobile_no,fest_id) value('9061173457',3);
insert into attend(mobile_no,fest_id) value('9064468593',1);
insert into attend(mobile_no,fest_id) value('9065740457',1);
insert into attend(mobile_no,fest_id) value('9073213521',3);
insert into attend(mobile_no,fest_id) value('9096594449',2);
insert into attend(mobile_no,fest_id) value('9153286894',2);
insert into attend(mobile_no,fest_id) value('9181922689',1);
insert into attend(mobile_no,fest_id) value('9189388728',1);
insert into attend(mobile_no,fest_id) value('9192892662',1);
insert into attend(mobile_no,fest_id) value('9198861319',3);
insert into attend(mobile_no,fest_id) value('9199970448',2);
insert into attend(mobile_no,fest_id) value('9217887696',3);
insert into attend(mobile_no,fest_id) value('9218693683',3);
insert into attend(mobile_no,fest_id) value('9219971785',2);
insert into attend(mobile_no,fest_id) value('9220427787',2);
insert into attend(mobile_no,fest_id) value('9223388453',2);
insert into attend(mobile_no,fest_id) value('9224362701',1);
insert into attend(mobile_no,fest_id) value('9226194613',1);
insert into attend(mobile_no,fest_id) value('9227189122',2);
insert into attend(mobile_no,fest_id) value('9228467804',1);
insert into attend(mobile_no,fest_id) value('9230301241',3);
insert into attend(mobile_no,fest_id) value('9231764002',3);
insert into attend(mobile_no,fest_id) value('9237808333',2);
insert into attend(mobile_no,fest_id) value('9243476384',2);
insert into attend(mobile_no,fest_id) value('9245632832',3);
insert into attend(mobile_no,fest_id) value('9257716376',1);
insert into attend(mobile_no,fest_id) value('9262374768',3);
insert into attend(mobile_no,fest_id) value('9264048858',1);
insert into attend(mobile_no,fest_id) value('9265252481',1);
insert into attend(mobile_no,fest_id) value('9269861802',1);
insert into attend(mobile_no,fest_id) value('9271269310',3);
insert into attend(mobile_no,fest_id) value('9277929557',3);
insert into attend(mobile_no,fest_id) value('9280460562',3);
insert into attend(mobile_no,fest_id) value('9284026161',1);
insert into attend(mobile_no,fest_id) value('9301524886',1);
insert into attend(mobile_no,fest_id) value('9313667054',1);
insert into attend(mobile_no,fest_id) value('9319357651',1);
insert into attend(mobile_no,fest_id) value('9322801343',2);
insert into attend(mobile_no,fest_id) value('9347339824',2);
insert into attend(mobile_no,fest_id) value('9355762973',1);
insert into attend(mobile_no,fest_id) value('9366526838',3);
insert into attend(mobile_no,fest_id) value('9380749999',2);
insert into attend(mobile_no,fest_id) value('9392102554',3);
insert into attend(mobile_no,fest_id) value('9395931707',1);
insert into attend(mobile_no,fest_id) value('9399330868',1);
insert into attend(mobile_no,fest_id) value('9403171551',1);
insert into attend(mobile_no,fest_id) value('9404808767',2);
insert into attend(mobile_no,fest_id) value('9407364259',3);
insert into attend(mobile_no,fest_id) value('9428489089',3);
insert into attend(mobile_no,fest_id) value('9437647102',2);
insert into attend(mobile_no,fest_id) value('9439115413',2);
insert into attend(mobile_no,fest_id) value('9450790958',1);
insert into attend(mobile_no,fest_id) value('9457546082',3);
insert into attend(mobile_no,fest_id) value('9458774297',3);
insert into attend(mobile_no,fest_id) value('9459897381',3);
insert into attend(mobile_no,fest_id) value('9466286069',1);
insert into attend(mobile_no,fest_id) value('9478516282',1);
insert into attend(mobile_no,fest_id) value('9485180784',3);
insert into attend(mobile_no,fest_id) value('9485381663',3);
insert into attend(mobile_no,fest_id) value('9487193976',2);
insert into attend(mobile_no,fest_id) value('9489507295',2);
insert into attend(mobile_no,fest_id) value('9497006230',3);
insert into attend(mobile_no,fest_id) value('9503535901',1);
insert into attend(mobile_no,fest_id) value('9510017739',2);
insert into attend(mobile_no,fest_id) value('9526912880',3);
insert into attend(mobile_no,fest_id) value('9527840477',2);
insert into attend(mobile_no,fest_id) value('9528660740',1);
insert into attend(mobile_no,fest_id) value('9532747237',3);
insert into attend(mobile_no,fest_id) value('9534819380',2);
insert into attend(mobile_no,fest_id) value('9538801103',3);
insert into attend(mobile_no,fest_id) value('9543106116',2);
insert into attend(mobile_no,fest_id) value('9546216675',1);
insert into attend(mobile_no,fest_id) value('9547261088',3);
insert into attend(mobile_no,fest_id) value('9549317832',1);
insert into attend(mobile_no,fest_id) value('9550708334',3);
insert into attend(mobile_no,fest_id) value('9550946570',1);
insert into attend(mobile_no,fest_id) value('9562544909',3);
insert into attend(mobile_no,fest_id) value('9563072041',3);
insert into attend(mobile_no,fest_id) value('9563834923',3);
insert into attend(mobile_no,fest_id) value('9567010088',2);
insert into attend(mobile_no,fest_id) value('9578061376',2);
insert into attend(mobile_no,fest_id) value('9579524214',1);
insert into attend(mobile_no,fest_id) value('9581361345',2);
insert into attend(mobile_no,fest_id) value('9587500342',3);
insert into attend(mobile_no,fest_id) value('9602011404',1);
insert into attend(mobile_no,fest_id) value('9605960235',1);
insert into attend(mobile_no,fest_id) value('9610123582',1);
insert into attend(mobile_no,fest_id) value('9615178567',3);
insert into attend(mobile_no,fest_id) value('9624251773',3);
insert into attend(mobile_no,fest_id) value('9633413838',1);
insert into attend(mobile_no,fest_id) value('9635716211',2);
insert into attend(mobile_no,fest_id) value('9636813449',1);
insert into attend(mobile_no,fest_id) value('9641200587',3);
insert into attend(mobile_no,fest_id) value('9648124994',2);
insert into attend(mobile_no,fest_id) value('9661057917',1);
insert into attend(mobile_no,fest_id) value('9663024876',1);
insert into attend(mobile_no,fest_id) value('9681488866',1);
insert into attend(mobile_no,fest_id) value('9682395610',2);
insert into attend(mobile_no,fest_id) value('9689531370',3);
insert into attend(mobile_no,fest_id) value('9690150214',2);
insert into attend(mobile_no,fest_id) value('9725793906',3);
insert into attend(mobile_no,fest_id) value('9727059643',1);
insert into attend(mobile_no,fest_id) value('9727567550',1);
insert into attend(mobile_no,fest_id) value('9740829600',3);
insert into attend(mobile_no,fest_id) value('9740879097',3);
insert into attend(mobile_no,fest_id) value('9740893033',3);
insert into attend(mobile_no,fest_id) value('9741228627',1);
insert into attend(mobile_no,fest_id) value('9745037114',1);
insert into attend(mobile_no,fest_id) value('9747194784',1);
insert into attend(mobile_no,fest_id) value('9747248001',2);
insert into attend(mobile_no,fest_id) value('9749585257',2);
insert into attend(mobile_no,fest_id) value('9775918959',1);
insert into attend(mobile_no,fest_id) value('9778108392',1);
insert into attend(mobile_no,fest_id) value('9785550843',1);
insert into attend(mobile_no,fest_id) value('9789170501',3);
insert into attend(mobile_no,fest_id) value('9790507140',1);
insert into attend(mobile_no,fest_id) value('9792636074',1);
insert into attend(mobile_no,fest_id) value('9804352811',2);
insert into attend(mobile_no,fest_id) value('9823584122',1);
insert into attend(mobile_no,fest_id) value('9829192693',3);
insert into attend(mobile_no,fest_id) value('9832844560',2);
insert into attend(mobile_no,fest_id) value('9838251342',2);
insert into attend(mobile_no,fest_id) value('9840240075',2);
insert into attend(mobile_no,fest_id) value('9843666378',2);
insert into attend(mobile_no,fest_id) value('9854938557',1);
insert into attend(mobile_no,fest_id) value('9864419603',2);
insert into attend(mobile_no,fest_id) value('9870290234',2);
insert into attend(mobile_no,fest_id) value('9874504419',3);
insert into attend(mobile_no,fest_id) value('9882179468',1);
insert into attend(mobile_no,fest_id) value('9893692097',1);
insert into attend(mobile_no,fest_id) value('9894751956',3);
insert into attend(mobile_no,fest_id) value('9899691358',3);
insert into attend(mobile_no,fest_id) value('9906440394',1);
insert into attend(mobile_no,fest_id) value('9918288169',3);
insert into attend(mobile_no,fest_id) value('9921318393',2);
insert into attend(mobile_no,fest_id) value('9923250555',2);
insert into attend(mobile_no,fest_id) value('9923252622',1);
insert into attend(mobile_no,fest_id) value('9935423847',3);
insert into attend(mobile_no,fest_id) value('9936892554',2);
insert into attend(mobile_no,fest_id) value('9943090843',3);
insert into attend(mobile_no,fest_id) value('9948871650',2);
insert into attend(mobile_no,fest_id) value('9954479723',1);
insert into attend(mobile_no,fest_id) value('9959746713',2);
insert into attend(mobile_no,fest_id) value('9966716389',3);
insert into attend(mobile_no,fest_id) value('9984010101',3);
insert into attend(mobile_no,fest_id) value('9984627855',1);
insert into attend(mobile_no,fest_id) value('9993687543',1);
insert into attend(mobile_no,fest_id) value('9995530140',1);


-- participate

insert into participate(mobile_no,event_id) value('8021923027',5);
insert into participate(mobile_no,event_id) value('8025438734',4);
insert into participate(mobile_no,event_id) value('8041580055',6);
insert into participate(mobile_no,event_id) value('8052410432',2);
insert into participate(mobile_no,event_id) value('8056787494',6);
insert into participate(mobile_no,event_id) value('8060414416',1);
insert into participate(mobile_no,event_id) value('8063505609',4);
insert into participate(mobile_no,event_id) value('8085237305',6);
insert into participate(mobile_no,event_id) value('8100321792',3);
insert into participate(mobile_no,event_id) value('8131713679',7);
insert into participate(mobile_no,event_id) value('8177563681',1);
insert into participate(mobile_no,event_id) value('8199081746',1);
insert into participate(mobile_no,event_id) value('8227164774',5);
insert into participate(mobile_no,event_id) value('8236283971',5);
insert into participate(mobile_no,event_id) value('8247349245',8);
insert into participate(mobile_no,event_id) value('8262064726',3);
insert into participate(mobile_no,event_id) value('8277591642',8);
insert into participate(mobile_no,event_id) value('8302612219',2);
insert into participate(mobile_no,event_id) value('8315140939',2);
insert into participate(mobile_no,event_id) value('8329619347',8);
insert into participate(mobile_no,event_id) value('8344274864',4);
insert into participate(mobile_no,event_id) value('8415923771',2);
insert into participate(mobile_no,event_id) value('8441118060',4);
insert into participate(mobile_no,event_id) value('8445336545',2);
insert into participate(mobile_no,event_id) value('8450047626',5);
insert into participate(mobile_no,event_id) value('8457884840',1);
insert into participate(mobile_no,event_id) value('8482347596',3);
insert into participate(mobile_no,event_id) value('8482758650',3);
insert into participate(mobile_no,event_id) value('8488137984',8);
insert into participate(mobile_no,event_id) value('8542670041',7);
insert into participate(mobile_no,event_id) value('8563655890',6);
insert into participate(mobile_no,event_id) value('8605479130',5);
insert into participate(mobile_no,event_id) value('8605731436',8);
insert into participate(mobile_no,event_id) value('8648074956',4);
insert into participate(mobile_no,event_id) value('8691601558',4);
insert into participate(mobile_no,event_id) value('8763637088',5);
insert into participate(mobile_no,event_id) value('8770416242',7);
insert into participate(mobile_no,event_id) value('8771421003',6);
insert into participate(mobile_no,event_id) value('8773820585',5);
insert into participate(mobile_no,event_id) value('8780517445',5);
insert into participate(mobile_no,event_id) value('8811941759',8);
insert into participate(mobile_no,event_id) value('8829499566',8);
insert into participate(mobile_no,event_id) value('8866176084',5);
insert into participate(mobile_no,event_id) value('8890080750',2);
insert into participate(mobile_no,event_id) value('8892150192',5);
insert into participate(mobile_no,event_id) value('8908716867',5);
insert into participate(mobile_no,event_id) value('8971798049',6);
insert into participate(mobile_no,event_id) value('8987527827',5);
insert into participate(mobile_no,event_id) value('9036299663',4);
insert into participate(mobile_no,event_id) value('9036769856',6);
insert into participate(mobile_no,event_id) value('9065740457',4);
insert into participate(mobile_no,event_id) value('9153286894',5);
insert into participate(mobile_no,event_id) value('9189388728',8);
insert into participate(mobile_no,event_id) value('9198861319',1);
insert into participate(mobile_no,event_id) value('9218693683',7);
insert into participate(mobile_no,event_id) value('9224362701',5);
insert into participate(mobile_no,event_id) value('9227189122',5);
insert into participate(mobile_no,event_id) value('9243476384',3);
insert into participate(mobile_no,event_id) value('9245632832',5);
insert into participate(mobile_no,event_id) value('9262374768',2);
insert into participate(mobile_no,event_id) value('9265252481',3);
insert into participate(mobile_no,event_id) value('9271269310',6);
insert into participate(mobile_no,event_id) value('9280460562',7);
insert into participate(mobile_no,event_id) value('9284026161',1);
insert into participate(mobile_no,event_id) value('9313667054',7);
insert into participate(mobile_no,event_id) value('9319357651',6);
insert into participate(mobile_no,event_id) value('9399330868',5);
insert into participate(mobile_no,event_id) value('9403171551',6);
insert into participate(mobile_no,event_id) value('9404808767',6);
insert into participate(mobile_no,event_id) value('9428489089',8);
insert into participate(mobile_no,event_id) value('9478516282',3);
insert into participate(mobile_no,event_id) value('9485381663',7);
insert into participate(mobile_no,event_id) value('9487193976',4);
insert into participate(mobile_no,event_id) value('9497006230',5);
insert into participate(mobile_no,event_id) value('9503535901',6);
insert into participate(mobile_no,event_id) value('9526912880',2);
insert into participate(mobile_no,event_id) value('9532747237',5);
insert into participate(mobile_no,event_id) value('9543106116',6);
insert into participate(mobile_no,event_id) value('9549317832',2);
insert into participate(mobile_no,event_id) value('9567010088',5);
insert into participate(mobile_no,event_id) value('9578061376',1);
insert into participate(mobile_no,event_id) value('9635716211',8);
insert into participate(mobile_no,event_id) value('9648124994',6);
insert into participate(mobile_no,event_id) value('9682395610',5);
insert into participate(mobile_no,event_id) value('9689531370',5);
insert into participate(mobile_no,event_id) value('9727059643',2);
insert into participate(mobile_no,event_id) value('9740829600',3);
insert into participate(mobile_no,event_id) value('9747194784',8);
insert into participate(mobile_no,event_id) value('9749585257',7);
insert into participate(mobile_no,event_id) value('9775918959',4);
insert into participate(mobile_no,event_id) value('9790507140',8);
insert into participate(mobile_no,event_id) value('9838251342',6);
insert into participate(mobile_no,event_id) value('9843666378',2);
insert into participate(mobile_no,event_id) value('9854938557',2);
insert into participate(mobile_no,event_id) value('9874504419',1);
insert into participate(mobile_no,event_id) value('9882179468',5);
insert into participate(mobile_no,event_id) value('9899691358',3);
insert into participate(mobile_no,event_id) value('9921318393',1);
insert into participate(mobile_no,event_id) value('9923250555',1);
insert into participate(mobile_no,event_id) value('9993687543',5);


-- exhibits
insert into exhibits(stall_id,fest_id) value('1001',1);
insert into exhibits(stall_id,fest_id) value('1004',1);
insert into exhibits(stall_id,fest_id) value('1026',2);
insert into exhibits(stall_id,fest_id) value('1049',2);
insert into exhibits(stall_id,fest_id) value('1053',2);
insert into exhibits(stall_id,fest_id) value('1065',1);
insert into exhibits(stall_id,fest_id) value('1067',1);
insert into exhibits(stall_id,fest_id) value('1076',1);
insert into exhibits(stall_id,fest_id) value('1080',3);
insert into exhibits(stall_id,fest_id) value('1093',3);



-- passwords


insert into authentication(userName,pwd,userType) value('8005631031','x5rS3Qq','Attendees');
insert into authentication(username,pwd,userType) value('8015090694','s17wT86','Attendees');
insert into authentication(username,pwd,userType) value('8021236123','X9u668s','Attendees');
insert into authentication(username,pwd,userType) value('8032594303','j8D2z7T','Attendees');
insert into authentication(username,pwd,userType) value('8039351783','x22ag9r','Attendees');
insert into authentication(username,pwd,userType) value('8040806612','GF80dbe','Attendees');
insert into authentication(username,pwd,userType) value('8045420548','yL1iJd8','Attendees');
insert into authentication(username,pwd,userType) value('8052154349','KO9x3tj','Attendees');
insert into authentication(username,pwd,userType) value('8066401624','defjt6H','Attendees');
insert into authentication(username,pwd,userType) value('8075045386','ltO1Dzl','Attendees');
insert into authentication(username,pwd,userType) value('8084438810','m5fPf8d','Attendees');
insert into authentication(username,pwd,userType) value('8084919431','J5yTwv7','Attendees');
insert into authentication(username,pwd,userType) value('8109584906','A05HCKR','Attendees');
insert into authentication(username,pwd,userType) value('8114090533','Sff27Jc','Attendees');
insert into authentication(username,pwd,userType) value('8137381942','Ov8b1R7','Attendees');
insert into authentication(username,pwd,userType) value('8149369489','d82QNL8','Attendees');
insert into authentication(username,pwd,userType) value('8167126188','2z7GeWF','Attendees');
insert into authentication(username,pwd,userType) value('8182586641','l75ZwFL','Attendees');
insert into authentication(username,pwd,userType) value('8191229664','J4bf46I','Attendees');
insert into authentication(username,pwd,userType) value('8244878049','QCxoJDd','Attendees');
insert into authentication(username,pwd,userType) value('8247081762','MaXJLmw','Attendees');
insert into authentication(username,pwd,userType) value('8252149908','o84NPje','Attendees');
insert into authentication(username,pwd,userType) value('8268055399','t17gtK3','Attendees');
insert into authentication(username,pwd,userType) value('8275261374','ksVr5je','Attendees');
insert into authentication(username,pwd,userType) value('8287377630','sPkA58I','Attendees');
insert into authentication(username,pwd,userType) value('8297363602','38Hj8oG','Attendees');
insert into authentication(username,pwd,userType) value('8306884956','hIv0W3W','Attendees');
insert into authentication(username,pwd,userType) value('8316860239','svTJs4k','Attendees');
insert into authentication(username,pwd,userType) value('8321110572','4LHshUs','Attendees');
insert into authentication(username,pwd,userType) value('8322440478','zTtbELV','Attendees');
insert into authentication(username,pwd,userType) value('8343158456','83630BL','Attendees');
insert into authentication(username,pwd,userType) value('8352119874','o4e97Z0','Attendees');
insert into authentication(username,pwd,userType) value('8359283264','GFcksaC','Attendees');
insert into authentication(username,pwd,userType) value('8376697130','1JW4nb5','Attendees');
insert into authentication(username,pwd,userType) value('8378389017','oVlJkGc','Attendees');
insert into authentication(username,pwd,userType) value('8383117298','LWI3z3O','Attendees');
insert into authentication(username,pwd,userType) value('8396588326','M37J31p','Attendees');
insert into authentication(username,pwd,userType) value('8420593584','Vv6Y94v','Attendees');
insert into authentication(username,pwd,userType) value('8435028309','Qft7E7v','Attendees');
insert into authentication(username,pwd,userType) value('8435532082','p1yZK51','Attendees');
insert into authentication(username,pwd,userType) value('8457802306','A8HwD1S','Attendees');
insert into authentication(username,pwd,userType) value('8466506497','ag76pN2','Attendees');
insert into authentication(username,pwd,userType) value('8466977590','4g8I5L3','Attendees');
insert into authentication(username,pwd,userType) value('8467039359','na4FL3O','Attendees');
insert into authentication(username,pwd,userType) value('8468088030','SQnz8JM','Attendees');
insert into authentication(username,pwd,userType) value('8494924183','gV9pk57','Attendees');
insert into authentication(username,pwd,userType) value('8501036548','1u2dHcq','Attendees');
insert into authentication(username,pwd,userType) value('8510933836','ypd0jCS','Attendees');
insert into authentication(username,pwd,userType) value('8514539465','uj2PV1O','Attendees');
insert into authentication(username,pwd,userType) value('8518132333','5h940g2','Attendees');
insert into authentication(username,pwd,userType) value('8521032859','86JG84i','Attendees');
insert into authentication(username,pwd,userType) value('8549016660','RVKa320','Attendees');
insert into authentication(username,pwd,userType) value('8555775788','r0O69YA','Attendees');
insert into authentication(username,pwd,userType) value('8602185696','h5pK7np','Attendees');
insert into authentication(username,pwd,userType) value('8613505056','6n6lZ65','Attendees');
insert into authentication(username,pwd,userType) value('8625042185','R0RF2w4','Attendees');
insert into authentication(username,pwd,userType) value('8628794939','85KY438','Attendees');
insert into authentication(username,pwd,userType) value('8642341371','GAPpw9X','Attendees');
insert into authentication(username,pwd,userType) value('8651603646','G2iFdG3','Attendees');
insert into authentication(username,pwd,userType) value('8652782941','Wn57eQ2','Attendees');
insert into authentication(username,pwd,userType) value('8654723546','Vj63HT1','Attendees');
insert into authentication(username,pwd,userType) value('8655509836','jAk3R5w','Attendees');
insert into authentication(username,pwd,userType) value('8670214169','S3Dn6S4','Attendees');
insert into authentication(username,pwd,userType) value('8670884232','rfL9J1N','Attendees');
insert into authentication(username,pwd,userType) value('8675957567','Ft8539P','Attendees');
insert into authentication(username,pwd,userType) value('8678575085','U8uZJo3','Attendees');
insert into authentication(username,pwd,userType) value('8688588669','Gy42dn9','Attendees');
insert into authentication(username,pwd,userType) value('8692617822','E5P0iy6','Attendees');
insert into authentication(username,pwd,userType) value('8692947180','mP5W236','Attendees');
insert into authentication(username,pwd,userType) value('8706663466','R2kr738','Attendees');
insert into authentication(username,pwd,userType) value('8715972930','ByF9TtS','Attendees');
insert into authentication(username,pwd,userType) value('8737633824','31SoZ2Y','Attendees');
insert into authentication(username,pwd,userType) value('8763831662','KGtmb5h','Attendees');
insert into authentication(username,pwd,userType) value('8793019870','8vrl8Cm','Attendees');
insert into authentication(username,pwd,userType) value('8793036110','z6m1l2e','Attendees');
insert into authentication(username,pwd,userType) value('8797247665','J9y8x2Q','Attendees');
insert into authentication(username,pwd,userType) value('8799015738','EiZwb70','Attendees');
insert into authentication(username,pwd,userType) value('8804047065','m5l8dq1','Attendees');
insert into authentication(username,pwd,userType) value('8812988484','A42QDxY','Attendees');
insert into authentication(username,pwd,userType) value('8822517297','HVYu3EY','Attendees');
insert into authentication(username,pwd,userType) value('8827583760','AQIGD1W','Attendees');
insert into authentication(username,pwd,userType) value('8828653142','NeBAi0j','Attendees');
insert into authentication(username,pwd,userType) value('8833646395','hDFTLF6','Attendees');
insert into authentication(username,pwd,userType) value('8851393613','b3DS8Mi','Attendees');
insert into authentication(username,pwd,userType) value('8861373730','V6o0DSp','Attendees');
insert into authentication(username,pwd,userType) value('8866365836','JR4Ct9Y','Attendees');
insert into authentication(username,pwd,userType) value('8873928264','GTO46rd','Attendees');
insert into authentication(username,pwd,userType) value('8881516274','yw5Mx21','Attendees');
insert into authentication(username,pwd,userType) value('8886539211','oi1T22P','Attendees');
insert into authentication(username,pwd,userType) value('8894430948','4Q591k2','Attendees');
insert into authentication(username,pwd,userType) value('8926411061','ZbeacD8','Attendees');
insert into authentication(username,pwd,userType) value('8967208099','STntJ6K','Attendees');
insert into authentication(username,pwd,userType) value('8983541778','3LXc50m','Attendees');
insert into authentication(username,pwd,userType) value('8990485325','u1L9SZy','Attendees');
insert into authentication(username,pwd,userType) value('9004750449','GaAi1GY','Attendees');
insert into authentication(username,pwd,userType) value('9007312956','EE6l71Z','Attendees');
insert into authentication(username,pwd,userType) value('9020003771','XW4jYb6','Attendees');
insert into authentication(username,pwd,userType) value('9038468185','Gzgm9T1','Attendees');
insert into authentication(username,pwd,userType) value('9041354746','6dUtJjm','Attendees');
insert into authentication(username,pwd,userType) value('9045716138','EU6c45h','Attendees');
insert into authentication(username,pwd,userType) value('9048520829','VdzO33y','Attendees');
insert into authentication(username,pwd,userType) value('9059364517','I5b7P4u','Attendees');
insert into authentication(username,pwd,userType) value('9061173457','VMO2vI3','Attendees');
insert into authentication(username,pwd,userType) value('9064468593','gE5K1WX','Attendees');
insert into authentication(username,pwd,userType) value('9073213521','0TexOiz','Attendees');
insert into authentication(username,pwd,userType) value('9096594449','9Orw38g','Attendees');
insert into authentication(username,pwd,userType) value('9181922689','9qNRJ04','Attendees');
insert into authentication(username,pwd,userType) value('9192892662','2sH7cy6','Attendees');
insert into authentication(username,pwd,userType) value('9199970448','V61A42l','Attendees');
insert into authentication(username,pwd,userType) value('9217887696','5vctm57','Attendees');
insert into authentication(username,pwd,userType) value('9219971785','7969bhV','Attendees');
insert into authentication(username,pwd,userType) value('9220427787','kYxwom0','Attendees');
insert into authentication(username,pwd,userType) value('9223388453','1aKA010','Attendees');
insert into authentication(username,pwd,userType) value('9226194613','igj08ki','Attendees');
insert into authentication(username,pwd,userType) value('9228467804','02kz49M','Attendees');
insert into authentication(username,pwd,userType) value('9230301241','qXVnRo6','Attendees');
insert into authentication(username,pwd,userType) value('9231764002','f2fQJ0m','Attendees');
insert into authentication(username,pwd,userType) value('9237808333','IF079te','Attendees');
insert into authentication(username,pwd,userType) value('9257716376','eJy7j1X','Attendees');
insert into authentication(username,pwd,userType) value('9264048858','15RWxp6','Attendees');
insert into authentication(username,pwd,userType) value('9269861802','v2dmUmZ','Attendees');
insert into authentication(username,pwd,userType) value('9277929557','70X6fU9','Attendees');
insert into authentication(username,pwd,userType) value('9301524886','9bqSZ70','Attendees');
insert into authentication(username,pwd,userType) value('9322801343','12rBmC6','Attendees');
insert into authentication(username,pwd,userType) value('9347339824','6TC07Wa','Attendees');
insert into authentication(username,pwd,userType) value('9355762973','65V4R9w','Attendees');
insert into authentication(username,pwd,userType) value('9366526838','2335H8U','Attendees');
insert into authentication(username,pwd,userType) value('9380749999','7dU2izk','Attendees');
insert into authentication(username,pwd,userType) value('9392102554','9GkzFDd','Attendees');
insert into authentication(username,pwd,userType) value('9395931707','rV6d9S4','Attendees');
insert into authentication(username,pwd,userType) value('9407364259','G04w7SJ','Attendees');
insert into authentication(username,pwd,userType) value('9437647102','9r4dbqj','Attendees');
insert into authentication(username,pwd,userType) value('9439115413','eTpYVeG','Attendees');
insert into authentication(username,pwd,userType) value('9450790958','yQLIJE2','Attendees');
insert into authentication(username,pwd,userType) value('9457546082','8qhr9CX','Attendees');
insert into authentication(username,pwd,userType) value('9458774297','GALhFnj','Attendees');
insert into authentication(username,pwd,userType) value('9459897381','582g3y6','Attendees');
insert into authentication(username,pwd,userType) value('9466286069','3j1sRXh','Attendees');
insert into authentication(username,pwd,userType) value('9485180784','m0vUIKV','Attendees');
insert into authentication(username,pwd,userType) value('9489507295','78P0915','Attendees');
insert into authentication(username,pwd,userType) value('9510017739','6ss9jev','Attendees');
insert into authentication(username,pwd,userType) value('9527840477','9Se5Aa1','Attendees');
insert into authentication(username,pwd,userType) value('9528660740','GSIEv7m','Attendees');
insert into authentication(username,pwd,userType) value('9534819380','Ha5dOdm','Attendees');
insert into authentication(username,pwd,userType) value('9538801103','6B94q9e','Attendees');
insert into authentication(username,pwd,userType) value('9546216675','zjhqvj8','Attendees');
insert into authentication(username,pwd,userType) value('9547261088','vx56Pe2','Attendees');
insert into authentication(username,pwd,userType) value('9550708334','z567ycf','Attendees');
insert into authentication(username,pwd,userType) value('9550946570','x0EQ4fL','Attendees');
insert into authentication(username,pwd,userType) value('9562544909','45YgIg8','Attendees');
insert into authentication(username,pwd,userType) value('9563072041','2bu8Wc6','Attendees');
insert into authentication(username,pwd,userType) value('9563834923','ew2cMD6','Attendees');
insert into authentication(username,pwd,userType) value('9579524214','BV110YU','Attendees');
insert into authentication(username,pwd,userType) value('9581361345','rQjTmWf','Attendees');
insert into authentication(username,pwd,userType) value('9587500342','305lN52','Attendees');
insert into authentication(username,pwd,userType) value('9602011404','KU87x1Y','Attendees');
insert into authentication(username,pwd,userType) value('9605960235','8Hmkp9n','Attendees');
insert into authentication(username,pwd,userType) value('9610123582','1k7YphG','Attendees');
insert into authentication(username,pwd,userType) value('9615178567','vn7G2S0','Attendees');
insert into authentication(username,pwd,userType) value('9624251773','Pj36R9E','Attendees');
insert into authentication(username,pwd,userType) value('9633413838','lVsFJ52','Attendees');
insert into authentication(username,pwd,userType) value('9636813449','2Vq48J0','Attendees');
insert into authentication(username,pwd,userType) value('9641200587','u90Cf9V','Attendees');
insert into authentication(username,pwd,userType) value('9661057917','g6017x8','Attendees');
insert into authentication(username,pwd,userType) value('9663024876','sFrKdk4','Attendees');
insert into authentication(username,pwd,userType) value('9681488866','6JdX886','Attendees');
insert into authentication(username,pwd,userType) value('9690150214','Pd7wR3h','Attendees');
insert into authentication(username,pwd,userType) value('9725793906','BC0Cw0A','Attendees');
insert into authentication(username,pwd,userType) value('9727567550','rXlLqT2','Attendees');
insert into authentication(username,pwd,userType) value('9740879097','7HBYbGN','Attendees');
insert into authentication(username,pwd,userType) value('9740893033','tW2I32S','Attendees');
insert into authentication(username,pwd,userType) value('9741228627','0aAki17','Attendees');
insert into authentication(username,pwd,userType) value('9745037114','6qsH3vm','Attendees');
insert into authentication(username,pwd,userType) value('9747248001','0384jzv','Attendees');
insert into authentication(username,pwd,userType) value('9778108392','82tHS3X','Attendees');
insert into authentication(username,pwd,userType) value('9785550843','vtJi5n9','Attendees');
insert into authentication(username,pwd,userType) value('9789170501','JSivt9R','Attendees');
insert into authentication(username,pwd,userType) value('9792636074','OtQhu3L','Attendees');
insert into authentication(username,pwd,userType) value('9804352811','qe8689p','Attendees');
insert into authentication(username,pwd,userType) value('9823584122','OuYqPZ2','Attendees');
insert into authentication(username,pwd,userType) value('9829192693','2t0ivK6','Attendees');
insert into authentication(username,pwd,userType) value('9832844560','AZ043zS','Attendees');
insert into authentication(username,pwd,userType) value('9840240075','I3bZfQH','Attendees');
insert into authentication(username,pwd,userType) value('9864419603','29hm56P','Attendees');
insert into authentication(username,pwd,userType) value('9870290234','yGZ42tj','Attendees');
insert into authentication(username,pwd,userType) value('9893692097','hF8YO8R','Attendees');
insert into authentication(username,pwd,userType) value('9894751956','5WRTxHS','Attendees');
insert into authentication(username,pwd,userType) value('9906440394','R1Zc823','Attendees');
insert into authentication(username,pwd,userType) value('9918288169','6wmXgld','Attendees');
insert into authentication(username,pwd,userType) value('9923252622','wU5x3dg','Attendees');
insert into authentication(username,pwd,userType) value('9935423847','EAv4aG0','Attendees');
insert into authentication(username,pwd,userType) value('9936892554','f957YQt','Attendees');
insert into authentication(username,pwd,userType) value('9943090843','x7FHIpm','Attendees');
insert into authentication(username,pwd,userType) value('9948871650','Fb5A7vP','Attendees');
insert into authentication(username,pwd,userType) value('9954479723','37C8og2','Attendees');
insert into authentication(username,pwd,userType) value('9959746713','v68VIJ4','Attendees');
insert into authentication(username,pwd,userType) value('9966716389','jyd3HtT','Attendees');
insert into authentication(username,pwd,userType) value('9984010101','UBh95G7','Attendees');
insert into authentication(username,pwd,userType) value('9984627855','R5mGzd7','Attendees');
insert into authentication(username,pwd,userType) value('9995530140','7jfOvx0','Attendees');

insert into authentication(username,pwd,userType) value('8021923027','knk46lE','Participants');
insert into authentication(username,pwd,userType) value('8025438734','9q8H4b8','Participants');
insert into authentication(username,pwd,userType) value('8041580055','Zee154d','Participants');
insert into authentication(username,pwd,userType) value('8052410432','12Ri3i3','Participants');
insert into authentication(username,pwd,userType) value('8056787494','TOQK1jR','Participants');
insert into authentication(username,pwd,userType) value('8060414416','Y6gV2X2','Participants');
insert into authentication(username,pwd,userType) value('8063505609','ScoiCjM','Participants');
insert into authentication(username,pwd,userType) value('8085237305','qL5oepP','Participants');
insert into authentication(username,pwd,userType) value('8100321792','1qRLRYu','Participants');
insert into authentication(username,pwd,userType) value('8131713679','9q86N7s','Participants');
insert into authentication(username,pwd,userType) value('8177563681','cxM0MmT','Participants');
insert into authentication(username,pwd,userType) value('8199081746','7HUF5F1','Participants');
insert into authentication(username,pwd,userType) value('8227164774','w1hU5ED','Participants');
insert into authentication(username,pwd,userType) value('8236283971','262z9hg','Participants');
insert into authentication(username,pwd,userType) value('8247349245','C3Eg6Ox','Participants');
insert into authentication(username,pwd,userType) value('8262064726','EOZzffz','Participants');
insert into authentication(username,pwd,userType) value('8277591642','NOfPfnx','Participants');
insert into authentication(username,pwd,userType) value('8302612219','hje7sT6','Participants');
insert into authentication(username,pwd,userType) value('8315140939','sQIxj04','Participants');
insert into authentication(username,pwd,userType) value('8329619347','C077VLf','Participants');
insert into authentication(username,pwd,userType) value('8344274864','0xcmAVb','Participants');
insert into authentication(username,pwd,userType) value('8415923771','OYWsp1g','Participants');
insert into authentication(username,pwd,userType) value('8441118060','qyT3vL6','Participants');
insert into authentication(username,pwd,userType) value('8445336545','3M151zU','Participants');
insert into authentication(username,pwd,userType) value('8450047626','152YZhR','Participants');
insert into authentication(username,pwd,userType) value('8457884840','H5FU2w7','Participants');
insert into authentication(username,pwd,userType) value('8482347596','v2l0JZE','Participants');
insert into authentication(username,pwd,userType) value('8482758650','FPtN7Fr','Participants');
insert into authentication(username,pwd,userType) value('8488137984','mrKjd9A','Participants');
insert into authentication(username,pwd,userType) value('8542670041','N0FtUbl','Participants');
insert into authentication(username,pwd,userType) value('8563655890','zGxA3Ol','Participants');
insert into authentication(username,pwd,userType) value('8605479130','8qOi39k','Participants');
insert into authentication(username,pwd,userType) value('8605731436','qI6Eb4B','Participants');
insert into authentication(username,pwd,userType) value('8648074956','lf2OJrz','Participants');
insert into authentication(username,pwd,userType) value('8691601558','S5yxYs3','Participants');
insert into authentication(username,pwd,userType) value('8763637088','sqchmed','Participants');
insert into authentication(username,pwd,userType) value('8770416242','m44FygJ','Participants');
insert into authentication(username,pwd,userType) value('8771421003','6C5326M','Participants');
insert into authentication(username,pwd,userType) value('8773820585','Y0UZCvG','Participants');
insert into authentication(username,pwd,userType) value('8780517445','Z1EHgBn','Participants');
insert into authentication(username,pwd,userType) value('8811941759','t2PW72f','Participants');
insert into authentication(username,pwd,userType) value('8829499566','61aM1Rd','Participants');
insert into authentication(username,pwd,userType) value('8866176084','CAX5849','Participants');
insert into authentication(username,pwd,userType) value('8890080750','3p8kmLU','Participants');
insert into authentication(username,pwd,userType) value('8892150192','s7rnYlZ','Participants');
insert into authentication(username,pwd,userType) value('8908716867','oNpbvx1','Participants');
insert into authentication(username,pwd,userType) value('8971798049','NK0aQ24','Participants');
insert into authentication(username,pwd,userType) value('8987527827','szoEqu7','Participants');
insert into authentication(username,pwd,userType) value('9036299663','jB364wU','Participants');
insert into authentication(username,pwd,userType) value('9036769856','g2hzpiA','Participants');
insert into authentication(username,pwd,userType) value('9065740457','5HV99ut','Participants');
insert into authentication(username,pwd,userType) value('9153286894','ma91WdB','Participants');
insert into authentication(username,pwd,userType) value('9189388728','OI61PeL','Participants');
insert into authentication(username,pwd,userType) value('9198861319','czUM7SC','Participants');
insert into authentication(username,pwd,userType) value('9218693683','46nM3dT','Participants');
insert into authentication(username,pwd,userType) value('9224362701','24C9YBn','Participants');
insert into authentication(username,pwd,userType) value('9227189122','lR13dNL','Participants');
insert into authentication(username,pwd,userType) value('9243476384','sT5frQZ','Participants');
insert into authentication(username,pwd,userType) value('9245632832','0Z8z4rD','Participants');
insert into authentication(username,pwd,userType) value('9262374768','xXw3eHs','Participants');
insert into authentication(username,pwd,userType) value('9265252481','M773l5I','Participants');
insert into authentication(username,pwd,userType) value('9271269310','QK6EmXX','Participants');
insert into authentication(username,pwd,userType) value('9280460562','irI88uQ','Participants');
insert into authentication(username,pwd,userType) value('9284026161','5EiizC1','Participants');
insert into authentication(username,pwd,userType) value('9313667054','pyD6kzY','Participants');
insert into authentication(username,pwd,userType) value('9319357651','8Df218C','Participants');
insert into authentication(username,pwd,userType) value('9399330868','92BRZUR','Participants');
insert into authentication(username,pwd,userType) value('9403171551','2m6YC2N','Participants');
insert into authentication(username,pwd,userType) value('9404808767','mH5vJl8','Participants');
insert into authentication(username,pwd,userType) value('9428489089','nK6hy39','Participants');
insert into authentication(username,pwd,userType) value('9478516282','91lfiSj','Participants');
insert into authentication(username,pwd,userType) value('9485381663','xoN5j6Y','Participants');
insert into authentication(username,pwd,userType) value('9487193976','U8I24wi','Participants');
insert into authentication(username,pwd,userType) value('9497006230','Zbhc6bf','Participants');
insert into authentication(username,pwd,userType) value('9503535901','PnqFq6p','Participants');
insert into authentication(username,pwd,userType) value('9526912880','k3QJr39','Participants');
insert into authentication(username,pwd,userType) value('9532747237','xrAvgwI','Participants');
insert into authentication(username,pwd,userType) value('9543106116','RPYLZ2n','Participants');
insert into authentication(username,pwd,userType) value('9549317832','53bDw3t','Participants');
insert into authentication(username,pwd,userType) value('9567010088','JaxMO8G','Participants');
insert into authentication(username,pwd,userType) value('9578061376','1CYY1HS','Participants');
insert into authentication(username,pwd,userType) value('9635716211','L1viXLN','Participants');
insert into authentication(username,pwd,userType) value('9648124994','FwmSo25','Participants');
insert into authentication(username,pwd,userType) value('9682395610','kOn8Zp2','Participants');
insert into authentication(username,pwd,userType) value('9689531370','Tv1Yavz','Participants');
insert into authentication(username,pwd,userType) value('9727059643','vLrDYd7','Participants');
insert into authentication(username,pwd,userType) value('9740829600','4mROP6W','Participants');
insert into authentication(username,pwd,userType) value('9747194784','4s2hyk0','Participants');
insert into authentication(username,pwd,userType) value('9749585257','h7337nh','Participants');
insert into authentication(username,pwd,userType) value('9775918959','uSio613','Participants');
insert into authentication(username,pwd,userType) value('9790507140','3BttXhd','Participants');
insert into authentication(username,pwd,userType) value('9838251342','8Zh1tpV','Participants');
insert into authentication(username,pwd,userType) value('9843666378','923yBk1','Participants');
insert into authentication(username,pwd,userType) value('9854938557','9Z6839Z','Participants');
insert into authentication(username,pwd,userType) value('9874504419','L3X1LHh','Participants');
insert into authentication(username,pwd,userType) value('9882179468','x5YfXt8','Participants');
insert into authentication(username,pwd,userType) value('9899691358','X5guZN5','Participants');
insert into authentication(username,pwd,userType) value('9921318393','SJODdPf','Participants');
insert into authentication(username,pwd,userType) value('9923250555','wfaf7l1','Participants');
insert into authentication(username,pwd,userType) value('9993687543','bI6hFcU','Participants');


insert into authentication(username,pwd,userType) value('agambains198@gmail.com','4bWl628','cultural committee');
insert into authentication(username,pwd,userType) value('dishaniapte658@gmail.com','C22Q82j','cultural committee');
insert into authentication(username,pwd,userType) value('farhansin228@gmail.com','xu6iF7r','cultural committee');
insert into authentication(username,pwd,userType) value('harryhard929@gmail.com','i3E9UZ2','cultural committee');
insert into authentication(username,pwd,userType) value('himmatl111@gmail.com','az9TJmb','cultural committee');
insert into authentication(username,pwd,userType) value('keyadutt999@gmail.com','W7M4O3a','cultural committee');
insert into authentication(username,pwd,userType) value('lohandas118@gmail.com','e9xPc5D','cultural committee');
insert into authentication(username,pwd,userType) value('muditagg007@gmail.com','4W3qBxz','cultural committee');
insert into authentication(username,pwd,userType) value('saajanl111@gmail.com','eh19r6A','cultural committee');
insert into authentication(username,pwd,userType) value('sammyjain218@gmail.com','7TwK1qi','cultural committee');
insert into authentication(username,pwd,userType) value('sarthokjo999@gmail.com','s8xmCPj','cultural committee');
insert into authentication(username,pwd,userType) value('tarunkhanna100@gmail.com','I9DnQmB','cultural committee');
insert into authentication(username,pwd,userType) value('varunchat008@gmail.com','OM0OdwZ','cultural committee');



insert into authentication(username,pwd,userType) value('ayushijain709@gmail.com','CCt9ver','Organising Team');
insert into authentication(username,pwd,userType) value('hanitb264@gmail.com','YCWp8JV','Organising Team');
insert into authentication(username,pwd,userType) value('hiteshachand509@gmail.com','mDW31Lw','Organising Team');
insert into authentication(username,pwd,userType) value('jasleen101@gmail.com','90SZzjU','Organising Team');
insert into authentication(username,pwd,userType) value('kesarhar022@gmail.com','zFSS1sB','Organising Team');
insert into authentication(username,pwd,userType) value('manmohansingh099@gmail.com','JIE8gya','Organising Team');
insert into authentication(username,pwd,userType) value('manny111@gmail.com','O7j3PqJ','Organising Team');
insert into authentication(username,pwd,userType) value('mitrasinghal911@gmail.com','hu5fK4r','Organising Team');
insert into authentication(username,pwd,userType) value('mudrabhand009@gmail.com','7321ejk','Organising Team');
insert into authentication(username,pwd,userType) value('mukeshkamra@gmail.com','W8613C3','Organising Team');
insert into authentication(username,pwd,userType) value('nischays009@gmail.com','TxTq0H4','Organising Team');
insert into authentication(username,pwd,userType) value('parthm095@gmail.com','YQYLJ4U','Organising Team');
insert into authentication(username,pwd,userType) value('utsavr007@gmail.com','YH7YdrZ','Organising Team');



insert into authentication(username,pwd,userType) value('raghavr1992@delltechnology.com','nQzbtD7','Sponsors');
insert into authentication(username,pwd,userType) value('allu123@iocl.com','2mk19HK','Sponsors');
insert into authentication(username,pwd,userType) value('ufarrell@example.org','PE9bOfA','Sponsors');
insert into authentication(username,pwd,userType) value('amy1222@infosys.com','81HGoC6','Sponsors');
insert into authentication(username,pwd,userType) value('estel.purdy@example.org','7wc3O1P','Sponsors');
insert into authentication(username,pwd,userType) value('mohiniappam@ibm.com','oZ8s6F2','Sponsors');
insert into authentication(username,pwd,userType) value('bailey.triston@example.org','dCZ30uJ','Sponsors');
insert into authentication(username,pwd,userType) value('althea34@example.com','Dy5B9v8','Sponsors');
insert into authentication(username,pwd,userType) value('jackma@gmail.com','x2wl906','Sponsors');
insert into authentication(username,pwd,userType) value('sundarwashi@gmail.com','Vc67bEi','Sponsors');
insert into authentication(username,pwd,userType) value('jeffrybezos@gmail.com','ug0kiN9','Sponsors');
insert into authentication(username,pwd,userType) value('bill.waelchi@example.org','9p0X3l2','Sponsors');
insert into authentication(username,pwd,userType) value('kihn.dustin@example.net','NOXsVRt','Sponsors');
insert into authentication(username,pwd,userType) value('bryce.collier@example.org','71L3Cux','Sponsors');
insert into authentication(username,pwd,userType) value('champlin.reyes@example.net','38J7hUJ','Sponsors');
insert into authentication(username,pwd,userType) value('otto21@example.net','AGHJk8E','Sponsors');
insert into authentication(username,pwd,userType) value('trenton.nienow@example.com','vl0lEna','Sponsors');


insert into authentication(username,pwd,userType) value('advikadani111@gmail.com','6bcnDmq','Volunteers');
insert into authentication(username,pwd,userType) value('adiraluthra777@gmail.com','SHO6dbI','Volunteers');
insert into authentication(username,pwd,userType) value('advikhari456@gmail.com,','WaOi3G0','Volunteers');
insert into authentication(username,pwd,userType) value('alishachadha101@gmail.com','WYk16f7','Volunteers');
insert into authentication(username,pwd,userType) value('anviseth944@gmail.com','Blpi6VI','Volunteers');
insert into authentication(username,pwd,userType) value('arushchanda813@gmail.com','iMFcSUX','Volunteers');
insert into authentication(username,pwd,userType) value('ashishpandey626@gmail.com','k4XO982','Volunteers');
insert into authentication(username,pwd,userType) value('binodkumar555@gmail.com','1XrsDHf','Volunteers');
insert into authentication(username,pwd,userType) value('chrisgayle010@gmail.com','xs3Cw8u','Volunteers');
insert into authentication(username,pwd,userType) value('deepankarjiwanu912@gmail.com','n79ND4s','Volunteers');
insert into authentication(username,pwd,userType) value('divinfernando231@gmail.com','7s6GBlE','Volunteers');
insert into authentication(username,pwd,userType) value('divitshree677@gmail.com','fG0JgOS','Volunteers');
insert into authentication(username,pwd,userType) value('freemanpaul444@gmail.com,','K16v5iE','Volunteers');
insert into authentication(username,pwd,userType) value('gyanhardik888@gmail.com','J4r4bZ2','Volunteers');
insert into authentication(username,pwd,userType) value('hardikpandya009@gmail.com','Mr7QPM9','Volunteers');
insert into authentication(username,pwd,userType) value('harshitak122@gmail.com,','xm6AxYv','Volunteers');
insert into authentication(username,pwd,userType) value('heersandhu433@gmail.com','vFE8RR8','Volunteers');
insert into authentication(username,pwd,userType) value('hiranbabu766@gmail.com','G4l662Q','Volunteers');
insert into authentication(username,pwd,userType) value('jasminekaur223@gmail.com','jP7OcIA','Volunteers');
insert into authentication(username,pwd,userType) value('johnsnow666@gmail.com','0AkT0Xz','Volunteers');
insert into authentication(username,pwd,userType) value('manjarikaur555@gmail.com','bdr1yuV','Volunteers');
insert into authentication(username,pwd,userType) value('raniraj666@gmail.com','09u5pkN','Volunteers');
insert into authentication(username,pwd,userType) value('samreshchatterjee999@gmail.com','7s9DK6O','Volunteers');
insert into authentication(username,pwd,userType) value('yashbhargava334@gmail.com','8l414br','Volunteers');



insert into authentication(username,pwd,userType) value('samrithr@iiitd.ac.in','55LMqRf','College Admin');
insert into authentication(username,pwd,userType) value('payalcmukh@iiitd.ac.in','1lY48bB','College Admin');
insert into authentication(username,pwd,userType) value('piyushgoel@iiitd.ac.in','97IDzoy','College Admin');
insert into authentication(username,pwd,userType) value('sidkaul@iiitd.ac.in','UOakRIV','College Admin');
insert into authentication(username,pwd,userType) value('ravibahsin@iiitd.ac.in','67mIHco','College Admin');

alter table sponsors drop column stalls;
alter table sponsors RENAME column organinsation TO organisation;
