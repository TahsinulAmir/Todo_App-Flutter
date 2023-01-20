import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool varSementara = true;
  @override
  Widget build(BuildContext context) {
    AppBar myAppBar = AppBar(
      title: Text(
        "Todo App",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

    // Layout Responseve
    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: myAppBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: widthBody,
                height: heightBody * 0.15,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search your task...",
                  ),
                ),
              ),
              Container(
                  height: heightBody * 0.85,
                  width: widthBody,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        secondary: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          "Title",
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text("Subtitle"),
                        value: varSementara,
                        onChanged: (value) {
                          setState(() {
                            varSementara = value!;
                          });
                        },
                      );
                    },
                  )),
            ],
          ),
        ));
  }
}
