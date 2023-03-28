import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Services/firebase_service.dart';

//widget Barra de busqueda del evento
class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showSearchBar = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: showSearchBar
              ? TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                )
              : Container(),
        ),
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {
            setState(() {
              showSearchBar = !showSearchBar;
            });
          },
        ),
      ],
    );
  }
}



//widget carta de eventos
Widget card_event(BuildContext context) {
  return FutureBuilder(
      future: getEvent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.25,
            child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // padding: EdgeInsets.all(15.0),
                      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                                "https://ichef.bbci.co.uk/news/640/cpsprodpb/10E9B/production/_109757296_gettyimages-1128004359.jpg"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              snapshot.data?[index]["Nombre"],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Text(
                              snapshot.data?[index]["Descripcion"],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: () {
                              var precio = snapshot.data?[index]
                                      ["Precioboleta1"]
                                  .toString();
                              if (snapshot.data?[index]["Precioboleta1"] == 0) {
                                return Text(
                                  "Este evento es de entrada Gratuita",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,
                                      color: Colors.white),
                                );
                              } else {
                                return Text(
                                  "Precio boleta: " + precio!,
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,
                                      color: Colors.white),
                                );
                              }
                            }(),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: () {
                              cosas() {}
                              if (snapshot.data?[index]["Precioboleta1"] == 0) {
                                return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .deepPurple, // Establecer el color del botón
                                    ),
                                    onPressed: cosas,
                                    child: Text("Confirmas asistencia"));
                              } else {
                                return ElevatedButton(
                                    onPressed: cosas,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .deepPurple, // Establecer el color del botón
                                    ),
                                    child: Text("Comprar boleta"));
                              }
                            }(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: IconButton(
                                  icon: Image.network("https://cdn-icons-png.flaticon.com/512/599/599419.png?w=740&t=st=1679419709~exp=1679420309~hmac=6e42e8fdd9aa5b734c6e6b35ec532032f5f0ca2279d21971154cfe96edd83ec7"),
                                  onPressed: () {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: IconButton(
                                  icon: Image.network("https://cdn-icons-png.flaticon.com/512/346/346059.png?w=740&t=st=1679419912~exp=1679420512~hmac=8677fb40a2aba37c51207c56a2228e1b390f811875cad64d4b62fdf33a47a32e"),
                                  onPressed:  () async {

                                    const url = 'https://www.google.com/maps/search/?api=1&query=';
                                    final query = snapshot.data?[index]["Ubicacion"];
                                    if (await canLaunchUrlString(url + query)) {
                                      await launchUrlString(url + query);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                      },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: IconButton(
                                  icon: Image.network("https://cdn-icons-png.flaticon.com/512/225/225092.png?w=740&t=st=1679419957~exp=1679420557~hmac=cca50e4f9a79ecfbca949eeb4eb66a079a22af7d379daebddcc5310c9cf5b4cb"),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      ));
                }),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}
