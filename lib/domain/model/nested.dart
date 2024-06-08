class Nested {
  final NestedType type;
  final int id;
  final int courseId;

  Nested({required this.type, required this.id, required this.courseId});
}

class Info extends Nested {
  final String name;
  final String markdown;
  Info({
    super.type = NestedType.info,
    required super.id,
    required super.courseId,
    required this.name,
    required this.markdown,
  });
}

class Lab extends Nested {
  final DateTime opens;
  final DateTime closes;
  final String topic;
  final String locationId;
  final int attemts;
  final String? requirements;
  final String? example;
  Lab({
    required this.opens,
    required this.closes,
    required super.id,
    required super.courseId,
    super.type = NestedType.lab,
    required this.topic,
    required this.locationId,
    required this.attemts,
    required this.example,
    required this.requirements,
  });
}

class Test extends Nested {
  final DateTime opens;
  final DateTime closes;
  final int taskCount;
  final String topic;
  final String locationId;
  final int attemts;
  final String? password;
  final String timeLimit;
  Test({
    required this.opens,
    required this.closes,
    required this.taskCount,
    required this.topic,
    required this.locationId,
    required this.attemts,
    this.password,
    required this.timeLimit,
    required super.id,
    required super.courseId,
    super.type = NestedType.test,
  });
}

enum NestedType { info, lab, test }
