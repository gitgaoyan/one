package com.jcloud.WebModel.Tools;

import com.jcloud.WebModel.dao.VoiceAnalysisDao;
import com.jcloud.WebModel.model.TbSpeechModel;
import com.jcloud.WebModel.service.TbSpeechService;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import javax.swing.plaf.synth.SynthEditorPaneUI;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ExcelOperate {

    public List<TbSpeechModel> getTbSpeechModelList(){
        List<TbSpeechModel> tbSpeechModelList=new ArrayList<>();
        try {
            FileInputStream excelFileInputStream = new FileInputStream("E:\\IdeaProjects\\WebModel\\src\\main\\java\\com\\jcloud\\WebModel\\Tools\\test.xlsx");
            XSSFWorkbook workbook = new XSSFWorkbook(excelFileInputStream);
            excelFileInputStream.close();
            XSSFSheet sheet = workbook.getSheetAt(0);
//            List<TbSpeechModel> tbSpeechModelList = getTbSpeechModelFromExcel(sheet);
            System.out.println(sheet.getLastRowNum());
            int type=1;
            String type_name="--NOFINACE";
            String type_inset="非金融";
            for (int rowIndex = 1; rowIndex < sheet.getLastRowNum(); rowIndex++) {
                //XSSFROW表示一行数据
                TbSpeechModel financeTbSpeechModel = new TbSpeechModel();
                TbSpeechModel noFinanceTbSpeechModel = new TbSpeechModel();
                XSSFRow row = sheet.getRow(rowIndex);
                if (row == null) {
                    continue;
                }
//            XSSFCell idCell = row.getCell(0);
                XSSFCell nameCell = row.getCell(0);
                XSSFCell noFinanceTimeCell = row.getCell(1);
                XSSFCell noFinanceCell = row.getCell(2);
                String name = nameCell.getStringCellValue();
                if (name.equals("文件名")){
                    type=2;
                    type_name="--FINACE";
                    type_inset="金融";
                    continue;
                }
                int noFinanceTime =(int) noFinanceTimeCell.getNumericCellValue();
                String noFinance = noFinanceCell.getStringCellValue();
//                String finance = financeCell.getStringCellValue();
//                String financeTime = financeTimeCell.getStringCellValue();
                TbSpeechModel tbSpeechModel=new TbSpeechModel();
                tbSpeechModel.setName(name+type_name);
                tbSpeechModel.setTime(noFinanceTime);
                tbSpeechModel.setContent_length(noFinance.length());
                tbSpeechModel.setContent(noFinance);
                tbSpeechModel.setSpeech_type(type_inset);
                tbSpeechModelList.add(tbSpeechModel);
                System.out.println(tbSpeechModel.getSpeech_type());
            }
            workbook.close();
            return tbSpeechModelList;



        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return tbSpeechModelList;
    }
}