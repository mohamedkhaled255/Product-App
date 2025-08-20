import 'package:flutter/material.dart';
import 'package:lab8/contacts/helper/database_helper.dart';
import 'package:lab8/model/user_contact_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<UserContactModel> userContacts = [];
  String name = '', email = '', phone = '';
  bool flag = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  UserContactModel? currentContact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: getAllContact(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  getAllContact() {
    return FutureBuilder(
      future: _getContacts(),
      builder: (context, snapshot) {
        return createListView(context, snapshot);
      },
    );
  }

  createListView(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Center(child: Text("Error : ${snapshot.error}"));
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return Center(child: Text("No Contact Found"));
    }

    userContacts = snapshot.data;
    return ListView.builder(
      itemCount: userContacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(userContacts[index].name ?? "NO Name"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userContacts[index].email ?? "NO Email"),
              Text(userContacts[index].phone ?? "NO phone"),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.black,size: 30,),
                onPressed: () {
                  openAlertDialog(userContacts[index]);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete_forever, color: Colors.red,size: 30,),
                onPressed: () {
                  var dbHelper = DatabaseHelper.db;
                  dbHelper.deleteContact(userContacts[index].id!).then((value) {
                    print("contact deleted : ${userContacts[index].name}");
                    setState(() {});
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<List<UserContactModel>> _getContacts() async {
    var dbHelper = DatabaseHelper.db;
    return await dbHelper.getAllContact();
  }

  _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => openAlertDialog(null),
      backgroundColor: Colors.blue,
      child: Icon(Icons.add),
    );
  }

  void openAlertDialog(UserContactModel? contact) {
    if (contact != null) {
      name = contact.name ?? '';
      email = contact.email ?? '';
      phone = contact.phone ?? '';
      flag = true;
      currentContact = contact;
    } else {
      name = '';
      email = '';
      phone = '';
      flag = false;
      currentContact = null;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(flag ? "Edit Contact" : "Add Contact"),
          content: Form(
            key: key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: name,
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: email,
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: phone,
                  decoration: InputDecoration(labelText: 'Phone'),
                  onChanged: (value) {
                    phone = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter phone";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  if (flag) {
                    updateUser(currentContact!);
                  } else {
                    addUser();
                  }
                }
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            )
          ],
        );
      },
    );
  }

  void addUser() {
    var dbHelper = DatabaseHelper.db;
    dbHelper
        .insertContact(
            UserContactModel(name: name, email: email, phone: phone))
        .then((value) {
      print("Contact added: $value");
      name = '';
      email = '';
      phone = '';
      Navigator.pop(context);
      setState(() {});
    });
  }

  void updateUser(UserContactModel contact) {
    var dbHelper = DatabaseHelper.db;
    dbHelper
        .UpdateContact(UserContactModel(
          id: contact.id,
          name: name,
          email: email,
          phone: phone,
        ))
        .then((value) {
      print("Contact updated: ${contact.id}");
      Navigator.pop(context);
      setState(() {});
    });
  }
}
