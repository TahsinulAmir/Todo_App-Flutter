import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Todo> todos = dataTodo;

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

    //Function search
    void searchTodo(String query) {
      final todoFilter = dataTodo.where((todo) {
        final todoTitle = todo.title.toLowerCase();
        final input = query.toLowerCase();
        return todoTitle.contains(input);
      }).toList();
      setState(() {
        todos = todoFilter;
      });
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'add_todo');
          },
          child: Icon(Icons.add),
        ),
        appBar: myAppBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: widthBody,
                height: heightBody * 0.15,
                child: TextField(
                  onChanged: searchTodo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search your task...",
                  ),
                ),
              ),
              todos.length != 0
                  ? Container(
                      height: heightBody * 0.85,
                      width: widthBody,
                      child: ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return CheckboxListTile(
                            secondary: IconButton(
                              onPressed: () {
                                setState(() {
                                  todos.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: todo.isCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            subtitle: Text(todo.desc),
                            value: todo.isCompleted,
                            onChanged: (value) {
                              setState(() {
                                todo.isCompleted = value!;
                              });
                            },
                          );
                        },
                      ))
                  : Container(
                      child: Text("Data Kosong"),
                    ),
            ],
          ),
        ));
  }
}
