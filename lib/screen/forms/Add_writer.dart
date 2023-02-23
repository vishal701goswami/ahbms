import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _formKey = GlobalKey<FormState>();
  final namecodeController = TextEditingController();
  final emailcodeController = TextEditingController();
  final addresscodeController = TextEditingController();
  final mobilecodeController = TextEditingController();
  final alternate_numbercodeController = TextEditingController();
  final Bank_namecodeController = TextEditingController();
  final account_numbercodeController = TextEditingController();
  final ifsc_codecodeController = TextEditingController();
  final branch_namecodeController = TextEditingController();
  final addhar_card_numbercodeController = TextEditingController();
  final pan_card_numbercodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Form(
              key: _formKey,
              child: Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    TextFormField(
                      controller: namecodeController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailcodeController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: addresscodeController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: mobilecodeController,
                      decoration: InputDecoration(
                        labelText: 'Mobile number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: alternate_numbercodeController,
                      decoration: InputDecoration(
                        labelText: 'Alternate_number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: Bank_namecodeController,
                      decoration: InputDecoration(
                        labelText: 'bank_name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: account_numbercodeController,
                      decoration: InputDecoration(
                        labelText: 'account_number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: ifsc_codecodeController,
                      decoration: InputDecoration(
                        labelText: 'IFSC_code',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: branch_namecodeController,
                      decoration: InputDecoration(
                        labelText: 'Branch_name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: addhar_card_numbercodeController,
                      decoration: InputDecoration(
                        labelText: 'Aadhar_number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: pan_card_numbercodeController,
                      decoration: InputDecoration(
                        labelText: 'Pan_number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: AnimatedButton(
                        onPress: () {},
                        height: 50,
                        width: 120,
                        text: 'Submit',
                        isReverse: true,
                        selectedTextColor: const Color.fromARGB(255, 98, 97, 160),
                        transitionType: TransitionType.LEFT_TO_RIGHT,
                        textStyle: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 201, 201, 201),
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Color.fromARGB(255, 118, 0, 253),
                        borderColor: Color.fromARGB(255, 118, 0, 253),
                        borderRadius: 20,
                        borderWidth: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
