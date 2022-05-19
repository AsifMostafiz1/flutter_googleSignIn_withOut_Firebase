import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_signinwithout_firebase/provider.dart';
import 'package:google_signinwithout_firebase/services/product_services.dart';
import 'package:provider/provider.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  _ApiTestState createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {


  ProductServices productServices = ProductServices();
  ScrollController scrollController = ScrollController();
  ProductProvider productProvider= ProductProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }

  getData()  {

    final providerData = Provider.of<ProductProvider>(context,listen: false);

     providerData.getProduct();

  }

  @override
  Widget build(BuildContext context) {

    final providerData = Provider.of<ProductProvider>(context);
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(

        ),

        body: Column(

          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 45,
              padding: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black)
              ),
              child: TextFormField(

                onChanged: (String value){
                  providerData.onChanged();
                  // setState(() {
                  //   // providerData.searchResultList = providerData.resultList
                  //   //     .where((element) => element.brand!.slug!
                  //   //     .startsWith(searchController.text.toLowerCase()))
                  //   //     .toList();
                  // });

                },
                    controller: providerData.searchController,
                    decoration: const InputDecoration(
                      hintText: "Search Product here",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)
                      )
                    ),


              ),
            ),
            Expanded(
              child: Container(
                
                child: providerData.isLoading==false?ListView.builder(

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
                                    image: NetworkImage(providerData.searchResultList[index].image.toString())
                                  )
                                ),

                            ),
                            Text(providerData.searchResultList[index].productName.toString()),
                            Text(providerData.searchResultList.length.toString()),
                          ],
                        ),
                      ),
                    );

                  },
                  itemCount: providerData.searchResultList.length,
                ):providerData.isLoading?Container(child:  Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [

                      SpinKitThreeBounce(color: Colors.blue,),
                      SizedBox(height: 20,),
                      Text("Loading Data.......")
                    ],
                  ),
                ),):providerData.searchResultList.length<=10? Center(child:  Text("No Product Found"),):Container(),
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){

            providerData.pageIncrement();
            getData();
          },
          child: const Text("Next"),
        ),
      ),
    );
  }
}
