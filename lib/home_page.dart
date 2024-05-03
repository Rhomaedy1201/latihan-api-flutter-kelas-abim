import 'package:belajar_api/http/controllers/tes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  tesController tesC = Get.put(tesController());

  @override
  void initState() {
    super.initState();
    tesC.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("GetX Example"),
      ),
      body: Obx(
        () => tesC.isLoading.value
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: tesC.tesM!.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = tesC.tesM!.data;
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            )),
                        width: Get.width,
                        child: Row(
                          children: [
                            Text("${index + 1}. "),
                            Text(data[index].sertifikasi),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
