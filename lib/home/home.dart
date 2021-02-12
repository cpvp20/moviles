import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/dessert/dessert_page.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/login.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/colors.dart';

class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var drinkList = ProductRepository.loadProducts(ProductType.BEBIDAS);
  var grainsList = ProductRepository.loadProducts(ProductType.GRANO);
  var dessertList = ProductRepository.loadProducts(ProductType.POSTRES);
  List<ProductItemCart> cartItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: orange),
              accountName: Text(PROFILE_NAME),
              accountEmail: Text(PROFILE_EMAIL),
              currentAccountPicture: CircleAvatar(
                backgroundColor: grey,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    PROFILE_PICTURE,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
              title: Text(PROFILE_CART),
              leading: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Cart(productsList: cartItems)));
              },
            ),
            ListTile(
              title: Text(PROFILE_WISHES),
              leading: Icon(Icons.favorite_border),
              onTap: () {},
            ),
            ListTile(
              title: Text(PROFILE_HISTORY),
              leading: Icon(Icons.store),
              onTap: () {},
            ),
            ListTile(
              title: Text(PROFILE_SETTINGS),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text("CERRAR SESION"),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cart(productsList: cartItems)));
            },
          )
        ],
        title: Text("Inicio"),
      ),
      key: _scaffoldKey,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50),
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 500,
                    height: 260,
                    decoration: BoxDecoration(color: grey, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4.0)
                    ]),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Bebidas", style: TextStyle(fontSize: 26)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          width: 300,
                          height: 300,
                          child:
                              Image.network("https://i.imgur.com/XJ0y9qs.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(color: grey, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4.0)
                    ]),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Granos", style: TextStyle(fontSize: 26)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          width: 300,
                          height: 300,
                          child:
                              Image.network("https://i.imgur.com/5MZocC1.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(color: grey, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4.0)
                    ]),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Postres", style: TextStyle(fontSize: 26)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          width: 300,
                          height: 300,
                          child:
                              Image.network("https://i.imgur.com/fI7Tezv.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Proximamente'),
                  ),
                );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    width: 500,
                    height: 300,
                    decoration: BoxDecoration(
                      color: grey,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 4.0)
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Tazas", style: TextStyle(fontSize: 26)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5.0),
                          width: 300,
                          height: 300,
                          child:
                              Image.network("https://i.imgur.com/fMjtSpy.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HotDrinksPage(
            drinksList: drinkList,
            cartItems: cartItems,
          );
        },
      ),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return GrainsPage(
          grainsList: grainsList,
          cartItems: cartItems,
        );
      }),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return DessertPage(
          dessertList: dessertList,
          cartItems: cartItems,
        );
      }),
    );
  }
}
