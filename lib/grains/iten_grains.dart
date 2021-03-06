import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/colors.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grains;
  ItemGrains({
    Key key,
    @required this.grains,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          padding: const EdgeInsets.all(30.0),
          width: 500,
          height: 260,
          decoration: BoxDecoration(color: grey, boxShadow: [
            BoxShadow(
                color: Colors.grey, offset: Offset(0.0, 1.0), blurRadius: 4.0)
          ]),
          child: Row(
            children: [
              Container(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Café de grano",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 15)),
                    Text(
                      "${widget.grains.productTitle}",
                      style: TextStyle(
                          fontFamily: 'AkzidenzGrotesk BQ Medium',
                          fontSize: 22,
                          color: Colors.white),
                    ),
                    Text("\$${widget.grains.productPrice}",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 24))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                width: 300,
                height: 300,
                child: Image.network(
                  widget.grains.productImage,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 12,
          child: Container(
              child: widget.grains.liked
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border)),
        )
      ]),
    );
  }
}
