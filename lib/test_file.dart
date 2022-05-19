import 'package:flutter/material.dart';
import 'package:google_signinwithout_firebase/provider.dart';
import 'package:provider/provider.dart';

class TextApp extends StatefulWidget {
  const TextApp({Key? key}) : super(key: key);

  @override
  _TextAppState createState() => _TextAppState();
}

class _TextAppState extends State<TextApp> {

  bool isPressed = false;
  int value = 0;
  @override
  Widget build(BuildContext context) {

    final providerData = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            isPressed==false?GestureDetector(
              onTap: (){
                providerData.cartItemIncrement();
                setState(() {
                  isPressed= true;

                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue
                ),
                child: const Icon(Icons.add,color: Colors.white,),
              ),
            ):Container(
              padding: const EdgeInsets.all(5),
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      providerData.cartItemDecrement();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.amber
                      ),
                      child: const Icon(Icons.minimize_sharp,color: Colors.white,),
                    ),
                  ),

                  Text(providerData.getCartItem().toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                  GestureDetector(
                    onTap: (){
                      providerData.cartItemIncrement();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.amber
                      ),
                      child: const Icon(Icons.add,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),


          ],
        ),
      ),
    );
  }
}
