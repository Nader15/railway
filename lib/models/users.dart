class UsersModel {
  Token token;
  User user;

  UsersModel({this.token, this.user});

  UsersModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Token {
  AccessToken accessToken;
  String plainTextToken;

  Token({this.accessToken, this.plainTextToken});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'] != null
        ? new AccessToken.fromJson(json['accessToken'])
        : null;
    plainTextToken = json['plainTextToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accessToken != null) {
      data['accessToken'] = this.accessToken.toJson();
    }
    data['plainTextToken'] = this.plainTextToken;
    return data;
  }
}

class AccessToken {
  String name;
  List<String> abilities;
  int tokenableId;
  String tokenableType;
  String updatedAt;
  String createdAt;
  int id;

  AccessToken(
      {this.name,
        this.abilities,
        this.tokenableId,
        this.tokenableType,
        this.updatedAt,
        this.createdAt,
        this.id});

  AccessToken.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    abilities = json['abilities'].cast<String>();
    tokenableId = json['tokenable_id'];
    tokenableType = json['tokenable_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['abilities'] = this.abilities;
    data['tokenable_id'] = this.tokenableId;
    data['tokenable_type'] = this.tokenableType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  int wallet;
  String createdAt;
  String updatedAt;
  String phoneNumber;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.wallet,
        this.createdAt,
        this.updatedAt,
        this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    wallet = json['wallet'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['wallet'] = this.wallet;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
