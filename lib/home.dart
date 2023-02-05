import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managment/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var toodos;
  final TextEditingController _textEditingController =
      TextEditingController(text: " ");
  // List<String> todos = ["todo 1", "todo 2"];
  @override
  Widget build(BuildContext context) {
    toodos = context.watch<TodoProvider>().getTodos;
    return Scaffold(
      appBar: AppBar(
        title: const Text("provider stste managment"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Todo lists",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<TodoProvider>()
                        .todoAdd(_textEditingController.text);
                    _textEditingController.text = "";
                  },
                  child: const Text("addTodo"))),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: toodos.length,
                itemBuilder: (context, index) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("- ${toodos[index]}"),
                        const SizedBox(
                          height: 10,
                        )
                      ]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
