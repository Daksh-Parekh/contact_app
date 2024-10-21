import 'dart:io';

import 'package:contact_app/routes/app_routes.dart';
import 'package:contact_app/utils/app_theme.dart';
import 'package:contact_app/utils/extensions.dart';
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
        title: Text(
          "Hide Page",
          style: AppTheme.LightTheme.textTheme.titleLarge,
        ),
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
            onLongPress: () {},
            leading:
                context.watch<HomeProvider>().hideContacts[index].image == null
                    ? CircleAvatar(
                        child: Text(
                          context
                              .watch<HomeProvider>()
                              .hideContacts[index]
                              .name!
                              .substring(0, 1)
                              .toUpperCase(),
                          style: AppTheme.LightTheme.textTheme.displayLarge,
                        ),
                      )
                    : CircleAvatar(
                        foregroundImage: FileImage(context
                            .watch<HomeProvider>()
                            .hideContacts[index]
                            .image!),
                      ),
            title: Text(
              context.watch<HomeProvider>().hideContacts[index].name.toString(),
              style: AppTheme.LightTheme.textTheme.displayLarge,
            ),
            subtitle: Text(
              context.watch<HomeProvider>().hideContacts[index].contact!,
              style: AppTheme.LightTheme.textTheme.displayMedium,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton.filledTonal(
                  onPressed: () {
                    context.read<HomeProvider>().setIndex(index);
                    context.read<HomeProvider>().unlockContatc(mod);
                  },
                  icon: const Icon(Icons.lock_open_rounded),
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    dialog(index, mod);
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
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
