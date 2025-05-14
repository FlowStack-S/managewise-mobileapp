class Epic {
  final int id;
  final String title;
  final String description;
  final String status;

  Epic({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Epic.fromJson(Map<String, dynamic> json) => Epic(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    status: json['status'],
  );
}
