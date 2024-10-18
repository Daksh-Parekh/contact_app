import 'dart:io';

import 'package:contact_app/routes/app_routes.dart';
import 'package:contact_app/utils/extensions.dart';
import 'package:contact_app/views/add_contact_page/add_contact_page.dart';
import 'package:contact_app/views/home_page/model/models.dart';
import 'package:contact_app/views/home_page/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HidePage extends StatefulWidget {
  const HidePage({super.key});

  @override
  State<HidePage> createState() => _HidePageState();
}

class _HidePageState extends State<HidePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  File? img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hide Page"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.lock_open_rounded),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<HomeProvider>().hideContacts.length,
        itemBuilder: (context, index) {
          ContactModel mod = ContactModel(
            email: context.watch<HomeProvider>().hideContacts[index].email,
            name: context.watch<HomeProvider>().hideContacts[index].name,
            contact: context.watch<HomeProvider>().hideContacts[index].contact,
            image: context.watch<HomeProvider>().hideContacts[index].image,
          );
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.detailPage,
                  arguments: context.read<HomeProvider>().hideContacts[index]);
            },
            onLongPress: () {
              dialog(index, mod);
            },
            leading:
                context.watch<HomeProvider>().hideContacts[index].image == null
                    ? CircleAvatar(
                        child: Text("A"),
                      )
                    : CircleAvatar(
                        foregroundImage: FileImage(context
                            .watch<HomeProvider>()
                            .hideContacts[index]
                            .image!),
                      ),
            title: Text(context
                .watch<HomeProvider>()
                .hideContacts[index]
                .name
                .toString()),
            subtitle: Text(
                context.watch<HomeProvider>().hideContacts[index].contact!),
            trailing: IconButton(
              onPressed: () {
                context.read<HomeProvider>().setIndex(index);
                context.read<HomeProvider>().unlockContatc(mod);
                // Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          );
        },
      ),
    );
  }

  void dialog(int index, ContactModel mod) {
    nameController.text =
        context.read<HomeProvider>().hideContacts[index].name!;
    emailController.text =
        context.read<HomeProvider>().hideContacts[index].email!;
    contactController.text =
        context.read<HomeProvider>().hideContacts[index].contact!;
    img = context.read<HomeProvider>().hideContacts[index].image;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Details..."),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                10.h,
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                10.h,
                TextField(
                  controller: contactController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ContactModel model = ContactModel(
                    image: img,
                    name: nameController.text,
                    email: emailController.text,
                    contact: contactController.text);
                context.read<HomeProvider>().setIndex(index);
                context.read<HomeProvider>().updateHideContact(model);
                Navigator.pop(context);
              },
              child: Text(
                "Update",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
