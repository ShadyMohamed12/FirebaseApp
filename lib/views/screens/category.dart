import 'package:flutter/material.dart';
import 'package:flutter_group_1/core/firebase_cloud_store_util.dart';
import 'package:flutter_group_1/models/category_model.dart';
import 'package:flutter_group_1/views/widgets/app_button.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({Key? key}) : super(key: key);

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  TextEditingController name = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController id = TextEditingController();
  final _addCategoryFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new category"),
      ),
      body: Form(
        key: _addCategoryFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Invalid name";
                      }
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: id,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "id",
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Invalid id";
                      }
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: image,
                    decoration: const InputDecoration(
                      labelText: "Image",
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "Invalid Image";
                      }
                    },
                  )),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : AppButton(
                      label: "Add Category",
                      color: Color.fromARGB(255, 143, 183, 97),
                      onTap: () async {
                        if (_addCategoryFormKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          var data = CategoryModel(
                              name: name.text, image: image.text, id: id.text);
                          bool result =
                              await FirebaseCloudStoreUtil.addCategory(data);
                          if (result) {
                            name.clear();
                            image.clear();
                            id.clear();
                            var snackBar = const SnackBar(
                              content: Text("added succesfully"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            var snackBar = const SnackBar(
                              content: Text("wrong in add category"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
