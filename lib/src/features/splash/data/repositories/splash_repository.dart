import 'package:nutri_plate/src/core/base/base_repository.dart';
import 'package:nutri_plate/src/core/base/result.dart';


class SplashRepository extends BaseRepository {
  SplashRepository(super.dioClient);


  Future<Result<bool>> checkAppVersion() async {
    try {

      return Success(true);
    } catch (e) {
      return Failure(e.toString());
    }
  }


  Future<Result<bool>> loadInitialData() async {
    try {

      return Success(true);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}