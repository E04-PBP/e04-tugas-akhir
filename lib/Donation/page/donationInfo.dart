import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iramakain/drawer.dart';
import 'package:iramakain/main.dart';
import 'package:iramakain/appbar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class DonationInfo extends StatefulWidget {
  const DonationInfo({super.key});

  @override
  State<DonationInfo> createState() => _DonationInfoState();
}

class _DonationInfoState extends State<DonationInfo> {
  _DonationInfoState();
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // String username = 
    return  Scaffold(
    appBar: AppBar(
          title: Text('Donations'),
        ),
    drawer: const IramaKainDrawer(),
    backgroundColor: Colors.white,
    body:  Stack(
      children: <Widget>[
         Container(
          decoration:  BoxDecoration(
            image:  DecorationImage(image:  AssetImage("lib/Donation/assets/img/Rectangle.png"), fit: BoxFit.cover,),
          ),
        ),
         Column(
          children: <Widget>[
            Center(
              child:Padding(padding: EdgeInsets.all(20),
                child: 
                Expanded(child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topCenter,
                    height: 100,
                    decoration: BoxDecoration(
                      color:Color.fromRGBO(64, 28, 92, 0.3),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    // color: Color.fromARGB(153, 18, 18, 18),
                    child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 18,
                      fontFamily: "Stratford"),
                    children: [
                      TextSpan(
                        text: request.loggedIn? "Username's Donation" : "Be the agent of change!",
                      ),
                      WidgetSpan(
                        child: Expanded(child: Container(height: 30,))
                      ),
                      WidgetSpan(child: Icon(Icons.monetization_on_rounded)),
                      TextSpan(
                        text: "Coins: ",
                      ),
                    ]),
                  )
                ),)
                ,)
            ),


          ]
        )
      ],
    )
  );
//     return Container(
//     constraints: const BoxConstraints.expand(),
//     decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("lib/Donation/assets/img/PURPLE.png"), fit: BoxFit.cover)),
//     child:
//       Scaffold(
//         appBar: AppBar(
//           title: Text('Donation Info'),
//         ),
//         drawer: const IramaKainDrawer(),
//         body: Column(
// //           children: <Widget>[
// //             RichText(
// //               text: TextSpan(
// //                 style: TextStyle(color: Colors.black, fontSize: 16),
// //                 children: <TextSpan>[
// //                   TextSpan(
// //                     text: """Microplastics are estimated to enter the ocean each year of 14 million tonnes.

// // About 16-35% microplastics released to the oceans are from synthetic textiles as a result of the vast fashion production in the recent times. (www.eea.europa.eu)

// // A sustainable fashion production is needed for reducing the release of microplastic toxins to the oceans as well as recycling clothes!

// // """,
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.w600,

// //                     ),
// //                   ),
// //                   TextSpan(text: "Irama Kain helps to provide this act for the better and healthier ocean!",
// //                       style: TextStyle(color: Color.fromRGBO(64, 28, 92, 1),
// //                       fontWeight: FontWeight.w600,),

// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Text("DONATION INFO")],
//         )));
  }
}
