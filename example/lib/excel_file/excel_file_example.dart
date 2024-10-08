import 'dart:io';
import 'dart:math';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';

class ExcelFileExample extends StatefulWidget {
  const ExcelFileExample({Key? key}) : super(key: key);

  @override
  State<ExcelFileExample> createState() => _ExcelFileExampleState();
}

class _ExcelFileExampleState extends State<ExcelFileExample> {

  String? filePath;

  @override
  void initState() {
    super.initState();
    var excel = Excel.createExcel();

    getApplicationDocumentsDirectory().then((directory) async {

      filePath = p.join('${directory.path}/attendance', 'kob智控考勤数据_2023年9月.xlsx');

      var files = directory.listSync();
      for (var entity in files) {
        debugPrint('-->> entity: $entity');
        if (entity is File) {
          await entity.delete();
        }
      }

      Sheet sheetObject = excel['Sheet1'];
      CellStyle headerCellStyle
        = CellStyle(backgroundColorHex: '#0350A6', fontFamily : getFontFamily(FontFamily.Calibri), fontColorHex: '#FFFFFF', fontSize: 12);

      var cellA0 = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0));
      cellA0.value =  const TextCellValue('');
      cellA0.cellStyle = headerCellStyle;

      for (var i = 1; i <= 31; i++) {
        var cellR = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0));
        cellR.value = TextCellValue('$i号');
        cellR.cellStyle = headerCellStyle;
      }

      CellStyle bodyCellStyle
        = CellStyle(backgroundColorHex: '#FFFFFF', fontFamily : getFontFamily(FontFamily.Calibri), fontColorHex: '#11122A', fontSize: 12);

      CellStyle bodyCellStyle4Warning
        = CellStyle(backgroundColorHex: '#FFEB3B', fontFamily : getFontFamily(FontFamily.Calibri), fontColorHex: '#11122A', fontSize: 12);

      CellStyle bodyCellStyle4Warning2
        = CellStyle(backgroundColorHex: '#F44336', fontFamily : getFontFamily(FontFamily.Calibri), fontColorHex: '#FFFFFF', fontSize: 12);

      //

      // var cellA2 = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1));
      // cellA2.value = '杨雪松'; // dynamic values support provided;
      // cellA2.cellStyle = bodyCellStyle;


      for (var row = 1; row < 50; row++) {

        var cellC0 = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row));
        cellC0.value = TextCellValue(generateRandomChineseName()); // dynamic values support provided;
        cellC0.cellStyle = bodyCellStyle;

        for (var i = 1; i <= 31; i++) {
          var cellC = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: row));
          var val1 = generateRandomTimeBetween8And9();
          var val2 = generateRandomTimeBetween18And19();
          cellC.value = TextCellValue('$val1, $val2');
          if (val1.compareTo('8:30') > 0 && val2.compareTo('18:00') < 0) {
            cellC.cellStyle = bodyCellStyle4Warning2;
          } else if (val1.compareTo('8:30') <= 0 && val2.compareTo('18:00') >= 0) {
            cellC.cellStyle = bodyCellStyle;
          } else {
            cellC.cellStyle = bodyCellStyle4Warning;
          }
        }
      }

      var fileBytes = excel.save();
      if (fileBytes == null) {
        return;
      }

      File(filePath!)
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);

      Share.shareXFiles([XFile(filePath!, name: 'kob智控考勤数据_2023年9月', mimeType: 'application/vnd.ms-excel',)],);

    });

  }

  String generateRandomChineseName() {
    const familyNames = '赵钱孙李周吴郑王';
    const givenNames = '建国自强明德志明克学如松';

    final rng = Random();

    // 随机选择一个姓氏
    final family = familyNames[rng.nextInt(familyNames.length)];

    // 随机选择1-2个名字字符
    final given = [
      givenNames[rng.nextInt(givenNames.length)],
      if (rng.nextBool()) givenNames[rng.nextInt(givenNames.length)]
    ].join();

    return '$family$given';
  }

  String generateRandomTimeBetween8And9() {
    final rng = Random();
    // 随机选择分钟数 (0-59)
    final minute = rng.nextInt(60).toString().padLeft(2, '0');
    return '8:$minute';
  }

  String generateRandomTimeBetween18And19() {
    final rng = Random();
    // 随机选择分钟数 (0-59)
    final minute = rng.nextInt(60).toString().padLeft(2, '0');
    final rng2 = Random();
    return '${rng2.nextBool() ? 17 : 18}:$minute';
  }

  @override
  Widget build(BuildContext context) {

    return Container(
    );

  }



}
