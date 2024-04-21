import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/ExampleTwo/example_two_provider.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {

  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleTwoProvider>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Example 2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ExampleTwoProvider>(
            builder: (context,value,child){
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value, onChanged: (val){
                value.setValue(val);
              });
            }),
          Consumer<ExampleTwoProvider>(
            builder: (context,value,child){
              return Row(
                children: [
                  Expanded(child: Container(
                    child: Text("Container 1"),
                    color: Colors.amber.withOpacity(value.value),
                  ),
                  ),
                  Expanded(child: Container(
                    child: Text("Container 2"),
                    color: Colors.redAccent.withOpacity(value.value),
                  ),),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
