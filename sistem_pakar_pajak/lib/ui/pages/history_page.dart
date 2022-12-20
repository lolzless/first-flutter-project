import 'package:sistem_pakar_pajak/models/database/databasehelper.dart';
import 'package:sistem_pakar_pajak/ui/pages/show_history.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text(
          'Riwayat Konsultasi',
          style: whiteTextStyle.copyWith(
            fontWeight: regular,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [kSecondaryColor, kPrimaryColor],
            ),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<History>>(
          future: DatabaseHelper.instance.getHistory(),
          builder:
              (BuildContext context, AsyncSnapshot<List<History>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return snapshot.data!.isEmpty
                ? Container(
                    width: size.width * 60,
                    height: size.height * 60,
                    margin: EdgeInsets.only(
                        top: 60, left: 80, right: 80, bottom: 80),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/no_history.png'),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 5,
                      right: 5,
                    ),
                    child: ListView(
                      children: snapshot.data!.map((history) {
                        return Center(
                          child: Card(
                            child: ListTile(
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    DatabaseHelper.instance.remove(history.id!);
                                  });
                                },
                              ),
                              title: Text(history.name),
                              subtitle: Text(convertDateTime(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      history.dateTime))),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShowHistory(
                                              history: history,
                                            )));
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class History {
  final int? id;
  final String name, solusi;
  final int dateTime;

  History({
    this.id,
    required this.dateTime,
    required this.name,
    required this.solusi,
  });

  factory History.fromMap(Map<String, dynamic> json) => new History(
      id: json['id'],
      name: json['name'],
      solusi: json['solusi'],
      dateTime: json['datetime']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'solusi': solusi,
      'datetime': dateTime,
    };
  }
}
