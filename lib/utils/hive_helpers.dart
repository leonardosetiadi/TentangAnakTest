// import 'package:hive/hive.dart';
//
// import '../constant/hive_boxes.dart';
// import '../models/history.dart';
// import '../models/phase.dart';
// import '../models/slide.dart';
// import '../models/student.dart';
//
// class HiveHelpers {
//   HiveHelpers._();
//
//   static void registerAdapters() {
//     Hive.registerAdapter<Student>(StudentAdapter());
//     Hive.registerAdapter<Phase>(PhaseAdapter());
//     Hive.registerAdapter<Slide>(SlideAdapter());
//     Hive.registerAdapter<History>(HistoryAdapter());
//   }
//
//   static Future<void> openBoxes() async {
//     await Future.wait<void>(<Future<Box<Object>>>[
//       Hive.openBox<Student>(HiveBoxes.STUDENTS),
//       Hive.openBox<Phase>(HiveBoxes.PHASES),
//       Hive.openBox<Slide>(HiveBoxes.SLIDES),
//       Hive.openBox<History>(HiveBoxes.HISTORIES),
//     ]);
//   }
//
//   static Future<void> deleteAllBoxes() async {
//     await Future.wait<void>(<Future<void>>[
//       Hive.deleteBoxFromDisk(HiveBoxes.STUDENTS),
//       Hive.deleteBoxFromDisk(HiveBoxes.PHASES),
//       Hive.deleteBoxFromDisk(HiveBoxes.SLIDES),
//       Hive.deleteBoxFromDisk(HiveBoxes.HISTORIES),
//     ]);
//   }
// }
