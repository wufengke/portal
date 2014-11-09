package com.cyou.infor.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.base.util.PropertyUtil;
import com.cyou.core.action.BaseAction;
import com.cyou.register.service.UsersService;

@Controller
@Namespace(value = "/member")
@InterceptorRefs(value = { 
@InterceptorRef(value="fileUploadStack",
params={"maximumSize","512000","allowedTypes","image/png,image/gif,image/jpeg"}),
@InterceptorRef(value="defaultStack")})
public class ImageUploadAction extends BaseAction {
	private static final Logger logger = Logger.getLogger(ImageUploadAction.class);
	private static final long serialVersionUID = 572146812454l;
	private static final int BUFFER_SIZE = 16 * 1024;  
    private List<File> myFile = new ArrayList<File>();    
    private List<String> myFileContentType = new ArrayList<String>();  
    private List<String> myFileFileName = new ArrayList<String>();    //文件名  
    private List<String> imageFileName = new ArrayList<String>();  
    @Resource
    private UsersService usersService;
    
	@Action(value = "/imageUpload", results = { 
			@Result(name =SUCCESS, type="redirect",location = "/member/my_infor?tab=3"),
			@Result(name =INPUT, type="redirect",location = "/member/my_infor?error=1&tab=3"),
			@Result(name ="COMPLETE", type="redirect",location = "/member/my_infor?error=2&tab=3"),
			@Result(name =LOGIN,type="redirect", location = "/login"),
			})
	public String imageUpload() {
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				Users user = (Users) getFromSession("user");
				if(user != null){
					if(!user.getUserId().equals(null)&&!user.getUserId().equals(""))
					{
						return "COMPLETE";
					}
					if (myFile == null || myFile.size() <= 0 )  {
						if(StringUtils.isNotBlank(user.getImageUrl())){
							return SUCCESS;
						}else{
							 return INPUT; 
						}
					}
			        for (int i = 0; i < myFile.size(); i++) {  
			            imageFileName.add(new Date().getTime()+ getExtention(this.getMyFileFileName().get(i))) ;  
			            File dir = new File(PropertyUtil.getProperty("imagesLocation")+"/"+ account.getUserId() +"/" + i);
			            dir.mkdirs();
			            File imageFile = new File(PropertyUtil.getProperty("imagesLocation")+"/"+ account.getUserId() + "/" + i +"/" + imageFileName.get(i));   
			            copy(myFile.get(i), imageFile); 
			        }  
			        for (int i = 0; i < imageFileName.size(); i++) {
			        	String prefix = "/upload/" + account.getUserId() + "/" + i + "/";
						user.setImageUrl(prefix + imageFileName.get(i));
					}
			        usersService.updateUsers(user);
				}else{
					return "COMPLETE";
				}
			}else{
				return LOGIN;
			}
		}catch(Exception e){
			logger.error(e.getMessage());
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/teacherImageUpload", results = { 
			@Result(name =SUCCESS, type="redirect",location = "/member/my_infor_teacher?tab=3"),
			@Result(name =INPUT, type="redirect",location = "/member/my_infor_teacher?error=1&tab=3"),
			@Result(name ="COMPLETE", type="redirect",location = "/member/my_infor_teacher?error=2&tab=3"),
			@Result(name =LOGIN,type="redirect", location = "/login"),
	})
	public String teacherImageUpload() {
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				Users user = (Users) getFromSession("user");
				if(user != null){
					if (myFile == null || myFile.size() <= 0 )  {
						if(StringUtils.isNotBlank(user.getImageUrl())){
							return SUCCESS;
						}else{
							return INPUT; 
						}
					}
					for (int i = 0; i < myFile.size(); i++) {  
						imageFileName.add(new Date().getTime()+ getExtention(this.getMyFileFileName().get(i))) ;  
						File dir = new File(PropertyUtil.getProperty("imagesLocation")+"/"+ account.getUserId() +"/" + i);
						dir.mkdirs();
						File imageFile = new File(PropertyUtil.getProperty("imagesLocation")+"/"+ account.getUserId() + "/" + i +"/" + imageFileName.get(i));   
						copy(myFile.get(i), imageFile); 
					}  
					for (int i = 0; i < imageFileName.size(); i++) {
						String prefix = "/upload/" + account.getUserId() + "/" + i + "/";
						user.setImageUrl(prefix + imageFileName.get(i));
					}
					
					usersService.updateUsers(user);
				}else{
					return "COMPLETE";
				}
			}else{
				return LOGIN;
			}
		}catch(Exception e){
			logger.error(e.getMessage());
			return INPUT;
		}
		return SUCCESS;
	}
	private static void copy(File src, File dst) {  
        try {  
            InputStream in = null;  
            OutputStream out = null;  
            try {  
                in = new BufferedInputStream(new FileInputStream(src),  
                        BUFFER_SIZE);  
                out = new BufferedOutputStream(new FileOutputStream(dst),  
                        BUFFER_SIZE);  
                byte[] buffer = new byte[BUFFER_SIZE];  
                while (in.read(buffer) > 0) {  
                    out.write(buffer);  
                }  
            } finally {  
                if (null != in) {  
                    in.close();  
                }  
                if (null != out) {  
                    out.close();  
                }  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
	      
    private static String getExtention(String fileName) {  
        int pos = fileName.lastIndexOf(".");  
        return fileName.substring(pos);  
    }
	public List<File> getMyFile() {
		return myFile;
	}
	public void setMyFile(List<File> myFile) {
		this.myFile = myFile;
	}
	public List<String> getMyFileContentType() {
		return myFileContentType;
	}
	public void setMyFileContentType(List<String> myFileContentType) {
		this.myFileContentType = myFileContentType;
	}
	public List<String> getMyFileFileName() {
		return myFileFileName;
	}
	public void setMyFileFileName(List<String> myFileFileName) {
		this.myFileFileName = myFileFileName;
	}
	public List<String> getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(List<String> imageFileName) {
		this.imageFileName = imageFileName;
	}
    
}