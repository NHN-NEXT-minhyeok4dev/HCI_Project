package org.nhnnext.support;

import java.io.File;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	//Local Path
	//private static final String ATTACHMENT_ROOT_DIR = "/Users/astomusic/Documents/workspace/HCI_Project/webapp/pdf";
//	private static final String ATTACHMENT_ROOT_DIR = "/Users/kimminhyeok/git/HCI_Project/webapp/pdf";
	//Server Path
	private static final String ATTACHMENT_ROOT_DIR = "/var/lib/tomcat7/webapps/ROOT/pdf";

	public static String upload(MultipartFile multipartFile) {
		if (multipartFile.isEmpty()) {
			return null;
		}
		transferToAttachmentDir(multipartFile);
		return multipartFile.getOriginalFilename();
	}

	private static File transferToAttachmentDir(MultipartFile multipartFile) {
		File destFile = getDestinationFile(multipartFile.getOriginalFilename());
		try {
			multipartFile.transferTo(destFile);
		} catch (Exception ex) {
			throw new IllegalArgumentException(destFile + "");
		}
		return destFile;
	}

	public static File getDestinationFile(String fileName) {
		java.util.Calendar cal = java.util.Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get ( Calendar.MONTH ) + 1 ;
		int date = cal.get ( Calendar.DATE ) ;
		String curDate = "_" + year + month + date + ".pdf";
		
		return new File(ATTACHMENT_ROOT_DIR + File.separator + fileName.replace(".pdf", curDate));
	}
}
