// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Selecionar unidade")]),
            SearchDropDown(),
            DropdownExample(),
          ],
        ),
      ),
    );
  }
}

class SearchDropDown extends StatelessWidget {
  const SearchDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Product>(
      enableSearch: true,
      controller: TextEditingController(),
      dropdownMenuEntries: productList
          .map(
            (e) => DropdownMenuEntry<Product>(value: e, label: e.nome),
          )
          .toList(),
      expandedInsets: const EdgeInsets.all(0),
    );
  }
}

class Product {
  int id;
  String nome;
  Product({
    required this.id,
    required this.nome,
  });
}

List<Product> productList = List.generate(
  1000,
  (index) => Product(id: index, nome: "Produto $index"),
);

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  Product? dropdownValue = null;
  List<String> produtos = List<String>.generate(300, (i) => 'Produto ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          width: 1,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<Product>(
          underline: const Icon(Icons.add),
          isExpanded: true,
          value: dropdownValue,
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 400,
            elevation: 1,
          ),
          onChanged: (Product? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: productList.map<DropdownMenuItem<Product>>((Product value) {
            return DropdownMenuItem<Product>(
              value: value,
              child: Text(value.nome),
            );
          }).toList(),
          // Altura máxima do dropdown
        ),
      ),
    );
  }
}
