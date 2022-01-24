import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payment_screen/expenselist.dart';
import 'package:payment_screen/payment_screen.dart';
import 'package:paystack_manager/paystack_manager.dart';

class AtmScreen extends StatefulWidget {
  @override
  _AtmScreenState createState() => _AtmScreenState();
}

class _AtmScreenState extends State<AtmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 27,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                size: 27,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/picc1.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/picc2.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/picc3.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/picc4.jpg"),
                        fit: BoxFit.cover)),
              )
            ],
          ),
          Column(
            children: [
              Container(
                width: 250,
                margin: EdgeInsets.symmetric(horizontal: 90.0, vertical: 20),
                child: ElevatedButton(
                    child: Text(
                      'Pay Here',
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        primary: Colors.pink,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onPressed: () => _checkPayment()),
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 25, left: 35),
                color: Colors.black12,
                child: Text(
                  "Expenditures",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 350,
                child: ExpenseList(),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _checkPayment() {
    try {
      PaystackPayManager(context: context)
        ..setSecretKey("sk_test_743afefd1b54b5085cdacf0cbeb62228fbb412d7")
        ..setCompanyAssetImage(Image(image: AssetImage("assets/newwl.png")))
        ..setAmount(500000)
        ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
        ..setCurrency("NGN")
        ..setEmail("joyskye9@gmail.com")
        ..setFirstName("Chika")
        ..setLastName("Joy")
        ..setMetadata({
          "custom_fields": [
            {
              "value": "Skye Tech",
              "display_name": "Payment_to",
              "variable_name": "Payment_to",
            }
          ]
        })
        ..onSuccesful(_onPaymentSuccessful)
        ..onPending(_onPaymentPending)
        ..onFailed(_onPaymentFailed)
        ..onCancel(_onCancel)
        ..initialize();
    } catch (error) {
      print("Payment error ==> $error");
    }
  }

  void _onPaymentSuccessful(Transaction transaction) {
    print("Transaction Successful");
    print(
        "Transaction message ==> ${transaction.message}, Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentPending(Transaction transaction) {
    print("Transaction Pending");
    print("Transaction Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentFailed(Transaction transaction) {
    print("Transaction Failed");
    print("Transaction message ==> ${transaction.message}");
  }

  void _onCancel(Transaction transaction) {
    print("Transaction Cancelled");
  }
}
