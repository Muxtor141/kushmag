import 'package:flutter/material.dart';
import 'package:uymarket1/main%20pages/actives/submitOrder_page.dart';
import 'package:uymarket1/models/active_orders_cart.dart';
import 'package:uymarket1/models/submit_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrdersCart extends StatefulWidget {
  final int id;
  OrdersCart({this.id});

  @override
  _OrdersCartState createState() => _OrdersCartState();
}

class _OrdersCartState extends State<OrdersCart> {
  List<CartItems> ordersList = [
    CartItems(doorName: 'Oshxona eshigiOshxona eshigiOshxona eshigiOshxona eshigi',orderCount: '22'),
  ];

  // ignore: missing_return
  Future<Database> _database1;
// ignore: missing_return
  Future<List<SubmitOrders>> getOrderData() async {
    _database1 = openDatabase('orders.db');
    // Get a reference to the database.
    final Database db = await _database1;

    // Query the table for all The SubmitOrders.
    final List<Map<String, dynamic>> maps = await db.query('orders');
    if (maps == null) {
    } else {
      // Convert the List<Map<String, dynamic> into a List<SubmitOrders>.
      for (int i = 0; i < maps.length; i++) {
        CartItems newlist = CartItems(
          orderCount: maps[i]['id'].toString(),
          doorName: maps[i]['coronacount'],
        );
        ordersList.add(newlist);
        setState(() {});
      }
    }
  }

  void tableIsEmpty() async {
    var db = await _database1;

    int count =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM orders'));

    print(count);
  }

  Widget basicOrder({String doorName, String buyurtmaSoni, int indexNum, Size sizeQuery}) {
    return Container(
      height: sizeQuery.height * 0.08,
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: sizeQuery.width * 0.015,
            ),
            Text('${indexNum.toString()}.'),
            SizedBox(
              width: sizeQuery.width * 0.02,
            ),
            Container(width: sizeQuery.width*0.45,child: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text(doorName,maxLines: 1,)),),
            SizedBox(
              width: sizeQuery.width * 0.01,
            ),
            VerticalDivider(color: Colors.black,endIndent: sizeQuery.height*0.01,indent: sizeQuery.height*0.01,),
            Text('Буйуртма сони: ${buyurtmaSoni}'),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: sizeQuery.width * 0.28,
            ),
            Text(widget.id.toString()),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              getOrderData();
              tableIsEmpty();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => SubmitOrderPage(orderID: widget.id,)),
              // );
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubmitOrderPage(
                          orderID: widget.id,
                        )),
              );
            },
            icon: Icon(
              Icons.add,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ordersList.length,
          itemBuilder: (_, index) {
            return basicOrder(
                doorName: ordersList[index].doorName,
                buyurtmaSoni: ordersList[index].orderCount,
                indexNum: index + 1,
                sizeQuery: sizeQuery);
          },
        ),
      ),
    );
  }
}
