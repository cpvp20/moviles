import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/payment/item_payment.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pagos"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Elige tu método de pago:",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'AkzidenzGrotesk BQ Medium',
                )),
            ItemPayment(
                title: "Tarjeta de crédito",
                icon: Icon(
                  Icons.credit_card,
                  size: 110,
                  color: blue,
                )),
            ItemPayment(
                title: "PayPal",
                icon: Image.asset(
                  "images/paypal.png",
                  height: 110,
                )),
            ItemPayment(
                title: "Tarjeta de regalo",
                icon: Icon(
                  Icons.card_giftcard,
                  size: 110,
                  color: blue,
                ))
          ],
        ),
      ),
    );
  }
}
