class AppUsersModel {
  final String id;
  final String firstName;
  final String lastName;
  final int year;
  final String universityId;
  final DateTime dateCreated;
  final bool isRegistered;

  const AppUsersModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.year,
    required this.universityId,
    required this.isRegistered,
    required this.dateCreated,
  });

  factory AppUsersModel.fromJson(Map<String, dynamic> json) {
    return AppUsersModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      year: json['year'],
      universityId: json['universityId'],
      isRegistered: json['isRegistered'],
      dateCreated: DateTime.parse(json['dateCreated']),
    );
  }
}
