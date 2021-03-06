import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uymarket1/models/submit_model.dart';

class SubmitOrderPage extends StatefulWidget {
  final int orderID;
  final int tableID;
  final bool previewModeStatus;
  SubmitOrderPage({
    Key key,
    this.orderID,
    this.tableID,
    this.previewModeStatus,
  }) : super(key: key);
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
  final eshikNomiController = TextEditingController();

  final overallCountController = TextEditingController();
  final orderNameController = TextEditingController();

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

  final _dobor1Size1Key = GlobalKey<FormState>();
  final _dobor1Size2Key = GlobalKey<FormState>();
  final _dobor1CountKey = GlobalKey<FormState>();

  final _dobor2Size1Key = GlobalKey<FormState>();
  final _dobor2Size2Key = GlobalKey<FormState>();
  final _dobor2CountKey = GlobalKey<FormState>();
  bool isError = false;
  bool previewMode = false;

  void openDB() async {
    if (widget.previewModeStatus) {
      setState(() {
               previewMode = true;
            });
     
    }else{

         WidgetsFlutterBinding.ensureInitialized();
    Future.delayed(Duration(seconds: 1));
    database = openDatabase(
      join(await getDatabasesPath(), 'orders.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE orders${widget.orderID}(id INTEGER PRIMARY KEY, eshikNomi TEXT, razmerBoyi DOUBLE, razmereni DOUBLE, razmercount INTEGER,coronasirt DOUBLE,coronaishi DOUBLE,coronacount INTEGER,nalichniksize1 DOUBLE,nalichniksize2 DOUBLE,nalichnikcount INTEGER,boxCheck BOOLEAN,dobor1size1 DOUBLE,dobor1size2 DOUBLE,dobor2size1 DOUBLE,dobor2size2 DOUBLE,dobor1count INTEGER,dobor2count INTEGER,promok DOUBLE,buyurtmaSoni INTEGER)");
      },
      version: 1,
    );

    print('openDB() called');


    }

 
  }

  Future<void> insertOrder(SubmitOrders orders) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'orders${widget.orderID}',
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
      helperText: '',
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
        child: Form(
          key: formKey,
          child: Container(
            height: 50,
            child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    isError = true;

                    return 'Тулдиринг';
                  }

                  isError = false;

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
//
// VALIDATING FIELDS
//

  validatingModel({
    GlobalKey<FormState> f1,
    GlobalKey<FormState> f2,
    GlobalKey<FormState> f3,
    TextEditingController k1,
    TextEditingController k2,
    TextEditingController k3,
  }) {
    if (k1.text.isNotEmpty && k2.text.isNotEmpty && k3.text.isNotEmpty) {
      f1.currentState.validate();
      f2.currentState.validate();
      f3.currentState.validate();
      return true;
    } else {
      if (k1.text.isEmpty && k2.text.isEmpty && k3.text.isEmpty) {
        print('good to go');
        return true;
      } else {
        f1.currentState.validate();
        f2.currentState.validate();
        f3.currentState.validate();
        return false;
      }
    }
  }

  singleValidateModel(GlobalKey<FormState> f1) {
    if (f1.currentState.validate()) {
      return true;
    } else {
      return false;
    }

    //bu yerda agar textfield lar bo'sh bo'lsa false qaytaradi
  }

  razmeriValidate() {
    if (validatingModel(
        f1: _razmerBoyiKey,
        f2: _razmerEniKey,
        f3: _razmerCountKey,
        k1: razmeriHeightController,
        k2: razmeriWidthController,
        k3: razmeriCountController)) {
      return true;
    } else {
      return false;
    }
  }

  coronaValidate() {
    if (validatingModel(
        f1: _coronaSirtKey,
        f2: _coronaIshiKey,
        f3: _coronaCountKey,
        k1: coronaSirtController,
        k2: coronaIshiController,
        k3: coronaCountController)) {
      return true;
    } else {
      return false;
    }
  }

  nalichnikValidate() {
    if (validatingModel(
        f1: _nalichnikSize1Key,
        f2: _nalichnikSize2Key,
        f3: _nalichnikCountKey,
        k1: nalichnikSize1Controller,
        k2: nalichnikSize2Controller,
        k3: nalichnikCountController)) {
      return true;
    } else {
      return false;
    }
  }

  dobor1Validate() {
    if (validatingModel(
        f1: _dobor1Size1Key,
        f2: _dobor1Size2Key,
        f3: _dobor1CountKey,
        k1: dobor1Size1Controller,
        k2: dobor1Size2Controller,
        k3: dobor1Count)) {
      return true;
    } else {
      return false;
    }
  }

  dobor2Validate() {
    if (validatingModel(
        f1: _dobor2Size1Key,
        f2: _dobor2Size2Key,
        f3: _dobor2CountKey,
        k1: dobor2Size1Controller,
        k2: dobor2Size2Controller,
        k3: dobor2Count)) {
      return true;
    } else {
      return false;
    }
  }

  promokValidate() {
    if (singleValidateModel(_promokSizeKey)) {
      return true;
    } else {
      return false;
    }
  }

  eshikNomiValidate() {
    if (singleValidateModel(_eshikNomiKey)) {
      return true;
    } else {
      return false;
    }
  }

  buyurtmaSoniValidate() {
    if (singleValidateModel(_buyurtmaSoniKey)) {
      return true;
    } else {
      return false;
    }
  }

  validateAll() {
    if (razmeriValidate() &&
        coronaValidate() &&
        nalichnikValidate() &&
        dobor1Validate() &&
        promokValidate() &&
        eshikNomiValidate() &&
        buyurtmaSoniValidate()) {
      return true;
    } else {
      razmeriValidate();
      coronaValidate();
      nalichnikValidate();
      dobor1Validate();
      dobor2Validate();
      promokValidate();
      eshikNomiValidate();
      buyurtmaSoniValidate();
      return false;
    }
  }

//
// VALIDATING FIELDS END
//
  @override
  void initState() {
    openDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final order = SubmitOrders(
      //this field will be added
      coronaSirt:
          coronaSirtController.text.isEmpty ? '' : coronaSirtController.text,
      coronaIshi:
          coronaIshiController.text.isEmpty ? '' : coronaIshiController.text,
      coronaCount:
          coronaCountController.text.isEmpty ? '' : coronaCountController.text,
      razmerBoyi: razmeriHeightController.text.isEmpty
          ? ''
          : razmeriHeightController.text,
      razmerEni: razmeriWidthController.text.isEmpty
          ? ''
          : razmeriWidthController.text,
      razmerCount: razmeriCountController.text.isEmpty
          ? ''
          : razmeriCountController.text,
      nalichnikSize1: nalichnikSize1Controller.text.isEmpty
          ? ''
          : nalichnikSize1Controller.text,
      nalichnikSize2: nalichnikSize2Controller.text.isEmpty
          ? ''
          : nalichnikSize2Controller.text,
      nalichnikCount: nalichnikCountController.text.isEmpty
          ? ''
          : nalichnikCountController.text,
      dobor1Size1:
          dobor1Size1Controller.text.isEmpty ? '' : dobor1Size1Controller.text,
      dobor1Size2:
          dobor1Size2Controller.text.isEmpty ? '' : dobor1Size2Controller.text,
      dobor2Size1:
          dobor2Size1Controller.text.isEmpty ? '' : dobor2Size1Controller.text,
      dobor2Size2:
          dobor2Size2Controller.text.isEmpty ? '' : dobor2Size2Controller.text,
      dobor1Count: dobor1Count.text.isEmpty ? '' : dobor1Count.text,
      dobor2Count: dobor2Count.text.isEmpty ? '' : dobor2Count.text,
      id: widget.tableID.toString().isEmpty ? '' : widget.tableID.toString(),
      promok:
          promokSizeController.text.isEmpty ? '' : promokSizeController.text,
      eshiknomi:
          eshikNomiController.text.isEmpty ? '' : eshikNomiController.text,
      buyurtmaSoni: overallCountController.text.isEmpty
          ? ''
          : overallCountController.text,
      boxCheck: packageCheck,
    );
    final sizeQuery = MediaQuery.of(context).size;
    final textFieldsHeight = MediaQuery.of(context).size.height * 0.04;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            widthFactor: sizeQuery.width,
            child: Text(widget.orderID.toString())),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: IgnorePointer(ignoring: previewMode,
            child: Column(children: [
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
                      formKey: _dobor1Size1Key,
                      textFieldsHeight: textFieldsHeight,
                      width: 0.3),
                  basicTextField(
                      formKey: _dobor1Size2Key,
                      textController: dobor1Size2Controller,
                      label: '',
                      sizeQuery: sizeQuery,
                      textFieldsHeight: textFieldsHeight,
                      width: 0.3),
                  basicTextField(
                      formKey: _dobor1CountKey,
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
                      formKey: _dobor2Size1Key,
                      textController: dobor2Size1Controller,
                      label: '',
                      sizeQuery: sizeQuery,
                      textFieldsHeight: textFieldsHeight,
                      width: 0.3),
                  basicTextField(
                      formKey: _dobor2Size2Key,
                      textController: dobor2Size2Controller,
                      label: '',
                      sizeQuery: sizeQuery,
                      textFieldsHeight: textFieldsHeight,
                      width: 0.3),
                  basicTextField(
                      formKey: _dobor2CountKey,
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
              Container(
                height: sizeQuery.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    basicTextField(
                        formKey: _eshikNomiKey,
                        textController: eshikNomiController,
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
                      if (validateAll()) {
                        inserting(order);
                        print('done');
                      } else {
                        print('requirements not completed');
                      }

                      //   // inserting(order);

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
      ),
    );
  }
}
