import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Screens/usersdatadisplay.dart';
import 'date_widget.dart';
import 'dropdown.dart';
import 'textbox_widget.dart';
import 'time_widget.dart';

class UserUIDesign extends StatefulWidget {
  @override
  _UserUIDesignState createState() => _UserUIDesignState();
}

class _UserUIDesignState extends State<UserUIDesign> {


    String ? userTaskText;
    String ? userDate;
    String ? userTime;
    String ? userPriority;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
              height: MediaQuery.of(context).size.height / 2.0,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.white,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(5.0),
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: dropdown(onPrioritySelected: (text) {
                          userPriority=text;
                        },),
                      ),
                    ],
                  ),
                   taskabout(onTextChanged: (text) {
                    setState(() {
                      userTaskText = text;
                     
                    });
                  },
                ),
                  date_widget(onDateSelected: (text) {
                     setState(() {
                      userDate = text;
                     
                    });
                  },),
                  time_widget(onDateSelected: (text) {
                     setState(() {
                      userTime = text;
                     
                    });
                  },),
                  ElevatedButton(
                      onPressed: () {

                      
                           addUserTasks(userTaskText,userPriority,userDate,userTime);
                      },
                      child: const Align(
                          alignment: Alignment.center, child: Text("Save"))),
                          
                ]),
                
              ),
               
            ),
            SizedBox(
               height: 50,
              child:  UsersData()),
            
      ],
    );
}
}


void addUserTasks(userTask,userPriorityText,userDateText,userTimeText) async{


 

   DatabaseReference ref =
      FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid);

   ref.child(FirebaseAuth.instance.currentUser!.uid).push().set({
     
	    "tasks":[
	    	{
	    	  "priority":userPriorityText,
	    	  "tasks":userTask,
	    	  "date":userDateText,
	    	  "time":userTimeText,
	    	  "email":FirebaseAuth.instance.currentUser!.email,
	    	  "status":"done"
	    	}
	    	 
	    	]
  

   });
}