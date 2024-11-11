import 'package:flutter/material.dart';
import 'package:receipt_sharing/models/icon_mapping.dart';

class Group {
  final int gId;
  final String gName;
  final List<int> participants;
  final String img;

  Group({
    required this.gId,
    required this.gName,
    required this.participants,
    required this.img,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': gId,
      'name': gName,
      'participants': participants,
      'img': img.toString(),
    };
  }

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      gId: json['group_id'],
      gName: json['group_name'],
      participants: List<int>.from(json['users']),
      img: json['img'],
    );
  }
}

class GroupDTO {
  String name;
  List<String> participants;
  int icon;

  GroupDTO({ required this.name, required this.participants, required this.icon });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "participants": participants,
      "icon": icon,
    };
  }
}

class QuickAddDTO {
  int id;
  double amt;

  QuickAddDTO({ required this.id, required this.amt });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "amt": amt,
    };
  }
}
