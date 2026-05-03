import 'package:cloud_firestore/cloud_firestore.dart';

/// User model for authentication and profile data
class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? phone;
  final String? profileImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isEmailVerified;
  final Map<String, dynamic>? metadata;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.isEmailVerified,
    this.metadata, String? photoUrl, DateTime? lastSignInAt,
  });

  /// Create UserModel from Map (for Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String?,
      name: map['name'] as String?,
      email: map['email'] as String?,
      phone: map['phone'] as String?,
      profileImage: map['profileImage'] as String?,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      isEmailVerified: map['isEmailVerified'] as bool?,
      metadata: map['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Create UserModel from JSON (for API responses)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      profileImage: json['profileImage'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      isEmailVerified: json['isEmailVerified'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Convert UserModel to Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      if (uid != null) 'uid': uid,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (profileImage != null) 'profileImage': profileImage,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
      if (updatedAt != null) 'updatedAt': Timestamp.fromDate(updatedAt!),
      if (isEmailVerified != null) 'isEmailVerified': isEmailVerified,
      if (metadata != null) 'metadata': metadata,
    };
  }

  /// Convert UserModel to JSON (for API requests)
  Map<String, dynamic> toJson() {
    return {
      if (uid != null) 'uid': uid,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (profileImage != null) 'profileImage': profileImage,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
      if (isEmailVerified != null) 'isEmailVerified': isEmailVerified,
      if (metadata != null) 'metadata': metadata,
    };
  }

  /// Create a copy of UserModel with updated fields
  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isEmailVerified,
    Map<String, dynamic>? metadata,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      metadata: metadata ?? this.metadata, 
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, phone: $phone, profileImage: $profileImage, createdAt: $createdAt, updatedAt: $updatedAt, isEmailVerified: $isEmailVerified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.profileImage == profileImage &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.isEmailVerified == isEmailVerified;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        profileImage.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        isEmailVerified.hashCode;
  }
}
