import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medease1/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  String selectedGender = "Male";
  String selectedRole = "Doctor";
  Country? selectedCountry;
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() => _isLoading = true);

    final response = await http.post(
      Uri.parse("https://medease-server.up.railway.app/api/users/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "phone": phoneController.text.trim(),
        "country": selectedCountry?.name ?? "",

        "city": cityController.text.trim(),
        "gender": selectedGender,
        "role": selectedRole,
      }),
    );

    setState(() => _isLoading = false);

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registered Successfully, Please check your emil"),
          backgroundColor: Colors.green,
        ),
      );

      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed("/login");
    } else {
      final responseData = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            responseData["message"] ?? "Registration failed. Please try again.",
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildTextField(nameController, "Name"),
              _buildTextField(emailController, "Email"),
              _buildTextField(
                passwordController,
                "Password",
                obscureText: true,
              ),
              _buildTextField(phoneController, "Phone"),
              _buildCountryPicker(),
              _buildTextField(cityController, "City"),
              _buildDropdown("Gender", selectedGender, ["Male", "Female"], (
                newValue,
              ) {
                setState(() => selectedGender = newValue!);
              }),
              _buildDropdown(
                "Role",
                selectedRole,
                ["Doctor", "Patient", "Admin"],
                (newValue) {
                  setState(() => selectedRole = newValue!);
                },
              ),
              SizedBox(height: 20),
              _buildRegisterButton(),
              _buildLoginText(),
            ],
          ),
        ),
      ),///
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool obscureText = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String value,
    List<String> options,
    void Function(String?) onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items:
            options
                .map(
                  (option) =>
                      DropdownMenuItem(value: option, child: Text(option)),
                )
                .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildCountryPicker() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          showCountryPicker(
            context: context,
            showPhoneCode: false,
            onSelect:
                (Country country) => setState(() => selectedCountry = country),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedCountry?.name ?? "Select Country",
                style: TextStyle(fontSize: 16),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _register,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Color(0xFF2F4EFF),
        ),
        child:
            _isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                  "Register",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
      ),
    );
  }

  Widget _buildLoginText() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/login"),
        child: Text(
          "Already have an account? Login",
          style: TextStyle(color: Color(0xFF2F4EFF)),
        ),
      ),
    );
  }
}
