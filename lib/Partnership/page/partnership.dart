import 'package:iramakain/main.dart';
import 'package:iramakain/Donation/page/donationForm.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:flutter/material.dart';

class MyPartnershipPage extends StatefulWidget {
    const MyPartnershipPage({super.key});

    @override
    State<MyPartnershipPage> createState() => _MyPartnershipPageState();
}
class _MyPartnershipPageState extends State<MyPartnershipPage> {
    final _formKey = GlobalKey<FormState>();
    String _fullName = "";
    String _emailAdress = "";
    String _phoneNumber = "";
    String _message = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Contact Us'),
            ),
            drawer: Drawer(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyHomePage(title: "Home Page")),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Donation'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => DonationInfo()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Contact Us'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyPartnershipPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('GET IN TOUCH!!', style: TextStyle(fontSize: 25)),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", 
                          textAlign: TextAlign.center),

                          Text('Contact Info', style: TextStyle(fontSize: 20)),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.location_on),
                              Text('Pondok Cina, Kecamatan Beji, Kota Depok, Jawa Barat 16424'),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.mail),
                              Text(' iramakain@gmail.com'),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.call),
                              Text(' +62-8734-3486-023'),
                            ],
                          ),

                          Text('Send us a Message', style: TextStyle(fontSize: 20)),
                          
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Contoh: Pak Rama",
                                    labelText: "Nama Lengkap",
                                    // Menambahkan icon agar lebih intuitif
                                    icon: const Icon(Icons.people),
                                    // Menambahkan circular border agar lebih rapi
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                // Menambahkan behavior saat nama diketik 
                                onChanged: (String? value) {
                                    setState(() {
                                        _fullName = value!;
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                        _fullName = value!;
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Nama lengkap tidak boleh kosong!';
                                    }
                                    return null;
                                },
                            ),
                        ),
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Contoh: ramakain@gmail.com",
                                    labelText: "Email Address",
                                    // Menambahkan icon agar lebih intuitif
                                    icon: const Icon(Icons.mail),
                                    // Menambahkan circular border agar lebih rapi
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                // Menambahkan behavior saat nama diketik 
                                onChanged: (String? value) {
                                    setState(() {
                                        _emailAdress = value!;
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                        _emailAdress = value!;
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Email tidak boleh kosong!';
                                    }
                                    return null;
                                },
                            ),
                        ),
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Contoh: 082235002091",
                                    labelText: "Phone Number",
                                    // Menambahkan icon agar lebih intuitif
                                    icon: const Icon(Icons.phone),
                                    // Menambahkan circular border agar lebih rapi
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                // Menambahkan behavior saat nama diketik 
                                onChanged: (String? value) {
                                    setState(() {
                                        _phoneNumber = value!;
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                        _phoneNumber = value!;
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Nomor tidak boleh kosong!';
                                    }
                                    return null;
                                },
                            ),
                        ),
                          Padding(
                            // Menggunakan padding sebesar 8 pixels
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Contoh: Ide yang bagus, mari bekerja sama!",
                                    labelText: "Message",
                                    // Menambahkan icon agar lebih intuitif
                                    icon: const Icon(Icons.message),
                                    // Menambahkan circular border agar lebih rapi
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                // Menambahkan behavior saat nama diketik 
                                onChanged: (String? value) {
                                    setState(() {
                                        _message = value!;
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                        _message = value!;
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Pesan tidak boleh kosong!';
                                    }
                                    return null;
                                },
                            ),
                        ),
                        TextButton(
                          child: const Text(
                            "Send",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: Container(
                                      child: ListView(
                                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          Center(child: const Text('Your Message is Already Send!!')),
                                          SizedBox(height: 20),
                                          // TODO: Munculkan informasi yang didapat dari form
                                          Column(
                                            children: [
                                              Text('Name : $_fullName', style: TextStyle(fontWeight: FontWeight.bold)),
                                              Text('Email : $_emailAdress', style: TextStyle(fontWeight: FontWeight.bold)),
                                              Text('Phone Number : $_phoneNumber', style: TextStyle(fontWeight: FontWeight.bold)),
                                              Text('$_message', style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: 
                                              Text('Kembali'),
                                          ), 
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                    ],
                    ),
                  ),
                ),
            ),
        );
    }
}