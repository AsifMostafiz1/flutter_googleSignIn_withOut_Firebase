import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_signinwithout_firebase/model/product_model.dart';
import 'package:google_signinwithout_firebase/services/product_services.dart';
import 'package:http/http.dart' as http;

class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  _ApiTestState createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {

  TextEditingController searchController = TextEditingController();
  ProductServices productServices = ProductServices();
  ProductSearch? productSearch;

  List<Results> productResultsList = [];
  List<Results> productResultsListSearch = [];

  Album? album;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var value = await productServices.fetchAlbum();
    var value2 = await productServices.httpRequest();
    setState(() {
      album = value;
      productSearch = value2;
      productResultsList = productSearch!.data!.products!.results!;
      productResultsListSearch = productResultsList;

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(

        ),
        backgroundColor: Colors.grey,
        body: Column(

          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 45,
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black)
              ),
              child: TextFormField(

                onChanged: (String value){
                  setState(() {
                    productResultsListSearch = productResultsList.where((element) =>
                      element.brand!.slug!.startsWith(searchController.text)
                    ).toList();
                  });

                },
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: "Search Product here",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)
                      )
                    ),


              ),
            ),
            Container(

              height: MediaQuery.of(context).size.height*.8,
              width: MediaQuery.of(context).size.width,
              child: productResultsListSearch.isNotEmpty?ListView.builder(

                itemBuilder: (context, index) {


                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width,

                    child: Card(
                      child: Row(
                        children: [

                          Container(
                            width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(productResultsList[index].image.toString())
                                )
                              ),

                          ),
                          Text(
                            productResultsListSearch[index].brand!.name.toString(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: productResultsListSearch.length,
              ):Container(child: const Center(
                child: Text('No product Found'),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
