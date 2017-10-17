package com.controller;

import com.util.Unit;
import com.vo.Project;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;

/**
 *
 */
// 注解标注此类为springmvc的controller，url映射为"/home"
@Controller
@RequestMapping("/lookPro")
public class HomeController {
    //添加一个日志器
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    //映射一个action

    @RequestMapping("/index")
    public String index(HttpServletRequest request, HttpServletResponse  response){
        ArrayList<Project> list =new ArrayList<Project>();
        request.setAttribute("a","asd");
        File file= new File("D:/lookPro/pro/");
        File[] tempList  =file.listFiles();
        for (int i = 0; i <tempList.length ; i++) {
            if (tempList[i].isDirectory()){
                Path filePath = Paths.get(tempList[i].getAbsolutePath());
                try {
                    BasicFileAttributes ra = Files.readAttributes(filePath,BasicFileAttributes.class);
                    Project pro = new Project();
                    pro.setCreateTime(ra.lastModifiedTime().toString());
                    pro.setProName(tempList[i].getName());
                    list.add(pro);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                System.out.println("文件夹:"+tempList[i]);
            }
        }
        request.setAttribute("proList",list);
        return "home";
    }
    public static void find(String pathname,int depth) throws IOException {
        int filecount =0;
        File dirFile =new File(pathname);
        if(! dirFile.exists()){
            System.out.println("do not exist");
            return;
        }
        if(!dirFile.isDirectory()){
            if(dirFile.isFile()){
                System.out.println(dirFile.getCanonicalFile());
            }
            return;
        }
        for (int j=0;j<depth;j++){
            System.out.println(" ");
        }

    }
    @RequestMapping("findPro")
    public void findPro(HttpServletResponse response,HttpServletRequest request){
        File file= new File("D:/lookPro/pro/");
        File[] tempList  =file.listFiles();
        for (int i = 0; i <tempList.length ; i++) {
            if (tempList[i].isDirectory()){
                System.out.println("文件夹:"+tempList[i]);

            }
        }
    }

    @RequestMapping("/upload")
    public  String Upload(HttpServletRequest request, HttpServletResponse response , Project pro) throws Exception {
       CommonsMultipartFile file= pro.getPro();
       int index =file.getOriginalFilename().lastIndexOf(".");
       String str =file.getOriginalFilename().substring(index);
       if(!file.isEmpty()){
           try {
               FileOutputStream os = new FileOutputStream("D:/lookPro/rar/"+file.getOriginalFilename());
               InputStream in = file.getInputStream();
               int b=0;
               while((b=in.read())!=-1){ //读取文件
                   os.write(b);
               }
               os.flush(); //关闭流
               in.close();
               os.close();

           } catch (FileNotFoundException e) {
               e.printStackTrace();
           } catch (IOException e) {
               e.printStackTrace();
           }

       }
       Unit unit =new Unit();
       String path = "D:/lookPro/pro";
       String filepath = "D:/lookPro/rar/"+file.getOriginalFilename();
       if(!StringUtils.isEmpty(str)&& str.equals(".zip")){
           unit.unzip(filepath,path);
       }
       if (!StringUtils.isEmpty(str)&& str.equals(".rar"))
       {
           unit.unrar(filepath,path);
       }
        return "redirect:/lookPro/index";
    }
}