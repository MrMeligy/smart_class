import 'package:dartz/dartz.dart';
import 'package:smart_class/features/main/data/system_statues.dart';

abstract class MainRepo {
  Future<Either<String, SystemStatues>> getStatues();
  Future<String> systemControl({required String mode});
  Future<String> windowControl({required String mode});
  Future<String> projectorControl({required String mode});
  Future<String> fanControl({required String mode});
  Future<String> fanPower({required String power});
  Future<String> lightControl({required String mode});
  Future<String> lightPower({required String power});
}
