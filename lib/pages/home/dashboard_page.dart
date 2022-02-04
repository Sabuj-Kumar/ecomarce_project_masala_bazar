import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:efgecom/components/cards/custom_card.dart';
import 'package:efgecom/components/scaffold/connectivity_bar.dart';
import 'package:efgecom/components/scaffold/custom_scaffold.dart';
import 'package:efgecom/components/scaffold/scaffold_header.dart';
import 'package:efgecom/helpers/toast.dart';
import 'package:efgecom/pages/wrapper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // final TextEditingController _typeAheadController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      header: const ScaffoldHeader(title: "Dashboard"),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Connectivitybar(),
            const SizedBox(
              height: 5,
            ),
            CustomCard(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.helloWorld),
                    MaterialButton(
                      child: const Text("Change to English"),
                      onPressed: () async {
                        await Wrapper.setLocale(context, 'en');
                        setState(() {});
                      },
                    ),
                    MaterialButton(
                      child: const Text("বাংলায় যান"),
                      onPressed: () async {
                        await Wrapper.setLocale(context, 'bn');
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                CustomToast.show(
                    message:
                        "Please enter valid value. Allowed special characters &,. ");
              },
              child: const Text("Alert"),
            ),
          ],
        ),
      ),
    );
  }
}
