class SubmitOrders {
  final String id,
      coronaCount,
      razmerCount,
      nalichnikCount,
      dobor1Count,
      dobor2Count;
  final String razmerBoyi,
      razmerEni,
      coronaSirt,
      coronaIshi,
      nalichnikSize1,
      nalichnikSize2,
      dobor1Size1,
      dobor1Size2,
      dobor2Size1,
      dobor2Size2,
      promok;

  SubmitOrders(
      {this.id,
      this.coronaCount,
      this.coronaIshi,
      this.coronaSirt,
      this.dobor1Count,
      this.dobor1Size1,
      this.dobor1Size2,
      this.dobor2Count,
      this.dobor2Size1,
      this.dobor2Size2,
      this.nalichnikCount,
      this.nalichnikSize1,
      this.nalichnikSize2,
      this.promok,
      this.razmerBoyi,
      this.razmerCount,
      this.razmerEni});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'razmerBoyi': razmerBoyi,
      'razmerEni': razmerEni,
      'razmercount':razmerCount,
      'coronasirt':coronaSirt,
      'coronaishi':coronaIshi,
      'coronacount':coronaCount,
      'nalichniksize1':nalichnikSize1,
      'nalichniksize2':nalichnikSize2,
      'nalichnikcount':nalichnikCount,
      'dobor1size1':dobor1Size1,
      'dobor1size2':dobor1Size2,
      'dobor2size1':dobor2Size1,
      'dobor2size2':dobor2Size2,
      'dobor1count':dobor1Count,
      'dobor2count':dobor2Count,
      'promok':promok,

    };
  }
}
