import 'package:base_flutter_app/theme/theme.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:flutter/services.dart';

class TextFormFieldDateTime extends StatefulWidget {
  final bool? isRequire;
  final String title;

  final DateTime? initDate;
  final Function(DateTime)? onChanged;
  final bool? readOnly;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const TextFormFieldDateTime(
      {Key? key,
      this.isRequire,
      required this.title,
      this.initDate,
      this.onChanged,
      this.readOnly,
      this.lastDate,
      this.controller,
      this.validator,
      this.firstDate})
      : super(key: key);

  @override
  State<TextFormFieldDateTime> createState() => _TextFormFieldDateTimeState();
}

class _TextFormFieldDateTimeState extends State<TextFormFieldDateTime> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _textController = widget.controller!;
    } else {
      _textController = TextEditingController();
    }
    if (widget.initDate != null) {
      _textController.text = widget.initDate!.formatDateddMMyyyy;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      readOnly: true,
      onTap: _selectDate,
      validator: widget.validator,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'dd/mm/yyyy',
        suffixIcon: Image.asset('ic_calendar'.assetPathIconPNG, width: 10).paddingOnly(right: 20),
      ),
    ).custom(title: widget.title, isRequire: widget.isRequire ?? false);
  }

  Future<void> _selectDate() async {
    final _date = await showDatePicker(
      context: context,
      initialDate: widget.initDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Get.theme.copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: AssetColors.yellowD3A429,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (_date != null) {
      _textController.text = _date.formatDateddMMyyyy;
      widget.onChanged?.call(_date);
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class TextFormFieldPhoneNumber extends StatefulWidget {
  final bool? isRequire;
  final String title;
  final String? intValue;
  final String? initCountryCode;
  final VoidCallback? onTap;
  final String? hintText;
  final Function(String)? onChanged;
  final Function(CountryCode)? callBackCountryCode;
  final bool? readOnly;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const TextFormFieldPhoneNumber(
      {Key? key,
      this.isRequire,
      required this.title,
      this.intValue,
      this.initCountryCode,
      this.onTap,
      this.hintText,
      this.onChanged,
      this.callBackCountryCode,
      this.readOnly,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  State<TextFormFieldPhoneNumber> createState() => _TextFormFieldPhoneNumberState();
}

class _TextFormFieldPhoneNumberState extends State<TextFormFieldPhoneNumber> {
  late TextEditingController _textController;
  late RxString _countryCode;

  final _textTheme = Get.textTheme;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _textController = widget.controller!;
    } else {
      _textController = TextEditingController();
    }
    if (widget.intValue != null) {
      _textController.text = widget.intValue!;
    }
    _countryCode = (widget.initCountryCode ?? Get.locale?.countryCode ?? '+84').obs;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        TextFormField(
          controller: _textController,
          readOnly: widget.readOnly ?? false,
          onTap: widget.onTap,
          validator: widget.validator,
          onChanged: widget.onChanged,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: widget.hintText ?? 'Enter phone number',
            prefix: 140.horizontalSpace,
          ),
        ).custom(title: widget.title, isRequire: widget.isRequire ?? false),
        _buildFlagAndCountryCode().paddingOnly(left: 10, top: 16),
      ],
    );
  }

  Widget _buildFlagAndCountryCode() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCountryCodePicker(),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AssetColors.primary,
        ),
        4.horizontalSpace,
        Container(
          width: 2,
          height: 28,
          color: AssetColors.greyE8E8E8,
        ),
      ],
    );
  }

  Widget _buildCountryCodePicker() {
    return SizedBox(
      width: 100,
      height: 35,
      child: CountryCodePicker(
        initialSelection: _countryCode.value,
        onChanged: (val) {
          widget.callBackCountryCode?.call(val);
        },
        padding: EdgeInsets.zero,
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        dialogSize: Size(Get.width - 32, Get.height * 0.7),
        flagWidth: 25,
        textStyle: _textTheme.subtitle1,
        searchStyle: _textTheme.subtitle1!.regular.textBlack44350D0p6,
        searchDecoration: const InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
              size: 26,
              color: AssetColors.primary,
            )),
        dialogTextStyle: _textTheme.subtitle1!.regular.textBlack44350D,
        showFlag: true,
        hideMainText: false,
        alignLeft: true,
        closeIcon: const Icon(
          Icons.close,
          size: 30,
          color: Colors.black,
        ),
        barrierColor: Colors.transparent,
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class TextFormFieldPassword extends StatefulWidget {
  final bool? isRequire;
  final String title;
  final String? hintText;
  final String? initValue;
  final Function(String)? onChanged;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;


  const TextFormFieldPassword(
      {Key? key,
      this.isRequire,
      required this.title,
      this.hintText,
      this.initValue,
      this.onChanged,
      this.readOnly,
      this.controller,
      this.onTap,
      this.validator})
      : super(key: key);

  final FormFieldValidator<String>? validator;

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _textController = widget.controller!;
    } else {
      _textController = TextEditingController();
    }
  }

  final _showPass = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          controller: _textController,
          readOnly: widget.readOnly ?? false,
          initialValue: widget.initValue,
          onTap: widget.onTap,
          validator: widget.validator,
          obscuringCharacter: '●',
          onChanged: widget.onChanged,
          obscureText: _showPass.value ? false : true,
          decoration: InputDecoration(
            hintText: widget.hintText ?? 'Enter your password',
            suffixIcon: InkWell(
              onTap: () => _showPass.value = !_showPass.value,
              child: Icon(_showPass.value ? Icons.visibility : Icons.visibility_off)
                  .paddingOnly(right: 20),
            ),
          ),
        ).custom(title: widget.title, isRequire: widget.isRequire ?? false));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
