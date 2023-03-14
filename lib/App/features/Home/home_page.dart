import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ewidencja/App/features/Home/add_record/add_record_page_content.dart';
import 'package:flutter_ewidencja/App/features/Home/my_account/my_account_page_content.dart';
import 'package:flutter_ewidencja/App/features/Home/my_records/record_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.green, Colors.yellow],
            ),
          ),
        ),
        title: Builder(builder: (context) {
          if (currentIndex == 0) {
            return const Text('Ewidencja zabiegów');
          }
          if (currentIndex == 1) {
            return const Text('Dodaj zabieg');
          }
          return const Text('Moje konto');
        }),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const RecordPageContent();
        }
        if (currentIndex == 1) {
          return AddRecordPageContent(onSave: () {
            setState(() {
              currentIndex = 0;
            });
          });
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Colors.green, Colors.yellow],
        )),
        child: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
          fixedColor: Colors.deepPurple,
          selectedFontSize: 16,
          unselectedItemColor: Colors.black,
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.agriculture,
                  color: Colors.deepPurple,
                ),
                label: 'Ewidencja'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: Colors.deepPurple,
                ),
                label: 'Dodaj zabieg'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.deepPurple,
                ),
                label: 'Moje konto'),
          ],
        ),
      ),
    );
  }
}
