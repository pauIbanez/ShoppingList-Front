import 'package:flutter/material.dart';


class CreateItemForm extends StatefulWidget {
  const CreateItemForm({Key? key}) : super(key: key);

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildNameField(),
          _buildQuantityField(),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: (() {
              if(!_formKey.currentState!.validate()){
                return;
              }

              _formKey.currentState!.save();
            }),
            child: const Text("Create", style: TextStyle(color: Colors.white))
          )
        ],
      )
    );
  }
}