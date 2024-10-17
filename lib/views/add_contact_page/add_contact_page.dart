import 'dart:developer';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:contact_app/routes/app_routes.dart';
import 'package:contact_app/utils/extensions.dart';
import 'package:contact_app/views/home_page/model/models.dart';
import 'package:contact_app/views/home_page/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  File? image;
  int setIndex = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                      // image = File(file.path);
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
            content: Form(
              key: formKey,
              child: Column(
                children: [
                  4.h,
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Enter your name" : null,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your Name",
                    ),
                  ),
                  10.h,
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your E-mail",
                    ),
                  ),
                  10.h,
                  TextFormField(
                    controller: contactController,
                    validator: (value) =>
                        value!.isEmpty ? "Enter your contact number" : null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Contact Number",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: Text("SAVE"),
            content: ElevatedButton(
              onPressed: () {
                bool vadiateForm = formKey.currentState!.validate();
                if (vadiateForm) {
                  String name = nameController.text;
                  String email = emailController.text;
                  String contact = contactController.text;
                  File? img = image != null ? File(image!.path) : null;

                  ContactModel model = ContactModel(
                      name: name, email: email, contact: contact, image: img);
                  context.read<HomeProvider>().addContact(model);
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      /// need to set following properties for best effect of awesome_snackbar_content
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Congratulations !!',
                        message: 'Your Contact Info Successfully Saved',
                        contentType: ContentType.success,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      /// need to set following properties for best effect of awesome_snackbar_content
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'On Hey!!',
                        message: 'Please Enter your name or email or contact',
                        messageTextStyle: TextStyle(fontSize: 10),
                        contentType: ContentType.failure,
                      ),
                    ),
                  );
                }
              },
              child: Text("SAVE"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.counter);
        },
        icon: const Icon(Icons.add),
        label: const Text("Add"),
      ),
    );
  }
}
