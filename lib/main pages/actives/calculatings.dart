import 'package:flutter/material.dart';

class Calculatings {
  final TextEditingController  razmeriCountController, razmeriHeightController,razmeriWidthController,coronaSirtController,coronaIshiController,coronaCountController,nalichnikSize1Controller,nalichnikSize2Controller,nalichnikCountController,dobor1Size1Controller,dobor1Size2Controller,dobor1Count,dobor2Size1Controller,dobor2Size2Controller,dobor2Count,promokSizeController,eshikNomiController,overallCountController,orderNameController;
  final GlobalKey<FormState> razmerBoyiKey,razmerEniKey,razmerCountKey,coronaSirtKey,coronaIshiKey,coronaCountKey,nalichnikSize1Key,nalichnikCountKey,nalichnikSize2Key,promokSizeKey,eshikNomiKey,buyurtmaSoniKey,dobor1Size1Key,dobor1Size2Key,dobor1CountKey,dobor2Size1Key,dobor2Size2Key,dobor2CountKey;






  Calculatings({this.buyurtmaSoniKey,this.coronaCountKey,this.coronaIshiKey,this.coronaSirtKey,this.dobor1CountKey,this.dobor1Size1Key,this.dobor1Size2Key,this.dobor2CountKey,this.dobor2Size1Key,this.dobor2Size2Key,this.eshikNomiKey,this.nalichnikCountKey,this.nalichnikSize1Key,this.nalichnikSize2Key,this.promokSizeKey,this.razmerBoyiKey,this.razmerCountKey,this.razmerEniKey,this.coronaCountController,this.coronaIshiController,this.coronaSirtController,this.dobor1Count,this.dobor1Size1Controller,this.dobor1Size2Controller,this.dobor2Count,this.dobor2Size1Controller,this.dobor2Size2Controller,this.eshikNomiController,this.nalichnikCountController,this.nalichnikSize1Controller,this.nalichnikSize2Controller,this.orderNameController,this.overallCountController,this.promokSizeController,this.razmeriCountController,this.razmeriHeightController,this.razmeriWidthController});
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
        f1:razmerBoyiKey,
        f2: razmerEniKey,
        f3: razmerCountKey,
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
        f1: coronaSirtKey,
        f2:coronaIshiKey,
        f3: coronaCountKey,
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
        f1:nalichnikSize1Key,
        f2:nalichnikSize2Key,
        f3: nalichnikCountKey,
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
        f1:dobor1Size1Key,
        f2: dobor1Size2Key,
        f3: dobor1CountKey,
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
        f1: dobor2Size1Key,
        f2: dobor2Size2Key,
        f3: dobor2CountKey,
        k1: dobor2Size1Controller,
        k2: dobor2Size2Controller,
        k3: dobor2Count)) {
      return true;
    } else {
      return false;
    }
  }

  promokValidate() {
    if (singleValidateModel(promokSizeKey)) {
      return true;
    } else {
      return false;
    }
  }

  eshikNomiValidate() {
    if (singleValidateModel(eshikNomiKey)) {
      return true;
    } else {
      return false;
    }
  }

  buyurtmaSoniValidate() {
    if (singleValidateModel(buyurtmaSoniKey)) {
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
}
