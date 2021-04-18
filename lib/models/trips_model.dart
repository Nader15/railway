import 'package:railway/models/stations.dart';

class TripsModel {
  List<Success> success;

  TripsModel({this.success});

  TripsModel.fromJson(Map<String, dynamic> json) {
    if (json['success'] != null) {
      success = new List<Success>();
      json['success'].forEach((v) { success.add(new Success.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Success {
  int id;
  String departTime;
  String arrivalTime;
  String status;
  int baseId;
  int destinationId;
  int trainId;
  String createdAt;
  String updatedAt;
  BaseStation baseStation;
  BaseStation destinationStation;
  List<StationsModel> stations;
  List<Seats> seats;
  List<Levels> levels;

  Success({this.id, this.departTime, this.arrivalTime, this.status, this.baseId, this.destinationId, this.trainId, this.createdAt, this.updatedAt, this.baseStation, this.destinationStation, this.stations, this.seats, this.levels});

  Success.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departTime = json['depart_time'];
    arrivalTime = json['arrival_time'];
    status = json['status'];
    baseId = json['base_id'];
    destinationId = json['destination_id'];
    trainId = json['train_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    baseStation = json['base_station'] != null ? new BaseStation.fromJson(json['base_station']) : null;
    destinationStation = json['destination_station'] != null ? new BaseStation.fromJson(json['destination_station']) : null;
    if (json['stations'] != null) {
      stations = new List<Null>();
      json['stations'].forEach((v) { stations.add(new StationsModel.fromJson(v)); });
    }
    if (json['seats'] != null) {
      seats = new List<Seats>();
      json['seats'].forEach((v) { seats.add(new Seats.fromJson(v)); });
    }
    if (json['levels'] != null) {
      levels = new List<Levels>();
      json['levels'].forEach((v) { levels.add(new Levels.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['depart_time'] = this.departTime;
    data['arrival_time'] = this.arrivalTime;
    data['status'] = this.status;
    data['base_id'] = this.baseId;
    data['destination_id'] = this.destinationId;
    data['train_id'] = this.trainId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.baseStation != null) {
      data['base_station'] = this.baseStation.toJson();
    }
    if (this.destinationStation != null) {
      data['destination_station'] = this.destinationStation.toJson();
    }
    if (this.stations != null) {
      data['stations'] = this.stations.map((v) => v.toJson()).toList();
    }
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    if (this.levels != null) {
      data['levels'] = this.levels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BaseStation {
  int id;
  String name;
  double latitude;
  double longitude;
  String createdAt;
  Null updatedAt;

  BaseStation({this.id, this.name, this.latitude, this.longitude, this.createdAt, this.updatedAt});

  BaseStation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Seats {
  int id;
  String status;
  int carId;
  String createdAt;
  String updatedAt;
  Pivot pivot;
  Car car;

  Seats({this.id, this.status, this.carId, this.createdAt, this.updatedAt, this.pivot, this.car});

  Seats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    carId = json['car_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    car = json['car'] != null ? new Car.fromJson(json['car']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['car_id'] = this.carId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    if (this.car != null) {
      data['car'] = this.car.toJson();
    }
    return data;
  }
}

class Pivot {
  int seatableId;
  int seatId;
  String seatableType;
  String createdAt;
  String updatedAt;

  Pivot({this.seatableId, this.seatId, this.seatableType, this.createdAt, this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    seatableId = json['seatable_id'];
    seatId = json['seat_id'];
    seatableType = json['seatable_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seatable_id'] = this.seatableId;
    data['seat_id'] = this.seatId;
    data['seatable_type'] = this.seatableType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Car {
  int id;
  int trainId;
  int levelId;
  dynamic createdAt;
  dynamic updatedAt;
  Level level;

  Car({this.id, this.trainId, this.levelId, this.createdAt, this.updatedAt, this.level});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainId = json['train_id'];
    levelId = json['level_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['train_id'] = this.trainId;
    data['level_id'] = this.levelId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.level != null) {
      data['level'] = this.level.toJson();
    }
    return data;
  }
}

class Level {
  int id;
  String Class;
  Null createdAt;
  Null updatedAt;

  Level({this.id, this.Class, this.createdAt, this.updatedAt});

  Level.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  Class = json['class'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['class'] = this.Class;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  return data;
  }
}

class Levels {
  int id;
  dynamic createdAt;
  dynamic updatedAt;
  Pivot pivot;

  Levels({this.id,  this.createdAt, this.updatedAt, this.pivot});

  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot2 {
  int tripId;
  int levelId;
  int price;

  Pivot2({this.tripId, this.levelId, this.price});

  Pivot2.fromJson(Map<String, dynamic> json) {
    tripId = json['trip_id'];
    levelId = json['level_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trip_id'] = this.tripId;
    data['level_id'] = this.levelId;
    data['price'] = this.price;
    return data;
  }
}

