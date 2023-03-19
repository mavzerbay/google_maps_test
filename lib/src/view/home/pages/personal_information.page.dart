import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/init/extensions/asset.extension.dart';
import '../../../core/init/extensions/context.extension.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        CircleAvatar(
            radius: 50,
            backgroundColor: context.theme.primaryColor,
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("profile_image".toJpeg),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        const SizedBox(height: 20),
        const Text("Baran Erbay MAVZER",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        const SizedBox(height: 20),
        const Text(
          "Full Stack Developer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Merhaba, ben Baran Erbay MAVZER. 2020 yılında "
            "Dokuz Eylül Üniversitesi İzmir Meslek Yüksekokulu "
            "Bilgisayar Programcılığı bölümünü bitirdim. "
            "Bitirme projemle birlikte flutter ile mobil "
            "geliştirmeye başladım. Şu ana kadar genel olarak Full Stack Developer olarak Backend ve "
            "Frontend geliştirmeleri yaptım. Ama kariyerime mobil "
            "geliştirme uzmanı olarak devam etmek istiyorum.",
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "İletişim",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                const email = "mavzerbay@gmail.com";

                final launchUri = Uri(
                  scheme: "mailto",
                  path: email,
                  query:
                      "subject=İş Başvurunuz Hakkında&body=Merhaba Baran Erbay MAVZER",
                );

                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(launchUri);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Email gönderilemedi"),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.mail,
                color: context.colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () async {
                const phone = "+905532830310";

                final launchUri = Uri(
                  scheme: "tel",
                  path: phone,
                );

                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(launchUri);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Telefon açılamadı"),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.phone,
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
