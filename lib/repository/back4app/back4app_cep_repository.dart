import 'package:dio_flutter_cep/models/back4app_cep_model.dart';
import 'package:dio_flutter_cep/repository/back4app/back4app_cep_custom_dio.dart';

class Back4AppCepRepository {
  final _customDio = Back4AppCepCustomDio();

  Future<List<Back4AppCepModel>> listar() async {
    var url = '/Cep';
    var result = await _customDio.dio.get(url);
    if (result.statusCode == 200) {
      return (result.data as List)
          .map((cep) => Back4AppCepModel.fromJson(cep))
          .toList();
    } else {
      return [];
    }
  }

  Future<Back4AppCepModel> buscar(String cep) async {
    var url = '/Cep?where={"cep":$cep}"';
    var result = await _customDio.dio.get(url);
    return Back4AppCepModel.fromJson(result.data);
  }

  Future<void> criar(Back4AppCepModel back4AppCepModel) async {
    try {
      await _customDio.dio.post("/Cep", data: back4AppCepModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizar(Back4AppCepModel back4AppCepModel) async {
    try {
      await _customDio.dio.put("/Cep/${back4AppCepModel.objectId}",
          data: back4AppCepModel.toJsonEndPoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      await _customDio.dio.delete(
        "/Cep/$objectId",
      );
    } catch (e) {
      rethrow;
    }
  }
}
