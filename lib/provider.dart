import 'package:flutter/material.dart';
import 'package:google_signinwithout_firebase/model/product_model.dart';
import 'services/product_services.dart';
class ProductProvider extends ChangeNotifier{
  ProductSearch? product;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  List<Results> resultList = [];
  List<Results> searchResultList = [];

  //ScrollController scrollController=ScrollController();

    // scrollController
    //   ..addListener(() {
    //     if (scrollController.position.pixels ==
    //         scrollController.position.maxScrollExtent) {
    //       getProduct();
    //       pageIncrement();
    //       // ... call method to load more repositories
    //     }
    //   });

  int cartItemValue = 0;
  int page =0;

  int getCartItem()=> cartItemValue;

  pageIncrement(){
    page++;
    print(page.toString());
    notifyListeners();
  }

  getProduct()async{
    isLoading = true;
    product = (await ProductServices().getProducts(page))!;
    resultList = product!.data!.products!.results!;
    searchResultList = resultList;
    isLoading = false;
    notifyListeners();
  }
  onChanged(){
    searchResultList = resultList
        .where((element) => element.brand!.slug!
        .startsWith(searchController.text.toLowerCase()))
        .toList();
    notifyListeners();
  }

  cartItemIncrement(){
    cartItemValue++;
    notifyListeners();
  }

  cartItemDecrement(){
    cartItemValue--;
    notifyListeners();
  }

}