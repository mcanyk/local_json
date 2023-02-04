import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:local_json/model/car_model.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
    @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Json Operations"),
      ),
      
      body: FutureBuilder<List<CarsModel>>(
          future: readCarsJson(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CarsModel> carList = snapshot.data!;

              return ListView.builder(
                itemCount: carList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(carList[index].arabaAdi),
                    subtitle: Text(carList[index].ulke),
                    leading: CircleAvatar(
                      child: Text(carList[index].model[0].fiyat.toString()),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  (snapshot.error.toString()),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center();
          }),
    );
  }
}

Future<List<CarsModel>> readCarsJson(BuildContext context) async {
  try {
    String readString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/cars.json');

    var jsonArray = jsonDecode(readString);

    // debugPrint(readString);
    //debugPrint('************');
    /*List carList =jsonObject;
  debugPrint(carList[1]['model'][0]['fiyat'].toString());  */

    List<CarsModel> allCars = (jsonArray as List)
        .map((carMap) => CarsModel.fromJson(carMap))
        .toList();
    //debugPrint(allCars[0].model[0].modelAdi);
    debugPrint(allCars.length.toString());

    return allCars;
  } catch (e) {
    debugPrint(e.toString());
    return Future.error(e.toString());
  }
}
