import 'package:flutter/material.dart';

import '../Widgets/widgets_Create_Event.dart';

class Create_Event extends StatefulWidget {
  Create_Event({Key? key}) : super(key: key);

  @override
  _Create_EventState createState() {
    return _Create_EventState();
  }
}

class _Create_EventState extends State<Create_Event> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              'CulturArte'),
        ),
        body: ListView(
          children: [
            Text(
              "Crear Evento",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.00,
              ),
            ),
            FormCreateEvent(),
          ],
        ));
  }
}
