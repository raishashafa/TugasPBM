import 'package:flutter/material.dart';

class ActivityInputPage extends StatefulWidget {
  @override
  _ActivityInputPageState createState() => _ActivityInputPageState();
}

class _ActivityInputPageState extends State<ActivityInputPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _activityData = {};
  final Map<String, bool> _checkboxState = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text('Daily Activity',
          style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSectionTitle('Name'),
              TextFormField(
                //decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _activityData['name'] = value!,
              ),
              _buildSectionTitle('Date'),
              TextFormField(
                //ecoration: InputDecoration(labelText: 'Date'),
                onSaved: (value) => _activityData['date'] = value!,
              ),
              _buildSectionTitle('Arrival'),
              TextFormField(
                //decoration: InputDecoration(labelText: 'Time'),
                onSaved: (value) => _activityData['time'] = value!,
              ),
              _buildSectionTitle('Body Temperature'),
              TextFormField(
                //decoration: InputDecoration(labelText: 'Temperature'),
                onSaved: (value) => _activityData['temperature'] = value!,
              ),
              _buildSectionTitle('Conditions'),
              TextFormField(
                //decoration: InputDecoration(labelText: 'Condition'),
                onSaved: (value) => _activityData['condition'] = value!,
              ),
              _buildSectionTitle('Meals'),
              _buildMealInput('Breakfast', 'breakfast'),
              _buildMealInput('Snack', 'snack'),
              _buildMealInput('Lunch', 'lunch'),
              _buildMealInput('Dinner', 'dinner'),
              _buildMealInput('Other', 'other'),
              _buildSectionTitle('Toilet'),
              _buildToiletSection(),
              _buildSectionTitle('Bottle'),
              _buildBottleSection(),
              _buildSectionTitle('Activity'),
              TextFormField(
                decoration: InputDecoration(labelText: 'Sport/Park/Sensory Play/Gymnastic'),
                onSaved: (value) => _activityData['act'] = value!,
              ),
              _buildSectionTitle('Other'),
              _buildShowerVitaminSection(),
              _buildSectionTitle('Notes for My Parents'),
              _buildNotesForParentsSection(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  Navigator.pop(context, _activityData);
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMealInput(String label, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Checkbox(
              value: _checkboxState['${key}_none'] ?? false,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxState['${key}_none'] = value!;
                });
              },
            ),
            Text('None'),
            Checkbox(
              value: _checkboxState['${key}_some'] ?? false,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxState['${key}_some'] = value!;
                });
              },
            ),
            Text('Some'),
            Checkbox(
              value: _checkboxState['${key}_lots'] ?? false,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxState['${key}_lots'] = value!;
                });
              },
            ),
            Text('Lots'),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Food'),
          onSaved: (value) => _activityData[key] = value!,
        ),
      ],
    );
  }

  Widget _buildToiletSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildToiletRow(),
        _buildToiletRow(),
      ],
    );
  }

  Widget _buildToiletRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _buildExpandedField('Time', 'toilet_time'),
          _buildCheckboxGroup(['Diaper', 'Potty'], 'toilet_tipe'),
          _buildCheckboxGroup(['Dry', 'Wet', 'BM'], 'toilet_dry_wet_bm'),
          _buildExpandedField('Notes', 'toilet_notes'),
        ],
      ),
    );
  }

  Widget _buildBottleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBottleRow(),
        _buildBottleRow(),
      ],
    );
  }

  Widget _buildBottleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _buildExpandedField('Time', 'bottle_time'),
          _buildExpandedField('ML', 'bottle_ml'),
          _buildCheckboxGroup(['Breast', 'Formula', 'Milk'], 'bottle_type'),
          _buildExpandedField('Notes', 'bottle_notes'),
        ],
      ),
    );
  }

  Widget _buildExpandedField(String hint, String key) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(),
          ),
          onSaved: (value) => _activityData[key] = value!,
        ),
      ),
    );
  }

  Widget _buildCheckboxGroup(List<String> labels, String key) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: labels.map((label) {
          return Row(
            children: [
              Checkbox(
                value: _checkboxState['${key}_$label'] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxState['${key}_$label'] = value!;
                  });
                },
              ),
              Text(label),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildShowerVitaminSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Shower:' , style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 8),
            Text('Morning:'),
            _buildSmallField('shower_morning'),
            SizedBox(width: 16),
            Text('Afternoon:'),
            _buildSmallField('shower_afternoon'),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text('Vitamin:' , style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 8),
            _buildLargeField('vitamin'),
          ],
        ),
      ],
    );
  }

  Widget _buildNotesForParentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ITEM I NEED:'),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _buildItemCheckbox('Diapers'),
            _buildItemCheckbox('Hand Towel'),
            _buildItemCheckbox('Cream'),
            _buildItemCheckbox('Clothes'),
            _buildItemCheckbox('Towel'),
            _buildItemCheckbox('Soap & Shampoo'),
            _buildItemCheckbox('Milk'),
            _buildItemCheckbox('Toothpaste'),
            _buildItemCheckbox('Other', withTextField: true),
          ],
        ),
      ],
    );
  }

  Widget _buildItemCheckbox(String label, {bool withTextField = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _checkboxState['item_needed_$label'] ?? false,
          onChanged: (bool? value) {
            setState(() {
              _checkboxState['item_needed_$label'] = value!;
            });
          },
        ),
        Text(label),
        if (withTextField)
          SizedBox(
            width: 100,
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              onSaved: (value) => _activityData['item_needed_$label'] = value!,
            ),
          ),
      ],
    );
  }

  Widget _buildSmallField(String key) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
        ),
        onSaved: (value) => _activityData[key] = value!,
      ),
    );
  }

  Widget _buildLargeField(String key) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
        ),
        onSaved: (value) => _activityData[key] = value!,
      ),
    );
  }
}
