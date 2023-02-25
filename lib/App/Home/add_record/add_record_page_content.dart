import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddRecordPageContent extends StatefulWidget {
  AddRecordPageContent({
    super.key,
    required this.onSave,
  });

  final Function onSave;

  @override
  State<AddRecordPageContent> createState() => _AddRecordPageContentState();
}

class _AddRecordPageContentState extends State<AddRecordPageContent> {
  var plantName = '';
  var fieldArea = '';
  var protectionArea = '';
  var recordDate = '';
  var productName = '';
  var dose = '';
  var treatmentCouse = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Podaj nazwę rośliny',
                ),
                onChanged: (newValue) {
                  setState(() {
                    plantName = newValue;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Podaj powierzchnię uprawy',
                ),
                onChanged: (newValue) {
                  setState(() {
                    fieldArea = newValue;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Podaj powierzchnię wykonania zabiegu',
                ),
                onChanged: (newValue) {
                  setState(() {
                    protectionArea = newValue;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Podaj termin zabiegu',
                ),
                onChanged: (newValue) {
                  setState(() {
                    recordDate = newValue;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Podaj nazwę zastosowanego środka',
                ),
                onChanged: (newValue) {
                  setState(() {
                    productName = newValue;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Podaj dawkę ś.o.r. kg/l',
                ),
                onChanged: (newValue) {
                  setState(() {
                    dose = newValue;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Podaj przyczynę zastosowania ś.o.r',
                ),
                onChanged: (newValue) {
                  setState(() {
                    treatmentCouse = newValue;
                  });
                },
              ),
              ElevatedButton(
                onPressed: plantName.isEmpty ||
                        fieldArea.isEmpty ||
                        protectionArea.isEmpty ||
                        recordDate.isEmpty ||
                        productName.isEmpty ||
                        dose.isEmpty ||
                        treatmentCouse.isEmpty
                    ? null
                    : () {
                        FirebaseFirestore.instance.collection('records').add({
                          'plantName': plantName,
                          'fieldArea': fieldArea,
                          'protectionArea': protectionArea,
                          'recordDate': recordDate,
                          'productName': productName,
                          'dose': dose,
                          'treatmentCouse': treatmentCouse,
                        });
                        widget.onSave();
                      },
                child: const Text('Dodaj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
