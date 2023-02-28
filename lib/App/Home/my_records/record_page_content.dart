import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecordPageContent extends StatelessWidget {
  const RecordPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('records').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Somethink went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading'));
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Wrap(
                    children: [
                      Dismissible(
                        key: ValueKey(document.id),
                        direction: DismissDirection.startToEnd,
                        background: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          alignment: AlignmentDirectional.centerStart,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (_) {
                          FirebaseFirestore.instance
                              .collection('records')
                              .doc(document.id)
                              .delete();
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Alert"),
                                content: const Text(
                                    "Czy napewno chcesz usunąć tę ewidencję"),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text("Usuń")),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text("Anuluj"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[Colors.green, Colors.yellow],
                            ),
                          ),
                          // padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                children: [
                                  const Text(
                                    'Data zabiegu:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    document['recordDate'],
                                    style: const TextStyle(fontSize: 17),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  const Text(
                                    'Nazwa rośliny:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    document['plantName'],
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  const Text(
                                    'Numer ewid. działki/pola:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    document['fieldNumber'].toString(),
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  const Text(
                                    'Powierzchnia uprawy:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    document['fieldArea'].toString(),
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  const Text(
                                    'Powierzchnia zabiegu:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    document['protectionArea'].toString(),
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  const Text(
                                    'Nazwa środka:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    document['productName'],
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  const Text(
                                    'Dawka środka:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    document['dose'].toString(),
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  const Text(
                                    'Powód:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    document['treatmentCouse'],
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        });
  }
}
