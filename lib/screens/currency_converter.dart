import 'package:flutter/material.dart';
import 'package:money_converter/Currency.dart';
import 'package:money_converter/money_converter.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  //def varebile
  String? usdToEgp;
  int currValue =0 ;
  TextEditingController _currentController = new TextEditingController();

  @override
  void initState() {
    super.initState();
// add in initState
    getAmounts();
  }

// call function to convert
  void getAmounts() async {
    var usdConvert = await MoneyConverter.convert(
        Currency(Currency.EGP, amount: currValue*0.0451247), Currency(Currency.USD));
   
    setState(() {
      usdToEgp = usdConvert.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Currency.EGP.toString());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Money Convertor'),
          centerTitle: true,
        ),
        body: Container(
          
          padding: EdgeInsets.all(20),
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                textAlign: TextAlign.center,
                controller:_currentController,
                onChanged: (value) {
                  currValue = int.parse(value) ;
                 
                },
                decoration: InputDecoration(
                  hintText: 'Enter Value',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Converted = ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Text(
                      "$usdToEgp ${Currency.USD}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          
        ),
      ),
    );
  }
}
