import 'package:dartz/dartz.dart';
import 'package:smart_class/api/api_consumer.dart';
import 'package:smart_class/api/end_ponits.dart';
import 'package:smart_class/errors/exceptions.dart';
import 'package:smart_class/features/main/data/system_statues.dart';
import 'package:smart_class/features/main/presentation/manager/repo/main_repo.dart';

class MainRepoImpl extends MainRepo {
  final ApiConsumer api;

  MainRepoImpl({required this.api});
  @override
  Future<String> fanControl({required String mode}) async {
    try {
      String response = await api.get(EndPoint.fanControl(mode: mode));
      return response;
    } on ServerException catch (e) {
      return (e.errModel.errorMessage);
    }
  }

  @override
  Future<String> fanPower({required String power}) async {
    try {
      String response = await api.get(EndPoint.fanPower(power: power));
      return response;
    } on ServerException catch (e) {
      return (e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, SystemStatues>> getStatues() async {
    try {
      var response = await api.get(EndPoint.getStatues);
      SystemStatues statues = SystemStatues.fromJson(response);
      return (right(statues));
    } on ServerException catch (e) {
      return (left(e.errModel.errorMessage));
    }
  }

  @override
  Future<String> lightControl({required String mode}) async {
    try {
      String response = await api.get(EndPoint.lightControl(mode: mode));
      return response;
    } on ServerException catch (e) {
      return (e.errModel.errorMessage);
    }
  }

  @override
  Future<String> lightPower({required String power}) async {
    try {
      String response = await api.get(EndPoint.lightPower(power: power));
      return response;
    } on ServerException catch (e) {
      return (e.errModel.errorMessage);
    }
  }

  @override
  Future<String> projectorControl({required String mode}) async {
    try {
      String response = await api.get(EndPoint.projectorControl(mode: mode));
      return response;
    } on ServerException catch (e) {
      return (e.errModel.errorMessage);
    }
  }

  @override
  Future<String> systemControl({required String mode}) async {
    try {
      String response = await api.get(EndPoint.controlSystem(mode: mode));
      return response;
    } on ServerException catch (e) {
      return (e.errModel.errorMessage);
    }
  }

  @override
  Future<String> windowControl({required String mode}) async {
    try {
      String response = await api.get(EndPoint.windowControl(mode: mode));
      return response;
    } on ServerException catch (e) {
      return (e.errModel.errorMessage);
    }
  }
}
