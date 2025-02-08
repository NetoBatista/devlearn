import 'package:devlearn/core/model/contributor_model.dart';
import 'package:devlearn/core/provider/navigator_provider.dart';
import 'package:devlearn/features/learn/component/contributor_component.dart';
import 'package:flutter/material.dart';

class ContributorsComponent extends StatelessWidget {
  final List<ContributorModel> contributors;
  const ContributorsComponent({
    required this.contributors,
    super.key,
  });

  void onClickContributors(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Contribuidores'),
              IconButton(
                onPressed: NavigatorProvider.pop,
                icon: Icon(Icons.close),
              ),
            ],
          ),
          contentPadding: EdgeInsets.fromLTRB(8, 16, 8, 16),
          content: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: contributors.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext __, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext __, int index) {
                var contributor = contributors.elementAt(index);
                return ContributorComponent(contributor: contributor);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (contributors.isEmpty) {
      return SizedBox();
    }

    if (contributors.length == 1) {
      return Card(
        elevation: 2,
        child: ContributorComponent(contributor: contributors.first),
      );
    }
    var maxImages = contributors.length > 3 ? 3 : contributors.length;
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: InkWell(
        onTap: () => onClickContributors(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                '${contributors.length} Contribuidores',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Row(
                spacing: 4,
                children: List.generate(maxImages, (int index) {
                  var item = contributors.elementAt(index);
                  return ClipOval(
                    child: Image.network(
                      height: 24,
                      item.imageUrl!,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.person_outline);
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_outward_outlined, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
