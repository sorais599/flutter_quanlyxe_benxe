// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddXe extends StatelessWidget {
  String userName;
  AddXe({ Key? key, required this.userName }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThemXe(userName: userName,),
    );
  }
}
class ThemXe extends StatefulWidget {
  final String userName;
  const ThemXe({ Key? key,  required this.userName}) : super(key: key);

  @override
  _ThemXeState createState() => _ThemXeState();
}

class _ThemXeState extends State<ThemXe> {
  DateTime dateVaoBen=DateTime.now();
  TimeOfDay timeVaoBen=TimeOfDay.now();
  DateTime dateRaBen = DateTime.now();
  TimeOfDay timeRaBen = TimeOfDay.now();
  _dateVaoBen (BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateVaoBen,
      initialEntryMode: DatePickerEntryMode.input,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );
    if (picked != null && picked != dateVaoBen) {
      setState(() {
        dateVaoBen = picked;
      });
    }
  }
  _timeVaoBen(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeVaoBen,
      initialEntryMode: TimePickerEntryMode.input,
      errorInvalidText: 'Enter time in valid range',
    );
    if (picked != null && picked != timeVaoBen) {
      setState(() {
        timeVaoBen = picked;
      });
    }
  }
    _dateRaBen(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateRaBen,
      initialEntryMode: DatePickerEntryMode.input,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );
    if (picked != null && picked != dateRaBen) {
      setState(() {
        dateRaBen = picked;
      });
    }
  }

  _timeRaBen(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeRaBen,
      initialEntryMode: TimePickerEntryMode.input,
      errorInvalidText: 'Enter time in valid range',
    );
    if (picked != null && picked != timeRaBen) {
      setState(() {
        timeRaBen = picked;
      });
    }
  }
  var fkey = GlobalKey<FormState>();
  var bsx= TextEditingController();
  var hx = TextEditingController();
  var tx = TextEditingController();
  var td = TextEditingController();
  var cmt = TextEditingController();
  var gv = TextEditingController();
  var gr = TextEditingController();
  var nv = TextEditingController();
  var nr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Th??m Xe M????i'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              if (fkey.currentState!.validate()) {
              Navigator.pop(context);
              showDialog(
                context: context, 
                builder: (context) {
                  return AlertDialog(
                    content: const Text('??a?? th??m tha??nh c??ng'),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context,'OK');
                        }, 
                        child: const Text('OK')
                      )
                    ],
                  );
                }
              );
              } else {
                print("Not OK");
              }
            }, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: fkey,
          child: Column(
            children: [
            TextFormField(
              controller: bsx,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Bi????n s???? xe kh??ng ????????c ?????? tr????ng";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                hintText: "Vui Lo??ng nh????p bi????n s???? xe",
                labelText: "Bi????n s???? xe",
              ),
            ),
            TextFormField(
              controller: hx,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ha??ng xe kh??ng ????????c ?????? tr????ng";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                hintText: "Vui Lo??ng nh????p ha??ng xe",
                labelText: "Ha??ng xe",
              ),
            ),
            TextFormField(
              controller: td,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Tuy????n ????????ng kh??ng ????????c ?????? tr????ng";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                hintText: "Vui Lo??ng nh????p tuy????n ????????ng",
                labelText: "Tuy????n ????????ng",
              ),
            ),
            TextFormField(
              controller: tx,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "T??n ta??i x???? kh??ng ????????c ?????? tr????ng";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                hintText: "Vui Lo??ng nh????p t??n ta??i x????",
                labelText: "Ta??i X????",
              ),
            ),
            TextFormField(
              controller: cmt,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ch????ng minh th?? kh??ng ????????c ?????? tr????ng";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                hintText: "Vui Lo??ng nh????p s???? ch????ng minh th??",
                labelText: "Ch????ng minh th??",
              ),
            ),
            Row(
              children: [
                const Text(
                  'Nga??y va??o b????n: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(dateVaoBen),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => _dateVaoBen(context),
                  icon: const Icon(Icons.date_range),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Gi???? va??o b????n: ',style: TextStyle(fontSize: 20),),
                Text(
                  timeVaoBen.format(context),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => _timeVaoBen(context),
                  icon: const Icon(Icons.watch),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Nga??y ra b????n: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(dateRaBen),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => _dateRaBen(context),
                  icon: const Icon(Icons.date_range),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Gi???? ra b????n: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  timeRaBen.format(context),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => _timeRaBen(context),
                  icon: const Icon(Icons.watch),
                ),
              ],
            ),
            ],
          )
        ),
      ),
    );
  }

}



