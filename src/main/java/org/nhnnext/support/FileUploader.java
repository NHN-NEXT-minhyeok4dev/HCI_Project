package org.nhnnext.support;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	private static final String ATTACHMENT_ROOT_DIR = "/Users/asto/Documents/workspace/HCI_Project/webapp/pdf";

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
		return new File(ATTACHMENT_ROOT_DIR + File.separator + fileName);
	}
}
