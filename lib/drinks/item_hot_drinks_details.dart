import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment/payment.dart';
import 'package:flutter/material.dart';

class HotDrinkDetails extends StatefulWidget {
  final ProductHotDrinks drink;
  final List<ProductItemCart> cartItems;
  HotDrinkDetails({Key key, @required this.drink, @required this.cartItems})
      : super(key: key);

  @override
  _HotDrinkDetailsState createState() => _HotDrinkDetailsState();
}

class _HotDrinkDetailsState extends State<HotDrinkDetails> {
  final List<String> _sizes = ["Chico", "Mediano", "Grande"];
  @override
  Widget build(BuildContext context) {
    int _sizeSelection = widget.drink.productSize.index;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.drink.productTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(alignment: Alignment.center, children: [
              Container(
                color: orange,
                width: 440,
                height: 440,
              ),
              Container(
                width: 400,
                height: 400,
                child: Image.network(widget.drink.productImage),
              ),
              Positioned(
                top: 10,
                right: 60,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.drink.liked = !widget.drink.liked;
                    });
                  },
                  child: Container(
                      child: widget.drink.liked
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border)),
                ),
              )
            ]),
            SizedBox(height: 14),
            Text(
              widget.drink.productTitle,
              style: TextStyle(
                  fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 25),
            ),
            SizedBox(height: 14),
            Text(widget.drink.productDescription,
                style: TextStyle(
                    fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 18)),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("TAMAÑOS DISPONIBLES"),
                Text("\$${widget.drink.productPrice}",
                    style: TextStyle(
                        fontFamily: 'AkzidenzGrotesk BQ Medium', fontSize: 30))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return ChoiceChip(
                  selectedColor: Colors.purple[50],
                  backgroundColor: Colors.grey[50],
                  shape: StadiumBorder(
                      side: _sizeSelection == index
                          ? BorderSide(color: Colors.purple)
                          : BorderSide.none),
                  selected: _sizeSelection == index ? true : false,
                  label: Text(_sizes[index]),
                  labelStyle: TextStyle(
                      fontFamily: 'AkzidenzGrotesk BQ Medium',
                      color: _sizeSelection == index
                          ? Colors.purple
                          : Colors.grey),
                  onSelected: (selected) {
                    setState(() {
                      _sizeSelection = index;
                      widget.drink.productSize = ProductSize.values[index];
                      widget.drink.productPrice =
                          widget.drink.productPriceCalculator();
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                    color: grey,
                    child: Text("AGREGAR AL CARRITO",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 12,
                            color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      widget.cartItems.add(ProductItemCart(
                          productTitle: widget.drink.productTitle,
                          productAmount: 1,
                          productPrice: widget.drink.productPrice,
                          product: widget.drink,
                          productImage: widget.drink.productImage,
                          productSize: widget.drink.productSize.index,
                          typeOfProduct: ProductType.BEBIDAS));
                    }),
                RaisedButton(
                    color: grey,
                    child: Text("COMPRAR AHORA",
                        style: TextStyle(
                            fontFamily: 'AkzidenzGrotesk BQ Medium',
                            fontSize: 12,
                            color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentPage()));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
