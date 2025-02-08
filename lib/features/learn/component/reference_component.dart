import 'package:devlearn/core/model/learn_reference_model.dart';
import 'package:devlearn/core/tool/url.dart';
import 'package:flutter/material.dart';

class ReferenceComponent extends StatelessWidget {
  final List<LearnReferenceModel> references;
  const ReferenceComponent({
    required this.references,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (references.isEmpty) {
      return Text(
        'Nenhum material de apoio fornecido.',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return ListView.builder(
      itemCount: references.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext _, int index) {
        var item = references.elementAt(index);
        return ListTile(
          onTap: () => Url.openUrl(item.url),
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.description_outlined),
          title: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(Icons.arrow_outward_outlined, color: Colors.white),
        );
      },
    );
  }
}
