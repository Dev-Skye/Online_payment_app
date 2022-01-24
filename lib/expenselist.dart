import 'package:flutter/material.dart';
import 'package:payment_screen/expense_model.dart';

class ExpenseList extends StatefulWidget {
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  final List<ExpenseModel> Expenselists = [
    ExpenseModel(
        name: "Netflix",
        date: "Today",
        amount: "# 7.99",
        imagepath: ("assets/netflix.png"),
        payment: "next payment"),
    ExpenseModel(
        name: "Uber",
        date: "Yesterday",
        amount: "#12.50",
        imagepath: ("assets/uber.png"),
        payment: "next payment"),
    ExpenseModel(
        name: "Spotify",
        date: "20 Jan. 2022",
        amount: "# 9.50",
        imagepath: ("assets/spotify.png"),
        payment: "next payment"),
    ExpenseModel(
        name: "Amazon",
        date: "15 Jan. 2022",
        amount: "# 4.56",
        imagepath: ("assets/amazon.jpeg"),
        payment: "next payment"),
    ExpenseModel(
        name: "Jumia",
        date: "31 Dec. 2021",
        amount: "# 14.75",
        imagepath: ("assets/jumia.jpeg"),
        payment: "Renew payment"),
    ExpenseModel(
        name: "Apple",
        date: "25 Oct. 2021",
        amount: "# 53.20",
        imagepath: ("assets/apple.png"),
        payment: "Renew payment")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext ctx, i) => ListTile(
              leading: Container(
                  width: 100,
                  height: 100,
                  child: Image(
                    image: AssetImage(Expenselists[i].imagepath),
                    fit: BoxFit.contain,
                  )),
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  Expenselists[i].name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 8),
                  Text(
                    Expenselists[i].payment,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Container(
                    height: 3,
                  ),
                  Text(
                    Expenselists[i].date,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Container(
                    height: 10,
                  )
                ],
              ),
              trailing: Container(
                width: 60,
                height: 50,
                child: Text(
                  Expenselists[i].amount,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
        itemCount: Expenselists.length);
  }
}
