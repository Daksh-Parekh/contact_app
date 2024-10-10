import 'dart:developer';
import 'dart:io';

import 'package:contact_app/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  File? image;
  int setIndex = 0;
  TextEditingController name = TextEditingController();
  TextEditingController eMail = TextEditingController();
  TextEditingController contact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
      ),
      body: Stepper(
        currentStep: setIndex,
        onStepContinue: () {
          setIndex < 2 ? setIndex++ : null;
          setState(() {});
        },
        onStepCancel: () {
          setIndex > 0 ? setIndex-- : null;
          setState(() {});
        },
        steps: [
          Step(
            title: Text("Add Photo"),
            content: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 80,
                  foregroundImage: image != null ? FileImage(image!) : null,
                ),
                FloatingActionButton.small(
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? file =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (file != null) {
                      log("Image received");
                      image = File(file.path);
                      setState(() {});
                    } else {
                      log("Image not received");
                    }
                  },
                  child: Icon(Icons.camera_alt_rounded),
                )
              ],
            ),
          ),
          Step(
            title: Text("Conatct Info"),
            content: Column(
              children: [
                4.h,
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter your Name",
                  ),
                ),
                10.h,
                TextField(
                  controller: eMail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter your E-mail",
                  ),
                ),
                10.h,
                TextField(
                  controller: contact,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Contact Number",
                  ),
                ),
              ],
            ),
          ),
          Step(
            title: Text("SAVE"),
            content: ElevatedButton(
              onPressed: () {
                ;
                if (name != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Contact Info Saved")));
                }
              },
              child: Text("SAVE"),
            ),
          ),
        ],
      ),
    );
  }
}
