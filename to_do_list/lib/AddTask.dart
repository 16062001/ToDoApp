import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home.dart';
import 'package:to_do_list/todo.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  TimeOfDay _timeStart = TimeOfDay(hour: 6, minute: 16);
  TimeOfDay _timeEnd = TimeOfDay(hour: 6, minute: 16);

  late SingleValueDropDownController _DropDownTextFieldController;

  var selectedRemind = "5 min";

  var selectedRepeat = "None";
  TextEditingController titleInput = TextEditingController();
  TextEditingController noteInput = TextEditingController();

  TextEditingController dateInput = TextEditingController();
  TextEditingController timeStartinput = TextEditingController();
  TextEditingController timeEndinput = TextEditingController();
  TextEditingController RemindInput = TextEditingController();
  TextEditingController RepeatInput = TextEditingController();

  final theList = ToDoClass.todoList();

  get title => this.title;

  get note => this.note;
  get startTime => this.startTime;
  get endTime => this.endTime;


  test(){
    for ( var x in theList){
      print(x.endTime);
    }
  }

  check(){

    var formData = formKey.currentState;
  //  assert(formData == null );
    if (formData != null  ){
      if(formData.validate()){
        // setState(() {
        //   theList.add(
        //     ToDoClass(id: DateTime.now().microsecond.toString(),
        //         title: "${title}" ,
        //         note: "${note}", startTime: startTime , endTime: endTime) ,
        //
        //
        //   );
        // });

        Navigator.of(context).push(MaterialPageRoute(
            builder:(context)=> home(title: "dateInput.text",
              note: "RemindInput.text",
              endTime: "DateTime.now().day as String",
              startTime: "DateTime.now().day as String",)));
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder:(context)=> home(title: dateInput.text,
        //       note: RemindInput.text,
        //       endTime: DateTime.now().day as String,
        //       startTime: DateTime.now().day as String,)));
        print("valid");
      }else{
        print("Not valid");

      }

    }
  }

  @override
 void initState(){
   _DropDownTextFieldController = SingleValueDropDownController();
   dateInput.text = "kjhtrwe";
   timeStartinput.text = "ttt";
   timeEndinput.text = "end";
   RemindInput.text="5 min";
   RepeatInput.text = "None";
   titleInput.text = "";
   noteInput.text = "";
   super.initState();
 }

 @override
 void dispose(){

   _DropDownTextFieldController.dispose();
   super.dispose();

 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back_ios) , color: Colors.blueAccent,
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder:(context)=> home(title: "dateInput.text",
                note: "RemindInput.text",
                endTime: DateTime.now().day as String,
                startTime: DateTime.now().day as String,)));
        }, ),
        actions: [

          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child:  Image.asset("assets/images/avatar.png" , ),

          )
        ],
      ),
      body:
Padding(
  padding:EdgeInsets.all(20) ,
  child:    SingleChildScrollView(
    child:


    Form(

      key: formKey,
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Center(child: Text("Add Task")),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Title ", )
            , alignment: Alignment.topLeft,
          ),
          TextFormField(
            validator: (text){

              if(text !=null){
                if (text.length < 1) {
                  return "please, Enter a title";
                }  return null;
              }


            },
            decoration: InputDecoration(
              // labelText: "Enter Title here",
                hintText: "Enter Title here",
                // labelStyle: TextStyle(color: Colors.black12),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                  ),
                  borderRadius:  BorderRadius.circular(20),
                )
            ),
          ),
          Container(child: Text("Note", )
            , alignment: Alignment.topLeft,),
          TextFormField(
            validator: (text){

              if(text !=null){
                if (text.length < 1) {
                  return "please, Enter a Note";
                }  return null;
              }


            },
            decoration: InputDecoration(
              // labelText: "Enter note here",
              // labelStyle: TextStyle(color: Colors.black12),
                hintText: "Enter note here",

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                  ),
                  borderRadius:  BorderRadius.circular(20),
                )
            ),
          ),
          Container(child: Text("Date ", )
            , alignment: Alignment.topLeft,),
          TextFormField(
            validator: (text){

              if(text !=null){
                if (text.length < 1) {
                  return "please, Enter a Date";
                }  return null;
              }


            },
            controller: dateInput,


            decoration: InputDecoration(
                suffixIcon: Icon(Icons.calendar_today),


                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                  ),
                  borderRadius:  BorderRadius.circular(20),
                )
            ),

            readOnly: true,

            onTap: ()async{
              DateTime? pickedDate= await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2050));

              if (pickedDate!=null){
                print(pickedDate);
                String formattedDate =  DateFormat('M/dd/yyyy').format(pickedDate);
                print(formattedDate);
                setState(() {
                  dateInput.text = formattedDate;
                });
              }
              else{

              }

            },
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(child: Text("Start Time" , )
                    , alignment: Alignment.topLeft,),

                  Container(
                    width: 200,

                    child: TextFormField(
                      validator: (text){

                        if(text !=null){
                          if (text.length < 1) {
                            return "please, Enter the Start time";
                          }  return null;
                        }


                      },
                      controller: timeStartinput,
                      decoration: InputDecoration(
                          labelText: "Enter start time",
                          labelStyle: TextStyle(color: Colors.black12),
                          suffixIcon: Icon(Icons.access_time),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                            ),
                            borderRadius:  BorderRadius.circular(20),
                          )
                      ),
                      readOnly: true,
                      onTap: ()async{
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        setState(() {
                          if (pickedTime!=null) {
                            timeStartinput.text = pickedTime.format(context)!;
                          }
                        });
                        // if (pickedTime!=null){
                        //   print("object");
                        //   print(pickedTime.format(context));
                        //   print("ob2");
                        //   DateTime convertedTime = DateTime.parse(pickedTime.format(context).toString());
                        //    print(convertedTime);
                        //    print("be");
                        //     String formattedTime = DateFormat('HH:mm').format(convertedTime);
                        //  print("skf");
                        //   print(formattedTime);
                        //
                        //   setState(() {
                        //     dateInput.text = formattedTime;
                        //     timeStartinput.text = "formattedTime";
                        //
                        //   });
                        // }
//                     else{
//
//
//
// print ("not valid");
//                     }
                      },
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  Container(child: Text("End Time" , )
                    , alignment: Alignment.topLeft,),

                  Container(
                    width: 200,

                    child: TextFormField(
                      validator: (text){

                        if(text !=null){
                          if (text.length < 1) {
                            return "please, Enter the End time";
                          }  return null;
                        }


                      },
                      controller: timeEndinput,
                      decoration: InputDecoration(
                          labelText: "Enter End time",
                          labelStyle: TextStyle(color: Colors.black12),
                          suffixIcon: Icon(Icons.access_time),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                            ),
                            borderRadius:  BorderRadius.circular(20),
                          )
                      ),
                      readOnly: true,
                      onTap: ()async{
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        setState(() {
                          if (pickedTime!=null) {
                            timeEndinput.text = pickedTime.format(context)!;
                          }
                        });
                        // if (pickedTime!=null){
                        //   print(pickedTime.format(context));
                        //   DateTime convertedTime = DateTime.parse(pickedTime.format(context).toString());
                        //   print(convertedTime);
                        //   String formattedTime = DateFormat('HH:mm').format(convertedTime);
                        //   print(convertedTime);
                        //
                        //   setState(() {
                        //     timeEndinput.text = formattedTime;
                        //
                        //   });
                        // }
                        // else{
                        //
                        // }
                      },
                    ),
                  ),


                ],
              ),

            ],
          ),
          Container(child: Text("Remind", )
            , alignment: Alignment.topLeft,),
          DropDownTextField(
            initialValue: "5 min",
            // validator: (text){
            //
            //   if(text !=null){
            //     if (text.length < 1) {
            //       return "Choose please";
            //     }  return null;
            //   }
            //
            //
            // },
            dropDownList: ["5 min ", "10 min"]
                .map((e) => DropDownValueModel(
              name: "$e",
              value:  e,
            )).toList(),

          ),
          Container(child: Text("Repeat ", )
            , alignment: Alignment.topLeft,),
          DropDownTextField(
            // validator: (text){
            //   if (text?.length! < 1) {
            //     return "please, Enter a title";
            //   }  return null;
            //
            // },
            initialValue: "None",
            dropDownList: ["None ", "every day ","every week"]
                .map((e) => DropDownValueModel(
              name: "$e",
              value:  e,
            )).toList(),

          ),
          ElevatedButton(
              onPressed: check,
              child: Container(
                width: 20,
                child: Text("ok"),
                alignment: Alignment.bottomRight,
              )
          ),


        ],),

    ),
  ),
)


        

    );
  }
}
