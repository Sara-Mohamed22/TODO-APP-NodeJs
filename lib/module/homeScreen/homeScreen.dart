
import 'package:flutter/material.dart';
import 'package:todo_app/module/homeScreen/addNoteScreen.dart';
import 'package:todo_app/module/homeScreen/addSubNoteScreen.dart';
import 'package:todo_app/module/homeScreen/editNoteScreen.dart';
import 'package:todo_app/shared/drawer.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Tasks' , style:TextStyle( fontWeight : FontWeight.w300 )),
        centerTitle: true,
        // automaticallyImplyLeading: false,

     /*   leading: InkWell(
          child: Icon(Icons.keyboard_arrow_left_outlined) ,
          onTap: (){
            Navigator.pop(context);
          },
        ),*/

      ),
      drawer: createDrawer(context),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children:
            [

              ListView.separated(
                shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context , index ){
                    return Card(child:  Column(
                      children: [
                        ListTile(
                          title: Text(
                            'html',
                            textScaleFactor: 1.5,
                          ),
                          subtitle: Text('write some codesss and designs write some codesss and designs write some codesss and designs '),
                          trailing: InkWell(
                              child: Icon(Icons.check_circle_outline),
                            onTap: (){
                                print('done');
                            },
                          ),
                          selected: false,

                          onTap: (){
                            print('44');




                            showDialog(context: context,
                                builder: (context){

                              return  AlertDialog(
                                title: const Text('html'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      Text('write some codesss and designs write some codesss and designs write some codesss and designs '),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Add SubTast'),
                                    onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                            AddSubNoteScreen())

                           )   ;
                                    },
                                  ),
                                ],
                              );
                                });

                          },
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('2023-05-11'),
                            Row(

                              children: [

                              IconButton(onPressed: (){
                                print('remove');
                              }, icon: Icon(Icons.highlight_remove_outlined)) ,
                              IconButton(onPressed: (){
                                print('edit');
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> EditNoteScreen()) );

                              }, icon: Icon(Icons.edit_note)) ,

                            ],
                            mainAxisAlignment: MainAxisAlignment.end ,),
                          ],
                        )
                      ],
                    )
                      ,);
                  },
                  separatorBuilder: (context , index )=>SizedBox(height:  10,) ,
                  itemCount: 1 ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(

        elevation: 5 ,

        onPressed: (){
          print('add note');

          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNoteScreen()

          ));


          },
        child: Icon(Icons.add ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
