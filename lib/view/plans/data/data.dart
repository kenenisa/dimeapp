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
