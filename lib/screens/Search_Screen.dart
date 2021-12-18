import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/SearchItems.dart';

class SearchScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
         actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CitySearch());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Text('Search Screen '),
    );
  }
}


class CitySearch extends SearchDelegate<Cities> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.navigate_before),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listItems = query.isEmpty
        ? cityDetails
        : cityDetails
            .where((element) => element.name
                .toLowerCase()
                .startsWith(query.toLowerCase().toString()))
            .toList();

    return listItems.isEmpty
        ? Center(child: Text("No Data Found!"))
        : ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(left: 15.00, right: 15.00),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        title: Text(listItems[index].name),
                        
                        onTap: () {
                        
                        },
                      ),
                      Divider(),
                    ],
                  ));
            });
  }
}