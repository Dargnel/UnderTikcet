import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//optener los datos de la base de datos
Future<List> getEvent () async{
  List events = [];
  CollectionReference referentsEvents = db.collection("Eventos");
  QuerySnapshot queryEvent = await referentsEvents.get();

  queryEvent.docs.forEach((element) {

    events.add(element.data());
  });
  return events;
}

//crar dato en la base de datos
Future<void> addEvent (String name,String description,String price) async{
  await db.collection("Eventos").add(
      { "Descripcion":description,
        "Nombre":name,
        "Precioboleta1": int.parse(price)});
}