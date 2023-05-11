import 'package:flutter/material.dart';

class ServiceForm extends StatefulWidget {
  const ServiceForm({Key? key}) : super(key: key);

  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final _formKey = GlobalKey<FormState>();

  late int _serviceCount;
  late TimeOfDay _openTime;
  late TimeOfDay _closeTime;
  late String _serviceDetails;
  late int _selectedTime;
  late List<String> _selectedVehicleTypes;
  late List<TextEditingController> _priceControllers;
  late List<double> _prices;

  final List<int> _timeList = [15, 30, 45, 60];
  final List<String> _vehicleTypeList = [
    'รถเก๋ง',
    'กระบะ',
    'รถตู้',
    'SUV',
    'HashBack'
  ];

  @override
  void initState() {
    super.initState();
    _serviceCount = 0;
    _openTime = TimeOfDay(hour: 9, minute: 0);
    _closeTime = TimeOfDay(hour: 18, minute: 0);
    _serviceDetails = '';
    _selectedTime = 15;
    _selectedVehicleTypes = [_vehicleTypeList.first];
    _priceControllers = List.generate(
      _vehicleTypeList.length,
      (index) => TextEditingController(),
    );
    _prices = List.generate(_vehicleTypeList.length, (index) => 0.0);
  }

  Future<void> _selectTime(BuildContext context, TimeOfDay selectedTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        if (selectedTime == _openTime) {
          _openTime = picked;
        } else if (selectedTime == _closeTime) {
          _closeTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Service Count',
              ),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                setState(() {
                  _serviceCount = int.parse(value!);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Open Time'),
              subtitle: Text('${_openTime.format(context)}'),
              onTap: () {
                _selectTime(context, _openTime);
              },
            ),
            ListTile(
              leading: const Icon(Icons.timer_off),
              title: const Text('Close Time'),
              subtitle: Text('${_closeTime.format(context)}'),
              onTap: () {
                _selectTime(context, _closeTime);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Service Details',
              ),
              maxLines: null,
              onSaved: (value) {
                setState(() {
                  _serviceDetails = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Service Time (minutes)'),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _timeList.map((time) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: time == _selectedTime
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      '$time',
                      style: TextStyle(
                        fontWeight: time == _selectedTime
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            const Text('Vehicle Types'),
            const SizedBox(height: 8.0),
            Wrap(
              children: _vehicleTypeList.map((vehicleType) {
                return CheckboxListTile(
                  title: Text(vehicleType),
                  value: _selectedVehicleTypes.contains(vehicleType),
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedVehicleTypes.add(vehicleType);
                      } else {
                        _selectedVehicleTypes.remove(vehicleType);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            const Text('Prices'),
            const SizedBox(height: 8.0),
            Column(
              children: _selectedVehicleTypes.map((vehicleType) {
                final index = _vehicleTypeList.indexOf(vehicleType);
                return Row(
                  children: [
                    Expanded(child: Text(vehicleType)),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: _priceControllers[index],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Price',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _prices[index] = double.parse(value);
                          });
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState?.save();
                print(
                  'Service Count: $_serviceCount\nOpen Time: $_openTime\nClose Time: $_closeTime\nService Details: $_serviceDetails\nSelected Time: $_selectedTime\nSelected Vehicle Types: $_selectedVehicleTypes\nPrices: $_prices',
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
