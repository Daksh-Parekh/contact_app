import 'dart:io';

import 'package:contact_app/utils/extensions.dart';
import 'package:contact_app/views/home_page/model/models.dart';
import 'package:contact_app/views/home_page/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  File? imgs;

  @override
  Widget build(BuildContext context) {
    ContactModel models =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
        actions: [
          IconButton(
            onPressed: () async {
              await Share.share('${models.name}\n${models.contact}');
            },
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              context.read<HomeProvider>().hideContact(models);
              Navigator.pop(context);
              // Navigator.pushNamed(context, AppRoutes.hidePage);
            },
            icon: Icon(Icons.lock),
          ),
          IconButton(
            onPressed: () {
              nameController.text = models.name ?? "";
              emailController.text = models.email ?? "";
              contactController.text = models.contact ?? "";
              imgs = models.image;
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
                              image: imgs,
                              name: nameController.text,
                              email: emailController.text,
                              contact: contactController.text);

                          context.read<HomeProvider>().updateContact(model);
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
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          models.image == null
              ? CircleAvatar(
                  radius: 60,
                  child: Text(
                    models.name!.substring(0, 1).toUpperCase(),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                )
              : CircleAvatar(
                  radius: 60, foregroundImage: FileImage(models.image!)),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(models.name!),
            trailing: IconButton(
              onPressed: () async {
                await launchUrl(Uri.parse('sms:${models.contact}'));
              },
              icon: Icon(Icons.sms_rounded),
            ),
          ),
          ListTile(
            leading: Icon(Icons.email_rounded),
            title: Text(models.email!),
            trailing: IconButton(
              onPressed: () async {
                await launchUrl(Uri.parse("mailto:${models.email}"));
              },
              icon: Icon(Icons.mark_email_read_outlined),
            ),
          ),
          ListTile(
            leading: Icon(Icons.contact_phone_rounded),
            title: Text(models.contact!),
            trailing: IconButton(
              onPressed: () async {
                await launchUrl(Uri.parse("tel:${models.contact}"));
              },
              icon: Icon(Icons.phone),
            ),
          ),
        ],
      ),
    );
  }
}
