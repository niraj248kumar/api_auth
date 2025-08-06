class UserModel {
  String firstName;
  String lastName;
  String email;
  String number;
  dynamic gender;
  dynamic address;
  dynamic agentId;
  dynamic referralCode;
  dynamic otherReferralCode;
  dynamic fcmToken;
  DateTime updatedAt;
  DateTime createdAt;
  int userId;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.number,
    required this.gender,
    required this.address,
    required this.agentId,
    required this.referralCode,
    required this.otherReferralCode,
    required this.fcmToken,
    required this.updatedAt,
    required this.createdAt,
    required this.userId,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? number,
    dynamic gender,
    dynamic address,
    dynamic agentId,
    dynamic referralCode,
    dynamic otherReferralCode,
    dynamic fcmToken,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? userId,
  }) =>
      UserModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        number: number ?? this.number,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        agentId: agentId ?? this.agentId,
        referralCode: referralCode ?? this.referralCode,
        otherReferralCode: otherReferralCode ?? this.otherReferralCode,
        fcmToken: fcmToken ?? this.fcmToken,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
      );
}
