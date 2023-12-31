// ignore_for_file: file_names

import 'Base_provider.dart';
import 'package:get/get.dart';

class TransaksiProvider extends BaseProvider {
  Future<Response> getDatapesanan(id) async {
    return get('$Url/pesanan/$id', headers: header);
  }

  Future<Response> getDataDetailpesanan(id) async {
    return get('$Url/pesanan/detail/$id', headers: header);
  }

  Future<Response> getDataByIdKurir(id) async {
    return get('$Url/pesanan/ByIdKurir/$id', headers: header);
  }

  Future<Response> updatePesananSelesai(id, data) async {
    return put('$Url/pesanan/selesai/$id', data, headers: header);
  }

  Future<Response> updateLokasi(data) async {
    return post('$Url/addlokasi', data, headers: header);
  }
}
