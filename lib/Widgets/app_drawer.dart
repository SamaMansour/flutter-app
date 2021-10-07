import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function onTapLink) {
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
      onTap:onTapLink(),
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
            color: Theme.of(context).accentColor,
            child: Text(
              'Home Page',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          buildListTile('Dashbord', Icons.card_travel, () {
            Navigator.of(context).pushNamed('/');
          },),
        ],
      ),
    );
  }
}
