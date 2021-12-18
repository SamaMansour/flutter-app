// import 'package:flutter/material.dart';
// import 'package:money_converter/Currency.dart';
// import 'package:money_converter/money_converter.dart';
// import 'dart:async';
// import 'dart:convert';
// //import 'package:http/http.dart' as http;



// class CurrencyConverter extends StatefulWidget {
//   const CurrencyConverter({Key? key}) : super(key: key);

//   @override
//   _CurrencyConverterState createState() => _CurrencyConverterState();
// }

// class _CurrencyConverterState extends State<CurrencyConverter> {
//    String? usdToJd;

//    final fromTextController = TextEditingController();
//   late List<String> currencies;
//   String fromCurrency = "USD";
//   String toCurrency = "GBP";
//   late String result;
//    @override
//   void initState() {
//     super.initState();
//     _loadCurrencies();
//   }

//   Future<String> _loadCurrencies() async {
//     String uri = "https://api.exchangeratesapi.io/latest";
//     var response = await http
//         .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
//     var responseBody = json.decode(response.body);
//     Map curMap = responseBody['rates'];
//     currencies = curMap.keys.toList();
//     setState(() {});
//     print(currencies);
//     return "Success";
//   }

//   Future<String> _doConversion() async {
//     String uri = "https://api.exchangeratesapi.io/latest?base=$fromCurrency&symbols=$toCurrency";
//     var response = await http
//         .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
//     var responseBody = json.decode(response.body);
//     setState(() {
//       result = (double.parse(fromTextController.text) * (responseBody["rates"][toCurrency])).toString();
//     });
//     print(result);
//     return "Success";
//   }

//   _onFromChanged(String value) {
//     setState(() {
//       fromCurrency = value;
//     });
//   }

//   _onToChanged(String value) {
//     setState(() {
//       toCurrency = value;
//     });
//   }


 
// }
