import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:sqflite_test/presentation/controllers/product_controller.dart';
import 'package:sqflite_test/presentation/functions/form_layout_decorations.dart';

import 'package:sqflite_test/presentation/models/category.dart';
import 'package:sqflite_test/presentation/models/product.dart';
import 'package:sqflite_test/presentation/widgets/create_category_form_widget.dart';

class CreateProductFormWidget extends StatefulWidget {
  const CreateProductFormWidget({super.key});

  @override
  State<CreateProductFormWidget> createState() =>
      _CreateProductFormWidgetState();
}

class _CreateProductFormWidgetState extends State<CreateProductFormWidget> {
  final _productManagerController = GetIt.instance<ProductManagerController>();
  final _formKey = GlobalKey<FormState>();
  final _productNameEditingController = TextEditingController();
  final _zeroValue = "R\$ 0,00";
  final _productPriceEditingController = TextEditingController();
  final String brl = "R\$";

  Category? selectedCategory;

  @override
  void initState() {
    super.initState();
    _productPriceEditingController.text = _zeroValue;
    print("categorias: ${_productManagerController.categories}");
  }

  void validade() {
    if (_formKey.currentState?.validate() == true) {
      final product = Product(
        name: _productNameEditingController.text,
        price: double.parse(_productPriceEditingController.text
            .replaceAll(RegExp(r'[^\d]+'), '')
            .replaceAll(',', '.')),
        categoryId: selectedCategory!.id!,
      );
      _productManagerController.addProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: _productManagerController,
        builder: (context, child) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim() == "") {
                        return "Por favor, preencha o nome do produto";
                      }
                    },
                    controller: _productNameEditingController,
                    decoration: const InputDecoration(
                      label: Text("Nome do Produto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  heightGap,
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyInputFormatter(),
                    ],
                    controller: _productPriceEditingController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration:
                        defaultInputDecoration(label: "Preço do produto"),
                    validator: (value) {
                      if (value == null || value.trim() == "") {
                        return "Por favor, de um valor ao produto";
                      }

                      if (value == _zeroValue) {
                        return "O valor do produto não pode ser zero";
                      }
                      print(value);
                    },
                  ),
                  heightGap,
                  DropdownButtonFormField<Category>(
                    validator: (value) => value == null
                        ? "Por favor, selecione uma categoria"
                        : null,
                    decoration: InputDecoration(
                      labelText: "Selecionar Categoria",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Dialog(
                                child: SizedBox(
                                  height: double.infinity,
                                  child: CreateCategoryWidget(),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ),
                    isExpanded: true,
                    value: selectedCategory,
                    onChanged: (Category? value) {
                      selectedCategory = value;
                      setState(() {});
                    },
                    items: _productManagerController.categories
                        .map<DropdownMenuItem<Category>>(
                          (Category e) => DropdownMenuItem<Category>(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                  ),
                  heightGap,
                  defaultSubmitButton(
                    buttonText: "Criar Produto",
                    callbackFunction: () => validade(),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _productNameEditingController.dispose();
    _productPriceEditingController.dispose();
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: newText.length,
      ),
    );
  }
}
