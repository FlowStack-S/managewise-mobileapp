class UserStory {
  final int id;
  final String title;
  final String description;
  final int effort;
  final String status;
  final int? sprintId;
  final int? epicId;

  UserStory({
    required this.id,
    required this.title,
    required this.description,
    required this.effort,
    required this.status,
    this.sprintId,
    this.epicId,
  });

  factory UserStory.fromJson(Map<String, dynamic> json) => UserStory(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    effort: json['effort'],
    status: json['status'],
    sprintId: json['sprintId'],
    epicId: json['epicId'],
  );
}
