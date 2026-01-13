class AuthResponse {
  final String? fullName;
  final String? phone;
  final String? email;
  final String? token;

  AuthResponse({
    this.fullName,
    this.phone,
    this.email,
    this.token,
  });

  AuthResponse copyWith({
    String? fullName,
    String? phone,
    String? email,
    String? token,
  }) => 
    AuthResponse(
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      token: token ?? this.token,
    );

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    fullName: json["full_name"],
    phone: json["phone"],
    email: json["email"],
    token: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "phone": phone,
    "email": email,
    "token": token,
  };
}
