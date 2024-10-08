import 'package:flutter/material.dart';
import '../../../icheer_widget.dart';

/// FileName ic_grouped_list_view
///
/// @Author 杨雪松
/// @Email simonyang81@gmail.com
/// @Date 2023/6/1 10:40
///
/// @Description
///
///

typedef ItemPressedCallback = void Function(int groupIndex, int itemIndex);
typedef TrailingWidget = Widget? Function(int groupIndex, int itemIndex);

class GroupItem<T> {
  final String key;
  final String content;
  final String? secKey;
  final String? tag;
  final T? model;

  GroupItem({
    required this.key,
    required this.content,
    this.secKey,
    this.tag,
    this.model,
  });
}

class ICGroupedListView extends StatefulWidget {
  final List<(String, List<GroupItem>)> groupList;
  final bool countItems;
  final Color? background;

  final TrailingWidget? trailingWidget;
  final ItemPressedCallback? onTrailingIconPressed;
  final IconData? trailingIcon;

  final Color? groupColor;
  final Color? itemColor;
  final Color? itemTextColor;

  final Gradient? gradient;
  final TextStyle? groupTextStyle;
  final TextStyle? itemTextStyle;

  const ICGroupedListView({
    super.key,
    required this.groupList,
    this.countItems = true,
    this.background,
    this.onTrailingIconPressed,
    this.trailingIcon,
    this.groupColor,
    this.itemColor,
    this.itemTextColor,
    this.trailingWidget,
    this.gradient,
    this.groupTextStyle,
    this.itemTextStyle,
  }) : assert(trailingWidget == null || trailingIcon == null,
    'Cannot provide both a trailingWidget and a trailingIcon.',
  );

  @override
  State<ICGroupedListView> createState() => _ICGroupedListViewState();
}

class _ICGroupedListViewState extends State<ICGroupedListView> {

  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    _initializeExpandedList();
  }

  @override
  void didUpdateWidget(ICGroupedListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.groupList.length != _isExpandedList.length) {
      _initializeExpandedList();
    }
  }

  void _initializeExpandedList() {
    setState(() {
      // 初始化展开状态列表，全部为true，表示默认展开所有组
      _isExpandedList = List<bool>.filled(widget.groupList.length, true);
    });
  }

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: widget.groupList.length,
      itemBuilder: (BuildContext context, int index) {
        var group = widget.groupList[index];
        return _buildGroup(context, index, group);
      },
      separatorBuilder: (BuildContext context, int index) {
        return ICGradientDivider(
          gradient: widget.gradient,
        );
      },

    );

  }

  Widget _buildGroup(BuildContext context, int index, (String, List<GroupItem>) group) {

    if (widget.background == null) {
      return _buildExpansionPanelList(context, index, group);
    }

    return Theme(
      data: Theme.of(context).copyWith(cardColor: widget.background),
      child: _buildExpansionPanelList(context, index, group),
    );
  }

  Widget _buildExpansionPanelList(BuildContext context, int index, (String, List<GroupItem>) group) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: const EdgeInsets.all(0),
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _isExpandedList[index] = isExpanded;
        });
      },
      expandIconColor: widget.groupColor ?? Theme.of(context).primaryColor,
      children: [
        _buildExpansionPanel(context, index, group),
      ],

    );
  }

  ExpansionPanel _buildExpansionPanel(BuildContext context, int groupIndex, (String, List<GroupItem>) group) {

    final (title, items) = group;
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: _buildGroupHeader(context, title, items.length),
          );
        },
        body: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            return Stack(
              alignment: Alignment.centerRight,
              children: [
                ListTile(
                  title: Text(items[itemIndex].content,
                    style: widget.itemTextStyle ?? TextStyle(color: widget.itemTextColor ?? Colors.white),
                  ),
                ),

                _buildIconButton(groupIndex, itemIndex) ?? const SizedBox()
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return ICGradientDivider(
              gradient: widget.gradient,
            );
          },
        ),
        isExpanded: _isExpandedList[groupIndex],
      );
  }

  Widget _buildGroupHeader(BuildContext context, String headerTitle, int count) {

    if (widget.countItems) {
      return Text('$headerTitle ($count)',
        style: widget.groupTextStyle ?? TextStyle(
          fontWeight: FontWeight.bold,
          color: widget.groupColor ?? Theme.of(context).primaryColor,
          fontSize: 16,
        ),
      );
    }

    return Text(headerTitle,
      style: widget.groupTextStyle ?? TextStyle(
        fontWeight: FontWeight.bold,
        color: widget.groupColor ?? Theme.of(context).primaryColor,
        fontSize: 20,
      ),
    );
  }

  Widget? _buildIconButton(int groupIndex, int itemIndex) {

    if (widget.trailingIcon == null && widget.trailingWidget == null) {
      return null;
    }

    if (widget.trailingWidget != null) {
      return widget.trailingWidget!(groupIndex, itemIndex);
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: IconButton(
        icon: Icon(widget.trailingIcon, size: 16, color: widget.itemColor ?? Theme.of(context).primaryColor,),
        onPressed: () {
          widget.onTrailingIconPressed?.call(groupIndex, itemIndex);
        },
      ),
    );

  }
}
