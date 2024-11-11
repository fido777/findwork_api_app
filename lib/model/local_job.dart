import 'package:findwork_api_app/model/findwork_api_response.dart';
import 'package:hive/hive.dart';
part 'local_job.g.dart';

@HiveType(typeId: 0)
class LocalJob extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String role;
  @HiveField(2)
  final String companyName;
  @HiveField(3)
  final String location;
  @HiveField(4)
  final bool isRemote;
  @HiveField(5)
  final String text;

  LocalJob({
    required this.id,
    required this.role,
    required this.companyName,
    required this.location,
    required this.isRemote,
    required this.text,
  });
}

/// Extension function that maps JobApiResult to LocalJob
extension JobApiResultExtension on JobApiResponse {
  LocalJob toLocalJob() => LocalJob(
        id: id,
        role: role,
        companyName: companyName,
        location: location ?? 'No info',
        isRemote: remote,
        text: text,
      );
}
