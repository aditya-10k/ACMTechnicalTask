import 'package:flutter/material.dart';
import 'package:tasksmgmt/utility/taskstile.dart';
import 'package:tasksmgmt/utility/dialoguebox.dart';
class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _controller = TextEditingController();
  




  List tasks = [
    /*['eat',true],
    ['sleep',true]*/
  ];

  void addnewtask()
  {
    setState(() {
      tasks.add([_controller.text,false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void createnewtask()
  {
    showDialog(context: context, builder: (context){
      return Dialoguebox(controller: _controller,
        onCancel:() => Navigator.of(context).pop(),
        onSave: addnewtask ,
      );});
  }

  void checkboxchanged(bool? value ,int index)
  {
    setState(() {
        tasks[index][1] = !tasks[index][1];
    });
  }

  void deletetask(int index) {
    setState(() {

      if (tasks.isNotEmpty && index >= 0 && index < tasks.length) {
        tasks.removeAt(index);
      }
    });
  }

  void editTask(int index) {
    _controller.text = tasks[index][0];
    showDialog(
      context: context,
      builder: (context) {
        return Dialoguebox(
          controller: _controller,
          onCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          },

          onSave: () {
            if (_controller.text.isNotEmpty) {
              setState(() {
                tasks[index][0] = _controller.text;
              });
              _controller.clear();
            }
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100-30,
          backgroundColor: Colors.yellow[600],
         // elevation: 10,
          title: Text(
              'TASKS',
            style: TextStyle(
              color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
              letterSpacing: 10,

            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context,index) {
            return Taskstile(
              taskname: tasks[index][0],
              complete: tasks[index][1],
              onChanged: (value) => checkboxchanged(value,index),
              deletefunc: (context)=> deletetask(index),
              onEdit: () => editTask(index),
            );
          },

            //Taskstile(),
        ),
        backgroundColor: Colors.yellow[200],
        floatingActionButton: Container(
          width: 70,
          height: 70,
          child: FloatingActionButton(onPressed: () {
            return createnewtask();
          },
            backgroundColor: Colors.yellow[600],
            //shape: ShapeBorder(),
            child: Icon(Icons.add,
            color:Colors.black,
            size: 40,),
          ),
        ),
      ),
    );
  }
}
