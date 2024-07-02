import 'package:flutter/material.dart';
import 'package:phish_defender/api_end_points/data.dart';
import 'package:phish_defender/core/textstyle.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Datadb.instance.tablenotifier,
      builder: (context, value, _) {
        if (Datadb.instance.tablenotifier.value.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 05,
            ),
            child: Table(
              textDirection: TextDirection.ltr,
              border: TableBorder.all(width: 3.0, color: Colors.white),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                    )),
                    children: [
                      const Text(
                        "DOMAIN NAME",
                        textAlign: TextAlign.center,
                        style: tableTextStyle,
                      ),
                      Text(
                        Datadb.instance.tablenotifier.value[0],
                        textAlign: TextAlign.center,
                        style: tableansTextStyle,
                      ),
                    ]),
                TableRow(children: [
                  const Text(
                    "CREATION DATE",
                    textAlign: TextAlign.center,
                    style: tableTextStyle,
                  ),
                  Text(
                    Datadb.instance.tablenotifier.value[1],
                    textAlign: TextAlign.center,
                    style: tableansTextStyle,
                  ),
                ]),
                TableRow(children: [
                  const Text(
                    "EXPIRATION DATE",
                    textAlign: TextAlign.center,
                    style: tableTextStyle,
                  ),
                  Text(
                    Datadb.instance.tablenotifier.value[2],
                    textAlign: TextAlign.center,
                    style: tableansTextStyle,
                  ),
                ]),
                TableRow(children: [
                  const Text(
                    "REGISTRAR",
                    textAlign: TextAlign.center,
                    style: tableTextStyle,
                  ),
                  Text(
                    Datadb.instance.tablenotifier.value[3].toString(),
                    textAlign: TextAlign.center,
                    style: tableansTextStyle,
                  ),
                ]),
                TableRow(children: [
                  const Text(
                    "URL LENGTH",
                    textAlign: TextAlign.center,
                    style: tableTextStyle,
                  ),
                  Text(
                    Datadb.instance.tablenotifier.value[4].toString(),
                    textAlign: TextAlign.center,
                    style: tableansTextStyle,
                  ),
                ]),
                TableRow(children: [
                  const Text(
                    "DOMAIN EXPIRATION",
                    textAlign: TextAlign.center,
                    style: tableTextStyle,
                  ),
                  Text(
                    Datadb.instance.tablenotifier.value[5].toString(),
                    textAlign: TextAlign.center,
                    style: tableansTextStyle,
                  ),
                ]),
              ],
            ),
          );
        } else {
          return const Text("no data avilable");
        }
      },
    );
  }
}
