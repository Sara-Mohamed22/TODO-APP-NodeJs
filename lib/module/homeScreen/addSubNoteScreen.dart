

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class AddSubNoteScreen extends StatefulWidget {
  AddSubNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddSubNoteScreen> createState() => _AddSubNoteScreenState();
}

class _AddSubNoteScreenState extends State<AddSubNoteScreen> {
  String? dropdownvalue ;

  var items = [
    'Start',
    'In Progress',
    'Done',
  ];



  var formKey = GlobalKey<FormState>();
  var noteNameController = TextEditingController();
  var desController = TextEditingController();
  var sDateController = TextEditingController();
  var eDateController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      /* appBar: AppBar(
        automaticallyImplyLeading: false ,
        leading: InkWell(
            child: Icon(Icons.keyboard_arrow_left_outlined) ,
          onTap: (){
              Navigator.pop(context);
          },
        ),
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 20 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Row(
                  children: [
                    Text('Add Sub Task' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600),),

                    Spacer(),

                    IconButton(onPressed: (){

                      Navigator.pop(context);

                    }, icon: Icon(Icons.close))
                  ],
                ) ,

                SizedBox(height: 10,),
                Text('Fill out the details below to add new Sub Task') ,
                SizedBox(height: 25,),




                Form(
                  key: formKey,
                  child: Column(
                    children:
                    [
                      TextFormField(
                        controller: noteNameController ,
                        decoration: InputDecoration(

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFF01A0C7) ),
                            ),

                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.redAccent),
                            ),
                            labelText: 'Enter your Note Name ..' ,
                            labelStyle: TextStyle( color: Color(0xFF777777) ,
                                fontSize: 14),

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(5.0),

                            )

                        ),


                      ),

                      SizedBox(height: 20,),


                      Container(
                        width: MediaQuery.of(context).size.width ,
                        padding: EdgeInsets.symmetric(horizontal: 20),

                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value:  dropdownvalue ,
                            // style: TextStyle(color: defColor),
                            menuMaxHeight: 100 ,
                            hint:  Text('Status of your task ..' , style: TextStyle(color: Color(0xFF777777) ,
                                fontSize: 14),)
                            ,
                            underline: Container(),
                            items:
                            items.map((String item) {
                              return
                                DropdownMenuItem(
                                  value: item ,
                                  child: Text(item),
                                );
                            }).toList() ,

                            onChanged: (String? newValue) {
                              setState(() {
                                print(newValue);
                                dropdownvalue = newValue! ;

                              });
                            },
                          ),

                          /*  child:  CustomDropdownButton(
                                hint: Text('Select your  Event' , style: TextStyle(color: HexColor('#777777') ,
                                    fontSize: 14),),
                                value: dropdownvalue ,
                                style: TextStyle(color: defColor),
                                items:  cubit.eventList.map((String item) {
                                  return
                                    DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );

                                }).toList() ,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    print(newValue);
                                    dropdownvalue = newValue! ;
                                  });
                                },
                              ),*/
                        ),
                      ),

                      SizedBox(height: 25,),

                      Container(
                        child: TextFormField(
                          controller: desController ,
                          maxLines: 2,
                          decoration: InputDecoration(

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFF01A0C7) ),
                              ),

                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.redAccent),
                              ),
                              labelText: 'Enter Description of Task ...' ,
                              labelStyle: TextStyle( color: Color(0xFF777777) ,
                                  fontSize: 14),

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.circular(5.0),

                              )

                          ),


                        ),
                      ),

                      SizedBox(height: 25,),

                      Row(children: [
                        Expanded(child: Text('Start Date' , style: TextStyle(fontWeight: FontWeight.w500),  )),
                        Spacer(),

                        Expanded(child: Text('End Date', style: TextStyle(fontWeight: FontWeight.w500),)),

                      ],),

                      SizedBox(height: 10,),
                      Row(

                        children: [

                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black12 ,
                                  border: Border.all(color: Colors.transparent ),
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: DateTimePicker(
                                // controller: sDateController ,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                // initialValue: '',
                                initialValue: DateTime.now().toString(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                // dateLabelText: 'Start Date',
                                onChanged: (val) => print(val),
                                validator: (val) {
                                  print(val);
                                  return null;
                                },
                                onSaved: (val) => print(val),
                              ),
                            ),
                          ),

                          // Spacer(),
                          SizedBox(width: 20,),

                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),

                              decoration: BoxDecoration(
                                  color: Colors.black12 ,
                                  border: Border.all(color: Colors.transparent ),
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: DateTimePicker(
                                // controller: eDateController,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),

                                type: DateTimePickerType.date ,
                                dateMask: 'd MMM, yyyy',
                                // initialValue: DateTime.now().toString(),

                                initialValue: '',
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                // dateLabelText: 'End Date',
                                onChanged: (val) => print('dddd '+ val),
                                validator: (val) {
                                  print(val);
                                  return null;
                                },
                                onSaved: (val) => print(val),
                              ),
                            ),
                          ),
                        ],
                      ) ,


                    ],
                  ),
                ) ,

                SizedBox(height: 30,),


                Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width /2 ,
                      decoration: BoxDecoration(
                          color: Color(0xFF01A0C7) ,
                          border: Border.all(color: Colors.transparent ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),

                      child: MaterialButton(onPressed: (){
                        print('create Task');


                      } , child: Text('Create Sub Task' , style:  TextStyle(color: Colors.white ),),)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

