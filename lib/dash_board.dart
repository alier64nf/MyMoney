import 'package:flutter/material.dart';
import 'card_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<Dashboard> createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  late PageController _controller;
  late PageController _controller2;
  var currentcard = 0;
  var currentdate = DateTime.monthsPerYear;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentdate,
      viewportFraction: 0.32,
    );
    _controller2 = PageController(
      initialPage: currentcard,
      viewportFraction: 0.74,
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget selectorCard() {
      return Expanded(
        flex: 1,
          child: PageView(
              controller: _controller2,
              scrollDirection: Axis.horizontal,
              children: [
                CardBanks(
                    context:context,
                    type: 'BMP',
                    propName: 'Alier Nuñez Fonseca',
                    accountName: 'CUP',
                    accountNumber: '9224 9598 7724 0331',
                    moneyType: 'CUP',
                    saldo: 234,
                  ),
                CardBanks(
                    context:context,
                    type: 'BMP',
                    propName: 'Peddro J Fonseca',
                    accountName: 'CUP',
                    accountNumber: '9224 9598 3421 8900',
                    moneyType: 'CUP',
                    saldo: 2324,),
                CardBanks(
                    context:context,
                    type: 'BMP',
                    propName: 'Peddro J Fonseca',
                    accountName: 'CUP',
                    accountNumber: '9224 9598 3421 8900',
                    moneyType: 'CUP',
                    saldo: 1234,),
              ]),
      );
    }

    Widget pageViewMonth(String month, int position) {
      // ignore: no_leading_underscores_for_local_identifiers
      Alignment _alignment;

      final selected = Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onTertiary,
        fontWeight:FontWeight.bold,
        letterSpacing: 2,
      );

      final unselected =  Theme.of(context).textTheme.titleSmall!.copyWith(
        color: Theme.of(context).colorScheme.onTertiary,

      );
      if (position == currentdate) {
        _alignment = Alignment.center;
      } else if (position > currentdate) {
        _alignment = Alignment.centerRight;
      } else {
        _alignment = Alignment.centerLeft;
      }

      return Align(
          alignment: _alignment,
          child: Text(
            month,
            style: position == currentdate ? selected : unselected,
          ));
    }

    Widget selectorMonth() {
      return SizedBox.fromSize(
        size: const Size.fromHeight(50),
        child: PageView(
            controller: _controller,
            //scrollDirection: Axis.horizontal,
            onPageChanged: (newPage) {
              setState(() {
                currentdate = newPage;
              });
            },
            children: [
              pageViewMonth('Enero', 0),
              pageViewMonth('Febrero', 1),
              pageViewMonth('Marzo', 2),
              pageViewMonth('Abril', 3),
              pageViewMonth('Mayo', 4),
              pageViewMonth('Junio', 5),
              pageViewMonth('Julio', 6),
              pageViewMonth('Agosto', 7),
              pageViewMonth('Septiembre', 8),
              pageViewMonth('Noviembre', 9),
              pageViewMonth('Octubre', 10),
              pageViewMonth('Diciembre', 11),
            ]),
      );
    }

    Widget listInfo(IconData icon, String label, String text, Color color) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: color,
              ),
              Text(label,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  inherit: true,
                                  color: Theme.of(context).colorScheme.onTertiary,
                                  letterSpacing: 3)
                      ),
            ],
          ),
          Text(text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  inherit: true,
                  color: Theme.of(context).colorScheme.onTertiary,
                  letterSpacing: 3)
          ),
        ],
      );
    }

    Widget tabInfo() {
      return Expanded(
        flex: 2,
        child: DecoratedBox(
          decoration:  BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                const Divider(height: 20,),
                selectorMonth(),
                Container(
                    height: 2,
                    decoration:
                    BoxDecoration(color: Theme.of(context).cardColor)),
                const Divider(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    listInfo(
                        Icons.monetization_on, 'Saldo Inicial', '\$ 3234.3',
                        Colors.blue),
                    listInfo(
                        Icons.money_off, 'Saldo Final', '\$ 5232.3',
                        Colors.blue),
                  ],
                ),
                const Divider(height: 20,),
                Container(
                    height: 2,
                    decoration:
                    BoxDecoration(color: Theme.of(context).cardColor)),
                const Divider(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    listInfo(
                        Icons.monetization_on_sharp, 'Ingresos', '\$ 4231.3',
                        Colors.green),
                    listInfo(
                        Icons.money_off_sharp, 'Gastos', '\$ 2234.2',
                        Colors.red),
                  ],
                ),
              ]),
        ),
      );
    }


    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme
                  .of(context)
                  .colorScheme
                  .primary,
              Theme
                  .of(context)
                  .colorScheme
                  .secondary,
            ],
            stops: const [0.12, 0.7],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,),),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            selectorCard(),
            const SizedBox(
              height: 10,
            ),
            tabInfo(),
          ],
        ),
      ),
    );
  }
}
