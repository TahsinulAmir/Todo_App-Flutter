import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerDesc = TextEditingController();
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
      body: Container(
        padding: EdgeInsets.all(20),
        width: widthBody,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[350]),
              child: TextField(
                controller: controllerTitle,
                maxLength: 20,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: heightBody * 0.05,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[350]),
              child: TextField(
                controller: controllerDesc,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Description",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
