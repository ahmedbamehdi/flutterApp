// pages/booking_page/booking_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_car_parking/controller/PakingController.dart';
import '../../config/colors.dart';
import 'package:smart_car_parking/pages/homepage/homepage.dart';

class BookingPage extends StatelessWidget {
  final String slotName;
  final String slotId;
  const BookingPage({super.key, required this.slotId, required this.slotName});

  get get => HomePage;

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    Get.put(WithoutFirebase());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "Réserver        حجز",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animation/running_car.json',
                      width: 300,
                      height: 200,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Nouvelle réservation      حجز جديد",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: blueColor,
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      "Entrez votre nom   ادخل اسمك",
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: parkingController.name,
                        decoration: const InputDecoration(
                          fillColor: lightBg,
                          filled: true,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person,
                            color: blueColor,
                          ),
                          hintText: "Ahmed bamehdi",
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      "Saisissez le numéro du véhicule     ادخل رقم المركبة ",
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: parkingController.vehicalNumber,
                        decoration: const InputDecoration(
                          fillColor: lightBg,
                          filled: true,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.car_rental,
                            color: blueColor,
                          ),
                          hintText: " أ |15|000001  ",
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Choisissez la durée de l'emplacement  اختر مدة الوقوف",
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Slider(
                    mouseCursor: MouseCursor.defer,
                    thumbColor: blueColor,
                    activeColor: blueColor,
                    inactiveColor: lightBg,
                    label: "${parkingController.parkingTimeInMin.value} heure",
                    value: parkingController.parkingTimeInMin.value,
                    onChanged: (v) {
                      parkingController.parkingTimeInMin.value = v;
                      if (v <= 1) {
                        parkingController.parkingAmount.value = 5;
                      } else if (v <= 5) {
                        parkingController.parkingAmount.value = 8;
                      } else if (v <= 10) {
                        parkingController.parkingAmount.value = 10;
                      } else if (v <= 14) {
                        parkingController.parkingAmount.value = 12;
                      } else if (v <= 19) {
                        parkingController.parkingAmount.value = 15;
                      } else if (v <= 23) {
                        parkingController.parkingAmount.value = 20;
                      } else if (v ==24) {
                        parkingController.parkingAmount.value = 25;
                      }
                    },
                    divisions: 5,
                    min: 1,
                    max: 24,
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("tranch 1"),
                      Text("tranch 2"),
                      Text("tranch 3"),
                      Text("tranch 4"),
                      Text("tranch 5"),
                      Text("tranch 6"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Le nom de votre emplacement",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          slotName,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("Montant à payer   المبلغ المطلوب دفعه"),
                          ],
                        ),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage('assets/images/MAD.png'),
                              size: 70,
                              color: blueColor,
                            ),
                            Obx(
                              () => Text(
                                "${parkingController.parkingAmount.value}",
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  color: blueColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Logique pour annuler la réservation ici
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Couleur de fond du bouton
                          ),
                          child: Text(
                            "ANNULER LA RÉSERVATION",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            get.offAll(HomePage());
                            var withoutFirebase;
                            withoutFirebase.slot1.value = true;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "PAYER MAINTENANT    ادفع الآن",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WithoutFirebase {}
