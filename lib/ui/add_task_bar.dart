import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/ui/theme.dart';
import 'package:todoapp/ui/widgets/input_field.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Task", style: headingStyle,),
              MyInputField(title: "Title", hint: "Enter your title"),
              MyInputField(title: "Note", hint: "Enter your note"),
              MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate), widget: IconButton(
                icon: Icon(Icons.calendar_today_outlined, color: Colors.grey,),
                onPressed: () {
                  _getDateFromUser();
                },
              ),),
              Row(
                children: [
                  Expanded(child: MyInputField(
                    title: 'Start Time',
                    hint: _startTime,
                    widget: IconButton(
                      icon: Icon(Icons.access_time_outlined, color: Colors.grey,),
                      onPressed: () {
                        _getTimeFromUser(isStartTime: true);
                      },
                    ))),
                  SizedBox(width: 12),
                  Expanded(child: MyInputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        icon: Icon(Icons.access_time_outlined, color: Colors.grey,),
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                      )))
                ],
              ),
              MyInputField(title: "Remind", hint: "$_selectedRemind minutes early", widget: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                iconSize: 32,
                elevation: 4,
                style: subTitleStyle,
                underline: Container(height: 0),
                items: remindList.map<DropdownMenuItem<String>>((int value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );
                }
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRemind = int.parse(newValue!);
                  });
                },
              ),)
            ],
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/profile.jpg"),
        ),
        SizedBox(width: 20,)
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2122)
    );

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);

    if (pickedTime == null) {
      print("Time cancelled");
    }
    else if (isStartTime) {
      setState(() {
        _startTime = _formatedTime;
      });
    }
    else if (!isStartTime) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(hour: int.parse(_startTime.split(":")[0]), minute: int.parse(_startTime.split(":")[1].split(" ")[0]))
    );
  }
}

