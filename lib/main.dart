import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsoncard/movie_data_model.dart';
import 'package:flutter/services.dart' as rootBundle;

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context,data){
          if(data.hasError){
            return Center(child: Text("${data.error}"));
          }else if(data.hasData){
            var items =data.data as List<MovieDataModel>;
            return ListView.builder(
              itemCount:items.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image(image: NetworkImage(items[index].imageURL.toString()),fit: BoxFit.fill,),
                          ),
                          Expanded(child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: const EdgeInsets.only(left: 8,right: 8),child: Text(items[index].name.toString(),style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),),),
                                Padding(padding: const EdgeInsets.only(left: 8,right: 8),child: Text(items[index].category.toString()),),
                                Padding(padding: const EdgeInsets.only(left: 8,right: 8),child: Text(items[index].popularity.toString()),),
                                Padding(padding: const EdgeInsets.only(left: 8,right: 8),child: Text(items[index].date.toString()),),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }
            );
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }

  Future<List<MovieDataModel>>ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => MovieDataModel.fromJson(e)).toList();
  }
}

