import 'package:apidemo/model.dart';
import 'package:apidemo/server.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder<Respose>(
            future: getcategory(),
            builder: (BuildContext context, AsyncSnapshot<Respose> snapshot) {
              if(snapshot.data!=null){
                var data = snapshot.data!.data;
                return ListView.builder(
                  itemCount:data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading:
                      Text(data[index].catId.toString()),
                      title:Image.network(baseURL+data[index].catImage!),
                    );
                  },
                );
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
