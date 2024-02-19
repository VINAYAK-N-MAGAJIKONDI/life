import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // Import flutter_markdown
import 'package:google_gemini/google_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/gappbar.dart';

const apiKey = "AIzaSyBwxtvYwbj-SQASGB7A1sgNqiEsE8LMJWo"; // Replace with your actual API key
const Color aquaBlue = Color(0xFF00FFFF);

class Ai extends StatefulWidget {
  const Ai({Key? key}) : super(key: key);

  @override
  State<Ai> createState() => _AiState();
}

class _AiState extends State<Ai> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: customAppBar(),
        body: const TextWithImage(),
      ),
    );
  }
}


class TextWithImage extends StatefulWidget {
  const TextWithImage({Key? key}) : super(key: key);

  @override
  State<TextWithImage> createState() => _TextWithImageState();
}

class _TextWithImageState extends State<TextWithImage> {
  bool loading = false;
  List<Map<String, dynamic>> textAndImageChat = [];
  File? imageFile;

  final ImagePicker picker = ImagePicker();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // Create Gemini Instance
  final gemini = GoogleGemini(apiKey: apiKey);

  void fromText({required String query}) {
    setState(() {
      loading = true;
      textAndImageChat.add({
        "role": "User",
        "text": query,
      });
      _textController.clear();
    });
    scrollToTheEnd();

    gemini.generateFromText(query).then((value) {
      setState(() {
        loading = false;
        textAndImageChat.add({
          "role": "Gemini",
          "text": value.text,
        });
      });
      scrollToTheEnd();
    }).catchError((error) {
      setState(() {
        loading = false;
        textAndImageChat.add({
          "role": "Gemini",
          "text": error.toString(),
        });
      });
      scrollToTheEnd();
    });
  }

  void fromTextAndImage({required String query, File? image}) {
    setState(() {
      loading = true;
      textAndImageChat.add({
        "role": "User",
        "text": query,
        "image": image,
      });
      _textController.clear();
      imageFile = null;
    });
    scrollToTheEnd();

    if (image != null) {
      gemini
          .generateFromTextAndImages(query: query, image: image)
          .then((value) {
        setState(() {
          loading = false;
          textAndImageChat.add({
            "role": "Gemini",
            "text": value.text,
            "image": "",
          });
        });
        scrollToTheEnd();
      }).catchError((error) {
        setState(() {
          loading = false;
          textAndImageChat.add({
            "role": "Gemini",
            "text": error.toString(),
            "image": "",
          });
        });
        scrollToTheEnd();
      });
    } else {
      // Handle the case where no image is selected
      setState(() {
        loading = false;
        textAndImageChat.add({
          "role": "Gemini",
          "text": "No image selected",
          "image": null,
        });
      });
    }
  }

  void scrollToTheEnd() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueGrey.shade100, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ListView.builder(
                controller: _controller,
                itemCount: textAndImageChat.length,
                padding: const EdgeInsets.only(bottom: 20),
                itemBuilder: (context, index) {
                  dynamic image = textAndImageChat[index]["image"];
                  Widget trailingWidget;
                  if (image is File) {
                    trailingWidget = Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: FileImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else if (image is String) {
                    trailingWidget = Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: FileImage(File(image)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else {
                    trailingWidget = const SizedBox.shrink(); // or any other default widget
                  }
                  return Card(
                    color: Colors.grey.shade900,
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor: aquaBlue,
                        child: Text(
                          textAndImageChat[index]["role"].substring(0, 1),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        textAndImageChat[index]["role"],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: MarkdownBody(
                        data: textAndImageChat[index]["text"],
                        styleSheet: MarkdownStyleSheet(
                          // Add style for paragraphs
                          p: TextStyle(color: Colors.white),
                        ),
                      ),
                      trailing: trailingWidget,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Write a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.transparent,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_a_photo),
                  onPressed: () async {
                    final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      imageFile = image != null ? File(image.path) : null;
                    });
                  },
                ),
                IconButton(
                  icon: loading
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.send),
                  onPressed: () {
                    if (_textController.text.isNotEmpty || imageFile != null) {
                      if (imageFile == null) {
                        fromText(query: _textController.text);
                      } else {
                        fromTextAndImage(
                          query: _textController.text,
                          image: imageFile,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: imageFile != null
          ? Container(
        margin: const EdgeInsets.only(bottom: 80),
        height: 150,
        child: Image.file(imageFile!),
      )
          : null,
    );
  }
}
