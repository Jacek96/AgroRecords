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
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('Data i godzina zabiegu:'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(document['recordDate']),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Nazwa rośliny:'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(document['plantName']),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Numer ewid. działki/pola:'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(document['fieldNumber'].toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Powierzchnia uprawy:'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(document['fieldArea'].toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Powierzchnia zabiegu:'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(document['protectionArea'].toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Nazwa środka:'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(document['productName']),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Dawka środka:'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(document['dose'].toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text('Przyczyna zastosowanie ś.o.r:'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(document['treatmentCouse']),
                              ],
                            ),
                          ],
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
