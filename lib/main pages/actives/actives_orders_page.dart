import 'package:flutter/material.dart';
import 'package:uymarket1/main%20pages/actives/orders_cart.dart';
import 'package:uymarket1/models/orders.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActiveActions extends StatefulWidget {
  @override
  _ActivesState createState() => _ActivesState();
}

class _ActivesState extends State<ActiveActions> {
//There will be database data to add to List

  List<Orders> cardInfo = [
    Orders(
      address: 'Andijon',
      client: 'Abror Muxtarovich ',
      id: 32324,
      material: 'Taxta',
      phoneNumber: '+998905443434',
      actionDate: '22.02.2021',
    ),
    Orders(
      address: 'Andijon',
      client: 'Abror Muxtarovich ',
      id: 3333,
      material: 'Taxta',
      phoneNumber: '+998905443434',
      actionDate: '22.02.2021',
    ),
  ];

  Future<void> getOrderInfo() async {
    http.Response response =
        await http.get('http://yuklar.acode.uz/web/app/region.php');
    if (response.statusCode == 200) {
      String regionsBody = response.body;
      List regionList1 = json.decode(regionsBody);

      for (var element in regionList1) {
        Orders new1list = new Orders();

        cardInfo.add(element['title']);
      }
    } else {}
  }

  void new1() {}

  //There will be database data to add to List

  Widget ordersCard(
      {String phoneNum, clientName, date, int id, Size sizeQuery}) {
    return GestureDetector(onTap: (){
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrdersCart(id: id,)),
                    );
    },
      child: Container(margin: EdgeInsets.only(left: 5,right: 5),
        height: sizeQuery.height * 0.07,
        width: sizeQuery.width * 0.9,
        child: Container(
      
          //Overall Card start
          child: Row(
            //Overall Card Row start
            children: [
              Container(
                width: sizeQuery.width * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue)),
                padding: EdgeInsets.all(1),
                child: Container(
                  child: Text(
                    '20',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              SizedBox(
                width: sizeQuery.width * 0.02,
              ),
              Container(
                width: sizeQuery.width * 0.08,
                child: Text(
                  id.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              VerticalDivider(
                indent: sizeQuery.height * 0.005,
                endIndent: sizeQuery.height * 0.005,
                color: Colors.black,
              ),
              Container(
                width: sizeQuery.width * 0.21,
                child: Text(
                  clientName,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              VerticalDivider(
                indent: sizeQuery.height * 0.005,
                endIndent: sizeQuery.height * 0.005,
                color: Colors.black,
              ),
              Container(
                width: sizeQuery.width * 0.19,
                child: Text(
                  phoneNum,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              VerticalDivider(
                indent: sizeQuery.height * 0.005,
                endIndent: sizeQuery.height * 0.005,
                color: Colors.black,
              ),
              Container(
                  width: sizeQuery.width * 0.13,
                  child: Text(
                    date,
                    maxLines: 2,
                    style: TextStyle(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                  )),
              SizedBox(
                width: sizeQuery.width * 0.01,
              ),
              Container(
                  width: sizeQuery.width * 0.05,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone_forwarded_outlined,
                      color: Colors.green,
                    ),
                    iconSize: 18,
                  )),
              SizedBox(
                width: sizeQuery.width * 0.03,
              ),
              Container(
                  width: sizeQuery.width * 0.05,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrdersCart(id: id,)),
                      );
                    },
                    icon: Icon(
                      Icons.login,
                      color: Colors.black,
                    ),
                    iconSize: 18,
                  ))
            ],
          ),
          //Overall Card Row start
        ),
        //Overall Card end
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;


      var appbar = AppBar(
        backgroundColor: Colors.transparent,
      );






    return Scaffold(
      appBar: appbar,
      body: Container(color: Colors.grey[200],
        height: (sizeQuery.height-appbar.preferredSize.height-MediaQuery.of(context).padding.top)*0.88,
        child: Column(
          children: [
            Container(
              width: sizeQuery.width,
              child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 10,
                color: Colors.orange[200],
                child: Row(
                  children: [
                    SizedBox(
                      width: sizeQuery.width * 0.010,
                    ),
                    const Text('№',style: TextStyle(fontSize: 14),),
                    SizedBox(
                      width: sizeQuery.width * 0.023,
                    ),
                     const Text('ИД',style: TextStyle(fontSize: 14)),
                    SizedBox(
                      width: sizeQuery.width * 0.09,
                    ),
                    const Text('Ф.И.Ш',style: TextStyle(fontSize: 14)),
                    SizedBox(
                      width: sizeQuery.width * 0.11,
                    ),
                    const Text('Телефон',style: TextStyle(fontSize: 14)),
                    SizedBox(
                      width: sizeQuery.width * 0.09,
                    ),
                    const Text('Сана',style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
            Container(
              height: (sizeQuery.height-appbar.preferredSize.height-MediaQuery.of(context).padding.top) * 0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cardInfo.length,
                itemBuilder: (_, index) {
                  return ordersCard(
                      clientName: cardInfo[index].client,
                      id: cardInfo[index].id,
                      phoneNum: cardInfo[index].phoneNumber,
                      sizeQuery: sizeQuery,
                      date: cardInfo[index].actionDate);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
