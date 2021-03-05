class Orders {
  final String phoneNumber, address, material, client;
  final int id;
  final String actionDate;
  Orders(
      {this.address,
      this.client,
      this.material,
      this.phoneNumber,
      this.actionDate,
      this.id});
}
