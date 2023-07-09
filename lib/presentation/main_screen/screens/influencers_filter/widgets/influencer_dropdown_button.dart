import 'package:flutter/material.dart';

import 'package:fleeque/core_ui/constants.dart';

class InfluencerDropdownButton extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String labelText;
  final List<String> valueList;
  final String filterSelectedValue;

  const InfluencerDropdownButton({
    super.key,
    required this.valueList,
    required this.labelText,
    required this.onChanged,
    required this.filterSelectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputDecorator(
          decoration: InputDecoration(
            labelText: labelText.toUpperCase(),
            labelStyle: AppFonts.mediumFontPrefsWhite,
            prefix: const Divider(
              color: AppColors.primaryColor,
              height: 1.0,
              thickness: 1.0,
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: filterSelectedValue.isNotEmpty
                ? filterSelectedValue
                : valueList[0],
            icon: const Visibility(
              visible: false,
              child: Icon(Icons.arrow_downward),
            ),
            isExpanded: true,
            dropdownColor: AppColors.textPrimaryColor,
            items: valueList.map(
              (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: AppFonts.mediumFontPrefsWhiteLink,
                  ),
                );
              },
            ).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
