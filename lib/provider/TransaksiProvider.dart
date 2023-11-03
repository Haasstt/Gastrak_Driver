// ignore_for_file: file_names

import 'Base_provider.dart';
import 'package:get/get.dart';

class TransaksiProvider extends BaseProvider {
  Future<Response> getDatapesanan(id) async {
    return get('$Url/pesanan/$id', headers: header);
  }
  Future<Response> getDataDetailpesanan(id) async {
    return get('$Url/pesanan/agen/$id', headers: header);
  }
}