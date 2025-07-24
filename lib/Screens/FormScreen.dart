import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  String groupType = '1+9';
  String planType = 'Family';
  bool burial = false, grocery = false, meat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panther Funeral Application Form'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textRow(['Policy Number', 'Inception Date']),
              const SizedBox(height: 10),

              _sectionTitle('Group Type'),
              Wrap(
                spacing: 10,
                children: ['1+9', '1+5'].map((g) {
                  return ChoiceChip(
                    label: Text(g),
                    selected: groupType == g,
                    onSelected: (_) => setState(() => groupType = g),
                  );
                }).toList(),
              ),
              _sectionTitle('Type of Plan'),
              Wrap(
                spacing: 10,
                children:
                    [
                      'Single Parent',
                      'Family',
                      'Individual',
                      '65-74',
                      '74+',
                    ].map((p) {
                      return ChoiceChip(
                        label: Text(p),
                        selected: planType == p,
                        onSelected: (_) => setState(() => planType = p),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 10),

              _sectionTitle('Premium Calculation'),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Burial"),
                      value: burial,
                      onChanged: (v) => setState(() => burial = v!),
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Grocery"),
                      value: grocery,
                      onChanged: (v) => setState(() => grocery = v!),
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Meat"),
                      value: meat,
                      onChanged: (v) => setState(() => meat = v!),
                    ),
                  ),
                ],
              ),
              _textInput('Total Premium'),

              _sectionTitle('Payment Method'),
              Row(
                children: ['Cash', 'Stop Order'].map((method) {
                  return Expanded(
                    child: RadioListTile(
                      title: Text(method),
                      value: method,
                      groupValue: 'Cash',
                      onChanged: (_) {},
                    ),
                  );
                }).toList(),
              ),
              _textInput('Product Name'),

              const Divider(height: 30),

              _sectionTitle('Application Details'),
              _textRow(['Title', 'Surname', 'First Name']),
              _textRow(['Date of Birth', 'Gender', 'ID Number']),
              _textInput('Address'),
              _textRow(['Cell No.', 'Work No.']),
              _textRow(['Area Code', 'Fax No.']),
              _textInput('E-Mail Address'),

              const Divider(height: 30),

              _sectionTitle('Dependants'),
              for (int i = 0; i < 4; i++)
                _textRow([
                  'Surname',
                  'First Name',
                  'Birthday / ID',
                  'Burial Place',
                ]),

              const Divider(height: 30),

              _sectionTitle('Nomination of Beneficiary'),
              _textRow([
                'Full Name',
                'Date of Birth',
                'ID Number',
                'Relationship',
                'Claim %',
              ]),

              _textInput('Member\'s Signature'),
              _textInput('Full Name'),
              _textRow(['Agent Name', 'Branch', 'Agent Sign']),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form Submitted')),
                      );
                    }
                  },
                  child: const Text('Submit Application'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textInput(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }

  Widget _textRow(List<String> labels) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: labels
            .map(
              (label) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _textInput(label),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}
