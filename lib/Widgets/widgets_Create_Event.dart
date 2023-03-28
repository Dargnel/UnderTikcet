import 'package:culturarte/Widgets/widgets_Goglemaps.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Services/firebase_service.dart';

class FormCreateEvent extends StatefulWidget {
  FormCreateEvent({Key? key}) : super(key: key);

  @override
  _FormCreateEventState createState() {
    return _FormCreateEventState();
  }
}

class _FormCreateEventState extends State<FormCreateEvent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController nameControler = TextEditingController(text: "");
  TextEditingController descriptionControler = TextEditingController(text: "");
  TextEditingController priceControler = TextEditingController(text: "");
  String placeControler="";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [


          TextField(
            controller: nameControler,
            decoration: InputDecoration(
              hintText: 'Nombre',
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            controller: descriptionControler,
            decoration: InputDecoration(
              hintText: 'Descripcion',
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            controller: priceControler,
            decoration: InputDecoration(
              hintText: 'Precioboleta1',
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),

          GoogleMapsWidget(
            onMarkerPositionChanged: (LatLng position) {
              // Usa la posición del marcador aquí
              placeControler= '${position.latitude}, ${position.longitude}';
            },
          ),
          ElevatedButton(
              onPressed: () async {
                await addEvent(nameControler.text, descriptionControler.text,
                    priceControler.text,placeControler)
                    .then((value) {
                  Navigator.pop(context);
                });
              },
              child: Text("Crear Evento")),
        ],
      ),
    );
  }
}



