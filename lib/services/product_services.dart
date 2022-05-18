import 'dart:convert';
import 'package:google_signinwithout_firebase/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices{
  String apiUrl ="https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10";


  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<ProductSearch?> httpRequest()async{
    var response = await http.get(Uri.parse(apiUrl));

    if(response.statusCode==200){
      return ProductSearch.fromJson(jsonDecode(response.body));
    }
    else{
      throw "${response.statusCode}";
    }

  }

}