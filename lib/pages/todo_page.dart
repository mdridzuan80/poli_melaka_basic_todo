import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  final title;
  final todos;
  final delete_todo;

  const TodoPage(
      {Key? key,
      required this.title,
      required this.todos,
      required this.delete_todo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/add");
              },
              child: const Icon(
                Icons.add,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // children: todos
        //     .map((e) => Container(
        //           height: 50,
        //           //alignment: Alignment.topCenter,
        //           //decoration: BoxDecoration(
        //           //border: Border.all(color: Colors.red, width: 2.0)),
        //           child: Text(e['title']),
        //         ))
        //     .toList(),
        children: [
          Flexible(
            child: Container(
              width: double.infinity,
              color: Colors.amber.shade50,
              child: ListView(
                children: todos
                    .map<Widget>(
                      (e) => Container(
                        //alignment: Alignment.topCenter,
                        //decoration: BoxDecoration(
                        //border: Border.all(color: Colors.red, width: 2.0)),
                        child: Card(
                          child: ListTile(
                            leading: FlutterLogo(),
                            title: Text(e["title"]),
                            trailing: GestureDetector(
                                onTap: () {
                                  showAlertDialog(
                                      context, delete_todo, e["id"]);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

showAlertDialog(BuildContext context, deleteProcess, id) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Batal"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Setuju"),
    onPressed: () {
      deleteProcess(id);
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Amaran!"),
    content: Text("Anda pasti ingin menghapuskan maklumat ini?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
