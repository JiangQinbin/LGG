package lgg.upload.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import lgg.upload.mapper.VodeoDao;
import lgg.upload.service.PictureSave;
import lgg.upload.service.RealPictureSave;

/**
 * Servlet implementation class RealNameCertification
 */
@WebServlet("/RealNameCertification")
public class RealNameCertification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealNameCertification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> list = null;
		String username=(String) session.getAttribute("yonghu");			
		try {
			list = upload.parseRequest(request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<String> pList = new ArrayList<String>();
		for (FileItem item : list) {
			if (item.isFormField()) {
				// String name = item.getFieldName();
				String value = item.getString("UTF-8");
				pList.add(value);
				// System.out.println("value"+value);
			} 
		}
		VodeoDao vodeoDao = new VodeoDao();
		boolean hh = vodeoDao.select(pList.get(1));
		if(!hh) {
		try {
			RealPictureSave  save = new RealPictureSave();
			int kkkr = save.pictureSave(list, username);
			out.println(kkkr);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else {
			out.println(404);
			out.flush();
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
