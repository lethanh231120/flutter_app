import 'package:flutter/material.dart';
import 'package:my_app/widgets/AppInput.dart';

class FormRowResult {
  final String col1;
  final List<String> col2;
  final List<String> col3;

  FormRowResult({required this.col1, required this.col2, required this.col3});
}

class FormRowData {
  final TextEditingController col1;
  final List<TextEditingController> col2;
  final List<TextEditingController> col3;

  FormRowData()
    : col1 = TextEditingController(),
      col2 = [TextEditingController()],
      col3 = [TextEditingController()];
}

class ThreeColumnDynamicForm extends StatefulWidget {
  const ThreeColumnDynamicForm({super.key});

  @override
  State<ThreeColumnDynamicForm> createState() => _ThreeColumnDynamicFormState();
}

class _ThreeColumnDynamicFormState extends State<ThreeColumnDynamicForm> {
  final FormRowData data = FormRowData();

  @override
  void dispose() {
    data.col1.dispose();
    for (final c in data.col2) c.dispose();
    for (final c in data.col3) c.dispose();
    super.dispose();
  }

  Widget _buildInput(TextEditingController controller) {
    return AppInput();
  }

  Widget _buildColumnList(
    List<TextEditingController> controllers,
    VoidCallback onAdd,
  ) {
    return Column(
      children: [
        for (int i = 0; i < controllers.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(child: _buildInput(controllers[i])),
                if (i == 0)
                  GestureDetector(
                    onTap: onAdd,
                    child: Image.asset(
                      'assets/icons/plus_circle.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (i > 0)
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: 3),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          controllers[i].dispose();
                          controllers.removeAt(i);
                        });
                      },
                      child: Image.asset(
                        'assets/icons/minus_circle.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Expanded(flex: 2, child: _buildInput(data.col1)),
        // _buildInput(data.col1),
        SizedBox(width: 70, child: _buildInput(data.col1)),
        const SizedBox(width: 8),

        Expanded(
          // flex: 3,
          child: _buildColumnList(data.col2, () {
            setState(() {
              data.col2.add(TextEditingController());
            });
          }),
        ),
        const SizedBox(width: 8),

        Expanded(
          // flex: 3,
          child: _buildColumnList(data.col3, () {
            setState(() {
              data.col3.add(TextEditingController());
            });
          }),
        ),
      ],
    );
  }
}
