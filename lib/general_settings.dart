import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gmail_settings_ui/drag_widget.dart';
import 'package:gmail_settings_ui/config.dart';
import 'package:gmail_settings_ui/custom_dropdown.dart';
import 'package:gmail_settings_ui/signatureCont.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({Key? key}) : super(key: key);

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  String? selectedCountry = 'India';
  String? selectedLanguage = 'English';

  String? selectedFont = 'Pacifico';
  String? selectedSize = 'Normal';
  String? selectedColor = 'Black';

  Widget settingWidget(String setting,
      {Widget? child, String? subtitle, bool isBold = true, double? width}) {
    return Row(
      children: [
        SizedBox(
          width: width ?? MediaQuery
              .of(context)
              .size
              .width * 0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$setting : ",
                style: TextStyle(fontWeight: isBold ? FontWeight.bold : null),
              ),
              subtitle != null
                  ? Text(
                "($subtitle)",
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              )
                  : const SizedBox(),
            ],
          ),
        ),
        child ?? const SizedBox.shrink()
      ],
    );
  }

  Widget languageWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Gmail display language : ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)),
              child: DropdownButton<String>(
                isDense: true,
                underline: const SizedBox.shrink(),
                value: selectedLanguage,
                items: languages
                    .map((item) =>
                    DropdownMenuItem<String>(
                        value: item, child: Text(item)))
                    .toList(),
                onChanged: (item) => setState(() => selectedLanguage = item),
              ),
            )
          ],
        ),
        const Text(
          "Change language settings for other Google products",
          style: TextStyle(color: Colors.blue),
        ),
        const Text(
          "Show all language options",
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  Widget phoneNumberWidget() {
    return Row(
      children: [
        const Text(
          "Default country code : ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black)),
          child: DropdownButton<String>(
            isDense: true,
            underline: const SizedBox.shrink(),
            value: selectedCountry,
            items: countries
                .map((item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
                .toList(),
            onChanged: (item) => setState(() => selectedCountry = item),
          ),
        )
      ],
    );
  }

  Widget textWidget() {
    return Card(
      elevation: 8,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      items: CustomDropDown.addDividersAfterItems(fonts),
                      value: selectedFont,
                      onChanged: (String? value) {
                        setState(() {
                          selectedFont = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        customHeights:
                        CustomDropDown.getCustomItemsHeights(fonts),
                      ),
                      iconStyleData: const IconStyleData(
                        openMenuIcon: Icon(Icons.arrow_drop_up),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      items: CustomDropDown.addDividersAfterItems(fontSizes),
                      value: selectedSize,
                      onChanged: (String? value) {
                        setState(() {
                          selectedSize = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        customHeights:
                        CustomDropDown.getCustomItemsHeights(fontSizes),
                      ),
                      iconStyleData: const IconStyleData(
                        openMenuIcon: Icon(Icons.arrow_drop_up),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      items: CustomDropDown.addDividersAfterItems(colors),
                      value: selectedColor,
                      onChanged: (String? value) {
                        setState(() {
                          selectedColor = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        customHeights:
                        CustomDropDown.getCustomItemsHeights(colors),
                      ),
                      iconStyleData: const IconStyleData(
                        openMenuIcon: Icon(Icons.arrow_drop_up),
                      ),
                    ),
                  ),
                ],
              ),
              Text("This is what your body text will look like.",
                  style: TextStyle(fontFamily: selectedFont)),
            ],
          ),
        ),
      ),
    );
  }

  Widget starsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.8,
          child: RichText(
            text: TextSpan(
              text: 'Drag the stars between the lists.',
              style: const TextStyle(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text:
                  ' The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.',
                  style: DefaultTextStyle
                      .of(context)
                      .style,
                ),
              ],
            ),
          ),
        ),
        const DragAndDropScreen(),
      ],
    );
  }

  Widget signatureWidget() {
    return SignContainer();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16), // Adjust padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            settingWidget("Language", child: languageWidget()),
            const Divider(),
            settingWidget("Phone Numbers", child: phoneNumberWidget()),
            const Divider(),
            settingWidget(
              "Default text style",
              subtitle:
              "Use the 'Remove formatting' button on the toolbar to reset the default text style",
              child: textWidget(),
            ),
            const Divider(),
            settingWidget("Stars", child: starsWidget()),
            const Divider(),
            settingWidget(
              "Signatures",
              child: signatureWidget(),
              subtitle: "appended at the end of all outgoing messages",
            ),
          ],
        ),
      ),
    );
  }
}
