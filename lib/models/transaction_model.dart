class TransactionModel {
  final String title;
  final String time;
  final String power;
  final String amount;

  TransactionModel({
    required this.title,
    required this.time,
    required this.power,
    required this.amount,
  });
}

final List<TransactionModel> transactions = [
  TransactionModel(
    title: "Charging Session",
    time: "Today, 1:15 PM",
    power: "8.12 kW",
    amount: "€25.78",
  ),
  TransactionModel(
    title: "Charging Session",
    time: "Yesterday, 6:40 PM",
    power: "12.5 kW",
    amount: "€32.00",
  ),
  TransactionModel(
    title: "Charging Session",
    time: "Apr 14, 2:00 PM",
    power: "5.3 kW",
    amount: "€14.90",
  ),
  TransactionModel(
    title: "Charging Session",
    time: "Apr 13, 11:00 AM",
    power: "20.0 kW",
    amount: "€40.00",
  ),
];
