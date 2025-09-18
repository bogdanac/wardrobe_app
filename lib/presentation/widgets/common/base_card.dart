import 'package:flutter/material.dart';

abstract class BaseCard extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;

  const BaseCard({
    super.key,
    this.onTap,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(8.0),
    this.backgroundColor,
    this.elevation = 2.0,
    this.borderRadius,
  });

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Card(
        elevation: elevation,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: buildContent(context),
          ),
        ),
      ),
    );
  }
}

class ActionCard extends BaseCard {
  final Widget child;
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;

  const ActionCard({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    super.onTap,
    super.padding = null,
    super.margin = null,
    super.backgroundColor,
    super.elevation = null,
    super.borderRadius,
  });

  @override
  Widget buildContent(BuildContext context) {
    if (title != null || subtitle != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null || leading != null || trailing != null)
            Row(
              children: [
                if (leading != null) ...[
                  leading!,
                  const SizedBox(width: 12),
                ],
                if (title != null)
                  Expanded(
                    child: Text(
                      title!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                if (trailing != null) trailing!,
              ],
            ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
          if (title != null || subtitle != null) const SizedBox(height: 12),
          child,
        ],
      );
    }
    
    return child;
  }
}