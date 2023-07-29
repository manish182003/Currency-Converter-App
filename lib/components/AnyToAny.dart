import 'package:currency_converter_app/functions/functionrate.dart';
import 'package:flutter/material.dart';

class AnyToAny extends StatefulWidget {
  final rate;
  final Map currencies;
  const AnyToAny({
    Key? key,
    required this.rate,
    required this.currencies,
  }) : super(key: key);

  @override
  State<AnyToAny> createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController amount = TextEditingController();

  String d1 = 'AUD';
  String d2 = 'AUD';
  String ans = 'Converted Currency Will Be Shown Here';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    // Separate lists for dropdown items for d1 and d2
    List<DropdownMenuItem<String>> d1Items =
        widget.currencies.keys.toSet().toList().map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    List<DropdownMenuItem<String>> d2Items =
        widget.currencies.keys.toSet().toList().map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return Card(
      // margin: EdgeInsets.only(top: 120),
      elevation: 10,
      shadowColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: w,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Convert Any Currency',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              key: ValueKey('amount'),
              controller: amount,
              decoration: InputDecoration(
                hintText: 'Enter Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: DropdownButton<String>(
                        value: d1,
                        icon: Icon(Icons.arrow_drop_down_rounded),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey.shade400,
                        ),
                        onChanged: (newvalue) {
                          setState(() {
                            d1 = newvalue!;
                          });
                        },
                        items: d1Items)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('To'),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    value: d2,
                    icon: Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (newvalue) {
                      setState(() {
                        d2 = newvalue!;
                      });
                    },
                    items: d2Items,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    ans = amount.text +
                        '' +
                        d1 +
                        '' +
                        '=' +
                        '' +
                        convertany(widget.rate, amount.text, d1, d2) +
                        '' +
                        d2;
                  });
                },
                child: Text('Convert'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(ans),
            )
          ],
        ),
      ),
    );
  }
}
