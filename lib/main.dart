import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.cyanAccent,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.cyan),
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
              subtitle1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(fontSize: 20)),
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue[900]),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.white,
              selectionHandleColor: Colors.cyan,
              selectionColor: Colors.grey),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              labelStyle: TextStyle(color: Colors.white54),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54)))),
      home: MyHomePage(title: 'CartApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var list = [];
  var textController = TextEditingController();
  var quantityController = TextEditingController();

  void clearInputs() {
    textController.clear();
    quantityController.clear();
  }

  void setList() {
    if (textController.text.length > 0 && quantityController.text.length > 0) {
      setState(() {
        this.list.add(
            textController.text + " - Quantidade: " + quantityController.text);
      });
      clearInputs();
    }
  }

  void clearList() {
    setState(() {
      this.list = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(super.widget.title),
          bottom: PreferredSize(
              preferredSize: Size(200, 150),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          key: Key('productField'),
                          controller: textController,
                          decoration: InputDecoration(
                              labelText: "Produto",
                              suffixIcon: IconButton(
                                  onPressed: clearInputs,
                                  icon: Icon(
                                    Icons.clear,
                                    size: 15,
                                    color: Colors.white,
                                  ))),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              key: Key('quantityField'),
                              controller: quantityController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Quantidade',
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 20, right: 10),
                              child: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: clearList,
                                tooltip: "Limpar",
                              ))
                        ],
                      )
                    ],
                  )))),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            ...list.map((element) {
              return Container(
                  padding: EdgeInsets.only(top: 5, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    element.toString(),
                  ));
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: setList,
        clipBehavior: Clip.none,
      ),
    );
  }
}
