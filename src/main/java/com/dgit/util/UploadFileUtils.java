package com.dgit.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	// file의 폴더와 이름을 리턴한다.
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws IOException {
		UUID uuid = UUID.randomUUID();		
		String dataPath = calcPath(uploadPath);		
		String savedName = dataPath +"/"+ uuid.toString() + "_" + originalName; //큰 이미지
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		String thumbName = makeThumbnail(uploadPath, dataPath, uuid.toString() + "_" + originalName);	//썸네일 폴더
		
		System.out.println("thumbName : " + thumbName);
		return thumbName; // return 2017/06/30/s_xxxxx.jpg; 업로드되어 폴더이름안에 파일 저장
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = "/" + cal.get(Calendar.YEAR);
		String monthPath = String.format("%s/%02d", yearPath, cal.get(Calendar.MONTH) + 1);
		String datePath = String.format("%s/%02d/%02d", yearPath, cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (dirPath.exists() == false) {
				dirPath.mkdirs();
			}
		}
	}
	
	//썸네일 만드는 함수
	private static String makeThumbnail(String uploadPath, String datePath, String filename) throws IOException{ //s_uuid 이렇게 만들려고 매개변수 따로 받음.
		String originalFilename = uploadPath+"/"+datePath+"/"+filename;
		BufferedImage sourceImg = ImageIO.read(new File(originalFilename)); //원본 이미지에서 데이터 뽑아오기
		
		int dw = 600, dh = 700;
		BufferedImage destImg = Scalr.resize(sourceImg, dw, dh);
		//썸네일 이미지 높이 500px를 기준으로 자동 조정하여 이미지를 줄여준다.
		
		/*if(sourceImg.getHeight() >= sourceImg.getWidth()){
			destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 400);
			destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_WIDTH, 600);
		}else{
			destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 400);
			destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_WIDTH, 600);
		}*/
		
		String thumbFilename = uploadPath+"/"+datePath+"/s_"+filename;
		File newFile = new File(thumbFilename);
		
		//확장자
		String formatName = filename.substring(filename.lastIndexOf(".")+1); 
		// Thumbnail 경로/파일 이름에 resizing된 이미지를 넣는다.
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return datePath+"/s_"+filename;
	}

}
