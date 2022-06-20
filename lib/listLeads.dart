import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myknott/get_leads.dart';

class ListLeads extends StatefulWidget {
  const ListLeads({Key key}) : super(key: key);

  @override
  State<ListLeads> createState() => _ListLeadsState();
}

class _ListLeadsState extends State<ListLeads> {
  var name = [];
  var email = [];
  var number = [];

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setUp());
  }

  Future<void> setUp() async {
    GetLeads obj = GetLeads();
    await obj.makePostRequest();
    setState(() {
      name = obj.name;
      email = obj.email;
      number = obj.number;
    });
    print(name);
    print(email);
    print(number);
  }

  @override
  Widget build(BuildContext context) {
    //makePostRequest();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            // 2: FixedColumnWidth(75),
            1: FixedColumnWidth(180),
            0: FixedColumnWidth(75),
            //1: FixedColumnWidth(160),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    color: Colors.purple[200],
                    child: const Center(
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: const Center(
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.yellow[200],
                    child: const Center(
                      child: Text(
                        'Number',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            for (var i = 0; i < name.length; i++) ...[
              TableRow(
                children: [
                  TableCell(
                    child: Center(
                      child: Text(
                        name[i],
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        email[i],
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Center(
                      child: Text(
                        number[i].toString(),
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
