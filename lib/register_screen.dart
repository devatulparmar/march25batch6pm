import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedGender = "M";
  String? selectedCity;
  bool langEnglish = false;
  bool langGujarati = false;
  bool langHindi = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> cityNamesListObject = [
    "Vadodara",
    "Ahmedabad",
    "Surat",
    "Rajkot"
  ];

  List<DropdownMenuItem> cityList = [
    const DropdownMenuItem(
      value: "Vadodara",
      child: Text("Vadodara"),
    ),
    const DropdownMenuItem(
      value: "Ahmedabad",
      child: Text("Ahmedabad"),
    ),
    const DropdownMenuItem(
      value: "Surat",
      child: Text("Surat"),
    ),
    const DropdownMenuItem(
      value: "Bharuch",
      child: Text("Bharuch"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Screen"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            TextFormField(
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == '') {
                  return "Please enter a full name";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Enter Username",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
            ),
            // TextField(
            //   textInputAction: TextInputAction.next,
            //   decoration: InputDecoration(
            //     hintText: "Enter Username",
            //     prefixIcon: const Icon(Icons.person),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(35),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(35),
            //       borderSide: const BorderSide(
            //         color: Colors.red,
            //         width: 2,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            TextFormField(
              textInputAction: TextInputAction.next,
              validator: (value) {
                final regex = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                bool isValidEmail = regex.hasMatch(value!);
                if (value == '') {
                  return "Please enter an email";
                } else if (isValidEmail == false) {
                  return "Please enter valid email";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Enter Email",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
            ),
            // TextField(
            //   textInputAction: TextInputAction.next,
            //   decoration: InputDecoration(
            //     hintText: "Enter Email",
            //     prefixIcon: const Icon(Icons.person),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(35),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(35),
            //       borderSide: const BorderSide(
            //         color: Colors.red,
            //         width: 2,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            TextFormField(
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value == '') {
                  return "Please enter a password";
                } else if (RegExp(r'^(?=.*?[A-Z])').hasMatch(value) == false) {
                  return "Should contain at least one upper case";
                } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                  return "Should contain at least one lower case";
                } else if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
                  return "Should contain at least one digit";
                } else if (!RegExp(r'^(?=.*?[!@#\$&*~%])').hasMatch(value)) {
                  return "Should contain at least one Special character";
                } else if (!RegExp(r'^.{6,}').hasMatch(value)) {
                  return "Must be at least 6 characters in length.";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Enter password",
                prefixIcon: const Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Radio(
                  value: "M",
                  groupValue: selectedGender,
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    selectedGender = newValue!;
                    setState(() {});
                  },
                ),
                const Text("Male"),
                Radio(
                  value: "F",
                  groupValue: selectedGender,
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    selectedGender = newValue!;
                    setState(() {});
                  },
                ),
                const Text("Female"),
              ],
            ),
            const SizedBox(height: 20),
            RadioListTile(
              value: "M",
              groupValue: selectedGender,
              activeColor: Colors.red,
              onChanged: (newValue) {
                selectedGender = newValue!;
                setState(() {});
              },
              title: const Text("Male"),
            ),
            RadioListTile(
              value: "F",
              groupValue: selectedGender,
              activeColor: Colors.red,
              onChanged: (newValue) {
                selectedGender = newValue!;
                setState(() {});
              },
              title: const Text("Female"),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.black),
              ),
              child: DropdownButton(
                items: cityList,
                value: selectedCity,
                hint: const Text("Select City"),
                isExpanded: true,
                isDense: false, // for button height
                underline: const SizedBox.shrink(),
                icon: const Icon(
                  Icons.arrow_downward,
                  size: 20,
                ),
                borderRadius: BorderRadius.circular(35),
                onChanged: (city) {
                  selectedCity = city!;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.black),
              ),
              child: DropdownButton(
                items: cityNamesListObject
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                value: selectedCity,
                hint: const Text("Select City"),
                isExpanded: true,
                isDense: false, // for button height
                underline: const SizedBox.shrink(),
                icon: const Icon(
                  Icons.arrow_downward,
                  size: 20,
                ),
                borderRadius: BorderRadius.circular(35),
                onChanged: (city) {
                  selectedCity = city!;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: langEnglish,
                  onChanged: (newValue) {
                    langEnglish = newValue!;
                    setState(() {});
                  },
                ),
                const Text("English"),
                Checkbox(
                  value: langGujarati,
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    langGujarati = newValue!;
                    setState(() {});
                  },
                ),
                const Text("Gujarati"),
              ],
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              value: langEnglish,
              title: const Text("English"),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (newValue) {
                langEnglish = newValue!;
                setState(() {});
              },
            ),
            CheckboxListTile(
              value: langGujarati,
              activeColor: Colors.red,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("Gujarati"),
              onChanged: (newValue) {
                langGujarati = newValue!;
                setState(() {});
              },
            ),
            CheckboxListTile(
              value: langHindi,
              activeColor: Colors.red,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("Hindi"),
              onChanged: (newValue) {
                langHindi = newValue!;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print('vndfkldfknb');
                }
                setState(() {});
              },
              child: const Text("Register"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
