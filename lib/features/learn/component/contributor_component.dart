import 'package:devlearn/core/model/contributor_model.dart';
import 'package:devlearn/core/tool/url.dart';
import 'package:flutter/material.dart';

class ContributorComponent extends StatelessWidget {
  final ContributorModel contributor;
  const ContributorComponent({
    required this.contributor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Url.openUrl(contributor.url),
      leading: contributor.imageUrl == null
          ? Icon(Icons.person_outline)
          : ClipOval(
              child: Image.network(
                height: 32,
                contributor.imageUrl!,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person_outline);
                },
              ),
            ),
      title: Text(contributor.name),
      trailing: Icon(Icons.arrow_outward_outlined, color: Colors.white),
    );
  }
}
