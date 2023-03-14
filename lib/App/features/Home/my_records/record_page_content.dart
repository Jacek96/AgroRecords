import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ewidencja/App/features/Home/my_records/cubit/my_records_cubit.dart';

class RecordPageContent extends StatelessWidget {
  const RecordPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => MyRecordsCubit()..start(),
      child: BlocBuilder<MyRecordsCubit, MyRecordsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text('Coś poszło nie tak: ${state.errorMessage}'),
            );
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    alignment: AlignmentDirectional.centerStart,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (_) {
                    context
                        .read<MyRecordsCubit>()
                        .myEvent(documentId: document.id);
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Alert"),
                          content: const Text(
                              "Czy napewno chcesz usunąć daną ewidencję?"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("Usuń")),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Anuluj"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: screenWidth * 1,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[Colors.green, Colors.yellow],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            const Text(
                              'Data zabiegu:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
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
                                  fontWeight: FontWeight.bold, fontSize: 17),
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
                                  fontWeight: FontWeight.bold, fontSize: 17),
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
                                  fontWeight: FontWeight.bold, fontSize: 17),
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
                                  fontWeight: FontWeight.bold, fontSize: 17),
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
                                  fontWeight: FontWeight.bold, fontSize: 17),
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
                                  fontWeight: FontWeight.bold, fontSize: 17),
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
                                  fontWeight: FontWeight.bold, fontSize: 17),
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
            ],
          );
        },
      ),
    );
  }
}
