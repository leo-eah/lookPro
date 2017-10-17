package com.util;

import com.github.junrar.Archive;
import com.github.junrar.exception.RarException;
import com.github.junrar.rarfile.FileHeader;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

import java.io.*;
import java.util.List;


public class Unit {
    private static final int BUFFEREDSIZE =1024;

    /**
     * 解压zip格式的压缩文件到指定位置
     * @param zipFileName
     * @param extPlace
     */
    @SuppressWarnings("unchecked")
    public synchronized  void unzip(String zipFileName,String extPlace){
        try {
            (new File(extPlace)).mkdirs();
            File f =new File(zipFileName);
            ZipFile zipFile =new ZipFile(zipFileName);
            if((!f.exists())&&f.length()<=0){
                throw new Exception("要解压的文件不存在");
            }
            String strPath,gbkPath,strtemp;
            File tempFile =new File(extPlace);
            strPath=tempFile.getAbsolutePath();
            java.util.Enumeration e =zipFile.getEntries();
            while(e.hasMoreElements()){
                org.apache.tools.zip.ZipEntry zipEnt = (ZipEntry) e.nextElement();
                gbkPath=zipEnt.getName();
                if (zipEnt.isDirectory()){
                    strtemp =strPath+File.separator+gbkPath;
                    File dir =new File(strtemp);
                    dir.mkdirs();
                    continue;
                }else {
                    InputStream is = zipFile.getInputStream(zipEnt);
                    BufferedInputStream bis = new BufferedInputStream(is);
                    gbkPath=zipEnt.getName();
                    strtemp = strPath + File.separator + gbkPath;

                    //建目录
                    String strsubdir = gbkPath;
                    for(int i = 0; i < strsubdir.length(); i++) {
                        if(strsubdir.substring(i, i + 1).equalsIgnoreCase("/")) {
                            String temp = strPath + File.separator + strsubdir.substring(0, i);
                            File subdir = new File(temp);
                            if(!subdir.exists())
                                subdir.mkdir();
                        }
                    }
                    FileOutputStream fos = new FileOutputStream(strtemp);
                    BufferedOutputStream bos = new BufferedOutputStream(fos);
                    int c;
                    while((c = bis.read()) != -1) {
                        bos.write((byte) c);
                    }
                    bos.close();
                    fos.close();

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 解压rar格式的压缩文件到指定目录下
     * @param rarFileName 压缩文件
     * @param extPlace 解压目录
     * @throws Exception
     */
    public synchronized void unrar(String rarFileName, String extPlace) throws Exception{
        try  {
            Archive archive = new  Archive(new File(rarFileName));
            if(archive == null){
                throw new FileNotFoundException(rarFileName + " NOT FOUND!");
            }
            if(archive.isEncrypted()){
                throw new Exception(rarFileName + " IS ENCRYPTED!");
            }
            List<FileHeader> files =  archive.getFileHeaders();
            for (FileHeader fh : files) {
                if(fh.isEncrypted()){
                    throw new Exception(rarFileName + " IS ENCRYPTED!");
                }
                String fileName = fh.getFileNameW();
                if(fileName != null && fileName.trim().length() > 0){
                    String saveFileName = extPlace+"\\"+fileName;
                    File saveFile = new File(saveFileName);
                    File parent =  saveFile.getParentFile();
                    if(!parent.exists()){
                        parent.mkdirs();
                    }
                    if(!saveFile.exists()){
                        saveFile.createNewFile();
                    }
                    FileOutputStream fos = new FileOutputStream(saveFile);
                    try {
                        archive.extractFile(fh, fos);
                        fos.flush();
                        fos.close();
                    } catch (RarException e) {
                        if(e.getType().equals(RarException.RarExceptionType.notImplementedYet)){
                        }
                    }finally{
                    }
                }
            }

        } catch  (Exception e) {
            e.printStackTrace();
            throw e;

    }

}
}
