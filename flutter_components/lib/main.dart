import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _State createState() => _State();
}

enum Answers { YER, NO, MAYBE }

class _State extends State<MyApp> {
  // Values
  String _value = 'Hello World';
  String _valueDate = 'Now';
  int _valueAcc = 0;
  String _valueTextChange = '';
  bool _valueCheckbox1 = false;
  bool _valueCheckbox2 = false;
  int _valueRadio1 = 0;
  int _valueRadio2 = 0;
  bool _valueSwitch1 = false;
  bool _valueSwitch2 = false;
  double _valueSlider = 0.0;
  String _valueDatePicker = '';
  int _valueAppBar = 0;
  String _valueFloatingButton = '';
  String _valueFooterButton = '';
  List<BottomNavigationBarItem>? _navigationItems;
  String _valueNavigation = '';
  int _valueNavigationIndex = 0;
  String _valueSimpleAlert = 'Value';

  // Functions
  void _onPressed(String value) {
    setState(() {
      _value = value;
    });
  }

  void _onDateTimePressed() {
    setState(() {
      _valueDate = DateTime.now().toString();
    });
  }

  void _add() {
    setState(() {
      _valueAcc++;
    });
  }

  void _substract() {
    setState(() {
      _valueAcc--;
    });
  }

  void _onChange(String newValue) =>
      setState(() => _valueTextChange = 'Change: $newValue');

  void _onSubmit(String newValue) =>
      setState(() => _valueTextChange = 'Submit: $newValue');

  void _checkboxChanged(bool? newValue) =>
      setState(() => _valueCheckbox1 = newValue ?? false);

  void _checkboxChanged2(bool? newValue) =>
      setState(() => _valueCheckbox2 = newValue ?? false);

  void _setRadioValue(int? newValue) =>
      setState(() => _valueRadio1 = newValue ?? 0);

  void _setRadioValue2(int? newValue) =>
      setState(() => _valueRadio2 = newValue ?? 0);

  void _onChangeSwitch(bool newValue) =>
      setState(() => _valueSwitch1 = newValue);

  void _onChangeSwitch2(bool newValue) =>
      setState(() => _valueSwitch2 = newValue);

  void _setSliderValue(double newValue) {
    setState(() => _valueSlider = newValue);
  }

  Future<DateTime?> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null) setState(() => _valueDatePicker = picked.toString());
    return null;
  }

  Widget makeRadios() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(
          Radio(value: i, groupValue: _valueRadio1, onChanged: _setRadioValue));
    }
    Column column = Column(
      children: list,
    );
    return column;
  }

  Widget makeRadiosTiles() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(RadioListTile(
          value: i,
          groupValue: _valueRadio2,
          onChanged: _setRadioValue2,
          activeColor: Colors.green,
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text('Item $i'),
          subtitle: const Text('Subtitle')));
    }
    Column column = Column(
      children: list,
    );
    return column;
  }

  void _addAppBar() => setState(() => _valueAppBar++);

  void _removeAppBar() => setState(() => _valueAppBar--);

  void _onFloatingButtonClicked() =>
      setState(() => _valueFloatingButton = DateTime.now().toString());

  void _onFooterButtonClicked(String newValue) =>
      setState(() => _valueFooterButton = newValue);

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Some info here',
                  style: TextStyle(
                      color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'))
              ],
            ),
          );
        });
  }

  void _showSnackBar() => ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("This is a SnackBar")));

  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert title'),
            content: Text(message),
            actions: <Widget>[
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Button 1')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Button 2'))
            ],
          );
        });
  }

  void _simpleAlertSetValue(String newValue) =>
      setState(() => _valueSimpleAlert = newValue);

  Future _askUser() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Display buttons'),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pop(context, Answers.YER);
                },
              ),
              SimpleDialogOption(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context, Answers.NO);
                },
              ),
              SimpleDialogOption(
                child: const Text('Maybe'),
                onPressed: () {
                  Navigator.pop(context, Answers.MAYBE);
                },
              )
            ],
          );
        })) {
      case Answers.YER:
        _simpleAlertSetValue('Yes');
        break;
      case Answers.NO:
        _simpleAlertSetValue('No');
        break;
      case Answers.MAYBE:
        _simpleAlertSetValue('Maybe');
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _navigationItems = [];
    _navigationItems?.add(const BottomNavigationBarItem(
        icon: Icon(Icons.people), label: 'People'));
    _navigationItems?.add(const BottomNavigationBarItem(
        icon: Icon(Icons.weekend), label: 'Weekend'));
    _navigationItems?.add(const BottomNavigationBarItem(
        icon: Icon(Icons.message), label: 'Message'));
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
        backgroundColor: Colors.limeAccent,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.add), onPressed: _addAppBar),
          IconButton(icon: const Icon(Icons.remove), onPressed: _removeAppBar),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingButtonClicked,
        backgroundColor: Colors.red,
        mini: true,
        shape: const CircleBorder(),
        child: const Icon(Icons.timer),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
          onPressed: () => _onFooterButtonClicked('Button 1'),
          icon: const Icon(Icons.timer),
        ),
        IconButton(
          onPressed: () => _onFooterButtonClicked('Button 2'),
          icon: const Icon(Icons.people),
        ),
        IconButton(
          onPressed: () => _onFooterButtonClicked('Button 3'),
          icon: const Icon(Icons.map),
        ),
      ],
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              const Text('Hello World'),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                // Name
                Text(_value),
                TextButton(
                  onPressed: () => _onPressed('My name is Gabriel'),
                  child: const Text('Change Text'),
                ),
                // Date-Time
                Text(_valueDate),
                TextButton(
                  onPressed: _onDateTimePressed,
                  child: const Text('Date Time'),
                ),
                // Acc
                Text(_valueAcc.toString()),
                IconButton(onPressed: _add, icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: _substract, icon: const Icon(Icons.remove)),
                // Text change
                Text(_valueTextChange),
                TextField(
                  decoration: const InputDecoration(
                      labelText: 'Hello',
                      hintText: 'Hint',
                      icon: Icon(Icons.people)),
                  autocorrect: true,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onChanged: _onChange,
                  onSubmitted: _onSubmit,
                ),
                // Checkbox
                Checkbox(value: _valueCheckbox1, onChanged: _checkboxChanged),
                CheckboxListTile(
                  value: _valueCheckbox2,
                  onChanged: _checkboxChanged2,
                  title: const Text('Hello World'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: const Text('Subtitle'),
                  secondary: const Icon(Icons.archive),
                  activeColor: Colors.red,
                ),
                // Radios
                makeRadios(),
                makeRadiosTiles(),
                // Switch
                Switch(value: _valueSwitch1, onChanged: _onChangeSwitch),
                SwitchListTile(
                    value: _valueSwitch2,
                    onChanged: _onChangeSwitch2,
                    title: const Text('Hello World',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red))),
                // Slider
                Text('Value: ${(_valueSlider * 100).round()}'),
                Slider(value: _valueSlider, onChanged: _setSliderValue),
                // DatePicker
                Text(_valueDatePicker),
                TextButton(
                  onPressed: _selectDate,
                  child: const Text('Date Time Picker'),
                ),
                // AppBar
                Text(
                  _valueAppBar.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 37.0,
                  ),
                ),
                // Floating button
                Text(_valueFloatingButton),
                // Footer buttons
                Text(_valueFooterButton),
                // Navigation
                Text(_valueNavigation),
                // Bottom Sheet
                const Text('Bottom sheet'),
                TextButton(
                  onPressed: () => _showBottomSheet(),
                  child: const Text('Click me'),
                ),
                // SnackBar
                const Text('Snack Bar'),
                TextButton(
                  onPressed: _showSnackBar,
                  child: const Text('Click me'),
                ),
                // Alert Dialog
                const Text('Alert Dialog'),
                TextButton(
                  onPressed: () => _showAlert(context, 'Show two buttons'),
                  child: const Text('Click me'),
                ),
                // Simple Dialog
                const Text('Simple Dialog'),
                Text(_valueSimpleAlert),
                TextButton(
                  onPressed: () => _askUser(),
                  child: const Text('Click me'),
                ),
                // Card
                const Text('Card'),
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    child: const Column(
                      children: <Widget>[
                        Text('How are you?'),
                        Text('Hello world')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationItems ?? [],
        fixedColor: Colors.red,
        currentIndex: _valueNavigationIndex,
        onTap: (int item) {
          setState(() {
            _valueNavigationIndex = item;
            _valueNavigation =
                'Current value is: ${_valueNavigationIndex.toString()}';
          });
        },
      ),
    );
  }
}
