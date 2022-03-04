// import 'package:flutter/material.dart';
//
// class offers extends StatefulWidget {
//   const offers({ Key? key }) : super(key: key);
//
//   @override
//   State<offers> createState() =>offers_screen();
// }
//
// class offers_screen extends State<offers> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(color:Colors.blue);
//   }
// }/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(home: IndexPage()));

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List users = [];
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    var response =
        await http.get(Uri.parse("https://randomuser.me/api/?results=100"));
    print(response.body);
    print(response.headers);
    print(response.request);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map items = json.decode(response.body);
      setState(() {
        users = items['results'];
      });
    } else {
      users = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Random User Listing"),
        ),
        body: users.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    users[index]['picture']['large']),
                                fit: BoxFit.fill),
                          ),
                        ),
                        title: Text(users[index]['name']['title'] +
                            " " +
                            users[index]['name']["first"] +
                            " " +
                            users[index]['name']["last"]),
                        subtitle: Text(users[index]['email']),
                        trailing: Text(users[index]['location']['country']),
                      ),
                    ),
                  );
                }));
  }
}
