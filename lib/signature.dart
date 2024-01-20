import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class Signature extends StatefulWidget {
  Signature({super.key});

  // final String title;

  @override
  _SignatureState createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  final _text = TextEditingController();
  bool _validate = false;
  // String errorText = "1vdvxvx";
  String _text1 = "";
  String _selectedDefSign = "No signature";
  String _selectedDefSign1 = "No signature";
  bool insertSignCheck = false;
  void checkIns(bool var1) {
    setState(() {
      if (var1)
        insertSignCheck = false;
      else
        insertSignCheck = true;
    });
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (insertSignCheck) return Colors.blue;
    return Colors.white;

    // return Colors.blue;
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }
  // String? get _errorText {
  //   // at any time, we can get the text from _controller.value.text
  //   final text = _text.text;
  //   // Note: you can do your own custom validation here
  //   // Move this logic this outside the widget for more testable code
  //   if (text.isEmpty) {
  //     return 'Can\'t be empty';
  //   }
  //   if (text.length < 4) {
  //     return 'Too short';
  //   }
  //   // return null if the text is valid
  //   return null;
  // }

  String result = '';
  String textString = "";
  // void changeTextString
  final HtmlEditorController controller = HtmlEditorController();
  int activeSignIndex = 0;
  List<Map<String, String>> signList = [
    // {"name": "qww", "content": "zxxc"},
    // {"name": "qww1212", "content": "zxxc122"}
  ];

  void changeIndex(Map<String, String> item) {
    setState(() {
      if (activeSignIndex != signList.indexOf(item)) {
        activeSignIndex = signList.indexOf(item);
        // controller.clear();
        // controller.insertHtml();
        controller.setText(signList[activeSignIndex]["content"]!);
      }
    });
  }

  void deleteItem(Map<String, String> item) {
    setState(() {
      if (item["name"] == _selectedDefSign) {
        _selectedDefSign = "No signature";
      }
      if (item["name"] == _selectedDefSign1) {
        _selectedDefSign1 = "No signature";
      }
      signList.remove(item);
      activeSignIndex = 0;
      // controller.clear();
      // controller.insertHtml();
      if (signList.length == 0)
        controller.setText("");
      else
        controller.setText(signList[activeSignIndex]["content"]!);
    });
  }

  List<String> defSignList() {
    List<String> lst = ["No signature"];
    signList.forEach((element) {
      lst.add(element["name"]!);
    });

    return lst;
  }

  String x = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: signList.length > 0 ? 200 : 60,
          // width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 200,
                // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (signList.isEmpty)
                        Text(
                          "No Signatures",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      if (signList.isNotEmpty)
                        Container(
                          height: 150,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...signList.map((item) {
                                  return InkWell(
                                    onTap: () {
                                      print(activeSignIndex);
                                      changeIndex(item);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: (activeSignIndex ==
                                              signList.indexOf(item))
                                              ? Colors.blue.shade50
                                              : Colors.transparent),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(item["name"]!),
                                            InkWell(
                                              child: Icon(
                                                  color: Colors.grey,
                                                  Icons.delete),
                                              onTap: () {
                                                deleteItem(item);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 1, color: Colors.grey),
                              fixedSize: Size(200, 30),
                              shape: BeveledRectangleBorder()),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text(
                                      'Add Signature'), // To display the title it is optional
                                  content: TextFormField(
                                    autofocus: true,
                                    controller: _text,
                                    decoration: InputDecoration(
                                      labelText: 'Enter the Value',
                                    ),
                                    onChanged: (newText) {
                                      setState(() {
                                        // x = newText;
                                      });
                                    },
                                  ), // Message which will be pop up on the screen
                                  // Action widget which will provide the user to acknowledge the choice
                                  actions: [
                                    OutlinedButton(
                                      // FlatButton widget is used to make a text to work like a button
                                      // textColor: Colors.black,
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      }, // function used to perform after pressing the button
                                      child: Text('CANCEL'),
                                    ),
                                    OutlinedButton(
                                      // textColor: Colors.black,
                                      onPressed: () {
                                        if (_text.text.isNotEmpty) {
                                          setState(() {
                                            activeSignIndex =
                                                signList.length;
                                            // controller.clear();
                                            signList.add({
                                              "name": _text.text,
                                              "content": ""
                                            });
                                          });
                                          controller.clear();
                                          _text.clear();
                                          // x = _text.text;
                                          Navigator.pop(ctx);
                                        }
                                      },
                                      child: Text('ACCEPT'),
                                    ),
                                  ],
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  "Create New",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ))
                    ]),
              ),
              if (signList.isNotEmpty)
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!kIsWeb) {
                          controller.clearFocus();
                        }
                      },
                      child: Container(
                        // height: 500,
                        width: 800,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 200,
                                child: HtmlEditor(
                                  controller: controller,
                                  htmlEditorOptions: HtmlEditorOptions(
                                    initialText: signList[activeSignIndex]
                                    ["content"],
                                    hint: 'Your text here...',
                                    shouldEnsureVisible: true,
                                    //initialText: "<p>text content initial, if any</p>",
                                  ),
                                  htmlToolbarOptions: HtmlToolbarOptions(
                                    toolbarPosition: ToolbarPosition
                                        .aboveEditor, //by default
                                    toolbarType: ToolbarType
                                        .nativeScrollable, //by default
                                    onButtonPressed: (ButtonType type,
                                        bool? status, Function? updateStatus) {
                                      print(
                                          "button '${describeEnum(type)}' pressed, the current selected status is $status");
                                      return true;
                                    },
                                    onDropdownChanged: (DropdownType type,
                                        dynamic changed,
                                        Function(dynamic)? updateSelectedItem) {
                                      print(
                                          "dropdown '${describeEnum(type)}' changed to $changed");
                                      return true;
                                    },
                                    mediaLinkInsertInterceptor:
                                        (String url, InsertFileType type) {
                                      print(url);
                                      return true;
                                    },
                                    mediaUploadInterceptor: (PlatformFile file,
                                        InsertFileType type) async {
                                      print(file.name); //filename
                                      print(file.size); //size in bytes
                                      print(file
                                          .extension); //file extension (eg jpeg or mp4)
                                      return true;
                                    },
                                  ),
                                  otherOptions: OtherOptions(height: 250),
                                  callbacks: Callbacks(
                                      onBeforeCommand: (String? currentHtml) {
                                        print('html before change is $currentHtml');
                                      }, onChangeContent: (String? changed) {
                                    print('content changed to $changed');
                                    setState(() {
                                      signList[activeSignIndex]["content"] =
                                      '$changed';
                                    });
                                    print(signList);
                                  }, onChangeCodeview: (String? changed) {
                                    print('code changed to $changed');
                                  }, onChangeSelection:
                                      (EditorSettings settings) {
                                    print(
                                        'parent element is ${settings.parentElement}');
                                    print('font name is ${settings.fontName}');
                                  }, onDialogShown: () {
                                    print('dialog shown');
                                  }, onEnter: () {
                                    print('enter/return pressed');
                                  }, onFocus: () {
                                    print('editor focused');
                                  }, onBlur: () {
                                    print('editor unfocused');
                                  }, onBlurCodeview: () {
                                    print(
                                        'codeview either focused or unfocused');
                                  }, onInit: () {
                                    print('init');
                                  },
                                      //this is commented because it overrides the default Summernote handlers
                                      /*onImageLinkInsert: (String? url) {
                                  print(url ?? "unknown url");
                                },
                                onImageUpload: (FileUpload file) async {
                                  print(file.name);
                                  print(file.size);
                                  print(file.type);
                                  print(file.base64);
                                },*/
                                      onImageUploadError: (FileUpload? file,
                                          String? base64Str,
                                          UploadError error) {
                                        print(describeEnum(error));
                                        print(base64Str ?? '');
                                        if (file != null) {
                                          print(file.name);
                                          print(file.size);
                                          print(file.type);
                                        }
                                      }, onKeyDown: (int? keyCode) {
                                    print('$keyCode key downed');
                                    print(
                                        'current character count: ${controller.characterCount}');
                                  }, onKeyUp: (int? keyCode) {
                                    print('$keyCode key released');
                                  }, onMouseDown: () {
                                    print('mouse downed');
                                  }, onMouseUp: () {
                                    print('mouse released');
                                  },
                                      // onNavigationRequestMobile: (String url) {
                                      //   print(url);
                                      //   return NavigationActionPolicy.ALLOW;
                                      // },
                                      onPaste: () {
                                        print('pasted into editor');
                                      }, onScroll: () {
                                    print('editor scrolled');
                                  }),
                                  plugins: [
                                    SummernoteAtMention(
                                        getSuggestionsMobile: (String value) {
                                          var mentions = <String>[
                                            'test1',
                                            'test2',
                                            'test3'
                                          ];
                                          return mentions
                                              .where((element) =>
                                              element.contains(value))
                                              .toList();
                                        },
                                        mentionsWeb: [
                                          'test1',
                                          'test2',
                                          'test3'
                                        ],
                                        onSelect: (String value) {
                                          print(value);
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
        if (signList.length > 0)
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Signature Defaults",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 150,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "FOR NEW EMAIL USE",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(4),
                                      isDense: true,
                                      constraints: BoxConstraints(
                                          maxWidth: 400, maxHeight: 50),
                                      border: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                    // hint: Icon(Icons.text_fields_rounded),
                                    items: defSignList().map((item) {
                                      return DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ));
                                    }).toList(),
                                    value: _selectedDefSign,
                                    onChanged: (value) {
                                      if (value == null) return;
                                      setState(() {
                                        _selectedDefSign = value.toString();
                                      });
                                    }),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 150,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "FOR REPLY/FORWARD USE",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(4),
                                      isDense: true,
                                      constraints: BoxConstraints(
                                          maxWidth: 400, maxHeight: 50),
                                      border: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                    // hint: Icon(Icons.text_fields_rounded),
                                    items: defSignList().map((item) {
                                      return DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ));
                                    }).toList(),
                                    value: _selectedDefSign1,
                                    onChanged: (value) {
                                      if (value == null) return;
                                      setState(() {
                                        _selectedDefSign1 = value.toString();
                                      });
                                    }),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Checkbox(
                        side: BorderSide(color: Colors.black),
                        checkColor: Colors.white,
                        fillColor: MaterialStateColor.resolveWith(getColor),
                        value: insertSignCheck,
                        onChanged: (bool? value) {
                          setState(() {
                            checkIns(insertSignCheck);
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Text(
                        "Insert signature before quoted text in replies and remove the '--' line that precedes it.",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
      ],
    );
  }
}