class Transaction {
  int? id;
  String name;
  double amount;
  //DateTime date;
  String avatar;

  Transaction({
    this.id,
    required this.name,
    required this.amount,
    //required this.date,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      //'date': date,
      'avatar': avatar,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      //date:map['date'],
      avatar: map['avatar'],
    );
  }
}
