import 'package:flutter/material.dart';
import 'package:uymarket1/main%20pages/actives/orders_cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uymarket1/models/submit_model.dart';

class SubmitOrderPage extends StatefulWidget {
  final int orderID;
  SubmitOrderPage({Key key, this.orderID}) : super(key: key);
  @override
  SubmitOrderPageState createState() => SubmitOrderPageState();
}

class SubmitOrderPageState extends State<SubmitOrderPage> {
  Future<Database> database;
  bool packageCheck = false;

  final razmeriCountController = TextEditingController();
  final razmeriHeightController = TextEditingController();
  final razmeriWidthController = TextEditingController();

  final coronaSirtController = TextEditingController();
  final coronaIshiController = TextEditingController();
  final coronaCountController = TextEditingController();

  final nalichnikSize1Controller = TextEditingController();
  final nalichnikSize2Controller = TextEditingController();
  final nalichnikCountController = TextEditingController();

  final dobor1Size1Controller = TextEditingController();
  final dobor1Size2Controller = TextEditingController();
  final dobor1Count = TextEditingController();
  final dobor2Size1Controller = TextEditingController();
  final dobor2Size2Controller = TextEditingController();
  final dobor2Count = TextEditingController();

  final promokSizeController = TextEditingController();
  final materialTypeController = TextEditingController();

  final overallCountController = TextEditingController();
  final orderNameController = TextEditingController();

  final _materialKey = GlobalKey<FormState>();
  final _razmerBoyiKey = GlobalKey<FormState>();
  final _razmerEniKey = GlobalKey<FormState>();
  final _razmerCountKey = GlobalKey<FormState>();
  final _coronaSirtKey = GlobalKey<FormState>();
  final _coronaIshiKey = GlobalKey<FormState>();
  final _coronaCountKey = GlobalKey<FormState>();
  final _nalichnikSize1Key = GlobalKey<FormState>();
  final _nalichnikCountKey = GlobalKey<FormState>();
  final _nalichnikSize2Key = GlobalKey<FormState>();
  final _promokSizeKey = GlobalKey<FormState>();
  final _eshikNomiKey = GlobalKey<FormState>();
  final _buyurtmaSoniKey = GlobalKey<FormState>();
  final _formKey1Name = GlobalKey<FormState>();

  void openDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      join(await getDatabasesPath(), 'orders.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE orders(id INTEGER PRIMARY KEY, razmerBoyi DOUBLE, razmereni DOUBLE,razmercount INTEGER,coronasirt DOUBLE,coronaishi DOUBLE,coronacount INTEGER,nalichniksize1 DOUBLE,nalichniksize2 DOUBLE,nalichnikcount INTEGER,boxCheck BOOLEAN,dobor1size1 DOUBLE,dobor1size2 DOUBLE,dobor2size1 DOUBLE,dobor2size2 DOUBLE,dobor1count INTEGER,dobor2count INTEGER,promok DOUBLE)");
      },
      version: 1,
    );
    print('openDB() called');
  }

  Future<void> insertOrder(SubmitOrders orders) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'orders',
      orders.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print('insertOrder() completed');
  }

  Future<void> inserting(SubmitOrders order) async {
    await insertOrder(order);
    print('inserting() complete');
  }

  InputDecoration basicDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    );
  }

  Widget basicTextField({
    Size sizeQuery,
    double textFieldsHeight,
    double width,
    String label,
    TextEditingController textController,
    String validateText,
    final GlobalKey<FormState> formKey,
  }) {
    return Container(
        width: sizeQuery.width * width,
       height: sizeQuery.height*0.07,
        child: Form(
          key: formKey,
          child: Container(height: textFieldsHeight,
            child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Тулдиринг';
                  }
                  return null;
                },
                onFieldSubmitted: (newvalue) {
                  textController.text = newvalue;
                },
                controller: textController,
                decoration: basicDecoration(label)),
          ),
        ));
  }

  validating() {
    if (_razmerBoyiKey.currentState.validate() ||
        _razmerEniKey.currentState.validate() ||
        _razmerCountKey.currentState.validate()) {
      if (_razmerBoyiKey.currentState.validate() == true &&
          _razmerEniKey.currentState.validate() == false &&
          _razmerCountKey.currentState.validate() == false) {}
    }
  }

  @override
  void initState() {
    openDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final order = SubmitOrders(
      // coronaSirt: coronaSirtController.text,
      // coronaIshi: coronaIshiController.text,
      coronaCount: coronaCountController.text,
      // razmerBoyi: razmeriHeightController.text,
      // razmerEni: razmeriWidthController.text,
      // razmerCount: razmeriCountController.text,
      // nalichnikSize1: nalichnikSize1Controller.text,
      // nalichnikSize2: nalichnikSize2Controller.text,
      // nalichnikCount: nalichnikCountController.text,
      // dobor1Size1: dobor1Size1Controller.text,
      // dobor1Size2: dobor1Size2Controller.text,
      // dobor2Size1: dobor2Size1Controller.text,
      // dobor2Size2: dobor2Size2Controller.text,
      // dobor1Count: dobor1Count.text,
      // dobor2Count: dobor2Count.text,
      id: '323',
      // promok: promokSizeController.text,
    );
    final sizeQuery = MediaQuery.of(context).size;
    final textFieldsHeight = MediaQuery.of(context).size.height * 0.04;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: sizeQuery.width * 0.28,
                ),
                Text(widget.orderID.toString()),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: sizeQuery.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextField(
                    formKey: _materialKey,
                    label: 'Материал',
                    textController: materialTypeController,
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.4),
                SizedBox(
                  width: sizeQuery.width * 0.55,
                ),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Container(
              width: sizeQuery.width,
              child: const Text(
                'Размеры',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextField(
                    formKey: _razmerBoyiKey,
                    textController: razmeriHeightController,
                    label: 'Бойы',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    formKey: _razmerEniKey,
                    textController: razmeriWidthController,
                    label: 'Ени',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    formKey: _razmerCountKey,
                    textController: razmeriCountController,
                    label: 'шт',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Container(
              width: sizeQuery.width,
              child: const Text(
                'Корона',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextField(
                    formKey: _coronaSirtKey,
                    textController: coronaSirtController,
                    label: 'Сырт',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    formKey: _coronaIshiKey,
                    textController: coronaIshiController,
                    label: 'Иши',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    formKey: _coronaCountKey,
                    textController: coronaCountController,
                    label: 'шт',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Container(
              width: sizeQuery.width,
              child: const Text(
                'Наличник',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: sizeQuery.width * 0.27,
                ),
                const Text(
                  'Размер',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextField(
                    formKey: _nalichnikSize1Key,
                    textController: nalichnikSize1Controller,
                    label: '',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    formKey: _nalichnikSize2Key,
                    textController: nalichnikSize2Controller,
                    label: '',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    formKey: _nalichnikCountKey,
                    textController: nalichnikCountController,
                    label: 'шт',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: sizeQuery.width * 0.02,
                ),
                const Text(
                  'Каробка',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Checkbox(
                  value: this.packageCheck,
                  checkColor: Colors.red,
                  activeColor: Colors.black,
                  onChanged: (value1) {
                    setState(() {
                      this.packageCheck = value1;
                      print(packageCheck);
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.01,
            ),
            Container(
              width: sizeQuery.width,
              child: const Text(
                'Добор(общибка)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: sizeQuery.width * 0.27,
                ),
                const Text(
                  'Размер',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('1.'),
                basicTextField(
                    textController: dobor1Size1Controller,
                    label: '',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    textController: dobor1Size2Controller,
                    label: '',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    textController: dobor1Count,
                    label: 'шт',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('2.'),
                basicTextField(
                    textController: dobor2Size1Controller,
                    label: '',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    textController: dobor2Size2Controller,
                    label: '',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
                basicTextField(
                    textController: dobor2Count,
                    label: 'шт',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Container(
              width: sizeQuery.width,
              child: const Text(
                'Промок',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: sizeQuery.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: sizeQuery.width * 0.02,
                ),
                basicTextField(
                    formKey: _promokSizeKey,
                    textController: promokSizeController,
                    label: '',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.black,
            ),
            SizedBox(
              height: sizeQuery.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextField(
                    formKey: _eshikNomiKey,
                    textController: orderNameController,
                    label: 'Ешик Номи',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.6),
                basicTextField(
                    formKey: _buyurtmaSoniKey,
                    textController: overallCountController,
                    label: 'Буйуртма Сони',
                    sizeQuery: sizeQuery,
                    textFieldsHeight: textFieldsHeight,
                    width: 0.3),
              ],
            ),
            SizedBox(
              height: sizeQuery.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: sizeQuery.width * 0.55,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.greenAccent),
                  ),
                  onPressed: () {
                    // inserting(order);
                    validating();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) => OrdersCart(
                    //               id: widget.orderID,
                    //             )));
                  },
                  child: Text('Саклаш ва кайтиш'),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
