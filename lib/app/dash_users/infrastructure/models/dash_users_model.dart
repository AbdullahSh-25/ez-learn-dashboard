class DashUsersModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String universityId;
  final List<String> role;
  final DateTime dateCreated;

  const DashUsersModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.universityId,
    required this.role,
    required this.dateCreated,
  });

  factory DashUsersModel.fromJson(Map<String, dynamic> json) {
    return DashUsersModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      universityId: json['universityId'],
      role: (json['role'] as List).map((e) => e.toString()).toList(),
      dateCreated: DateTime.parse(json['dateCreated']),
    );
  }
}
