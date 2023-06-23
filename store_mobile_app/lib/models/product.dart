import 'package:flutter/material.dart';

class Product {
  final int id, price;
  final String title, subTitle, description, image;

  Product(
      {required this.id,
      required this.price,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.image});
}

// list of products
List<Product> products = [
  Product(
    id: 1,
    price: 125,
    title: "سماعات لاسلكية",
    subTitle: "جودة صوت عالية",
    image: "images/airpod.png",
    description:
        "وسائد أذن ناعمة من الجلد ومريحة للارتداء لفترات طويلة من الزمن وعزل صوتي جيد لحجب الضوضاء الخلفية",
  ),
  Product(
    id: 2,
    price: 1299,
    title: "ابل ايفون",
    subTitle: "مع ميزة الجزيرة الديناميكية",
    image: "images/mobile.png",
    description:
        "شاشة ريتنا سوبر اكس دي ار وكاميرا رئيسية تقدم وضوحا أعلى والنمط السينمائي في التصوير",
  ),
  Product(
    id: 3,
    price: 99,
    title: "نظارات ثلاثية الأبعاد",
    subTitle: "لنقلك للعالم الافتراضي",
    image: "images/class.png",
    description:
        "اذهب إلى أي مكان، افعل أي شيء، وكن أي شخص لديه الواقع الافتراضي",
  ),
  Product(
    id: 4,
    price: 159,
    title: "سماعات",
    subTitle: "لساعات استماع طويلة",
    image: "images/headset.png",
    description:
        "تقنية إلغاء الضوضاء: سماعة الأذن اللاسلكية مزودة بتقنية إلغاء الضوضاء للاستمتاع بسماع الموسيقى بدون تشتيت",
  ),
  Product(
    id: 5,
    price: 68,
    title: "مسجل صوت",
    subTitle: "سجل اللحظات المهمة حولك",
    image: "images/speaker.png",
    description:
        "جهار تسجيل الصوت بإمكانيات ممتازة، متانة والسهولة في الاستخدام وجودة رائعة وصوت نقي",
  ),
  Product(
    id: 6,
    price: 250,
    title: "كاميرات كمبيوتر",
    subTitle: "بجودة ودقة صورة عالية",
    image: "images/camera.png",
    description: "جودة تصوير عالية مع تصوير عالي السرعة ونظام التركيز التلقائي",
  ),
];
