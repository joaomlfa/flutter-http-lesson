import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_poc/config/http/http_client_base.dart';
import 'package:http_poc/config/http/http_client_base_dio.dart';
import 'package:http_poc/model/product/product_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HttpClientBase httpClient = HttpClientBase(client: http.Client());
  final HttpClientBaseDio httpClientDio = HttpClientBaseDio(http: dio.Dio());
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    //getProductsHttp();
    getProductsDio();
  }

  Future<void> getProductsHttp() async {
    final http.Response response = await httpClient.get(
      uri: 'https://praia-on-dev-7b0a153ad371.herokuapp.com/api/v1/Produto',
    );
    if (response.statusCode == HttpStatus.ok) {
      products = json.decode(response.body).map<ProductModel>((product) {
        return ProductModel.fromJson(product);
      }).toList();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('error on get products'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> getProductsDio() async {
    final dio.Response response = await httpClientDio.get(
      'https://praia-on-dev-7b0a153ad371.herokuapp.com/api/v1/Produto',
    );
    if (response.statusCode == HttpStatus.ok) {
      products =
          (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
      print(products);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('error on get products'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
