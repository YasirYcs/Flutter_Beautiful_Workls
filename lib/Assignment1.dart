import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Assignment2.dart';

class Assignment1  extends StatelessWidget {
  const Assignment1({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    RxBool menuclicked = false.obs; // Reactive variable
    RxBool circleclicked = false.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Obx(
                      () => AnimatedPositioned(
                    duration: Duration(milliseconds: 355),
                    curve: Curves.decelerate,
                    top: menuclicked.value ? 150 : 40,
                    left: menuclicked.value ? 115 : 115,
                    child: GestureDetector(
                      onTap: () {
                        if (circleclicked.value) {
                          // Only toggle menuClicked if circleClicked is true
                          menuclicked.value = !menuclicked.value;
                        }
                      },
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 355),
                        opacity: circleclicked.value ? 1 : 0,
                        child: Text(
                          menuclicked.value ? "Collapse Baby" : "Expand Baby",
                          style: TextStyle(
                            fontSize: menuclicked.value ? 20 : 25,
                            fontWeight: menuclicked.value
                                ? FontWeight.w100
                                : FontWeight.w900,
                            color: menuclicked.value ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //container 1


                Obx(() => AnimatedPositioned(
                  duration: Duration(milliseconds: 255),
                  curve: Curves.decelerate,
                  top: circleclicked.value?(menuclicked.value ? 300 : 360): 400,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 355),
                    curve: Curves.easeOut,
                    height: circleclicked.value?(menuclicked.value ? 350 : 200):100,
                    width: circleclicked.value?(menuclicked.value ? 350 : 200):100,
                    decoration: BoxDecoration(
                      color: Color(0xffa09ea0),
                      borderRadius:
                      BorderRadius.circular(menuclicked.value ? 80 : 100),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 1355),
                        opacity: menuclicked.value ? 1 : 0,
                        curve: Curves.easeIn,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (menuclicked.value)
                                ...[
                                  ListTile(
                                    leading: Icon(Icons.shopping_cart),
                                    title: Text('Items in Cart'),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.history),
                                    title: Text('Purchase History'),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.settings),
                                    title: Text('App Settings'),
                                  ),
                                ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),

                //container 2

                Obx(() => AnimatedPositioned(
                  duration: Duration(milliseconds: 355),
                  curve: Curves.decelerate,
                  top: circleclicked.value?(menuclicked.value ? 700 : 375):400,
                  right: menuclicked.value ? 30 : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 255),
                    curve: Curves.easeIn,
                    height: circleclicked.value?(menuclicked.value ? 80 : 170): 60,
                    width: circleclicked.value?(menuclicked.value ? 80 : 170): 60,
                    decoration: BoxDecoration(
                      color: Color(0xff4c4c4c),
                      borderRadius: BorderRadius.circular(85),
                    ),
                    child: menuclicked.value
                        ? GestureDetector(
                      onTap: () {
                        menuclicked.value=!menuclicked.value;
                      },
                      child: Icon(Icons
                          .refresh_sharp),
                    ) // show the icon when menuclicked is true
                        : null,
                  ),
                )),

                //container 3

                Obx(() => AnimatedPositioned(
                  duration: Duration(milliseconds: 355),
                  curve: Curves.decelerate,
                  top: menuclicked.value ? 50 : 390,
                  child: GestureDetector(
                    onTap: () {
                      if(menuclicked.value)
                      {
                        circleclicked.value = !circleclicked.value;
                      }
                      circleclicked.value = !circleclicked.value;
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 755),
                      curve: Curves.easeOut,
                      height: menuclicked.value ? 100 : 140,
                      width: menuclicked.value ? 100 : 140,
                      decoration: BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.circular(
                              menuclicked.value ? 65 : 70),
                          image: DecorationImage(image: AssetImage('images/Screenshot 2024-10-11 031339.png'),
                              fit: BoxFit.fill )
                      ),
                    ),
                  ),
                )),
                Positioned(
                  bottom: 50,
                  child: GestureDetector(
                    onTap: () {

                     Get.to(Assignment2());
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
