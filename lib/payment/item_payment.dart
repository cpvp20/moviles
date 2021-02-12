import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:flutter/material.dart';

class ItemPayment extends StatelessWidget {
  final String title;
  final dynamic icon;
  const ItemPayment({Key key, @required this.title, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                contentPadding: EdgeInsets.all(0.0),
                content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                          "https://1pw8z314201u11lztq1ulowz-wpengine.netdna-ssl.com/wp-content/uploads/2016/01/jo-lanta-68KjM0kfsVo-unsplash-310x210.jpg",
                          width: 400),
                      Row(children: [
                        Image.network(
                            "https://freesvg.org/img/1573216394coffee-cut-file-freesvg.org.png",
                            width: 80),
                        SizedBox(width: 10),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("¡Orden Exitosa!",
                                  style: TextStyle(fontSize: 22)),
                              Text("Taza Cupping",
                                  style: TextStyle(fontSize: 16, color: grey))
                            ])
                      ]),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Tu orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil.",
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ]),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Home(title: 'Inicio');
                        }));
                      },
                      child: Text(
                        "ACEPTAR",
                        style: TextStyle(color: Colors.purple),
                      ))
                ],
              );
            });
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        height: 200,
        color: grey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  icon,
                  SizedBox(width: 20),
                  Container(
                    //width: 100,
                    child: Text(title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        )),
                  )
                ],
              ),
            ),
            Positioned(bottom: 10, right: 10, child: Icon(Icons.border_color))
          ],
        ),
      ),
    );
  }
}
