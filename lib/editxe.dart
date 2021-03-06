import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Suaxe extends StatefulWidget {
  final String bsx;
  final String gv;
  final String gr;
  final String nv;
  final String nr;
  final String tx;
  final String cmt;
  final String hx;
  final String td;
  const Suaxe({ Key? key, required this.bsx, required this.gv, required this.gr, required this.nv, required this.nr, required this.tx, required this.cmt, required this.hx, required this.td }) : super(key: key);

  @override
  _SuaxeState createState() => _SuaxeState();
}

class _SuaxeState extends State<Suaxe> {
  var fkey = GlobalKey<FormState>();
  DateTime dateVaoBen = DateTime.now();
  TimeOfDay timeVaoBen = TimeOfDay.now();
  DateTime dateRaBen = DateTime.now();
  TimeOfDay timeRaBen = TimeOfDay.now();

 
  _dateVaoBen(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.nv=="null"?dateVaoBen: DateFormat("dd/MM/yyyy").parse(widget.nv),
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
      initialTime: widget.gv=="null"?timeVaoBen: TimeOfDay(
              hour: int.parse(widget.gv.split(":")[0]),
              minute: int.parse(widget.gv.split(":")[1])),
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
      initialDate:widget.nr=="null"?dateRaBen: DateFormat("dd/MM/yyyy").parse(widget.nr),
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
      initialTime: widget.gr=="null"?timeRaBen: TimeOfDay(
              hour: int.parse(widget.gr.split(":")[0]),
              minute: int.parse(widget.gr.split(":")[1])),
      initialEntryMode: TimePickerEntryMode.input,
      errorInvalidText: 'Enter time in valid range',
    );
    if (picked != null && picked != timeRaBen) {
      setState(() {
        timeRaBen = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S????a th??ng tin xe'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              if (fkey.currentState!.validate()) {
              Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text('??a?? s????a tha??nh c??ng'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('OK'))
                        ],
                      );
                    }
                  );
              }
            }, 
            icon: const Icon(Icons.check)
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
                  controller: TextEditingController(text: widget.bsx),
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
                  controller: TextEditingController(text: widget.hx),
                  validator: (value) {
                    if (value!.isEmpty) {
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
                  controller: TextEditingController(text: widget.td),
                  validator: (value) {
                    if (value!.isEmpty) {
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
                  controller: TextEditingController(text: widget.tx),
                  validator: (value) {
                    if (value!.isEmpty) {
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
                  controller: TextEditingController(text: widget.cmt),
                  validator: (value) {
                    if (value!.isEmpty) {
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
                    const Text(
                      'Gi???? va??o b????n: ',
                      style: TextStyle(fontSize: 20),
                    ),
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
            )),
      ),
    );
  }
}