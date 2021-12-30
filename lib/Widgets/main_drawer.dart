import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'package:jordantimes_final/screens/welcome_screen.dart';
import 'package:translator/src/extension.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({ Key? key }) : super(key: key);

  @override
 
   
  Widget buildListTile(String title, IconData icon, Function onTapLink) {
     final _auth = FirebaseAuth.instance;
     const en = Locale("en", "UK");
     const ar = Locale("ar", "AE");
     var currentLocale = en;
    var currentLanguage = "Enhlish";
TextDirection currentTextDir = TextDirection.ltr;
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.red,
            child: Text(
           'Home',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          new ListTile(
               leading: const Icon(Icons.phone),
              title: Text('Contactus', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                  Navigator.of(context).pushNamed(
                       'contactus');
                
              }),
         
           
         
          SizedBox(height: 20),
          new ListTile(
             leading: const Icon(Icons.money),
              title: Text('Currency Converter', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                   Navigator.of(context).pushNamed(
                       'currency_converter');
                
              }),

               
        
          SizedBox(height: 20),
          new ListTile(
            leading: const Icon(Icons.translate),
              title: Text('Change Language ', style: Theme.of(context).textTheme.headline6),
              onTap: () => _onActionSheetPress(context)),
        ],
      ),
    );
  }

  void showDemoActionSheet(
      {required BuildContext context, required Widget child}) {
    showCupertinoModalPopup<String>(
        context: context,
        builder: (BuildContext context) => child).then((String? value) {
      if (value != null) changeLocale(context, value);
    });
  }

  void _onActionSheetPress(BuildContext context) {
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: Text(translate('language.selection.title')),
        message: Text(translate('language.selection.message')),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text(translate('language.name.en')),
            onPressed: () => Navigator.pop(context, 'en_US'),
          ),
          CupertinoActionSheetAction(
            child: Text(translate('language.name.es')),
            onPressed: () => Navigator.pop(context, 'es'),
          ),
          CupertinoActionSheetAction(
            child: Text(translate('language.name.fa')),
            onPressed: () => Navigator.pop(context, 'fa'),
          ),
          CupertinoActionSheetAction(
            child: Text(translate('language.name.ar')),
            onPressed: () => Navigator.pop(context, 'ar'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(translate('button.cancel')),
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context, null),
        ),
      ),
    );
  }
  }
