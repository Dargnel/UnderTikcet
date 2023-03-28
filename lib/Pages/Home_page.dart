import 'package:flutter/material.dart';
import 'package:culturarte/Widgets/widgets_Home.dart';


class Home extends StatefulWidget {
  const Home({
    Key? key,
  }): super (key: key);

  @override
  State<Home> createState() => _HomeState();
}


@override
class _HomeState extends State<Home>{

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              'CulturArte'),
        ),
        body:SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              card_event(context),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        ),
                      onPressed:  () async{
                        await Navigator.pushNamed(context, '/add_event');
                        setState(() {
                        });
                      },
                      child: Center(
                        child:Text("Crear Evento"),
                      )
            ),
                  SearchBar(),
                ],
              )

            ],
          ),
        )
        );


  }
}