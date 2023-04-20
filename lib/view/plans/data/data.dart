class Plan {
  final String id;
  final String name;
  final String category;
  final String duration;
  final String balance;
  final String budget;

  Plan({
    required this.id,
    required this.name,
    required this.category,
    required this.duration,
    required this.budget,
    required this.balance,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      duration: json['duration'],
      budget: json['budget'],
      balance: json['balance'],
    );
  }
}

final List<Plan> _plans = [
  Plan(
    id: '1',
    name: 'Taxi',
    category: 'Transport',
    duration: 'Monthly',
    budget: '1000',
    balance: '1000',
  ),
  Plan(
    id: '2',
    name: 'Basic',
    category: 'Food and Drinks',
    duration: 'Monthly',
    budget: '250',
    balance: '1000',
  ),
  Plan(
    id: '3',
    name: 'Personal',
    category: 'Going out',
    duration: '2021-09-01',
    budget: '500',
    balance: '1000',
  ),
  Plan(
    id: '4',
    name: 'Study Materials',
    category: 'study',
    duration: '2021-09-01',
    budget: '100',
    balance: '1000',
  ),
];

Future<List<Plan>> getPlans() async {
  return _plans;
}
