package common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FileController {
	private final String UP_DIR = "D:/MyData/Workspace/KIWI/Upload";

	// [1] MultipartFile을 이용하는 방법
	@RequestMapping("/fileUpForm.do")
	public String showForm(){
		return "fileup/fileUpload";
	}

	@RequestMapping(value="/fileUpEnd.do", method=RequestMethod.POST)
	public String fileUpload(Model model, 
			@RequestParam(defaultValue="") String name,
			@RequestParam("fileone") MultipartFile mfileone,
			@RequestParam("filetwo") MultipartFile mfiletwo){
		
		// [1] 첨부파일명, 파일크기 얻어와서 model에 저장하자.
		String fileone = mfileone.getOriginalFilename();
		long fileone_size = mfileone.getSize();
		String filetwo = mfiletwo.getOriginalFilename();
		long filetwo_size = mfiletwo.getSize();
		
		// [2] 업로드 처리하자.
		try{
			if(mfileone != null)
				mfileone.transferTo(new File(UP_DIR, fileone));
			if(mfiletwo != null)
				mfiletwo.transferTo(new File(UP_DIR, filetwo));
		}catch(IOException e){
			e.printStackTrace();
		}
		
		model.addAttribute("file1", fileone);
		model.addAttribute("file1size", fileone_size);
		model.addAttribute("file2", filetwo);
		model.addAttribute("file2size", filetwo_size);	
		return "fileup/fileUploadEnd";
	}
	
	// [2] MultipartHttpServletRequest를 이용하는 방법
	/* => 이 경우는 동일한 파라미터 명으로 여러 개의 
	 * 파일을 업로드 하는 경우에 유용하다. */
	@RequestMapping("fileUpForm2.do")
	public String showForm2(){
		return "fileup/fileUpload2";
	}
	
	@RequestMapping(value="/fileUpEnd2.do", method=RequestMethod.POST)
	public String fileUpload2(Model model,
			HttpServletRequest req){
		// 올린 이 파라미터 값 받기
		String name = req.getParameter("name");
		
		// 첨부파일 목록 얻기
		MultipartHttpServletRequest mr
			= (MultipartHttpServletRequest) req;
		
		List<MultipartFile> mfList = mr.getFiles("filename");
		
		if(mfList != null){
			for(int i=0; i<mfList.size(); i++){
				MultipartFile mf = mfList.get(i);
				// 파라미터명 => filename
				String param = mf.getName();
				// 파일명
				String fname = mf.getOriginalFilename();
				// 파일 크기
				long fsize = mf.getSize();
				try{
					mf.transferTo(new File(UP_DIR, fname));
					model.addAttribute("file"+(i+1), fname);
					model.addAttribute("file"+(i+1)+"size", fsize);
				}catch(Exception e){
					e.printStackTrace();
				}// for---------
			}// if--------------
		}
		return "fileup/fileUploadEnd";
	}
	
	/** 파일 다운로드 처리 
	 * @ResponseBody : 해당 return을 다양한 형태로 변경/지원
	 * 				   하는 기능. application/json, 
	 * 				   application/xml 등으로 응답형태를 지정
	 * 				   해야 할 때 사용. */
	@ResponseBody
	@RequestMapping("/fileDown.do")
	public void fileDownload
		(HttpServletRequest req, HttpServletResponse res) 
			throws FileNotFoundException, IOException{
		// 다운로드 받을 파일명 받기
		String filename = req.getParameter("filename");
		
		// 컨텐트 타입을 알 수 없는 형식이나 binary 형식으로 지정
		res.setContentType("application/octet-stream");
		
		// 한글 파일명이 깨지는 것을 막기 위해
		String filename_en 
			= new String(filename.getBytes(), "ISO-8859-1");
		String args = "attachment; filename="+filename_en;
		
		res.setHeader("Content-Disposition", args);
		res.setHeader("Content-transfer-Encoding", "binary");
		
		// 파일 다운로드 처리
		FileCopyUtils.copy(new FileInputStream(new File(UP_DIR, filename)), 
						   res.getOutputStream());
	}
}////////////////////////////////////////////////////
