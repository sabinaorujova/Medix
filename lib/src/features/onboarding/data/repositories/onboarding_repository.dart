import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';


class OnboardingRepository extends BaseRepository {
  OnboardingRepository(super.dioClient);


  Future<Result<bool>> markOnboardingCompleted() async {
    try {


      return Success(true);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}