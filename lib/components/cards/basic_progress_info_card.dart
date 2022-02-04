import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:efgecom/config/theme_config.dart';

class BasicInfoProgressCard extends StatelessWidget {
  final String svgSrc, title;
  final int indicator, target;
  final Color color;
  final GestureTapCallback ontap;

  const BasicInfoProgressCard(
      {Key? key,
      required this.svgSrc,
      required this.title,
      required this.target,
      required this.indicator,
      required this.color,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: color.withOpacity(.2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.75),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SvgPicture.asset(
                    svgSrc,
                    color: color,
                  ),
                ),
                GestureDetector(
                  child: Icon(Icons.add_circle, color: color),
                  onTap: ontap,
                )
              ],
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color),
            ),
            const SizedBox(
              height: 3,
            ),
            ProgressLine(
              color: color,
              percentage: ((indicator / target) * 100),
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$indicator",
                    style: Theme.of(context).textTheme.bodyText1!),
                Text(target.toString(),
                    style: Theme.of(context).textTheme.bodyText1!),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}

class BasicCardGridView extends StatelessWidget {
  const BasicCardGridView(
      {Key? key,
      this.crossAxisCount = 4,
      this.childAspectRatio = 1,
      required this.items})
      : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final List<BasicInfoProgressCard> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        // crossAxisSpacing: defaultPadding,
        // mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => items[index],
    );
  }
}

class BasicWidgetGridView extends StatelessWidget {
  const BasicWidgetGridView(
      {Key? key,
      this.crossAxisCount = 4,
      this.childAspectRatio = 1,
      required this.items})
      : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        // crossAxisSpacing: defaultPadding,
        // mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => items[index],
    );
  }
}
