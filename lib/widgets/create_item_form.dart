import 'package:flutter/material.dart';
import 'package:shopping_list/services/use_api.dart';


class CreateItemForm extends StatefulWidget {
  const CreateItemForm({Key? key, required this.changePage}) : super(key: key);

  final void Function() changePage;
  @override
  State<CreateItemForm> createState() => _CreateItemFormState();
}

class _CreateItemFormState extends State<CreateItemForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = "";
  int _quantity = 1;


  Widget _buildNameField() {
    return TextFormField(
      autofocus: true,
      decoration: const InputDecoration(labelText: "Name"),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Name is required";
        }
        return null;
      },
      onSaved: (String? value) {
        _name = value ?? "";
      },
    );
  }

  Widget _buildQuantityField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Quantity"),
      keyboardType: TextInputType.number,
      initialValue: "1",
      validator: (String? value) {
        if(value!.isEmpty){
          return "Quantity can't be empty";
        }

        if(value == "0"){
          return "Quantity must be 1 or more";
        }
        
        if(int.tryParse(value) == null){
          return "Quantity must be a number";
        }

        _quantity =  int.tryParse(value) ?? 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildNameField(),
            const SizedBox(height: 20),
            _buildQuantityField(),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: (() async {
                if(!_formKey.currentState!.validate()){
                  return;
                }

                _formKey.currentState!.save();

                await UseAPI().createItem(_name, _quantity);

                widget.changePage();
              }),
              child: const Text("Create", style: TextStyle(color: Colors.white))
            )
          ],
        )
      )
    );
  }
}