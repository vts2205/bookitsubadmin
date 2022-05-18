import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDriversPage extends StatelessWidget {
  const AddDriversPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 20,
                      weight: FontWeight.bold,
                      color: green,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildAddDriver(context),
              const SizedBox(height: 10),
              const Divider(thickness: 2),
              const SizedBox(height: 10),
              buildCarDocuments(context),
              const SizedBox(height: 10),
              const Divider(thickness: 2),
              const SizedBox(height: 10),
              buildDriverDocuments(context),
              const SizedBox(height: 10),
              const Divider(thickness: 2),
              const SizedBox(height: 10),
              buildOwnerDocuments(context),
              const SizedBox(height: 10),
              const Divider(thickness: 2),
              const SizedBox(height: 10),
              buildSubmitButton(context)
            ],
          )),
        ],
      ),
    );
  }

  buildAddDriver(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            text: "Add Driver",
            size: 20,
            weight: FontWeight.bold,
            color: green,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter driver name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: green)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter driver phone number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: green)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter owner name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: green)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter owner phone number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: green)),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter driver location',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: green)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter driver license number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: green)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Enter driver license expiry date',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: green)),
                ),
              ),
            ),
            // const SizedBox(width: 10),
            // Expanded(
            //     child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(primary: blue),
            //         onPressed: () {},
            //         child: Container(
            //           width: MediaQuery.of(context).size.width * 0.30,
            //           height: 45,
            //           padding: const EdgeInsets.all(10),
            //           child: const Center(
            //             child: Text(
            //               'Submit',
            //               style: TextStyle(fontSize: 20, color: Colors.white),
            //             ),
            //           ),
            //         )))
          ],
        )
      ],
    );
  }

  buildCarDocuments(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            text: "Car Documents",
            size: 20,
            weight: FontWeight.bold,
            color: green,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Front Image :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Chase Number Image :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'RC Book Front :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'RC Book Back :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Insurance :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'FC Copy(optional) :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(primary: blue),
            //     onPressed: () {},
            //     child: Container(
            //       width: MediaQuery.of(context).size.width * 0.20,
            //       height: 45,
            //       padding: const EdgeInsets.all(10),
            //       child: const Center(
            //         child: Text(
            //           'Submit',
            //           style: TextStyle(fontSize: 20, color: Colors.white),
            //         ),
            //       ),
            //     ))
          ],
        )
      ],
    );
  }

  buildDriverDocuments(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            text: "Driver Documents",
            size: 20,
            weight: FontWeight.bold,
            color: green,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Profile Photo :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'License Front :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'License Back :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Aadhaar Front :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Aadhaar Back :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 20),
        // ElevatedButton(
        //     style: ElevatedButton.styleFrom(primary: blue),
        //     onPressed: () {},
        //     child: Container(
        //       width: MediaQuery.of(context).size.width * 0.20,
        //       height: 45,
        //       padding: const EdgeInsets.all(10),
        //       child: const Center(
        //         child: Text(
        //           'Submit',
        //           style: TextStyle(fontSize: 20, color: Colors.white),
        //         ),
        //       ),
        //     ))
      ],
    );
  }

  buildOwnerDocuments(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            text: "Owner Documents",
            size: 20,
            weight: FontWeight.bold,
            color: green,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Aadhaar Front :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Aadhaar Back :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Pan :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Passbook(optional) :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Rental Agreement 1st page(optional) :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Rental Agreement 2nd page(optional) :',
                      size: 17,
                      color: green,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(primary: blue),
            //     onPressed: () {},
            //     child: Container(
            //       width: MediaQuery.of(context).size.width * 0.20,
            //       height: 45,
            //       padding: const EdgeInsets.all(10),
            //       child: const Center(
            //         child: Text(
            //           'Submit',
            //           style: TextStyle(fontSize: 20, color: Colors.white),
            //         ),
            //       ),
            //     ))
          ],
        )
      ],
    );
  }

  buildSubmitButton(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: blue),
          onPressed: () {},
          child: SizedBox(
            width: 200,
            height: 45,
            child: const Center(
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )),
    );
  }
}
