import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductCustomizationWidget extends StatefulWidget {
  const ProductCustomizationWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Function(Map<String, dynamic>) data;

  @override
  State<ProductCustomizationWidget> createState() =>
      _ProductCustomizationWidgetState();
}

class _ProductCustomizationWidgetState
    extends State<ProductCustomizationWidget> {
  List<String> dropDownItem = const [
    'Progressive',
    'Blueray',
    'Photochromic',
    'Bluechromic',
  ];
  String dropValue = 'Blueray';

  Map<String, dynamic> transactionData = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Color'),
            DropdownButton(
              style: Theme.of(context).textTheme.bodyMedium,
              items: dropDownItem
                  .map<DropdownMenuItem<String>>(
                    (String e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              value: dropValue,
              onChanged: (value) {
                setState(() {
                  dropValue = value!;
                });
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Lens Type'),
            DropdownButton(
              style: Theme.of(context).textTheme.bodyMedium,
              items: dropDownItem
                  .map<DropdownMenuItem<String>>(
                    (String e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              value: dropValue,
              onChanged: (value) {
                setState(() {
                  dropValue = value!;
                });
              },
            )
          ],
        ),
        Row(
          children: const [
            Expanded(flex: 2, child: SizedBox()),
            Expanded(
                flex: 1,
                child: Text(
                  'Left',
                  textAlign: TextAlign.center,
                )),
            Expanded(
                flex: 1,
                child: Text(
                  'Right',
                  textAlign: TextAlign.center,
                )),
          ],
        ),
        EyeAdditions(
          label: 'Plus/Sphere',
          leftInput: (p0) {
            transactionData['lsphere'] = p0;
            transactionData['leye'] = 'L';
            widget.data(transactionData);
            // print('left $p0 $transactionData');
          },
          rightInput: (p0) {
            // print('right $p0');
            transactionData['rsphere'] = p0;
            transactionData['reye'] = 'R';
            // print('left $p0 $transactionData');
          },
        ),
        EyeAdditions(
          label: 'Cylinder',
          leftInput: (p0) {
            /// TODO add to map
          },
          rightInput: (p0) {
            /// TODO add to map
          },
        ),
        EyeAdditions(
          label: 'Axis',
          leftInput: (p0) {
            /// TODO add to map
          },
          rightInput: (p0) {
            /// TODO add to map
          },
        ),
        EyeAdditions(
          label: 'Add',
          leftInput: (p0) {
            /// TODO add to map
          },
          rightInput: (p0) {
            /// TODO add to map
          },
        ),
        EyeAdditions(
          label: 'Prism',
          leftInput: (p0) {
            /// TODO add to map
          },
          rightInput: (p0) {
            /// TODO add to map
          },
        ),
        EyeAdditions(
          label: 'Base',
          leftInput: (p0) {
            /// TODO add to map
          },
          rightInput: (p0) {
            /// TODO add to map
          },
        ),
      ],
    );
  }
}

class EyeAdditions extends StatelessWidget {
  final String label;
  final Function(String)? leftInput;
  final Function(String)? rightInput;

  EyeAdditions({
    Key? key,
    required this.label,
    this.leftInput,
    this.rightInput,
  }) : super(key: key);

  final TextEditingController leftController = TextEditingController();
  final TextEditingController rightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(label)),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: leftController,
              textAlign: TextAlign.center,
              maxLength: 5,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(counterText: ''),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              onEditingComplete: () {
                leftInput!(leftController.text);
              },
              onFieldSubmitted: (value) {
                leftInput!(value);
              },
              onChanged: (value) {
                leftInput!(value);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: rightController,
              textAlign: TextAlign.center,
              maxLength: 5,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(counterText: ''),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              onEditingComplete: () {
                rightInput!(rightController.text);
              },
              onChanged: (value) {
                rightInput!(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
