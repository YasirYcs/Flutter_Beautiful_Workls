import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_look/Assignment1.dart';
import 'Assignment2.dart';
class Assignmenthomepage extends StatelessWidget {
  const Assignmenthomepage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    RxBool menuclicked = false.obs;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Assigenment Pages', style:TextStyle(
                fontWeight: FontWeight.w800, fontSize: 30,
                color: Colors.red
              ),),
            ),

            GestureDetector(
              onTap: () {
                Get.to(Assignment1());

              },
              child: Container(
                width: size.height*.15,
                height: size.height*.06,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white
                ),
                child: Center(
                  child: Text('Next', style:TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 20,
                  ),),
                ),
              ),
            ),
        
        
          ],
        ),
      ),
      backgroundColor: Colors.teal,
    );
  }
}
