


import 'package:flutter/material.dart';



// ignore: must_be_immutable
class CardBanks extends StatefulWidget {
  String type;
  String? accountNumber;
  String? moneyType;
  String? propName;
  String? accountName;
  double? saldo;
  BuildContext context;
  CardBanks({
    required this.context,
    this.propName,
    required this.type,
    this.accountName,
    this.accountNumber,
    this.moneyType,
    this.saldo,
    super.key,
  });


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<CardBanks> createState() => _CardBanks();
}


class _CardBanks extends State<CardBanks> {
  get propName => widget.propName;

  get moneyType => widget.moneyType;

  get accountNumber => widget.accountNumber;

  get saldo => widget.saldo;

  late Widget cardDigital;



  Widget currentCard() {
    switch (widget.type) {
      case 'BMP':
        cardDigital = cardBMP();
        break;
      case 'BPA':
        cardDigital = cardBPA();
        break;
      default:
        throw ('no widget for e');
    }
    return cardDigital;
  }

  Widget cardBPA() {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
          //set border radius more than 50% of height and width to make circle
        ),
      child: const Center(widthFactor: 1, heightFactor: 1, child: Text('Hola BPA')),
    );
  }

  Widget cardBMP() {

    Widget top() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ Container(
        width: MediaQuery.of(context).size.width/1.7,
        height: MediaQuery.of(context).size.height/17,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12))),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/_tygraph_bp.png'),
          Text(
          'Banco Metropolitano S.A',
          style: Theme.of(context).textTheme.bodyMedium,),
          ]),
        ),],
      );
    }
    Widget itemNumAccount(IconData icon) {
      return Center(
          child: Row(
            children: [
              Icon(
                icon,
                size: 34,
                color: Colors.green,
              ),
              Text(
                '$accountNumber',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall,
                ),
            ],
          ));
    }
Widget bottom(){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Text('\$ $saldo',
                   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                     fontWeight: FontWeight.bold,
                   ),),
            ],
              ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                  margin: const EdgeInsets.only(left: 10),
                child: Text('$moneyType',
                  style: Theme.of(context).textTheme.titleLarge,),
              ),
                Card(
                  margin: const EdgeInsets.only(right: 10),
                  color: Colors.white ,
                  shape: const BeveledRectangleBorder(borderRadius:
                  BorderRadius.all(Radius.circular(2))),
                  child: SizedBox(
                    width: MediaQuery.of(context).devicePixelRatio*16,
                    height: MediaQuery.of(context).devicePixelRatio*14,
                    child: Image.asset('assets/ico_rombo_red.png'),
                  ),
                ),

              ],
            )

        ],
      );
}

    return Card(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //set border radius more than 50% of height and width to make circle
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            top(),
            Divider(
              height: MediaQuery.of(context).size.height/20,
              color: Colors.transparent,
            ),
            itemNumAccount(Icons.arrow_left_sharp),
            Divider(
              height: MediaQuery.of(context).size.height/30,
              color: Colors.transparent,
            ),
            bottom(),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),

          ),

          child: currentCard()

      );


  }
}
