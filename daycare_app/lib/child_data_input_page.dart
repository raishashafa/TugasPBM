import 'package:flutter/material.dart';

class ChildDataInputPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _childData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text('Child Data',
          style: TextStyle(fontWeight: FontWeight.bold))
      ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _childData['name'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                onSaved: (value) => _childData['age'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                onSaved: (value) => _childData['date'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Condition'),
                onSaved: (value) => _childData['condition'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Arrival'),
                onSaved: (value) => _childData['arrival'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Allergic'),
                onSaved: (value) => _childData['allergic'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Temperature'),
                onSaved: (value) => _childData['temperature'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Bottle'),
                onSaved: (value) => _childData['bottle'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Milk Type'),
                onSaved: (value) => _childData['milktype'] = value!,
              ),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  Navigator.pop(context, _childData);
                },
                child: Text('Save',
                  style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
